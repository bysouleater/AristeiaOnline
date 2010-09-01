package com.ao

import java.util.Date;

class JournalEntry{
	
	String text
	Date dateCreated
	
	static belongsTo = [ warrior : Warrior]

    static constraints = {
		text(nullable:false,blank:false,maxSize:1000)
    }		
}
