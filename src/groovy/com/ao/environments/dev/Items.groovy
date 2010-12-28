package com.ao.environments.dev

import com.ao.StatsList;
import com.ao.items.Armor;
import com.ao.items.Weapon;

class Items {
	
	static def init = {
		
		println "Creando Items"
		
		createWeapons()
		createArmors()
		
	}
	
	static def createWeapons(){
		createHeavyWeapons()
	}
	
	static def createArmors(){
		createHeadArmors()
	}
	
	static def createHeavyWeapons() {
		def newbie_long_sword = createWeapon("Newbie Long Sword",2,"/images/sword.png",Weapon.HEAVY, 2, [PAtk:4], [Jobs.newbie_job])
		Cities.cebrene_city.addToInitial_equip(newbie_long_sword)
		assertSave Cities.cebrene_city
		
		createWeapon("Rusted Long Sword",130,"/images/sword.png",Weapon.HEAVY,2,[PAtk:7],null)
	}
	
	static def createHeadArmors() {
		def newbie_cap = createArmor("Newbie Cap", 2, "/images/no_icon.png", Armor.HEAD, [PDef:1], [Jobs.newbie_job])
		Cities.cebrene_city.addToInitial_equip(newbie_cap)
		assertSave Cities.cebrene_city
	}
	
	static def createWeapon(def name, def price, def icon, def type, def handsQty, def stats, def jobs){
		def weapon_stats = new StatsList(stats)
		assertSave weapon_stats
		def weapon = new Weapon(name:name, price:price, icon:icon, type:type, handsQty:handsQty, stats:weapon_stats)
		if(jobs){
			jobs.each{
				weapon.addToJobs(it)
			}
		}
		assertSave weapon
		return weapon
	}	
	
	static def createArmor(def name, def price, def icon, def type, def stats, def jobs){
		def armor_stats = new StatsList(stats)
		assertSave armor_stats
		def armor = new Armor(name:name, price:price, icon:icon, type:type, stats:armor_stats)
		if(jobs){
			jobs.each{
				armor.addToJobs(it)
			}
		}
		assertSave armor
		return armor
	}
	
	static def assertSave(def domain){
		assert domain.save() != null
	}
}
