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
	Long gold
	
	Job job
	StatsList stats
	City origin
	Map actualLocation
	
	static hasMany = [equip:Item,inventory:Item]

    static constraints = {
		owner_id(nullable:false)
		name(nullable:false,blank:false,maxSize:30,unique:true)
		gender(inList:["M","F"])
		actualHP(minSize:0)
		actualSTA(minSize:0)
		statPoints(minSize:0)
		gold(minSize:0)
		job(nullable:false)
		stats(nullable:false)
		origin(nullable:false)
		actualLocation(nullable:false)
    }
	
	void initWarrior(){
		level = 1
		actualExp = 0
		statPoints = 0
		StatsList stats = new StatsList()
		origin.stats.all().each{key, val -> stats."$key" = val}
		job.baseStats.all().each{key, val -> stats."$key" += val}
		gender == "M"?stats.STR++:stats.AGI++
		stats.save()
		this.stats = stats
		refreshBaseStats()
		actualHP = baseStat("HP")
		actualSTA = baseStat("STA")
		gold = 100
		actualLocation = origin.map
	}
	
	void refreshBaseStats(){
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
	
	int baseStat(String stat){
		double value = stats."$stat"
		if(stat == "HP" || stat == "STA"){
			def sp = stat+"P"
			value += (double)((double)value * (double)stats."$sp")
		}
		return value.intValue()
	}
	
	int bonusStat(String stat){
		//despues veo
		return 0
	}
	
	int completeStat(String stat){
		return baseStat(stat) + bonusStat(stat)
	}
	
//	int getStatBonus(String stat, boolean perc){
//		def sp = stat+"P"
//		double value
//		
//		if(equip){
//			equip.each{ item ->
//				value += item.type.stats."$stat"
//				if(perc){
//					value += (double)((double)value * (double)stats."$sp")
//					value += (double)((double)value * (double)job.stats."$sp")
//				}
//			}	
//		}
//		 
//		
//		
//		return value.intValue()
//	}
	
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
	
	void levelUp(){
		statPoints += 2
		level++
		job.levelUpStats.all().each{key, val -> stats."$key" += val}
		refreshBaseStats()
		actualHP = completeStat("HP")
		actualSTA = completeStat("STA")
		save()
	}
	
	void updateStat(def stat){
		stats."$stat"++
		statPoints--
		refreshBaseStats()
		save()
	}
}
