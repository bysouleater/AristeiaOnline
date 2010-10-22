package com.ao.monster


import com.ao.StatsList 
import com.ao.items.Item

class Monster {
	
	String name
	StatsList stats
	Long exp
	
	static hasMany = [loot:Item]

    static constraints = {
		name(nullable:false,blank:false,unique:true,maxSize:30)
		stats(nullable:false)
    }
	
	public String toString() {
		return name
	}
}
