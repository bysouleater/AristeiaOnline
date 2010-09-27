package com.ao.monster


import com.ao.StatsList 
import com.ao.items.ItemType

class Monster {
	
	String name
	StatsList stats
	Long exp
	Long gold
	
	static hasMany = [loot:ItemType]

    static constraints = {
		name(nullable:false,blank:false,unique:true,maxSize:30)
		stats(nullable:false)
    }
}
