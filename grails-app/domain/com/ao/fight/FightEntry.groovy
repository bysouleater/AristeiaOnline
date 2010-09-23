package com.ao.fight

class FightEntry {

	String text
	Date dateCreated
	
	static belongsTo = [ fight : Fight]
	
    static constraints = {
    }
}
