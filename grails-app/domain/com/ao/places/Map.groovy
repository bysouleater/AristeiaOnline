package com.ao.places

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
	
	static hasMany = [encounters:Encounter,trainingPlaces:TrainingPlace]
	
    static constraints = {
		name(nullable:false,blank:false)
		picture(nullable:true)
		weapons(nullable:true)
		armors(nullable:true)
		consumables(nullable:true)
    }
}
