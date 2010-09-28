package com.ao.character

import com.ao.fight.Fight
import com.ao.items.Item
import com.ao.items.ItemType
import com.ao.places.City 
import com.ao.places.TrainingPlace 
import grails.converters.JSON
import com.ao.places.Map 

class WarriorController {
	
	def scaffold = true
	def beforeInterceptor = [action:this.&checkSessionWarrior,except:['index','register','save']]

	def checkSessionWarrior() {
		if(!session.warrior_id) {
			redirect(controller:"main", action:'index')
			return false
		}
	}
	
	def afterInterceptor = { model ->
		if(model.warrior){
			model.warrior.refreshSTA()
			model.warrior.refreshHP()
			model.warrior.save()
		}
	}
	
	def parse_signed_request(String signed_request){
		def encoded_sig = signed_request.split("\\.")[0]
		def payload = signed_request.split("\\.")[1]
		
		def sig = base64_url_decode(encoded_sig)
		def data = JSON.parse(base64_url_decode(payload))
		
		if(data.algorithm.toUpperCase() != 'HMAC-SHA256')
			throw new Exception("Unknow algorithm. Expected HMAC-SHA256")
		
		//TODO: Verificar el encodeo
		//check sig
		/*def expected_sig = hash_hmac('sha256', payload, FB_SECRET_KEY, $raw = true)
		
		if(sig != expected_sig)
			throw new Exception("Bad signed JSON signature!")
			*/
		return data
	}
	
	def base64_url_decode(def input) {
		def data = input.replaceAll("-","+").replaceAll("_","/")
		def decodedBytes = data.decodeBase64()
		return new String(decodedBytes)
	}
	
	//Actions
	
	def index = { 
		if(params.id)
			session.warrior_id = params.id as Long
		def w = Warrior.get(session.warrior_id)
		def journal = JournalEntry.withCriteria {
			warrior {
				eq('id', w.id)
			}
			maxResults(params.max?Math.min(params.max as Integer,10):10)
			firstResult(params.offset?params.offset as Integer:0)
			order("dateCreated", "desc")
		}
		[warrior:w,journal:journal]
	}
	
	def register = {
//		def url_params = parse_signed_request(params.signed_request)
		def warriorqty = Warrior.findAllByOwner_id(123L).size()
		if(warriorqty == 3)
			redirect(controller:"main",action:"index")
		[cities:City.list(), params:params]
	}
	
	def save = { WarriorRegistrationCommand wrc ->
		if(wrc.hasErrors()){
			render(view:"register",model:[wrc:wrc,cities:City.list()])
		}else{
//			def url_params = parse_signed_request(params.signed_request)
			def warrior = new Warrior(owner_id: 123L)
			warrior.initWarrior(wrc.properties)
			if(warrior.validate()){
				warrior.save()
				redirect(controller:"main",action:"index")
			}else{
				render(view:"register", model:[wrc:warrior,cities:City.list()])
			}
		}
	}
	
	def updateStat = {
		def warrior = Warrior.get(session.warrior_id)
		if(warrior.statPoints > 0){
			warrior.updateStat(params.id)
			warrior.save()
		}
		redirect(controller:"warrior", action:"index")
	}
	
	def skills = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def equipment = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def inventory = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def exploration = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def insights = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def training = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def explore = {
		def warrior = Warrior.get(session.warrior_id)
		
		if(warrior.actualSTA >= 5){
			warrior.actualSTA -= 5
			boolean encountered = false;
			warrior.actualLocation.encounters.each{
				if(encountered)
					return
					
				def chance = new Random().nextInt(100)+1
				if(chance <= it.chance){
					def fight = new Fight(warrior:warrior,encounter:it)
					fight.resolveFight()
					fight.save(flush:true)
					def je = new JournalEntry(type:JournalEntry.EXPLORATION_MONSTER_FOUND,fight:fight)
					je.save()
					warrior.addToJournal(je)
					if(fight.won){
						warrior.giveExp(it.totalExp())
						warrior.gold += it.totalGold()
						it.totalLoot().each{ item ->
							boolean alreadyHaveIt = false
							
							if(item.stackable){
								warrior.inventory.each{
									if(alreadyHaveIt)
										return
									if(it.type == item){
										if(it.qty + 1 > 1000){
											it.qty = 1000
										}else{
											it.qty += 1
											alreadyHaveIt = true
										}
										it.save()
									}
								}
							}
							
							if(!alreadyHaveIt){
								def newitem = new Item(type:item, qty:1)
								newitem.save()
								warrior.addToInventory(newitem)
							}
						}						
					}
					
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
		redirect(controller:"warrior",action:"index")
	}
	
	def quests = {
		def warrior = Warrior.get(session.warrior_id)
		
		[warrior:warrior,doing_quests:warrior.questsInProgress,available_quests:Quest.getAvailableQuests(warrior)]
	}
	
	def train = {
		def warrior = Warrior.get(session.warrior_id)
		def tp = TrainingPlace.get(params.id as Long)
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
		redirect(controller:"warrior",action:"index")
	}
	
	def worldmap = {
		def warrior = Warrior.get(session.warrior_id)
		def maps = Map.list()
		Map[][] worldmap = new Map[7][7]
		maps.each{
			worldmap[it.posX][it.posY] = it
		} 
		[warrior:warrior, map:worldmap]
	}
	
	def weaponstore = {
		def warrior = Warrior.get(session.warrior_id)
		render(view:"store", model:[store:warrior.actualLocation.weapons,warrior:warrior])
	}
	
	def armorstore = {
		def warrior = Warrior.get(session.warrior_id)
		render(view:"store", model:[store:warrior.actualLocation.armors,warrior:warrior])
	}
	
	def consumablestore = {
		def warrior = Warrior.get(session.warrior_id)
		render(view:"store", model:[store:warrior.actualLocation.consumables,warrior:warrior])
	}
	
	def transports = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def arena = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def move = {
		def warrior = Warrior.get(session.warrior_id)
		def map = Map.get(params.move_map_id as Long)
		
		//Si el mapa esta al lado..
		if( (warrior.actualLocation.posX == map.posX && 
			(warrior.actualLocation.posY == map.posY+1 || 
			 warrior.actualLocation.posY == map.posY-1)) ||
		    (warrior.actualLocation.posY == map.posY && 
			(warrior.actualLocation.posX == map.posX+1 || 
			 warrior.actualLocation.posX == map.posX-1)) ){
			
			if(warrior.actualSTA >= 5){
				warrior.actualSTA -= 5
				boolean encountered = false
				boolean killed = false
				warrior.actualLocation.encounters.each{
					if(encountered)
						return
					def chance = new Random().nextInt(100)+1
					if(chance <= it.chance / 2){
						def fight = new Fight(warrior:warrior,encounter:it)
						fight.resolveFight()
						fight.save(flush:true)
						if(!fight.won)
							killed = true
						def je = new JournalEntry(type:JournalEntry.EXPLORATION_MONSTER_FOUND,fight:fight)
						je.save()
						warrior.addToJournal(je)
						if(fight.won){
							warrior.giveExp(it.totalExp())
							warrior.gold += it.totalGold()
							it.totalLoot().each{ item ->
								boolean alreadyHaveIt = false
								
								if(item.stackable){
									warrior.inventory.each{
										if(alreadyHaveIt)
											return
										if(it.type == item){
											if(it.qty + 1 > 1000){
												it.qty = 1000
											}else{
												it.qty += 1
												alreadyHaveIt = true
											}
											it.save()
										}
									}
								}
							
								if(!alreadyHaveIt){
									def newitem = new Item(type:item, qty:1)
									newitem.save()
									warrior.addToInventory(newitem)
								}
							}						
						}
					
						encountered = true
					}
				}
				if(!encountered){
					def je = new JournalEntry(type:JournalEntry.TEXT, text:"You explore the area but didn't find anything.")
					je.save()
					warrior.addToJournal(je)
				}
				
				//Despues lo muevo si esta vivo
				if(!killed){
					warrior.actualLocation = map
					if(map.isCity())
						warrior.resurrectionMap = map
					def je = new JournalEntry(type:JournalEntry.TEXT, text:"You decided to walk for a while. You are now in <b>${map.name}</b>.")
					je.save()
					warrior.addToJournal(je)
				}
				warrior.save()
			}
		}
		redirect(controller:"warrior", action:"index")
	}
	
	def buy = {
		def referer = request.getHeader("Referer")
		def warrior = Warrior.get(session.warrior_id)
		
		def item = ItemType.get(params.buy_item_id as Long)
		if(warrior.actualLocation.weapons?.items?.contains(item) ||
			warrior.actualLocation.armors?.items?.contains(item) ||
			warrior.actualLocation.consumables?.items?.contains(item)){
			int qty = Math.max(Math.min(Integer.parseInt(params.buy_item_qty),999),1)
			if(warrior.gold >= item.price * qty){
				warrior.gold -= item.price * qty
				boolean alreadyHaveIt = false
				
				if(item.stackable){
					warrior.inventory.each{
						if(alreadyHaveIt)
							return
						if(it.type == item){
							if(it.qty + qty > 1000){
								qty = (it.qty + qty - 1000)
								it.qty = 1000
							}else{
								it.qty += qty
								alreadyHaveIt = true
							}
							it.save()
						}
					}
				}
				
				if(!alreadyHaveIt){
					def newitem = new Item(type:item, qty:qty)
					newitem.save()
					warrior.addToInventory(newitem)
				}
				warrior.save()
			}
		}
		
		redirect(url:referer)
	}
	
	def sell = {
		def referer = request.getHeader("Referer")
		def warrior = Warrior.get(session.warrior_id)
		
		def found = false
		def del = null
		def item = warrior.inventory.each{
			if(found)
				return
			if(it.id == params.sell_item_id as Long){
				found = true
				int qty = Math.max(Math.min(Integer.parseInt(params.sell_item_qty),999),1)
				if(qty >= it.qty){
					del = it
					warrior.gold += (it.qty * (it.type.price / 2).intValue()) 
				}else{
					warrior.gold += (qty * (it.type.price / 2).intValue())
					it.qty -= qty;
					it.save()
				}
				warrior.save()
			}
		}
		if(del){
			warrior.removeFromInventory(del)
			del.delete()
		}
		
		redirect(url:referer)
	}
	
	def fights = {
		def fight = Fight.get(params.id as Long)
		def warrior = Warrior.get(session.warrior_id)
		if(fight.warrior == warrior)
			return [warrior:warrior,fight:fight]
		else
			redirect(controller:"warrior", action:"index")
	}
	
	def startQuest = {
		def warrior = Warrior.get(session.warrior_id)
		//TODO: Revisar que no la tenga
		def quest = Quest.get(params.id)
		if(quest){
			warrior.addToQuestsInProgress(quest)	
		}
		
		def referer = request.getHeader("Referer")
		redirect(url:referer)
	}
	
	def getReward = {
		//TODO: Todas las validaciones de mierda
		def warrior = Warrior.get(session.warrior_id)
		def quest = Quest.get(params.id)
		if(quest){
			def skillsok = true
			if(quest.skillsNeeded){
				quest.skillsNeeded.all().each{
					if(warrior.skills."$it.key" < it.value)
						skillsok = false
				}
			}
			
			def itemsok = true
			if(quest.itemsNeeded){
				quest.itemsNeeded.each{
					if(warrior.qtyOfItem(it.type) < it.qty)
						itemsok = false
				}
			}
			
			if(skillsok && itemsok){
				
				//TODO: Sacarle los items
				
				warrior.gold += quest.gold
				warrior.giveExp(quest.exp)
				if(quest.jobQuest)
					warrior.changeJob(quest.jobReward)
				quest.itemsRewarded.each{ item ->
					boolean alreadyHaveIt = false
					def qty = item.qty
					if(item.type.stackable){
						warrior.inventory.each{
							if(alreadyHaveIt)
								return
							if(it.type == item.type){
								if(it.qty + qty > 1000){
									qty = (it.qty + qty - 1000)
									it.qty = 1000
								}else{
									it.qty += qty
									alreadyHaveIt = true
								}
								it.save()
							}
						}
					}
					
					if(!alreadyHaveIt){
						def newitem = new Item(type:item.type, qty:qty)
						newitem.save()
						warrior.addToInventory(newitem)
					}
				}
				
				
				//TODO: Sacar la quest
			}
			warrior.save()
		}
		
		redirect(controller:"warrior", action:"index")
	}
}

class WarriorRegistrationCommand{
	String name
	int origin
	String gender
	
	static constraints = {
		name(nullable:false,blank:false,maxSize:30)
		gender(inList:["M","F"])
		origin(inList:[1,2,3,4])
	}
}
