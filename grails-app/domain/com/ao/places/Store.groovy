package com.ao.places

import com.ao.items.ItemType

class Store {
	
	String name
	
	static hasMany = [items:ItemType]

    static constraints = {
    }
}
