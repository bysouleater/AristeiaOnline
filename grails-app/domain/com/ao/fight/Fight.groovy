package com.ao.fight

import com.ao.character.Warrior;
import com.ao.monster.Encounter;

class Fight {
	
	Warrior warrior
	Encounter encounter
	boolean won
	
	static hasMany = [details:FightEntry]
	
	static mapping = {
		details sort:"dateCreated"
	}

    static constraints = {
    }
	
	void fightMonster(def warrior, def monster){
		def monsterLife = monster.stats.HP
		boolean warrior_first = warrior.stats.Init >= monster.stats.Init
		def warrior_rate = warrior.stats.ARate
		def monster_rate = monster.stats.ARate
		if(warrior_first){
			monsterLife = Math.max(monsterLife - warrior.stats.PAtk, 0)
			def fe = new FightEntry(text:"${warrior.name} hit ${monster.name} for ${warrior.stats.PAtk}.")
			fe.save(flush:true)
			addToDetails(fe)
			save(flush:true)
		}else{
			warrior.actualHP = Math.max(warrior.actualHP - monster.stats.PAtk, 0)
			def fe2 = new FightEntry(text:"${monster.name} hit ${warrior.name} for ${monster.stats.PAtk}.")
			fe2.save(flush:true)
			addToDetails(fe2)
			save(flush:true)
		}
		while(warrior.actualHP > 0 && monsterLife > 0){
			if(warrior_first){
				monsterLife = Math.max(monsterLife - warrior.stats.PAtk, 0)
				def fe = new FightEntry(text:"${warrior.name} hit ${monster.name} for ${warrior.stats.PAtk}.")
				fe.save(flush:true)
				addToDetails(fe)
				save(flush:true)
				if(monsterLife > 0){
					warrior.actualHP = Math.max(warrior.actualHP - monster.stats.PAtk, 0)
					def fe2 = new FightEntry(text:"${monster.name} hit ${warrior.name} for ${monster.stats.PAtk}.")
					fe2.save(flush:true)
					addToDetails(fe2)
					save(flush:true)
				}else{
					def fe2 = new FightEntry(text:"${warrior.name} killed ${monster.name}.")
					fe2.save(flush:true)
					addToDetails(fe2)
					save(flush:true)
				}
			}else{
				warrior.actualHP = Math.max(warrior.actualHP - monster.stats.PAtk, 0)
				def fe2 = new FightEntry(text:"${monster.name} hit ${warrior.name} for ${monster.stats.PAtk}.")
				fe2.save(flush:true)
				addToDetails(fe2)
				save(flush:true)
				if(warrior.actualHP > 0){
					monsterLife = Math.max(monsterLife - warrior.stats.PAtk, 0)
					def fe = new FightEntry(text:"${warrior.name} hit ${monster.name} for ${warrior.stats.PAtk}.")
					fe.save(flush:true)
					addToDetails(fe)
					save(flush:true)
					if(monsterLife == 0){
						def fe3 = new FightEntry(text:"${warrior.name} killed ${monster.name}.")
						fe3.save(flush:true)
						addToDetails(fe3)
						save(flush:true)
					}
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
			if(warrior.actualHP == 0)
				alive = false
		}
		warrior.save()
		if(alive)
			won = true
		else
			won = false
		return won
	}
}
