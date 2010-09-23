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
	
	boolean resolveFight(){
		def alive = true
		encounter.monsters.each{
			if(!alive)
				return
			def monsterLife = it.stats.HP
			while(warrior.actualHP > 0 && monsterLife > 0){
				if(warrior.stats.Init >= it.stats.Init){
					monsterLife = Math.max(monsterLife - warrior.stats.PAtk, 0)
					def fe = new FightEntry(text:"${warrior.name} hit ${it.name} for ${warrior.stats.PAtk}.")
					fe.save(flush:true)
					addToDetails(fe)
					save(flush:true)
					if(monsterLife > 0){
						warrior.actualHP = Math.max(warrior.actualHP - it.stats.PAtk, 0)
						def fe2 = new FightEntry(text:"${it.name} hit ${warrior.name} for ${it.stats.PAtk}.")
						fe2.save(flush:true)
						addToDetails(fe2)
						save(flush:true)
					}else{
						def fe2 = new FightEntry(text:"${warrior.name} killed ${it.name}.")
						fe2.save(flush:true)
						addToDetails(fe2)
						save(flush:true)
					}
				}else{
					warrior.actualHP = Math.max(warrior.actualHP - it.stats.PAtk, 0)
					def fe2 = new FightEntry(text:"${it.name} hit ${warrior.name} for ${it.stats.PAtk}.")
					fe2.save(flush:true)
					addToDetails(fe2)
					save(flush:true)
					if(warrior.actualHP > 0){
						monsterLife = Math.max(monsterLife - warrior.stats.PAtk, 0)
						def fe = new FightEntry(text:"${warrior.name} hit ${it.name} for ${warrior.stats.PAtk}.")
						fe.save(flush:true)
						addToDetails(fe)
						save(flush:true)
						if(monsterLife == 0){
							def fe3 = new FightEntry(text:"${warrior.name} killed ${it.name}.")
							fe3.save(flush:true)
							addToDetails(fe3)
							save(flush:true)
						}
					}
				}
			}
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
