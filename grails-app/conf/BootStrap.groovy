import com.ao.StatsList;

import com.ao.*

class BootStrap {

    def init = { servletContext ->
		
		// Init Cities
    	def cs1 = new StatsList(STR:8d,DEX:5d,CON:5d,AGI:5d)
    	def cs2 = new StatsList(STR:5d,DEX:8d,CON:5d,AGI:5d)
    	def cs3 = new StatsList(STR:5d,DEX:5d,CON:8d,AGI:5d)
    	def cs4 = new StatsList(STR:5d,DEX:5d,CON:5d,AGI:8d)
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
		Job.initJobs()
		
		def wstats = new StatsList()
		wstats.save()
		def wolf = new Monster(name: "Wolf",stats: wstats, exp: 200L, gold: 50L)
		wolf.save()
		
		def wolfencounter = new Encounter(chance:75,description:"a Wolf")
		wolfencounter.addToMonsters(wolf)
		wolfencounter.save()
		
		cm1.addToEncounters(wolfencounter)
		cm1.save()
		cm2.addToEncounters(wolfencounter)
		cm2.save()
		cm3.addToEncounters(wolfencounter)
		cm3.save()
		cm4.addToEncounters(wolfencounter)
		cm4.save()
		
		def sk1 = new SkillsList(Aiming:1d)
		sk1.save()
		def tp1 = new TrainingPlace(name:"Chalcedon Shooting Camp", STArequired:5, skills:sk1)
		tp1.save()
		
		def sk2 = new SkillsList(Athletics:1d)
		sk2.save()
		def tp2 = new TrainingPlace(name:"Cebrene Speed Ring", STArequired:5, skills:sk2)
		tp1.save()
		
		def sk3 = new SkillsList(Escape_Artist:1d)
		sk3.save()
		def tp3 = new TrainingPlace(name:"Mallia Laberinth", STArequired:5, skills:sk3)
		tp1.save()
		
		def sk4 = new SkillsList(Endurance:1d)
		sk4.save()
		def tp4 = new TrainingPlace(name:"Baris Rocks", STArequired:5, skills:sk4)
		tp1.save()
		
		cm1.addToTrainingPlaces(tp2)
		cm2.addToTrainingPlaces(tp1)
		cm3.addToTrainingPlaces(tp4)
		cm4.addToTrainingPlaces(tp3)
		cm1.save()
		cm2.save()
		cm3.save()
		cm4.save()
		
		
		def knifeStats = new StatsList(PAtk:5)
		knifeStats.save()
		def knife = new Weapon(name:"Knife", price:10, consumable:false, type:Weapon.LIGHT,handsQty:1,stats:knifeStats)
		knife.save()
		
		
		
    }
    def destroy = {
    }
}
