package com.ao.items

import com.ao.StatsList;

class Consumable extends ItemType{

	StatsList stats
	
	boolean consumable = true
	
    static constraints = {
		stats(nullable:false)
    }
}
