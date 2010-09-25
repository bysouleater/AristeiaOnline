import grails.util.Environment;

import com.ao.SkillsList 
import com.ao.StatsList 
import com.ao.character.Job 
import com.ao.items.Armor 
import com.ao.items.Consumable
import com.ao.items.Weapon 
import com.ao.monster.Encounter 
import com.ao.monster.Monster 
import com.ao.places.City 
import com.ao.places.Store
import com.ao.places.TrainingPlace 
import com.ao.places.Map

class BootStrap {

    def init = { servletContext ->
		
		if(Environment.current == Environment.DEVELOPMENT){
			// Init Cities
	    	def cs1 = new StatsList(STR:8d,DEX:5d,CON:5d,AGI:5d)
	    	def cs2 = new StatsList(STR:5d,DEX:8d,CON:5d,AGI:5d)
	    	def cs3 = new StatsList(STR:5d,DEX:5d,CON:8d,AGI:5d)
	    	def cs4 = new StatsList(STR:5d,DEX:5d,CON:5d,AGI:8d)
	    	cs1.save();cs2.save();cs3.save();cs4.save();
			
			def knifeStats = new StatsList(PAtk:5)
			knifeStats.save()
			def knife = new Weapon(name:"Knife", price:10, icon:"/images/knife.png", consumable:false, type:Weapon.LIGHT,handsQty:1,stats:knifeStats)
			knife.save()
			
			def shirtStats = new StatsList(PDef:5)
			shirtStats.save()
			def shirt = new Armor(name:"Cotton Shirt", price:10, icon:"/images/shirt.png", consumable:false, type:Armor.BODY,stats:shirtStats)
			shirt.save()
			
			def appleStats = new StatsList(HP:10)
			appleStats.save()
			def apple = new Consumable(name:"Apple",price:5,icon:"/images/apple.png",stats:appleStats)
			apple.save()
			
			def wstore = new Store(name:"Weapons")
			wstore.addToItems(knife)
			wstore.save()
			
			def astore = new Store(name:"Armors")
			astore.addToItems(shirt)
			astore.save()
			
			def cstore = new Store(name:"Consumables")
			cstore.addToItems(apple)
			cstore.save()
			
			
			def cm1 = new Map(name:"Cebrene city", 	city:true, posX:1, posY:3, picture:"/images/worldmap/1_3.png", weapons:wstore, armors:astore, consumables:cstore)
			def cm2 = new Map(name:"Chalcedon city",city:true, posX:2, posY:5, picture:"/images/worldmap/2_5.png", weapons:wstore, armors:astore, consumables:cstore)
			def cm3 = new Map(name:"Baris city", 	city:true, posX:5, posY:2, picture:"/images/worldmap/5_2.png", weapons:wstore, armors:astore, consumables:cstore)
			def cm4 = new Map(name:"Mallia city", 	city:true, posX:3, posY:1, picture:"/images/worldmap/3_1.png", weapons:wstore, armors:astore, consumables:cstore)
			cm1.save();cm2.save();cm3.save();cm4.save();
			
			new City(name:"Cebrene", 	stats:cs1, map:cm1).save()
			new City(name:"Chalcedon",	stats:cs2, map:cm2).save()
			new City(name:"Baris",		stats:cs3, map:cm3).save()
			new City(name:"Mallia",		stats:cs4, map:cm4).save()
			
			// Init Jobs
			Job.initJobs()
			
			def wstats = new StatsList(HP:25,PAtk:5)
			wstats.save()
			def wolf = new Monster(name: "Wolf",stats: wstats, exp: 200L, gold: 50L)
			wolf.save()
			
			def wstatsA = new StatsList(HP:25,PAtk:5)
			wstatsA.save()
			def wolfA = new Monster(name: "Wolf A",stats: wstats, exp: 200L, gold: 50L)
			wolfA.save()
			
			def wstatsB = new StatsList(HP:25,PAtk:5)
			wstatsB.save()
			def wolfB = new Monster(name: "Wolf B",stats: wstats, exp: 200L, gold: 50L)
			wolfB.save()
			
			def wolfencounter = new Encounter(chance:50,description:"a Wolf")
			wolfencounter.addToMonsters(wolf)
			wolfencounter.save()
			
			def wolfencounter2 = new Encounter(chance:50,description:"two Wolfs")
			wolfencounter2.addToMonsters(wolfA)
			wolfencounter2.addToMonsters(wolfB)
			wolfencounter2.save()
			
			cm1.addToEncounters(wolfencounter)
			cm1.addToEncounters(wolfencounter2)
			cm1.save()
			cm2.addToEncounters(wolfencounter)
			cm2.addToEncounters(wolfencounter2)
			cm2.save()
			cm3.addToEncounters(wolfencounter)
			cm3.addToEncounters(wolfencounter2)
			cm3.save()
			cm4.addToEncounters(wolfencounter)
			cm4.addToEncounters(wolfencounter2)
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
		}
		
		
		
		
		
		
    }
    def destroy = {
    }
}
