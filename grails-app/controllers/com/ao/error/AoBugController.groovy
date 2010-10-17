package com.ao.error

class AoBugController {
	
	def scaffold = true

    def index = { }
	
	def report = {
		def error = new AoBug(user_id:session.fb_user_id,text:params.text)
		error.save(flush:true)
	}
}
