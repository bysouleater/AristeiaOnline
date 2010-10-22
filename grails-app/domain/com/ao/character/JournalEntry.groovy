package com.ao.character

import com.ao.monster.Encounter 
import com.ao.character.Warrior
import com.ao.fight.Fight
import com.ao.items.Item;

class JournalEntry{
	
	static int TEXT = 0
	static int EXPLORATION_MONSTER_FOUND = 1
	
	String text
	Date dateCreated
	Long exp
	
	int type
	Fight fight
	
	static belongsTo = [ warrior : Warrior]
	static hasMany = [itemsGained:Item]

    static constraints = {
		text(nullable:true,blank:false,maxSize:1000)
		fight(nullable:true)
		exp(nullable:true)
    }		
}
