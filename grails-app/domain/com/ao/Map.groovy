package com.ao

class Map {

	String name
	boolean city
	
	static hasMany = [encounters:Encounter]
	
    static constraints = {
    }
}
