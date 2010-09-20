package com.ao.items


class ItemType {
	
	String name
	Long price
	String icon
	
	boolean consumable
	
//	static mapping = {
//		tablePerHierarchy false
//	}

    static constraints = {
		name(nullable:false,blank:false,maxSize:50,unique:true)
		icon(nullable:true)
		price(minSize:0)
    }
}
