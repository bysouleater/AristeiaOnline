package com.ao

class Warrior {
	
	Long owner_id
	String name
	String gender = "M"
	int level = 1
	Long actualExp = 0
	int actualHP = 0
	int actualSTA = 0
	int statPoints = 0
	
	Job job
	StatsList stats
	City origin

    static constraints = {
    }
	
	int getStat(String stat, boolean perc){
		//suma
		def value = stats."$stat"
		//porcentajes
		if(perc){
			def sp = stat+"P"
			value += (value * stats."$sp")
		}
		return value.intValue()
	}
	
	Long nextLvlExp(){
		return fact(level) * 1000 as Long
	}
	
	int fact(int l){
		int sum = 1
		for(int x = 2; x < (l+1); x++)
			sum += x
		return sum
	}
	
	int actualExpPerc(){
		return (((actualExp-baseLvlExp()) * 100 / (nextLvlExp()-baseLvlExp())) * 1.5).intValue()
	}
	
	Long baseLvlExp(){
		if(level == 1)
			return 0L
		return fact(level-1) * 1000 as Long
	}
}
