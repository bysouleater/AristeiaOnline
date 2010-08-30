package com.ao

class Encounter {
	
	static hasMany = [monsters:Monster]
	
	double chance

    static constraints = {
		chance(minSize:0.01)
    }
}
