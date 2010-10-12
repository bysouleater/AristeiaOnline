package com.ao.error

class AoErrorController {

	def scaffold = true
	
    def index = { }
	
	def report = {
		def error = new AoError(error:params.error,
								servlet:params.servlet,
								uri:params.uri,
								exception_message:params.exception_message,
								caused_by:params.caused_by,
								exception_class:params.exception_class,
								at_line:params.at_line)
		for(def x = 0; x < 10; x++){
			if(params."stack_trace${x}"){
				def st = new AoErrorLine(text:params."stack_trace${x}")
				st.save()
				error.addToStackTrace(st)
			}
		}
		error.save(flush:true)
	}
}
