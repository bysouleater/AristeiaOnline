package com.ao.environments.dev

import com.ao.items.Weapon;
import com.ao.places.Store;

class Stores {

	static def init = {
		println "Creando Stores"
		
		def cebrene_weapons = new Store(name:"Cebrene Weapons")
		cebrene_weapons.addToItems(Weapon.findByName("Rusted Long Sword"))
		cebrene_weapons.save()
//		
//		def astore = new Store(name:"Armors")
//		astore.addToItems(shirt)
//		astore.save()
//		
//		def cstore = new Store(name:"Consumables")
//		cstore.addToItems(apple)
//		cstore.save()
	}
}
