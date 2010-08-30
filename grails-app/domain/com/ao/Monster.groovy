package com.ao

class Monster {
	
	String name
	StatsList stats
	Long exp
	Long gold
	
	static hasMany = [loot:Item]

    static constraints = {
		name(nullable:false,blank:false,unique:true,maxSize:30)
		stats(nullable:false)
    }
}
