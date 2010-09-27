package com.ao.fight

import com.ao.character.JournalEntry;
import com.ao.character.Warrior;
import com.ao.monster.Encounter;

class Fight {
	
	Warrior warrior
	Encounter encounter
	boolean won
	
	static hasMany = [details:FightEntry]
	
	static def ATK_RATE = 4
	static def CRIT_MULTIP = 1.5
	
	static mapping = {
		details sort:"dateCreated"
	}

    static constraints = {
    }

	void addEntry(def text){
		def fe = new FightEntry(text:text)
		fe.save(flush:true)
		addToDetails(fe)
		save(flush:true)
	}

	void killedEntry(def killer, def killed){
		addEntry("${killer} killed ${killed}.")
	}

	void hittedEntry(def hitter, def victim, def damage){
		addEntry("${hitter} hitted ${victim} for ${damage}.")
	}

	void criticHittedEntry(def hitter, def victim, def damage){
		addEntry("${hitter} hitted critically ${victim} for ${damage}.")
	}

	void missedEntry(def hitter){
		addEntry("${hitter}'s attack missed.")
	}

	int tryToHit(def hitter, def victim){
		def r = new Random()
		def rAtk = r.nextInt(21)
		def rDef = r.nextInt(21)

		//Para ser critico el random tiene que ser >= 20 - (stats.CRate / 10)
		if(rAtk >= 20 - (hitter.stats.CRate / 10).intValue()){
			def rDam = r.nextInt(11)-5
			def damage = Math.max(((hitter.stats.PAtk + rDam) * CRIT_MULTIP).intValue() - victim.stats.PDef,1)
			criticHittedEntry(hitter.name, victim.name, damage)
			return damage
		}else if(rAtk + hitter.stats.Acc >= rDef + victim.stats.Eva){
			def rDam = r.nextInt(11)-5
			def damage = Math.max(hitter.stats.PAtk + rDam - victim.stats.PDef,1)
			hittedEntry(hitter.name, victim.name, damage)
			return damage
		}else{
			missedEntry(hitter.name)
			return 0
		}
	}

	
	void fightMonster(def warrior, def monster){
		def monsterLife = monster.stats.HP
		boolean warrior_first = warrior.stats.Init + warrior.stats.Luck >= monster.stats.Init + monster.stats.Luck
		def warrior_rate = warrior.stats.ARate
		def monster_rate = monster.stats.ARate
		
		//Golpe inicial
		if(warrior_first){
			monsterLife -= tryToHit(warrior, monster)
			warrior_rate -= ATK_RATE
			if(monsterLife <= 0){
				killedEntry(warrior.name, monster.name)
				return
			}
		}else{
			warrior.actualHP -= tryToHit(monster, warrior)
			monster_rate -= ATK_RATE
			if(warrior.actualHP <= 0){
				killedEntry(monster.name, warrior.name)
				return
			}
		}

		//Continuacion de la pelea contemplado el Attack Rate
		while(warrior.actualHP > 0 && monsterLife > 0){
			if(warrior_rate >= monster_rate){
				monsterLife -= tryToHit(warrior, monster)
				warrior_rate -= ATK_RATE
				if(monsterLife <= 0){
					killedEntry(warrior.name, monster.name)
				}else if(monster_rate < 0){
					monster_rate = monster.stats.ARate
				}
			}else{
				warrior.actualHP -= tryToHit(monster, warrior)
				monster_rate -= ATK_RATE
				if(warrior.actualHP <= 0){
					killedEntry(monster.name, warrior.name)
				}else if(warrior_rate < 0){
					warrior_rate = warrior.stats.ARate
				}
			}
		}
	}
	
	boolean resolveFight(){
		def alive = true
		encounter.monsters.each{
			if(!alive)
				return
			fightMonster(warrior, it)
			if(warrior.actualHP <= 0)
				alive = false
		}
		if(alive)
			won = true
		else{
			won = false
			warrior.actualHP = 1
			warrior.actualLocation = warrior.resurrectionMap
			def je = new JournalEntry(type:JournalEntry.TEXT, text:"You died in combat. You resurrected in <b>${warrior.resurrectionMap.name}</b>.")
			je.save()
			warrior.addToJournal(je)
		}
		warrior.save()
		return won
	}
}
