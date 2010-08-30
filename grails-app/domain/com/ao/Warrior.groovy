package com.ao

class Warrior {
	
	Long owner_id
	String name
	String gender
	int level
	Long actualExp
	int actualHP
	int actualSTA
	int statPoints
	
	Job job
	StatsList stats
	City origin

    static constraints = {
    }
	
	int getStat(String stat, boolean perc){
		double value = stats."$stat"
		value += job.stats."$stat"
		if(perc){
			def sp = stat+"P"
			value += (double)((double)value * (double)stats."$sp")
			value += (double)((double)value * (double)job.stats."$sp")
		}
		return value.intValue()
	}
	
	Long nextLvlExp(){
		return lvlExp(level)
	}
	
	Long baseLvlExp(){
		return lvlExp(level-1)
	}
	
	Long lvlExp(def l){
		return fact(l) * 1000 as Long
	}
	
	Long fact(int l){
		if(l == 0)
			return 0L
		int sum = 1
		for(int x = 2; x < (l+1); x++)
			sum += x
		return sum
	}
	
	int actualExpPerc(){
		return (((actualExp-baseLvlExp()) * 100 / (nextLvlExp()-baseLvlExp())) * 1.5).intValue()
	}
	
	void initWarrior(){
		level = 1
		actualExp = 0
		statPoints = 0
		
		StatsList stats = new StatsList()
		
		origin.stats.all().each{key, val -> stats."$key" += val}
		job.stats.all().each{key, val -> stats."$key" += val}
		gender == "M"?stats.STR++:stats.AGI++
		stats.save()
		this.stats = stats
		refreshStats()
		actualHP = getStat("HP",true)
		actualSTA = getStat("STA",true)
	}
	
	void refreshStats(){
		stats."PAtk"  =   stats."STR" + level
		stats."PDef"  =   stats."CON" + level
		stats."Acc"   = ((stats."DEX" + level) / 2) 
		stats."Eva"   = ((stats."AGI" + level) / 2)
		stats."ARate" = ((stats."AGI" + level) / 5) 
		stats."CRate" = ((stats."DEX" + level) / 5)
		stats."Init"  = ((stats."DEX" + level) / 10)
		stats."Luck"  = ((stats."AGI" + level) / 10)
		stats."STAP"  = (double)((double)(stats."STR" + level) / 100) 
		stats."HPP"   = (double)((double)(stats."CON" + level) / 100)
	}
	
	void levelUp(){
		statPoints += 2
		level++
		job.stats.all().each{key, val -> stats."$key" += val}
		refreshStats()
		actualHP = getStat("HP",true)
		actualSTA = getStat("STA",true)
		save()
	}
	
	void updateStat(def stat){
		stats."$stat"++
		statPoints--
		refreshStats()
		save()
	}
}
