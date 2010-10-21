package com.ao.items

import com.ao.StatsList;

class Consumable extends ItemType{

	StatsList stats
	String description
	
	boolean consumable = true
	
    static constraints = {
		stats(nullable:false)
    }
	
	public String toString() {
		return "Consumable: ${name}"
	}
}
