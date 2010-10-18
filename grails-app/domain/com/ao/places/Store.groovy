package com.ao.places

import java.util.List;

import com.ao.items.ItemType

class Store {
	
	String name
	List items
	static hasMany = [items:ItemType]

    static constraints = {
    }
}
