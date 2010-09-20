package com.ao.items

import com.ao.StatsList;

class Consumable extends ItemType{

	StatsList stats
	
    static constraints = {
		stats(nullable:false)
    }
}
