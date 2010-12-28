package com.ao.environments.dev

import com.ao.StatsList;
import com.ao.items.Item;
import com.ao.items.ItemType;
import com.ao.monster.Encounter;
import com.ao.monster.Monster;

class Monsters {

	static def init = {
		println "Creando Monstruos"
		
		def snake_tooth = new ItemType(name:"Snake Tooth", price:10,icon:"/images/snaketooth.png", stackable:true)
		assertSave snake_tooth
		def snake_tooth_loot = new Item(type:snake_tooth, chance:80)
		assertSave snake_tooth_loot
		
		def snake_stats = new StatsList(HP:30,PAtk:10,PDef:5,Acc:2,Eva:2,ARate:0,CRate:0,Luck:0,Init:0)
		assertSave snake_stats
		def snakeA = new Monster(name:"Snake A", stats: snake_stats, exp: 50L)
		def snakeB = new Monster(name:"Snake B", stats: snake_stats, exp: 50L)
		snakeA.addToLoot(snake_tooth_loot)
		snakeB.addToLoot(snake_tooth_loot)
		assertSave snakeA
		assertSave snakeB
		
		def snake_2_encounter = new Encounter(chance:60,description:"two Snakes")
		snake_2_encounter.addToMonsters(snakeA)
		snake_2_encounter.addToMonsters(snakeB)
		assertSave snake_2_encounter
		
		Maps.cebrene_map.addToEncounters(snake_2_encounter)
		assertSave Maps.cebrene_map 
	}
	
	static def assertSave(def domain){
		assert domain.save() != null
	}
}
