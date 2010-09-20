package com.ao.character

import com.ao.monster.Encounter 
import com.ao.character.Warrior

class JournalEntry{
	
	static int TEXT = 0
	static int EXPLORATION_MONSTER_FOUND = 1
	
	String text
	Date dateCreated
	
	int type
	Encounter encounter
	boolean won
	
	static belongsTo = [ warrior : Warrior]

    static constraints = {
		text(nullable:true,blank:false,maxSize:1000)
		encounter(nullable:true)
    }		
}
