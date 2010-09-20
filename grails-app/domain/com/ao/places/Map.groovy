package com.ao.places

import com.ao.monster.Encounter
import com.ao.places.TrainingPlace


class Map {

	String name
	boolean city
	int posX
	int posY
	String picture
	
	static hasMany = [encounters:Encounter,trainingPlaces:TrainingPlace]
	
    static constraints = {
		name(nullable:false,blank:false)
		picture(nullable:true)
    }
}
