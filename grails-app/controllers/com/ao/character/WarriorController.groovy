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
		if(session.warrior_id){
			def warrior = Warrior.get(session.warrior_id)
			warrior.refreshSTA()
			warrior.refreshHP()
			warrior.save(flush:true)
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
				warrior.save(flush:true)
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
		warrior.unequipItem(params.unequip_item_id)
		warrior.save()
		def referer = request.getHeader("Referer")
		redirect(url:referer)
	}
	
	def equip = {
		def warrior = Warrior.get(session.warrior_id)
		def item = Item.get(params.equip_item_id)
		if(item && warrior.inventory && warrior.inventory.contains(item) && item.type.canEquip(warrior.job))
			warrior.equipItem(item)
		warrior.save()
		redirect(controller:"warrior", action:"equipment")
	}
	
	def use = {
		def warrior = Warrior.get(session.warrior_id)
		def item = Item.get(params.use_item_id)
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
		newEntry(warrior, "You decided to walk for a while. You are now in <b>${destiny.name}</b>.", JournalEntry.TEXT)
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
		return actualmap.weapons?.items?.contains(itemtype) || actualmap.armors?.items?.contains(itemtype) || actualmap.consumables?.items?.contains(itemtype)
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
			def qtysold = warrior.takeItem(item, params.sell_item_qty as int)
			//For alpha version, sell is for real price
			//warrior.gold += (qtysold * (item.type.price / 2).intValue())
			warrior.gold += (qtysold * item.type.price)
			warrior.save()
		}
		def referer = request.getHeader("Referer")
		redirect(url:referer)
	}
	
	
	
	def train = {
		def warrior = Warrior.get(session.warrior_id)
		def tp = TrainingPlace.get(params.training_place_id as Long)
		if(warrior.actualLocation.trainingPlaces.contains(tp)){
			if(warrior.canSpendSTA(tp.STArequired)){
				newEntry(warrior, "You spent some time training in <b>${tp.name}</b>. <br>Gained ${trainSkill(warrior, tp)}.",
					JournalEntry.TEXT)
			}
		}
		redirect(controller:"warrior",action:"index")
	}
	
	def startQuest = {
		def warrior = Warrior.get(session.warrior_id)
		def quest = Quest.get(params.id)
		if(quest && !warrior.questsInProgress.contains(quest)){
			warrior.addToQuestsInProgress(quest)
			newEntry(warrior, "You started quest <b>${quest.title}</b>.", JournalEntry.TEXT)
		}
		redirect(controller:"warrior",action:"index")
	}
	
	boolean hasSkillsNeeded(def warrior, def quest){
		def skillsok = true
		if(quest.skillsNeeded){
			quest.skillsNeeded.all().each{
				if(warrior.skills."$it.key" < it.value)
					skillsok = false
			}
		}
		return skillsok
	}
	
	boolean hasItemsNeeded(def warrior, def quest){
		def itemsok = true
		if(quest.itemsNeeded){
			quest.itemsNeeded.each{
				if(warrior.qtyOfItem(it.type) < it.qty)
					itemsok = false
			}
		}
		return itemsok
	}
	
	def getReward = {
		def warrior = Warrior.get(session.warrior_id)
		def quest = Quest.get(params.id)
		
		if(quest && warrior.questsInProgress.contains(quest)){
			if(hasSkillsNeeded(warrior, quest) && hasItemsNeeded(warrior, quest)){
				quest.itemsNeeded.each{ itemquest ->
					warrior.takeItem(itemquest.type, itemquest.qty)
					warrior.gold += quest.gold
					warrior.giveExp(quest.exp)
					
					if(quest.jobReward)
						warrior.changeJob(quest.jobReward)
						
					quest.itemsRewarded.each{ item ->
						warrior.giveItem(item.type, item.qty)
					}
					
					newEntry(warrior, "You completed quest <b>${quest.title}</b>.", JournalEntry.TEXT)
					
					warrior.removeFromQuestsInProgress(quest)
					warrior.addToQuestsDone(quest)
				}
			}
		}
		warrior.save(flush:true)
		redirect(controller:"warrior", action:"index")
	}
	
	def fights = {
		def warrior = Warrior.get(session.warrior_id)
		def fight = Fight.get(params.id as Long)
		if(fight && fight.warrior == warrior)
			return [warrior:warrior,fight:fight]
		else
			redirect(controller:"warrior", action:"index")
	}
	
	void newEntry(def warrior, def text, def type){
		def je = new JournalEntry(type:type, text:text)
		je.save(flush:true)
		warrior.addToJournal(je)
		warrior.save(flush:true)
	}
	
	void newEntry(def warrior, def fight){
		def je = new JournalEntry(type:JournalEntry.EXPLORATION_MONSTER_FOUND, fight:fight)
		je.save(flush:true)
		warrior.addToJournal(je)
		warrior.save(flush:true)
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
		def encounter = null;
		def killed = false
		
		encounters.each{
			if(chance >= it.value.min && chance <= it.value.max)
				encounter = it.key
		}
		
		if(encounter){
			def fight = new Fight(warrior:warrior,encounter:encounter)
			fight.resolveFight()
			fight.save(flush:true)
			killed = !fight.won
			
			newEntry(warrior, fight)
			
			if(fight.won){
				warrior.giveExp(encounter.totalExp())
				warrior.gold += encounter.totalGold()
				
				encounter.totalLoot().each{ itemtype, lqty ->
					warrior.giveItem(itemtype, lqty)
				}
			}
		}else{
			newEntry(warrior, "You explore the area but didn't find anything.", JournalEntry.TEXT)
		}
		
		return killed
	}	
	
	void searchItems(def warrior, def chance_mult){
		def items = getOrderedChances(warrior.actualLocation.items, chance_mult)
		def chance = new Random().nextInt(100)+1
		def itemfound = null
		
		items.each{
			if(chance >= it.value.min && chance <= it.value.max)
				itemfound = it.key
		}
		
		if(itemfound){
			newEntry(warrior, "While searching you found <b>${itemfound.qty}x ${itemfound.type.name}</b>.", JournalEntry.TEXT)
			warrior.giveItem(itemfound.type, itemfound.qty)
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
