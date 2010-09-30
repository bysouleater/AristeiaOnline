package com.ao.items


class ItemType {
	
	String name
	Long price
	String icon
	
	boolean consumable
	boolean equipable
	boolean stackable
	boolean weapon
	boolean armor
	
//	static mapping = {
//		tablePerHierarchy false
//	}

    static constraints = {
		name(nullable:false,blank:false,maxSize:50,unique:true)
		icon(nullable:true)
		price(minSize:0)
    }
}
