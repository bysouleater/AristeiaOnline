package aristeiaonline

class ItemTagLib {
	
	def itemrow = { attrs ->
		out << render(template:"/templates/itemrow", model:[item:attrs?.item])		
	}

}