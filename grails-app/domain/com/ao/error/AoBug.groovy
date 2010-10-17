package com.ao.error

class AoBug {
	
	Long user_id
	String text

    static constraints = {
		text(maxSize:2000)
    }
}
