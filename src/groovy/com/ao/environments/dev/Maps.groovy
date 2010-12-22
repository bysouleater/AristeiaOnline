package com.ao.environments.dev

import com.ao.places.Map;

class Maps {
	
	static def chalcedon_map
	static def baris_map
	static def mallia_map
	static def cebrene_map

	static def init = {
		println "Creando Mapas"
		
		for(int x = 0; x < 7; x++){
			for(int y = 0; y < 7; y++){
				def map
				if(x == 2 && y == 5){
					map = new Map(name:"Chalcedon city",city:true, posX:2, posY:5, picture:"/images/worldmap/2_5.png")
					chalcedon_map = map
				}else if(x == 5 && y == 2){
					map = new Map(name:"Baris city", 	city:true, posX:5, posY:2, picture:"/images/worldmap/5_2.png")
					baris_map = map
				}else if(x == 3 && y == 1){
					map = new Map(name:"Mallia city", 	city:true, posX:3, posY:1, picture:"/images/worldmap/3_1.png")
					mallia_map = map
				}else if(x == 1 && y == 3){
					map = new Map(name:"Cebrene city", 	city:true, posX:1, posY:3, picture:"/images/worldmap/1_3.png")
					cebrene_map = map
				}else{
					map = new Map(name:"Aristeia Field ${x}${y}", city:false, posX:x,posY:y, picture:"/images/worldmap/${x}_${y}.png")
				}
				println "${x}-${y}"
				assertSave {map.save(flush:true)}
			}
		}
	}
	
	static def assertSave(def clos){
		assert clos() != null
	}
}
