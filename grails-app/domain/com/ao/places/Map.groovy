package com.ao.places

import com.ao.items.Item;
import com.ao.monster.Encounter
import com.ao.places.TrainingPlace


class Map {

	String name
	boolean city
	int posX
	int posY
	String picture
	Store weapons
	Store armors
	Store consumables
	
	static hasMany = [encounters:Encounter,items:Item,trainingPlaces:TrainingPlace]
	
    static constraints = {
		name(nullable:false,blank:false)
		picture(nullable:true)
		weapons(nullable:true)
		armors(nullable:true)
		consumables(nullable:true)
    }
	
	static def getWorldMap(){
		def maps = list()
		Map[][] worldmap = new Map[7][7]
		maps.each{
			worldmap[it.posX][it.posY] = it
		}
		return worldmap
	}
}
