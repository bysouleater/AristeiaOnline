package com.ao

import java.util.HashMap;

class City {

	String name
	StatsList stats

    static constraints = {
		name(unique:true)
		stats(nullable:false)
    }
}
