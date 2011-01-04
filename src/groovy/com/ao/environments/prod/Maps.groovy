package com.ao.environments.prod


import com.ao.places.Map;

class Maps {
	
	static def chalcedon_map
	static def baris_map
	static def mallia_map
	static def cebrene_map

	static def init = {
		println "Creando Mapas"
		
		def map = new Map(name:"Cretan Labyrinth",city:false, posX:0, posY:1, picture:"/images/worldmap/0_1.png")
		assertSave map
		map = new Map(name:"Cretan Mountain Zone 01",city:false, posX:0, posY:2, picture:"/images/worldmap/0_2.png")
		assertSave map
		map = new Map(name:"Aristeia Field 01",city:false, posX:0, posY:3, picture:"/images/worldmap/0_3.png")
		assertSave map
		map = new Map(name:"Aristeia Field 02",city:false, posX:0, posY:4, picture:"/images/worldmap/0_4.png")
		assertSave map
		map = new Map(name:"Cistene Fields 01",city:false, posX:0, posY:5, picture:"/images/worldmap/0_5.png")
		assertSave map
		map = new Map(name:"Cistene Swamp",city:false, posX:0, posY:6, picture:"/images/worldmap/0_6.png")
		assertSave map
		map = new Map(name:"Cretan Mountain Zone 02",city:false, posX:1, posY:1, picture:"/images/worldmap/1_1.png")
		assertSave map
		map = new Map(name:"Cebrene Fields 04",city:false, posX:1, posY:2, picture:"/images/worldmap/1_2.png")
		assertSave map
		cebrene_map = new Map(name:"Cebrene City",city:true, posX:1, posY:3, picture:"/images/worldmap/1_3.png")
		assertSave cebrene_map
		map = new Map(name:"Aristeia Field 03",city:false, posX:1, posY:4, picture:"/images/worldmap/1_4.png")
		assertSave map
		map = new Map(name:"Aristeia Field 04",city:false, posX:1, posY:5, picture:"/images/worldmap/1_5.png")
		assertSave map
		map = new Map(name:"Cistene Fields 02",city:false, posX:1, posY:6, picture:"/images/worldmap/1_6.png")
		assertSave map
		map = new Map(name:"Aristeia Field 05",city:false, posX:2, posY:1, picture:"/images/worldmap/2_1.png")
		assertSave map
		map = new Map(name:"Aristeia Field 06",city:false, posX:2, posY:2, picture:"/images/worldmap/2_2.png")
		assertSave map
		map = new Map(name:"Aristeia Field 07",city:false, posX:2, posY:3, picture:"/images/worldmap/2_3.png")
		assertSave map
		map = new Map(name:"Aristeia Field 08",city:false, posX:2, posY:4, picture:"/images/worldmap/2_4.png")
		assertSave map
		chalcedon_map = new Map(name:"Chalcedon City",city:true, posX:2, posY:5, picture:"/images/worldmap/2_5.png")
		assertSave chalcedon_map
		map = new Map(name:"Aristeia Field 09",city:false, posX:2, posY:6, picture:"/images/worldmap/2_6.png")
		assertSave map
		mallia_map = new Map(name:"Mallia City",city:true, posX:3, posY:1, picture:"/images/worldmap/3_1.png")
		assertSave mallia_map
		map = new Map(name:"Aristeia Field 10",city:false, posX:3, posY:2, picture:"/images/worldmap/3_2.png")
		assertSave map
		map = new Map(name:"Aristeia Field 11",city:false, posX:3, posY:3, picture:"/images/worldmap/3_3.png")
		assertSave map
		map = new Map(name:"Aristeia Field 12",city:false, posX:3, posY:4, picture:"/images/worldmap/3_4.png")
		assertSave map
		map = new Map(name:"Aristeia Field 13",city:false, posX:3, posY:5, picture:"/images/worldmap/3_5.png")
		assertSave map
		map = new Map(name:"Aristeia Field 14",city:false, posX:3, posY:6, picture:"/images/worldmap/3_6.png")
		assertSave map
		map = new Map(name:"Lycia Gold Mine",city:false, posX:4, posY:0, picture:"/images/worldmap/4_0.png")
		assertSave map
		map = new Map(name:"Aristeia Field 15",city:false, posX:4, posY:1, picture:"/images/worldmap/4_1.png")
		assertSave map
		map = new Map(name:"Aristeia Field 16",city:false, posX:4, posY:2, picture:"/images/worldmap/4_2.png")
		assertSave map
		map = new Map(name:"Aristeia Field 17",city:false, posX:4, posY:3, picture:"/images/worldmap/4_3.png")
		assertSave map
		map = new Map(name:"Aristeia Field 18",city:false, posX:4, posY:4, picture:"/images/worldmap/4_4.png")
		assertSave map
		map = new Map(name:"Aristeia Field 19",city:false, posX:4, posY:5, picture:"/images/worldmap/4_5.png")
		assertSave map
		map = new Map(name:"Lycia Fields 01",city:false, posX:5, posY:0, picture:"/images/worldmap/5_0.png")
		assertSave map
		map = new Map(name:"Aristeia Field 20",city:false, posX:5, posY:1, picture:"/images/worldmap/5_1.png")
		assertSave map
		baris_map = new Map(name:"Baris City",city:true, posX:5, posY:2, picture:"/images/worldmap/5_2.png")
		assertSave baris_map
		map = new Map(name:"Aristeia Field 21",city:false, posX:5, posY:3, picture:"/images/worldmap/5_3.png")
		assertSave map
		map = new Map(name:"Aristeia Field 22",city:false, posX:5, posY:4, picture:"/images/worldmap/5_4.png")
		assertSave map
		map = new Map(name:"Aristeia Field 23",city:false, posX:5, posY:5, picture:"/images/worldmap/5_5.png")
		assertSave map
		map = new Map(name:"Lycia Way",city:false, posX:6, posY:0, picture:"/images/worldmap/6_0.png")
		assertSave map
		map = new Map(name:"Lycia Fields 02",city:false, posX:6, posY:1, picture:"/images/worldmap/6_1.png")
		assertSave map
		map = new Map(name:"Aristeia Field 24",city:false, posX:6, posY:2, picture:"/images/worldmap/6_2.png")
		assertSave map
		map = new Map(name:"Baris Falls",city:false, posX:6, posY:3, picture:"/images/worldmap/6_3.png")
		assertSave map
		
	}
	
	static def assertSave(def domain){
		assert domain.save() != null
	}
}
