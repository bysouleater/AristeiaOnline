package com.ao

import com.ao.Warrior
import com.ao.City

class WarriorController {
	
	def index = { 
		if(!params.id)
			redirect(controller:"main",action:"index")

		def w = Warrior.get(params.id as Long)
		if(!w)
			redirect(controller:"main",action:"index")
			
		def journal = JournalEntry.withCriteria {
			warrior {
				eq('id', w.id)
			}
			maxResults(params.max?params.max as Integer:6)
			firstResult(params.offset?params.offset as Integer:0)
			order("dateCreated", "desc")
		 }
		
		w.refreshSTA()
		w.refreshHP()
			
		[warrior:w,journal:journal]
	}
	
	def create = {
		def warriorqty = Warrior.findAllByOwner_id(123L).size()
		if(warriorqty == 3)
			redirect(controller:"main",action:"index")
		[cities:City.list()]
	}
	
	def save = {
		//validar los datos
		def warrior = new Warrior(owner_id: 123L)
		warrior.initWarrior(params)
		if(warrior.validate()){
			warrior.save()
			redirect(controller:"main",action:"index")
		}
		redirect(controller:"warrior",action:"create", params:params)
	}
	
	def updateStat = {
		if(!params.id)
			redirect(controller:"main",action:"index")
			
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
		
		if(!params.stat)
			redirect(controller:"warrior", action:"index", id:params.id)
		warrior.updateStat(params.stat)
		redirect(controller:"warrior", action:"index", id:params.id)
	}
	
	def skills = {
		if(!params.id)
			redirect(controller:"main",action:"index")
	
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
	
		[warrior:warrior]
	}
	
	def equip = {
		if(!params.id)
			redirect(controller:"main",action:"index")
	
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
	
		[warrior:warrior]
	}
	
	def inventory = {
		if(!params.id)
			redirect(controller:"main",action:"index")
	
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
	
		[warrior:warrior]
	}
	
	def exploration = {
		if(!params.id)
			redirect(controller:"main",action:"index")
	
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
	
		[warrior:warrior]
	}
	
	def training = {
		if(!params.id)
			redirect(controller:"main",action:"index")
	
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
	
		[warrior:warrior]
	}
	
	def explore = {
		if(!params.id)
			redirect(controller:"main",action:"index")
	
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
	
		if(warrior.actualSTA > 5){
			warrior.actualSTA -= 5
			boolean encountered = false;
			warrior.actualLocation.encounters.each{
				if(encountered)
					return
					
				def chance = new Random().nextInt(100)+1
				if(chance <= it.chance){
					def je = new JournalEntry(type:JournalEntry.EXPLORATION_MONSTER_FOUND,encounter:it,won:true)
					je.save()
					warrior.addToJournal(je)
					warrior.giveExp(it.totalExp())
					warrior.gold += it.totalGold()
					encountered = true
				}
			}
			if(!encountered){
				def je = new JournalEntry(type:JournalEntry.TEXT, text:"You explore the area but didn't find anything.")
				je.save()
				warrior.addToJournal(je)
			}
		}
		redirect(controller:"warrior",action:"index", id:params.id)
	}
	
	def quests = {
		if(!params.id)
			redirect(controller:"main",action:"index")
	
		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")
	
		[warrior:warrior]
	}
	
	
	
	
	
	
	
	
	def levelup = {
		def warrior = Warrior.get(params.id)
		warrior.actualExp = warrior.nextLvlExp() + 1000
		warrior.levelUp()
		redirect(controller:"warrior",action:"index",id:params.id)
	}
}
