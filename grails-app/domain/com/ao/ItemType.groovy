package com.ao

class ItemType {
	
	String name
	Long price
	
	boolean consumable
	
//	static mapping = {
//		tablePerHierarchy false
//	}

    static constraints = {
		name(nullable:false,blank:false,maxSize:50,unique:true)
		price(minSize:0)
    }
}
