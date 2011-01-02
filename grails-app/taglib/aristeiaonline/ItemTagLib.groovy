package aristeiaonline

class ItemTagLib {
	
	def itemrow = { attrs ->
		out << render(template:"/templates/itemrow", model:[item:attrs?.item])		
	}
	
	def spoilrow = { attrs ->
		out << render(template:"/templates/spoilrow", model:[type:attrs?.type,qty:attrs?.qty])
	}
}