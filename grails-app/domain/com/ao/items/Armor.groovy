package com.ao.items

import com.ao.*


class Armor extends ItemType{

	static int HEAD = 1
	static int SHOULDER = 2
	static int BODY = 3
	static int SHIELD = 4
	static int FOOT = 5
	static int ACCESORY = 6
	
	int type
	StatsList stats
	boolean equipable = true
	boolean armor = true

    static constraints = {
		type(inList:[HEAD,SHOULDER,BODY,SHIELD,FOOT,ACCESORY])
		stats(nullable:false)
    }
}
