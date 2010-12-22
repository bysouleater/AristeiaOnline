package com.ao.environments.dev

import com.ao.StatsList;
import com.ao.places.City;

class Cities {
	
	static def cebrene_city
	static def chalcedon_city
	static def baris_city
	static def mallia_city
	
	static def init = {
		println "Creando Cities"
		
		def cs1 = new StatsList(STR:8d,DEX:5d,CON:5d,AGI:5d)//1
		def cs2 = new StatsList(STR:5d,DEX:8d,CON:5d,AGI:5d)//23
		def cs3 = new StatsList(STR:5d,DEX:5d,CON:8d,AGI:5d)//24
		def cs4 = new StatsList(STR:5d,DEX:5d,CON:5d,AGI:8d)//25
		cs1.save(flush:true);cs2.save(flush:true);cs3.save(flush:true);cs4.save(flush:true);
		
		cebrene_city = new City(name:"Cebrene", stats:cs1, map:Maps.cebrene_map)
		assert cebrene_city.save() != null
		chalcedon_city = new City(name:"Chalcedon", stats:cs2, map:Maps.chalcedon_map)
		chalcedon_city.save()
		baris_city = new City(name:"Baris", stats:cs3, map:Maps.baris_map)
		baris_city.save()
		mallia_city = new City(name:"Mallia", stats:cs4, map:Maps.mallia_map)
		mallia_city.save()
	}

}
