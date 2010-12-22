package com.ao.environments.dev

import com.ao.StatsList;
import com.ao.items.Weapon;

class Items {
	
	static def init = {
		
		println "Creando Items"
		
		
		
		def newbie_long_sword_stats = new StatsList(PAtk:4)
		newbie_long_sword_stats.save()
		def newbie_long_sword = new Weapon(name:"Newbie Long Sword", price:2, icon:"/images/sword.png", consumable:false, type:Weapon.HEAVY, handsQty:2, stats:newbie_long_sword_stats)
		newbie_long_sword.save()
		
		Cities.cebrene_city.addToInitial_equip(newbie_long_sword)
		Cities.cebrene_city.save()
		
		/*
		
		
		def knifeStats = new StatsList(PAtk:5)
		knifeStats.save()
		def knife = new Weapon(name:"Knife", price:10, icon:"/images/knife.png", consumable:false, type:Weapon.LIGHT,handsQty:1,stats:knifeStats)
		knife.save()
		
		def chrysaorStats = new StatsList(PAtk:200,STR:5,Acc:10)
		chrysaorStats.save()
		def chrysaor = new Weapon(name:"Chrysaor sword", price:1, icon:"/images/no_icon.png", consumable:false, type:Weapon.NORMAL, handsQty:1, stats:chrysaorStats)
		chrysaor.addToJobs(Job.get(Job.BARBARIAN))
		chrysaor.save()
		
		
		def shirtStats = new StatsList(PDef:5)
		shirtStats.save()
		def shirt = new Armor(name:"Cotton Shirt", price:10, icon:"/images/shirt.png", consumable:false, type:Armor.BODY,stats:shirtStats)
		shirt.save()
		
		def appleStats = new StatsList(HP:10)
		appleStats.save()
		def apple = new Consumable(name:"Apple",price:5,icon:"/images/apple.png",stats:appleStats,stackable:true, description:"Recovers 10 HP")
		apple.save()*/
	}

}
