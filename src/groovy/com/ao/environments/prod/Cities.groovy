package com.ao.environments.prod


import com.ao.StatsList;
import com.ao.places.City;

class Cities {
	
	static def cebrene_city
	static def chalcedon_city
	static def baris_city
	static def mallia_city
	
	static def init = {
		println "Creando Cities"
		
		def cebrene_stats = new StatsList(STR:8d,DEX:5d,CON:5d,AGI:5d)
		assertSave cebrene_stats
		def chalcedon_stats = new StatsList(STR:5d,DEX:8d,CON:5d,AGI:5d)
		assertSave chalcedon_stats
		def baris_stats = new StatsList(STR:5d,DEX:5d,CON:8d,AGI:5d)
		assertSave baris_stats
		def mallia_stats = new StatsList(STR:5d,DEX:5d,CON:5d,AGI:8d)
		assertSave mallia_stats
		
		cebrene_city = new City(name:"Cebrene", stats:cebrene_stats, map:Maps.cebrene_map)
		assert cebrene_city.save() != null
		chalcedon_city = new City(name:"Chalcedon", stats:chalcedon_stats, map:Maps.chalcedon_map)
		chalcedon_city.save()
		baris_city = new City(name:"Baris", stats:baris_stats, map:Maps.baris_map)
		baris_city.save()
		mallia_city = new City(name:"Mallia", stats:mallia_stats, map:Maps.mallia_map)
		mallia_city.save()
	}
	
	static def assertSave(def domain){
		assert domain.save() != null
	}
}
