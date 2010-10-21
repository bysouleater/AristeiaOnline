package com.ao.places


import com.ao.StatsList 
import com.ao.items.ItemType;

class City {

	String name
	StatsList stats
	Map map
	static hasMany = [initial_equip:ItemType]

    static constraints = {
		name(nullable:false,blank:false,unique:true,maxSize:30)
		stats(nullable:false)
		map(nullable:false)
    }
	
	public String toString() {
		return name
	}
}
