import com.ao.*

class BootStrap {

    def init = { servletContext ->
		
		// Init Cities
    	def cs1 = new StatsList(STR:8,DEX:5,CON:5,AGI:5)
    	def cs2 = new StatsList(STR:5,DEX:8,CON:5,AGI:5)
    	def cs3 = new StatsList(STR:5,DEX:5,CON:8,AGI:5)
    	def cs4 = new StatsList(STR:5,DEX:5,CON:5,AGI:8)
    	cs1.save();cs2.save();cs3.save();cs4.save();
		
		def cm1 = new Map(name:"Cebrene city", 	city:true)
		def cm2 = new Map(name:"Chalcedon city",city:true)
		def cm3 = new Map(name:"Baris city", 	city:true)
		def cm4 = new Map(name:"Mallia city", 	city:true)
		cm1.save();cm2.save();cm3.save();cm4.save();
		
		new City(name:"Cebrene", 	stats:cs1, map:cm1).save()
		new City(name:"Chalcedon",	stats:cs2, map:cm2).save()
		new City(name:"Baris",		stats:cs3, map:cm3).save()
		new City(name:"Mallia",		stats:cs4, map:cm4).save()
		
		// Init Jobs
		def nbs = new StatsList(HP:40,STA:20)
		def nls = new StatsList(HP:40,STA:10)
    	nbs.save();nls.save()
    	new Job(name:"Newbie", baseStats:nbs, levelUpStats: nls, maxLevel: 5).save()
    }
    def destroy = {
    }
}
