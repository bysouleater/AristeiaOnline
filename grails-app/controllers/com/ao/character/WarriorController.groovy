package com.ao.character

import com.ao.fight.Fight
import com.ao.items.Armor;
import com.ao.items.Item
import com.ao.items.ItemType
import com.ao.monster.Encounter;
import com.ao.places.City 
import com.ao.places.TrainingPlace 
import grails.converters.JSON
import com.ao.places.Map 

class WarriorController {
	
	def scaffold = true
	def beforeInterceptor = [action:this.&checkSessionWarrior,except:['index','register','save','list','create','show','edit']]
	
	def checkSessionWarrior() {
		if(!session.warrior_id) {
			redirect(controller:"main", action:'index')
			return false
		}else{
			def w = Warrior.get(session.warrior_id)
			if(!w){
				redirect(controller:"main",action:"index")
				return false
			}
		}
	}
	
	def afterInterceptor = { model ->
		if(model.warrior){
			model.warrior.refreshSTA()
			model.warrior.refreshHP()
			model.warrior.save(flush:true)
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
	
	//PREVIOUS ACTIONS
	
	static def MAX_WARRIORS = 3
	
	def register = {
		//		def url_params = parse_signed_request(params.signed_request)
		def warriorqty = Warrior.findAllByOwner_id(123L).size()
		if(warriorqty == MAX_WARRIORS)
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
				session.warrior_id = warrior.id
				redirect(controller:"warrior",action:"index")
			}else{
				render(view:"register", model:[wrc:warrior,cities:City.list()])
			}
		}
	}
	
	//GUI ACTIONS
	
	//TOP LINKS
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
	
	def insights = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	//LEFT LINKS
	
	static def MAX_JOURNAL_ENTRIES_TO_SHOW = 10
	
	def index = {
		if(params.id)
			session.warrior_id = params.id as Long
		def w = Warrior.get(session.warrior_id)
		if(!w)
			redirect(controller:"main",action:"index")
		def journal = JournalEntry.withCriteria {
			warrior {
				eq('id', w.id)
			}
			maxResults(params.max?Math.min(params.max as Integer,MAX_JOURNAL_ENTRIES_TO_SHOW):MAX_JOURNAL_ENTRIES_TO_SHOW)
			firstResult(params.offset?params.offset as Integer:0)
			order("dateCreated", "desc")
		}
		return [warrior:w,journal:journal]
	}
	
	def exploration = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def training = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def quests = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior, doing_quests:warrior.questsInProgress,
			available_quests:Quest.getAvailableQuests(warrior)]
	}
	
	// RESOLVING ACTIONS
	
	def updateStat = {
		def warrior = Warrior.get(session.warrior_id)
		warrior.updateStat(params.id)
		warrior.save()
		def referer = request.getHeader("Referer")
		redirect(url:referer)
	}
	
	def unequip = {
		def warrior = Warrior.get(session.warrior_id)
		warrior.unequipItem(params.id)
		warrior.save()
		def referer = request.getHeader("Referer")
		redirect(url:referer)
	}
	
	def equip = {
		def warrior = Warrior.get(session.warrior_id)
		def item = Item.get(params.id)
		if(item && warrior.inventory && warrior.inventory.contains(item))
			warrior.equipItem(item)
		warrior.save()
		redirect(controller:"warrior", action:"equipment")
	}
	
	def use = {
		def warrior = Warrior.get(session.warrior_id)
		def item = Item.get(params.id)
		if(item && warrior.inventory && warrior.inventory.contains(item))
			warrior.useItem(item)
		warrior.save()
		redirect(controller:"warrior", action:"inventory")
	}
	
	def explore = {
		def warrior = Warrior.get(session.warrior_id)
		if(warrior.canSpendSTA(5)){
			def killed = searchMonsters(warrior, 1)
			if(!killed)
				searchItems(warrior, 1)
		}
		warrior.save()
		redirect(controller:"warrior",action:"index")
	}
	
	def worldmap = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior, map:Map.getWorldMap()]
	}
	
	boolean mapIsNear(def actualmap, def destinymap){
		return 	(actualmap.posX == destinymap.posX && (actualmap.posY == destinymap.posY+1 || actualmap.posY == destinymap.posY-1)) ||
				(actualmap.posY == destinymap.posY && (actualmap.posX == destinymap.posX+1 || actualmap.posX == destinymap.posX-1))
	}
	
	void moveWarrior(def warrior, def destiny){
		warrior.actualLocation = destiny
		if(destiny.isCity())
			warrior.resurrectionMap = destiny
		def je = new JournalEntry(type:JournalEntry.TEXT, text:"You decided to walk for a while. You are now in <b>${destiny.name}</b>.")
		je.save()
		warrior.addToJournal(je)
	}
	
	def move = {
		def warrior = Warrior.get(session.warrior_id)
		def map = Map.get(params.move_map_id as Long)
		if(mapIsNear(warrior.actualLocation, map)){
			if(warrior.canSpendSTA(5)){
				def killed = searchMonsters(warrior, 0.5)
				if(!killed){
					searchItems(warrior, 0.5)
					moveWarrior(warrior, map)
				}
			}
			warrior.save()
		}
		redirect(controller:"warrior", action:"index")
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
	
	boolean isFromNearStore(def itemtype, def actualmap){
		return actualmap.weapons?.items?.contains(item) || actualmap.armors?.items?.contains(item) || actualmap.consumables?.items?.contains(item)
	}
	
	def buy = {
		def warrior = Warrior.get(session.warrior_id)
		def item = ItemType.get(params.buy_item_id as Long)
		int qty = Math.max(Math.min(Integer.parseInt(params.buy_item_qty),999),1)
		if(item && isFromNearStore(item, warrior.actualLocation)){
			if(warrior.canBuy(item.price * qty))
				warrior.giveItem(item, qty)
		}
		warrior.save()
		def referer = request.getHeader("Referer")
		redirect(url:referer)
	}
	
	def sell = {
		def warrior = Warrior.get(session.warrior_id)
		def item = Item.get(params.sell_item_id)
		if(item && warrior.inventory.contains(item)){
			def qtysold = warrior.takeItem(item, params.sell_item_qty)
			warrior.gold += (qtysold * (item.type.price / 2).intValue())
			warrior.save()
		}
		def referer = request.getHeader("Referer")
		redirect(url:referer)
	}
	
	def train = {
		def warrior = Warrior.get(session.warrior_id)
		def tp = TrainingPlace.get(params.id as Long)
		if(warrior.actualLocation.trainingPlaces.contains(tp)){
			if(warrior.canSpendSTA(tp.STArequired)){
				def je = new JournalEntry(type:JournalEntry.TEXT, 
					text:"You spent some time training in <b>${tp.name}</b>. <br>Gained ${trainSkill(warrior, tp)}.")
				je.save()
				warrior.addToJournal(je)
				warrior.save()
			}
		}
		redirect(controller:"warrior",action:"index")
	}
	
	/*HASTA AK LLEGUE REVISANDO*/
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
				quest.itemsNeeded.each{ itemquest ->
					def del = []
					int qty = itemquest.qty
					warrior.inventory.each{
						if(it.type == itemquest.type){
							if(qty >= it.qty){
								del.add(it)
								qty -= it.qty
							}else{
								it.qty -= qty;
								it.save()
							}
							warrior.save()
						}
					}
					if(del && del.size > 0){
						del.each{
							warrior.removeFromInventory(it)
							it.delete()
						}
					}
				}
				
				warrior.gold += quest.gold
				warrior.giveExp(quest.exp)
				if(quest.jobReward)
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
				
				warrior.removeFromQuestsInProgress(quest)
				warrior.addToQuestsDone(quest)
				//TODO: Ver las repetibles
			}
			warrior.save()
		}
		
		redirect(controller:"warrior", action:"index")
	}
	
	def fights = {
		def fight = Fight.get(params.id as Long)
		def warrior = Warrior.get(session.warrior_id)
		if(fight.warrior == warrior)
		return [warrior:warrior,fight:fight]
		else
		redirect(controller:"warrior", action:"index")
	}
	
	def getOrderedChances(def posible, def chance_mult){
		def ordered = [:]
		def last_enc = 0
		posible.each{
			ordered[it] = [min:last_enc+1,max:last_enc+(it.chance * chance_mult).intValue()]
			last_enc = last_enc+(it.chance * chance_mult).intValue()
		}
		return ordered
	}
	
	boolean searchMonsters(def warrior, def chance_mult){
		def encounters = getOrderedChances(warrior.actualLocation.encounters, chance_mult)
		def chance = new Random().nextInt(100)+1
		boolean encountered = false;
		def killed
		encounters.each{
			if(encountered)
				return
			if(chance >= it.value.min && chance <= it.value.max){
				encountered = true
				def fight = new Fight(warrior:warrior,encounter:it.key)
				fight.resolveFight()
				fight.save(flush:true)
				killed = !fight.won
				
				def je = new JournalEntry(type:JournalEntry.EXPLORATION_MONSTER_FOUND,fight:fight)
				je.save()
				warrior.addToJournal(je)
				
				if(fight.won){
					warrior.giveExp(it.key.totalExp())
					warrior.gold += it.key.totalGold()
					
					it.key.totalLoot().each{ item, lqty ->
						boolean alreadyHaveIt = false
						
						if(item.stackable){
							warrior.inventory.each{
								if(alreadyHaveIt)
									return
								if(it.type == item){
									if(it.qty + lqty > 1000){
										it.qty = 1000
										lqty = it.qty + lqty -1000
									}else{
										it.qty += lqty
										alreadyHaveIt = true
									}
									it.save(flush:true)
								}
							}
						}
						
						if(!alreadyHaveIt){
							def newitem = new Item(type:item, qty:lqty)
							newitem.save(flush:true)
							warrior.addToInventory(newitem)
						}
					}
				}
			}
		}
		
		if(!encountered){
			def je = new JournalEntry(type:JournalEntry.TEXT, text:"You explore the area but didn't find anything.")
			je.save()
			warrior.addToJournal(je)
		}
		
		return killed
	}	
	
	void searchItems(def warrior, def chance_mult){
		def items = getOrderedChances(warrior.actualLocation.items, chance_mult)
		def chance = new Random().nextInt(100)+1
		boolean found = false;
		items.each{ item ->
			if(found)
				return
			if(chance >= item.value.min && chance <= item.value.max){
				found = true
				
				def je = new JournalEntry(type:JournalEntry.TEXT,text:"While searching you found <b>${item.key.qty}x ${item.key.type.name}</b>.")
				je.save()
				warrior.addToJournal(je)
				
				boolean alreadyHaveIt = false
				
				def lqty = item.key.qty
				if(item.key.type.stackable){
					warrior.inventory.each{
						if(alreadyHaveIt)
							return
						if(it.type == item.key.type){
							if(it.qty + lqty > 1000){
								it.qty = 1000
								lqty = it.qty + lqty -1000
							}else{
								it.qty += lqty
								alreadyHaveIt = true
							}
							it.save(flush:true)
						}
					}
				}
				
				if(!alreadyHaveIt){
					def newitem = new Item(type:item.key.type, qty:lqty)
					newitem.save(flush:true)
					warrior.addToInventory(newitem)
				}
			}
		}
	}
	
	def trainSkill(def warrior, def tp){
		def skillsgained = ""
		def r = new Random()
		tp.skills.all().each{ skill ->
			if(skill.value > 0){
				double gained = (r.nextDouble() * (skill.value - 0.1) + 0.1).round(1)
				if(skillsgained != "")
					skillsgained += " and "
				skillsgained += "<b>${warrior.giveSkill(skill.key, gained)}</b> in <b>${skill.key}</b>"
			}
		}
		return skillsgained
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
