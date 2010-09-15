package com.ao

import com.ao.Warrior
import com.ao.City

class WarriorController {
	
	def afterInterceptor = { model ->
		if(model.warrior){
			model.warrior.refreshSTA()
			model.warrior.refreshHP()
			model.warrior.save()
		}
	}
	
	def index = { 
		def w = Warrior.get(params.id as Long)
		def journal = JournalEntry.withCriteria {
			warrior {
				eq('id', w.id)
			}
			maxResults(params.max?params.max as Integer:6)
			firstResult(params.offset?params.offset as Integer:0)
			order("dateCreated", "desc")
		}
		[warrior:w,journal:journal]
	}
	
	def create = {
		def warriorqty = Warrior.findAllByOwner_id(123L).size()
		if(warriorqty == 3)
			redirect(controller:"main",action:"index")
		[cities:City.list()]
	}
	
	def save = {
		def warrior = new Warrior(owner_id: 123L)
		warrior.initWarrior(params)
		if(warrior.validate()){
			warrior.save()
			redirect(controller:"main",action:"index")
		}/*else{
			redirect(controller:"warrior",action:"create", params:params)
		}*/
	}
	
	def updateStat = {
		def warrior = Warrior.get(params.id as Long)
		warrior.updateStat(params.stat)
		warrior.save()
		redirect(controller:"warrior", action:"index", id:params.id)
	}
	
	def skills = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def equip = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def inventory = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def exploration = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def insights = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def training = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def explore = {
		def warrior = Warrior.get(params.id as Long)
		
		if(warrior.actualSTA >= 5){
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
		warrior.save()
		redirect(controller:"warrior",action:"index", id:params.id)
	}
	
	def quests = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def train = {
		def warrior = Warrior.get(params.id as Long)
		def tp = TrainingPlace.get(params.tp as Long)
		if(warrior.actualLocation.trainingPlaces.contains(tp)){
			if(warrior.actualSTA >= tp.STArequired){
				warrior.actualSTA -= tp.STArequired
				
				def text = "You spent some time training in <b>${tp.name}</b>. <br>Gained "
				boolean first = true
				tp.skills.all().each{
					if(it.value > 0){
						double gained = (double)((double)(new Random().nextInt((10*it.value).intValue())+1) / 10)
						if(!first)
							text += " and "
						else
							first = false
						text += "<b>${gained}</b> in <b>${it.key}</b>"
						warrior.skills."$it.key" += gained
					}
				}
				text += "."
				def je = new JournalEntry(type:JournalEntry.TEXT, text:text)
				je.save()
				warrior.addToJournal(je)
				warrior.save()
			}
		}
		redirect(controller:"warrior",action:"index", id:params.id)
	}
	
	def movemap = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def weaponstore = {
		def warrior = Warrior.get(params.id as Long)
		render(view:"store", model:[storename:"Weapons",warrior:warrior])
	}
	
	def armorstore = {
		def warrior = Warrior.get(params.id as Long)
		render(view:"store", model:[storename:"Armors",warrior:warrior])
	}
	
	def consumablestore = {
		def warrior = Warrior.get(params.id as Long)
		render(view:"store", model:[storename:"Consumables",warrior:warrior])
	}
	
	def transports = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
	
	def arena = {
		def warrior = Warrior.get(params.id as Long)
		[warrior:warrior]
	}
}
