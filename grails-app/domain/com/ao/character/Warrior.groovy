package com.ao.character

import com.ao.SkillsList 
import com.ao.StatsList 
import com.ao.items.Armor 
import com.ao.items.Item 
import com.ao.items.Weapon 
import com.ao.places.City 
import org.joda.time.DateTime
import com.ao.character.JournalEntry
import com.ao.places.Map
import com.ao.items.ItemType

class Warrior {
	
	static int INVENTORY_MAX_QTY = 20
	
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
	SkillsList skills
	City origin
	Map actualLocation
	Map resurrectionMap
	Equipment equip
	
	Long lastSTAModified
	Long lastSTAModifiedDelta
	Long lastHPModified
	Long lastHPModifiedDelta
	
	List inventory
	List questsInProgress
	static hasMany = [inventory:Item, journal:JournalEntry, questsInProgress:Quest, questsDone:Quest]
	
	static mapping = {
		journal sort:"dateCreated", order: "desc"
	}		
		
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
		resurrectionMap(nullable:false)
		equip(nullable:false)
    }
	
	void initWarrior(def params){
		name = params.name
		gender = params.gender
		origin = City.get(params.origin as Long)
		if(!params.name || !params.gender || !origin)
			return
		job = Job.get(Job.NEWBIE);
		level = 1
		actualExp = 0
		statPoints = 0
		gold = 100
		actualLocation = origin.map
		resurrectionMap = origin.map
		
		SkillsList skills = new SkillsList()
		skills.save()
		this.skills = skills
		
		StatsList stats = new StatsList()
		origin.stats.all().each{key, val -> stats."$key" = val}
		job.baseStats.all().each{key, val -> stats."$key" += val}
		gender == "M"?stats.STR++:stats.AGI++
		stats.save()
		this.stats = stats
		
		def knife = new Item(type:Weapon.get(1L))
		knife.save()
		
		def shirt = new Item(type:Armor.get(3L))
		shirt.save()
		
		def equip = new Equipment(weapon:knife,body:shirt)
		equip.save()
		this.equip = equip
		
		refreshDerivedStats()
		actualHP = maxHP()
		actualSTA = maxSTA()
		lastSTAModified = new DateTime().getMillis()
		lastSTAModifiedDelta = 0 
		lastHPModified = new DateTime().getMillis()
		lastHPModifiedDelta = 0
		
		def je = new JournalEntry(type:JournalEntry.TEXT, text:"<b>A new warrior was born under the name of ${name}. Good luck warrior! Try to do your best!</b>")
		je.save()
		addToJournal(je)
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
		double val = 0
		if(stat == "STR"){
			val += (skills.Athletics / 10).intValue()
			val += (skills.Climb / 10).intValue()
		}else if(stat == "DEX"){
			val += (skills.Aiming / 10).intValue()
			val += (skills.Thievery / 10).intValue()
		}else if(stat == "AGI"){
			val += (skills.Escape_Artist / 10).intValue()
			val += (skills.Stealth / 10).intValue()
		}else if(stat == "CON"){
			val += (skills.Endurance / 10).intValue()
			val += (skills.Concentration / 10).intValue()
		}
		
		return val + equip.equipStat(stat)
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
		lastSTAModified = new DateTime().getMillis()
		lastSTAModifiedDelta = 0
		lastHPModified = new DateTime().getMillis()
		lastHPModifiedDelta = 0
//		save()
	}
	
	void updateStat(def stat){
		if(statPoints > 0 && stats.hasProperty(stat)){
			stats."$stat" += 1
			statPoints--
			refreshDerivedStats()
		}
	}
	
	void giveExp(Long exp){
		if(level < job.maxLevel){
			actualExp += exp
			while(actualExp >= nextLvlExp()){
				levelUp()
				def je = new JournalEntry(type:JournalEntry.TEXT, text:"<b>You reach the next level! You are now level ${level}. Congrats!</b>")
				je.save()
				addToJournal(je)
				
			}
		}
	}
	
	int STARecoverAmount(){
		return 5 * maxSTA() / 100  
	}
	
	int HPRecoverAmount(){
		return 5 * maxHP() / 100
	}
	
	void refreshSTA(){
		Long now = new DateTime().getMillis()
		Long dif = now - lastSTAModified + lastSTAModifiedDelta  
		int refresh_rate = (100-completeBaseStat("AGI") + 20) * 1000
		if(actualLocation.city)
			refresh_rate = Math.max((refresh_rate / 2).intValue(), 1)
		int sta = (dif - (dif % refresh_rate)) / refresh_rate
		if(sta < 1)
			return
		if(actualSTA + (sta * STARecoverAmount()) > maxSTA())
			actualSTA = maxSTA()
		else
			actualSTA += sta * STARecoverAmount()
			
		lastSTAModified = now
		lastSTAModifiedDelta = dif % refresh_rate
//		save()
	}
	
	void refreshHP(){
		Long now = new DateTime().getMillis()
		Long dif = now - lastHPModified + lastHPModifiedDelta
		int refresh_rate = (100-completeBaseStat("CON") + 20) * 1000
		if(actualLocation.city)
			refresh_rate = Math.max((refresh_rate / 2).intValue(), 1)
		int hp = (dif - (dif % refresh_rate)) / refresh_rate
		if(hp < 1)
			return
		if(actualHP + (hp * HPRecoverAmount()) > maxHP())
			actualHP = maxHP()
		else
			actualHP += hp * HPRecoverAmount()
			
		lastHPModified = now
		lastHPModifiedDelta = dif % refresh_rate
//		save()
	}
	
	int qtyOfItem(ItemType i){
		if(!inventory)
			return 0
		def qty = 0
		inventory.each{
			if(it.type.id == i.id && it.qty)
				qty += it.qty // Si lo tiene repetido, le muestro la suma de todos los que tiene.
		}
		return qty
	}
	
	void changeJob(Job newjob){
		job = newjob
		job.baseStats.all().each{key, val -> stats."$key" += val}
		stats.save()
		
		refreshDerivedStats()
		actualHP = maxHP()
		actualSTA = maxSTA()
		
		def je = new JournalEntry(type:JournalEntry.TEXT, text:"Congrats! You have just changed into a <b>${job.name}</b>. A new path begins.")
		je.save()
		addToJournal(je)
	}
	
	boolean canSpendSTA(def qty){
		if(actualSTA >= qty){
			actualSTA -= qty
			return true
		}
		return false
	}
	
	boolean canBuy(def price){
		if(gold >= price){
			gold -= price
			return true
		}
		return false
	}
	
	void unequipItem(def equiptype){
		if(equip."$equiptype"){
			if(inventory.size() < INVENTORY_MAX_QTY){
				addToInventory(equip."$equiptype")
				equip."$equiptype" = null
				equip.save()
			}
		}
		refreshDerivedStats()
	}
	
	void equipItem(def item){
		if(item.type.isWeapon()){
			def auxitem = equip.weapon
			equip.weapon = item
			removeFromInventory(item)
			if(auxitem)
				addToInventory(auxitem)
		}else if(item.type.isArmor()){
			def auxitem
			def acc
			switch(item.type.type){
				case Armor.HEAD:
					auxitem = equip.head;
					equip.head = item
					break;
				case Armor.SHOULDER:
					auxitem = equip.shoulder;
					equip.shoulder = item
					break;
				case Armor.BODY:
					auxitem = equip.body;
					equip.body = item
					break;
				case Armor.SHIELD:
					auxitem = equip.shield;
					equip.shield = item
					break;
				case Armor.FOOT:
					auxitem = equip.foot;
					equip.foot = item
					break;
				case Armor.ACCESORY:
					if(!equip.accesory1)
						equip.accesory1 = item
					else if(!equip.accesory2)
						equip.accesory2 = item
					else{
						auxitem = equip.accesory1
						equip.accesory1 = item
					}
					break
			}
			removeFromInventory(item)
			if(auxitem)
				addToInventory(auxitem)
		}
		equip.save()
		refreshDerivedStats()
	}
	
	void useItem(def item){
		if(item.type.consumable){
			if(item.type.stats.HP > 0){
				actualHP = Math.min(actualHP + item.type.stats.HP, maxHP())
			}
			if(item.qty > 1){
				item.qty--
				item.save()
			}else{
				removeFromInventory(item)
				item.delete()
			}
		}
	}
	
	void giveItem(def itemtype, def qty){
		def someleft = qty
		if(itemtype.stackable){
			inventory.each{ inv_item ->
				if(someleft == 0)
					return
				if(inv_item.type == itemtype){
					if(inv_item.qty + someleft > 1000){
						someleft = (inv_item.qty + someleft - 1000)
						inv_item.qty = 1000
					}else{
						inv_item.qty += someleft
						someleft = 0
					}
					inv_item.save()
				}
			}
		}
		
		if(someleft > 0){
			def newitem = new Item(type:itemtype, qty:someleft)
			newitem.save()
			addToInventory(newitem)
		}
	}
	
	def takeItem(Item item, def qty){
		if(item.qty - qty <= 0){
			removeFromInventory(item)
			return item.qty
		}

		item.qty -= qty
		item.save()
		return qty
	}
	
	def takeItem(ItemType itemtype, def qty){
		def left = qty
		def del = []
		inventory.each{ invitem ->
			if(left == 0)
				return
			if(invitem.type == itemtype){
				if(invitem.qty - left <= 0){
					del.add(invitem)
					left -= invitem.qty
				}else{
					invitem.qty -= left
					invitem.save()
					left = 0
				}
			}
		}
		if(del && del.size() > 0){
			del.each{
				removeFromInventory(it)
			}
		}
	}
	
	def giveSkill(def skill, def gained){
		def previous_value = skills."$skill".round(1) 
		skills."$skill" = Math.min((skills."$skill" + gained).round(1),job.maxSkillsValue)
		return (skills."$skill" - previous_value).round(1)
	}
}
