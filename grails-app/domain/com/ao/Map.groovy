package com.ao

class Map {

	String name
	boolean city
	
	static hasMany = [encounters:Encounter,trainingPlaces:TrainingPlace]
	
    static constraints = {
		name(nullable:false,blank:false)
    }
}
