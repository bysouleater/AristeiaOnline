package aristeiaonline

class WarriorSheetTagLib {
	
	def warriorSheet = { attrs, body ->
		out << render(template:"/templates/warrior", model:[warrior:attrs.warrior,body:body()])		
	}

}
