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
	Equipment equip
	
	static hasMany = [inventory:Item]
	
	static int INVENTORY_MAX_QTY = 20

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
		equip(nullable:false)
    }
	
	void initWarrior(){
		level = 1
		actualExp = 0
		statPoints = 0
		gold = 100
		actualLocation = origin.map
		
		StatsList stats = new StatsList()
		origin.stats.all().each{key, val -> stats."$key" = val}
		job.baseStats.all().each{key, val -> stats."$key" += val}
		gender == "M"?stats.STR++:stats.AGI++
		stats.save()
		this.stats = stats
		
		
		def equip = new Equipment()
		equip.save()
		this.equip = equip
		
		refreshDerivedStats()
		actualHP = maxHP()
		actualSTA = maxSTA()
	}
	
	//Los jobs no pueden dar estos stats
	void refreshDerivedStats(){
		stats."PAtk"  = calcStat("STR","PAtk" ,1).intValue()
		stats."PDef"  = calcStat("CON","PDef" ,1).intValue()
		stats."Acc"   = calcStat("DEX","Acc"  ,2).intValue()
		stats."Eva"   = calcStat("AGI","Eva"  ,2).intValue()
		stats."ARate" = calcStat("AGI","ARate",5).intValue()
		stats."CRate" = calcStat("DEX","CRate",5).intValue()
		stats."Init"  = calcStat("DEX","Init" ,10).intValue()
		stats."Luck"  = calcStat("AGI","Luck" ,10).intValue()
		
		stats."STAP"  = calcStat("STR","STAP",100)
		stats."HPP"   = calcStat("CON","HPP" ,100)
		
		stats.save()
	}
	
	double calcStat(String baseStat, String derivedStat, int divisor){
		return (double)((double)(completeBaseStat(baseStat) + level) / divisor) + bonusBaseStat(derivedStat)
	}
	
	/**
	 * Stat base redondeado
	 * Unicamente util para STR,DEX,AGI,CON
	 */
	double baseStat(String stat){
		return stats."$stat"
	}
	
	/**
	 * Stat bonus del equip + skills
	 * Util para todos los stats
	 */
	double bonusBaseStat(String stat){
		return equip.equipStat(stat)
	}
	
	/**
	 * Stat completo
	 * Util para STR,DEX,CON,AGI
	 */
	double completeBaseStat(String stat){
		return baseStat(stat) + bonusBaseStat(stat)
	}
	
	/**
	 * Stat derivado previamente calculado salvo para HPP y STAP
	 */
	int completeDerivedStat(String stat){
		return stats."$stat"
	}
	
	int maxHP(){
		double value = completeBaseStat("HP")
		value += (double)((double)value * (double)stats.HPP)
		return value.intValue()
	}
	
	int maxSTA(){
		double value = completeBaseStat("STA")
		value += (double)((double)value * (double)stats.STAP)
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
		return (((actualExp-baseLvlExp()) * 100 / (nextLvlExp()-baseLvlExp())) * 1.25).intValue()
	}
	
	void levelUp(){
		statPoints += 2
		level++
		job.levelUpStats.all().each{key, val -> stats."$key" += val}
		refreshDerivedStats()
		actualHP = maxHP()
		actualSTA = maxSTA()
		save()
	}
	
	void updateStat(def stat){
		stats."$stat" += 1
		statPoints--
		refreshDerivedStats()
		save()
	}
}
