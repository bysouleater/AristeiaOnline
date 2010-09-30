package com.ao.monster

import com.ao.character.Warrior

class Encounter {
	
	String description
	int chance
	
	static hasMany = [monsters:Monster]
	
    static constraints = {
		chance(minSize:1,maxSize:100)
		description(blank:false,maxSize:200)
    }
	
	Long totalExp(){
		Long value = 0
		monsters.each{
			value += it.exp
		}
		return value
	}
	
	Long totalGold(){
		Long value = 0
		monsters.each{
			value += it.gold
		}
		return value
	}
	
	def totalLoot(){
		def loot = []
		monsters.each{ monster ->
			monster.loot.each{ item ->
				loot.add item
			}
		}
		return loot
	}
	
	void checkEncounter(def warrior, def chance_mult){
		
	}
}
