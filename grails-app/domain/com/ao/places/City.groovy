package com.ao.places


import com.ao.StatsList 

class City {

	String name
	StatsList stats
	Map map

    static constraints = {
		name(nullable:false,blank:false,unique:true,maxSize:30)
		stats(nullable:false)
		map(nullable:false)
    }
}
