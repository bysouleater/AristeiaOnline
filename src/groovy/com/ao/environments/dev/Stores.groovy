package com.ao.environments.dev

import com.ao.items.Weapon;
import com.ao.places.Store;

class Stores {

	static def init = {
		println "Creando Stores"
		
		def cebrene_weapons = new Store(name:"Cebrene Weapons")
		cebrene_weapons.addToItems(Weapon.findByName("Rusted Long Sword"))
		assertSave cebrene_weapons
		Maps.cebrene_map.weapons = cebrene_weapons
		assertSave Maps.cebrene_map
//		
//		def astore = new Store(name:"Armors")
//		astore.addToItems(shirt)
//		astore.save()
//		
//		def cstore = new Store(name:"Consumables")
//		cstore.addToItems(apple)
//		cstore.save()
	}
	
	static def assertSave(def domain){
		assert domain.save() != null
	}
}
