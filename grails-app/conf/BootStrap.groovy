import grails.util.Environment;

import com.ao.SkillsList 
import com.ao.StatsList 
import com.ao.character.Job 
import com.ao.character.Quest;
import com.ao.items.Armor 
import com.ao.items.Consumable
import com.ao.items.Item;
import com.ao.items.ItemType;
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
			def apple = new Consumable(name:"Apple",price:5,icon:"/images/apple.png",stats:appleStats,stackable:true, description:"Recovers 10 HP")
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
			def mappath1 = new Map(name:"Cebrene field 01", city:false, posX:0,posY:2, picture:"/images/worldmap/0_2.png")
			def mappath2 = new Map(name:"Cebrene field 02", city:false, posX:0,posY:3, picture:"/images/worldmap/0_3.png")
			def mappath3 = new Map(name:"Cebrene field 03", city:false, posX:0,posY:4, picture:"/images/worldmap/0_4.png")
			def mappath4 = new Map(name:"Cebrene field 04", city:false, posX:1,posY:2, picture:"/images/worldmap/1_2.png")
			def mappath5 = new Map(name:"Cebrene field 05", city:false, posX:1,posY:4, picture:"/images/worldmap/1_4.png")
			def mappath6 = new Map(name:"Cebrene field 06", city:false, posX:2,posY:2, picture:"/images/worldmap/2_2.png")
			def mappath7 = new Map(name:"Cebrene field 07", city:false, posX:2,posY:3, picture:"/images/worldmap/2_3.png")
			def mappath8 = new Map(name:"Cebrene field 08", city:false, posX:2,posY:4, picture:"/images/worldmap/2_4.png")
			def cm2 = new Map(name:"Chalcedon city",city:true, posX:2, posY:5, picture:"/images/worldmap/2_5.png", weapons:wstore, armors:astore, consumables:cstore)
			def cm3 = new Map(name:"Baris city", 	city:true, posX:5, posY:2, picture:"/images/worldmap/5_2.png", weapons:wstore, armors:astore, consumables:cstore)
			def cm4 = new Map(name:"Mallia city", 	city:true, posX:3, posY:1, picture:"/images/worldmap/3_1.png", weapons:wstore, armors:astore, consumables:cstore)
			cm1.save();cm2.save();cm3.save();cm4.save();mappath1.save();mappath2.save();mappath3.save();mappath4.save();
			mappath5.save();mappath6.save();mappath7.save();mappath8.save();
			
			new City(name:"Cebrene", 	stats:cs1, map:cm1).save()
			new City(name:"Chalcedon",	stats:cs2, map:cm2).save()
			new City(name:"Baris",		stats:cs3, map:cm3).save()
			new City(name:"Mallia",		stats:cs4, map:cm4).save()
			
			// Init Jobs
			Job.initJobs()
			
			def wolfFang = new ItemType(name:"Wolf Fang",price:2,icon:"/images/fang.png",stackable:true)
			wolfFang.save()
			
			def wstats = new StatsList(HP:25,PAtk:5)
			wstats.save()
			def wolf = new Monster(name: "Wolf",stats: wstats, exp: 200L, gold: 0L)
			wolf.addToLoot(wolfFang)
			wolf.save()
			
			def wstatsA = new StatsList(HP:25,PAtk:5)
			wstatsA.save()
			def wolfA = new Monster(name: "Wolf A",stats: wstats, exp: 200L, gold: 0L)
			wolfA.addToLoot(wolfFang)
			wolfA.save()
			
			def wstatsB = new StatsList(HP:25,PAtk:5)
			wstatsB.save()
			def wolfB = new Monster(name: "Wolf B",stats: wstats, exp: 200L, gold: 0L)
			wolfB.addToLoot(wolfFang)
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
			
			
			def applefind = new Item(type:apple,chance:90)
			applefind.save()
			cm1.addToItems(applefind)
			
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
			
			
			def questWolfs = new Quest(title:"Killing Wolfs",description:"Help the citizens to get rid of the hungry wolfs in the streets.",
				repetible:true,minLevel:1,maxLevel:5,exp:100,gold:100,starting_location:cm1)
			def wolfsNeeded = new Item(type:wolfFang,qty:5)
			wolfsNeeded.save()
			questWolfs.addToItemsNeeded(wolfsNeeded)
			def knifereward = new Item(type:knife, qty:1)
			knifereward.save()
			questWolfs.addToItemsRewarded(knifereward)
			questWolfs.save()
			
			def barbarianSkillsNeeded = new SkillsList(Endurance:10)
			barbarianSkillsNeeded.save()
			def barbarianQuest = new Quest(title:"Path to Barbarian",description:"Take this quest to become a Barbarian.",
				minLevel:5,maxLevel:5,exp:0,gold:0,starting_location:cm1,jobReward:Job.get(Job.BARBARIAN),skillsNeeded: barbarianSkillsNeeded)
			def barbarianItemsNeeded = new Item(type:wolfFang,qty:10)
			barbarianItemsNeeded.save()
			barbarianQuest.addToItemsNeeded(barbarianItemsNeeded)
			barbarianQuest.addToItemsRewarded(knifereward)
			def applereward = new Item(type:apple, qty:10)
			applereward.save()
			barbarianQuest.addToItemsRewarded(applereward)			
			barbarianQuest.save()
		}
		
		
		
		
		
		
    }
    def destroy = {
    }
}
