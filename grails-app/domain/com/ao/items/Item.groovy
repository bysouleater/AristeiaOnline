package com.ao.items

import com.ao.*

class Item {
	
	ItemType type
	int qty = 1
	double lootChance = 0
	Long playerPrice = 0
	int upgrade = 0
	Date dateCreated

    static constraints = {
		type(nullable:false)
		qty(minSize:1)
		lootChance(minSize:0)
		playerPrice(minSize:0)
		upgrade(minSize:0,maxSize:10)
    }
}
