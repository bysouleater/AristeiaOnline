package com.ao.character

import com.ao.monster.Encounter 
import com.ao.character.Warrior
import com.ao.fight.Fight

class JournalEntry{
	
	static int TEXT = 0
	static int EXPLORATION_MONSTER_FOUND = 1
	
	String text
	Date dateCreated
	
	int type
	Fight fight
	
	static belongsTo = [ warrior : Warrior]

    static constraints = {
		text(nullable:true,blank:false,maxSize:1000)
		fight(nullable:true)
    }		
}
