package aristeiaonline

class WarriorSheetTagLib {
	
	def warriorSheet = { attrs, body ->
		out << render(template:"/templates/warrior", model:[warrior:attrs.warrior,body:body()])		
	}
	
	def warriorSmallSheet = { attrs, body ->
		out << render(template:"/templates/smallwarrior", model:[warrior:attrs.warrior,body:body()])
	}

}
