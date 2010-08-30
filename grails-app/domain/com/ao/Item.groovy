package com.ao

class Item {
	
	ItemType type
	int qty = 1
	double lootChance 
	Long playerPrice
	int upgrade

    static constraints = {
		type(nullable:false)
		qty(minSize:1)
		lootChance(minSize:0.01)
		playerPrice(minSize:0)
		upgrade(minSize:0,maxSize:10)
    }
}
