package com.ao.items

import com.ao.*

class Weapon extends ItemType{
	
	static int HEAVY = 1
	static int NORMAL = 2
	static int LIGHT = 3
	static int DISTANCE = 4
	static int DUAL = 5
	static int SPECIAL = 6
	
	int type
	int handsQty
	StatsList stats
	boolean equipable = true
	boolean weapon = true

    static constraints = {
		type(inList:[HEAVY,NORMAL,LIGHT,DISTANCE,DUAL,SPECIAL])
		handsQty(minSize:1, maxSize:2)
		stats(nullable:false)
    }
}
