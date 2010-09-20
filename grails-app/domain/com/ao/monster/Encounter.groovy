package com.ao.monster



class Encounter {
	
	static hasMany = [monsters:Monster]
	
	int chance
	String description

    static constraints = {
		chance(minSize:1,maxSize:100)
		description(nullable:false,blank:false,maxSize:200)
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
}
