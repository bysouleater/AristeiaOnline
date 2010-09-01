package com.ao

import com.ao.Warrior
import com.ao.City

class WarriorController {
	
	def index = { 
		if(!params.id)
			redirect(controller:"main",action:"index")

		def warrior = Warrior.get(params.id as Long)
		if(!warrior)
			redirect(controller:"main",action:"index")

		[warrior:warrior]
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
	
	def explore = {
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
