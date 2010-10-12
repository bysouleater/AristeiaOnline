package com.ao.error

class AoError {
	
	String error
	String servlet
	String uri
	String exception_message
	String caused_by
	String exception_class
	String at_line
	
	static hasMany = [stackTrace:AoErrorLine]

    static constraints = {
		error(nullable:true)
		servlet(nullable:true)
		uri(nullable:true)
		exception_message(nullable:true)
		caused_by(nullable:true)
		exception_class(nullable:true)
		at_line(nullable:true)
    }
}
