package com.ao

class ItemType {
	
	String name
	Long price
	
	boolean equipable
	boolean consumable
	
	StatsList stats

    static constraints = {
		name(nullable:false,blank:false,maxSize:50,unique:true)
		price(minSize:0)
		stats(nullable:true)
    }
}
