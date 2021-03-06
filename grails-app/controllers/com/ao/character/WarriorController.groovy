package com.ao.character

import org.joda.time.DateTime;

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
	def beforeInterceptor = [action:this.&checkSessionWarrior,except:['index','register','save','list','create','show','edit','login','logged']]
	
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
	
	//PREVIOUS ACTIONS
	
	static def MAX_WARRIORS = 3
	
	def register = {
		def warriorqty = 0
		Warrior.findAllByOwner_id(123L).each{
			if(it.status == "A" || it.status == "B")
				warriorqty++
		}
		if(warriorqty == MAX_WARRIORS)
			redirect(controller:"main",action:"index")
		[cities:City.list(), params:params]
	}
	
	def save = { WarriorRegistrationCommand wrc ->
		if(wrc.hasErrors()){
			render(view:"register",model:[wrc:wrc,cities:City.list()])
		}else{
			def warrior = new Warrior(owner_id: session.fb_user_id)
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
	
	def deleteWarrior = {
		if(params.warrior_id){
			def warrior = Warrior.get(params.warrior_id)
			if(warrior != null && warrior.owner_id == session.fb_user_id as Long){
				warrior.status = "D"
				warrior.save()
			}
		}
		redirect(controller:"main", action:"warriorList")
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
		if(!w || w.status == "B" || w.status == "D")
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
		else
			flash.message = "Can't equip ${item.type.name}."
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
		warrior.refreshSTA()
		warrior.refreshHP()
		warrior.save()
		if(warrior.canSpendSTA(5)){
			def encounter = getEncounter(warrior.actualLocation, 1)
			def fight
			def expgained = 0
			def itemsgained = [:]
			def leveled_up
			if(encounter){
				fight = new Fight(warrior:warrior,encounter:encounter)
				fight.resolveFight()
				fight.save()
			}
			
			if(fight?.won){
				def wlevel = warrior.level
				expgained = warrior.giveExp(encounter.totalExp())
				if(warrior.level > wlevel) leveled_up = true
				encounter.totalLoot().each{ item ->
					def itemchance = new Random().nextInt(100)+1
					if(itemchance <= item.chance){
//						warrior.giveItem(item.type, item.qty)
						if(itemsgained[item.type])
							itemsgained[item.type] += item.qty
						else
							itemsgained[item.type] = item.qty
					}
				}
//				newEntry(warrior, fight, expgained, itemsgained)
			}else{
//				newEntry(warrior, fight, 0, [:])
			}
			
			
			
			warrior.save()
			flash.explore_results = true
			flash.encounter = encounter
			flash.fight = fight
			flash.expgained = expgained
			flash.itemsgained = itemsgained
			flash.leveled_up = leveled_up
			redirect(controller:"warrior",action:"searchResults")
			
			
//			def killed = searchMonsters(warrior, 1)
//			if(!killed){
//				searchItems(warrior, 1)
//				if(warrior.actualSTA >= 5)
//					flash.search_again = true
//			}else{
//				def je = new JournalEntry(type:JournalEntry.TEXT, text:"You died in combat. You resurrected in <b>${warrior.actualLocation.name}</b>.")
//				je.save(flush:true)
//				warrior.addToJournal(je)
//			}
		}
			
	}
	
	def searchResults = {
		if(!flash.explore_results)
			redirect(controller:"warrior", action:"index")
		def warrior = Warrior.get(session.warrior_id)
		flash.itemsToTake = flash.itemsgained
		return [encounter:flash.encounter, fight: flash.fight, expgained:flash.expgained, itemsgained:flash.itemsgained, warrior:warrior,
			leveled_up:flash.leveled_up]		
	}
	
	def takeAndSearch = {
		if(flash.itemsToTake){
			def warrior = Warrior.get(session.warrior_id)
			flash.itemsToTake.each{ type, qty ->
				warrior.giveItem(type, qty)
			}
			warrior.save()
		}
		redirect(controller:"warrior", action:"explore")
	}
	
	def takeAndJournal = {
		if(flash.itemsToTake){
			def warrior = Warrior.get(session.warrior_id)
			flash.itemsToTake.each{ type, qty ->
				warrior.giveItem(type, qty)
			}
			warrior.save()
		}
		redirect(controller:"warrior", action:"index")
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
		warrior.save()
//		newEntry(warrior, "You decided to walk for a while. You are now in <b>${destiny.name}</b>.", JournalEntry.TEXT)
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
	
	def temple = {
		def warrior = Warrior.get(session.warrior_id)
		[warrior:warrior]
	}
	
	def templeHP = {
		def warrior = Warrior.get(session.warrior_id)
		if(warrior.canRecoverHP() && warrior.gold >= 5){
			warrior.gold -= 5
			def realhp
			if(warrior.actualHP + (warrior.maxHP()/2).intValue() > warrior.maxHP()){
				realhp = warrior.maxHP() - warrior.actualHP
				warrior.actualHP = warrior.maxHP()
			}else{
				realhp = (warrior.maxHP()/2).intValue()
				warrior.actualHP += (warrior.maxHP()/2).intValue()
			}
			warrior.lastHPRecovered = new DateTime().getMillis()
//			newEntry(warrior, "In the silence of the temple you recovered ${realhp} HP praying.", JournalEntry.TEXT)
			warrior.save()
		}
		redirect(controller:"warrior", action:"index")
	}
	
	def templeSTA = {
		def warrior = Warrior.get(session.warrior_id)
		if(warrior.canRecoverSTA() && warrior.gold >= 10){
			warrior.gold -= 10
			def realsta
			if(warrior.actualSTA + (warrior.maxSTA()/2).intValue() > warrior.maxSTA()){
				realsta = warrior.maxSTA() - warrior.actualSTA
				warrior.actualSTA = warrior.maxSTA()
			}else{
				realsta = (warrior.maxSTA()/2).intValue()
				warrior.actualSTA += (warrior.maxSTA()/2).intValue()
			}
			warrior.lastSTARecovered = new DateTime().getMillis()
//			newEntry(warrior, "In the silence of the temple you recovered ${realsta} STA praying.", JournalEntry.TEXT)
			warrior.save()
		}
		redirect(controller:"warrior", action:"index")
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
			warrior.gold += (qtysold * (item.type.price / 2).intValue())
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
		warrior.save()
		redirect(controller:"warrior",action:"index")
	}
	
	def startQuest = {
		def warrior = Warrior.get(session.warrior_id)
		def quest = Quest.get(params.id)
		if(quest && !warrior.questsInProgress.contains(quest)){
			warrior.addToQuestsInProgress(quest)
			newEntry(warrior, "You started quest <b>${quest.title}</b>.", JournalEntry.TEXT)
		}
		warrior.save()
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
		warrior.save()
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
		warrior.save()
	}
	
	void newEntry(def warrior, def fight, def expgained, def itemsgained){
		def je = new JournalEntry(type:JournalEntry.EXPLORATION_MONSTER_FOUND, fight:fight, exp: expgained)
		itemsgained.each{
			def item = new Item(type:it.key,qty:it.value)
			item.save(flush:true)
			je.addToItemsGained(item)
		}
		je.save(flush:true)
		warrior.addToJournal(je)
		warrior.save()
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
	
	def getEncounter(def map, def chance_mult){
		def encounters = getOrderedChances(map.encounters, chance_mult)
		def chance = new Random().nextInt(100)+1
		def encounter = null;
		
		encounters.each{
			if(chance >= it.value.min && chance <= it.value.max)
				encounter = it.key
		}
		
		return encounter
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
			
			if(fight.won){
				def expgained = warrior.giveExp(encounter.totalExp())
				def itemsgained = [:]
				encounter.totalLoot().each{ item ->
					def itemchance = new Random().nextInt(100)+1
					if(itemchance <= item.chance){
						warrior.giveItem(item.type, item.qty)
						if(itemsgained[item.type])
							itemsgained[item.type] += item.qty 
						else
							itemsgained[item.type] = item.qty
					}
				}
				newEntry(warrior, fight, expgained, itemsgained)
			}else{
				newEntry(warrior, fight, 0, [:])
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