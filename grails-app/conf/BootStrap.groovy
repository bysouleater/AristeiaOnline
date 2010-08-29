import com.ao.*

class BootStrap {

    def init = { servletContext ->
		
		 // Init Cities
    	def city1stats = new StatsList(STR:8d,DEX:5d,CON:5d,AGI:5d)
    	def city2stats = new StatsList(STR:5d,DEX:8d,CON:5d,AGI:5d)
    	def city3stats = new StatsList(STR:5d,DEX:5d,CON:8d,AGI:5d)
    	def city4stats = new StatsList(STR:5d,DEX:5d,CON:5d,AGI:8d)
    	city1stats.save()
    	city2stats.save()
    	city3stats.save()
    	city4stats.save()
		new City(name:"Cebrene",stats:city1stats).save()
		new City(name:"Chalcedon",stats:city2stats).save()
		new City(name:"Baris",stats:city3stats).save()
		new City(name:"Mallia",stats:city4stats).save()
		
		def newbieStats = new StatsList(HP:20,STA:20)
    	newbieStats.save()
    	new Job(name:"Newbie",stats:newbieStats).save()
    }
    def destroy = {
    }
}
