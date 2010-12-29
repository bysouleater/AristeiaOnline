package com.ao.fight

import com.ao.character.JournalEntry;
import com.ao.character.Warrior;
import com.ao.monster.Encounter;

class Fight {
	
	Warrior warrior
	Encounter encounter
	
	int hits = 0
	int hitsMissed = 0
	int criticalHits = 0
	
	int damageTaken = 0
	int damageDone = 0
	double averageDamagePerHit = 0
	
	boolean won
	
	static def ATK_RATE = 4
	static def CRIT_MULTIP = 1.5
	
	static constraints = {
    }

	int tryToHit(def hitter, def victim, boolean warrior){
		def r = new Random()
		def rAtk = r.nextInt(21)
		def rDef = r.nextInt(21)

		//Para ser critico el random tiene que ser >= 20 - (stats.CRate / 10)
		if(rAtk >= 20 - (hitter.stats.CRate / 10).intValue()){
			def rDam = r.nextInt(11)-5
			def damage = Math.max(((hitter.stats.PAtk + rDam) * CRIT_MULTIP).intValue() - victim.stats.PDef,1)
			if(warrior){
				criticalHits++
				damageDone += damage
			}else{
				damageTaken += damage
			}
			return damage
		}else if(rAtk + hitter.stats.Acc >= rDef + victim.stats.Eva){
			def rDam = r.nextInt(11)-5
			def damage = Math.max(hitter.stats.PAtk + rDam - victim.stats.PDef,1)
			if(warrior){
				hits++
				damageDone += damage
			}else{
				damageTaken += damage
			}
			return damage
		}else{
			if(warrior)
				hitsMissed++
				
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
			monsterLife -= tryToHit(warrior, monster, true)
			warrior_rate -= ATK_RATE
			if(monsterLife <= 0){
//				killedEntry(warrior.name, monster.name)
				return
			}
		}else{
			warrior.actualHP -= tryToHit(monster, warrior, false)
			monster_rate -= ATK_RATE
			if(warrior.actualHP <= 0){
//				killedEntry(monster.name, warrior.name)
				return
			}
		}

		//Continuacion de la pelea contemplado el Attack Rate
		while(warrior.actualHP > 0 && monsterLife > 0){
			if(warrior_rate >= monster_rate){
				monsterLife -= tryToHit(warrior, monster, true)
				warrior_rate -= ATK_RATE
				if(monsterLife <= 0){
//					killedEntry(warrior.name, monster.name)
				}else if(monster_rate < 0){
					monster_rate = monster.stats.ARate
				}
			}else{
				warrior.actualHP -= tryToHit(monster, warrior, false)
				monster_rate -= ATK_RATE
				if(warrior.actualHP <= 0){
//					killedEntry(monster.name, warrior.name)
				}else if(warrior_rate < 0){
					warrior_rate = warrior.stats.ARate
				}
			}
		}
	}
	
	void resolveFight(){
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
		}
		if(hits + criticalHits > 0)
			averageDamagePerHit = ((double)damageDone / (double)(hits + criticalHits)).round(1)
		warrior.save(flush:true)
	}
}
