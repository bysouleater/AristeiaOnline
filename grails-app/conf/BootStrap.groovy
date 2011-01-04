import com.ao.items.Weapon;

import grails.util.Environment;
import com.ao.SkillsList
import com.ao.StatsList
import com.ao.character.Job
import com.ao.character.Quest;
import com.ao.character.Warrior;
import com.ao.environments.dev.DevelopmentEnvironment;
import com.ao.environments.prod.ProductionEnvironment;
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
		
		if(Environment.current == Environment.DEVELOPMENT)			
			DevelopmentEnvironment.init()
		if(Environment.current == "initDB")
			ProductionEnvironment.init()
						
			
			
			/*
			
			
			
			
			
			
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
			
			
			def thsStats = new StatsList(PAtk:5)
			thsStats.save()
			def ths = new Weapon(name:"Two Hand Sword", price:10, icon:"/images/knife.png", consumable:false, type:Weapon.HEAVY,handsQty:2,stats:thsStats)
			ths.save()
			
			wstore.addToItems(ths)
			wstore.save()
			
			def shieldStats = new StatsList(PDef:3)
			shieldStats.save()
			def shield = new Armor(name:"Round Shield", price:10, icon:"/images/no_icon.png", consumable:false, type:Armor.SHIELD,stats:shieldStats)
			shield.save()
			
			astore.addToItems(shield)
			astore.save()
			
			
			def warrior1 = new Warrior(owner_id: 501777856)
			warrior1.initWarrior([name:"Guerrero 1", gender:"M", origin:1])
			if(warrior1.validate())
				warrior1.save(flush:true)
			def warrior2 = new Warrior(owner_id: 507858364)
			warrior2.initWarrior([name:"Guerrero 2", gender:"M", origin:1])
			if(warrior2.validate())
				warrior2.save(flush:true)
			def warrior3 = new Warrior(owner_id: 507963940)
			warrior3.initWarrior([name:"Guerrero 3", gender:"M", origin:1])
			if(warrior3.validate())
				warrior3.save(flush:true)
			def warrior4 = new Warrior(owner_id: 507963940)
			warrior4.initWarrior([name:"Guerrero 4", gender:"M", origin:1])
			if(warrior4.validate())
				warrior4.save(flush:true)
				
				
			warrior2.level=2
			warrior2.save(flush:true)
			warrior3.level=3
			warrior3.save(flush:true)
			warrior4.level=4
			warrior4.save(flush:true)
			
//			501777856
//			507858364
//			507963940
		}*/
		
		
		
		
		
		
	}
	def destroy = {
	}
}