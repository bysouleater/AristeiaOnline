package com.ao

class Job {
	
	String name
	StatsList baseStats
	StatsList levelUpStats
	int maxLevel

    static constraints = {
		name(nullable:false,blank:false,maxSize:30,unique:true)
		baseStats(nullable:false)
		levelUpStats(nullable:false)
    }
}
