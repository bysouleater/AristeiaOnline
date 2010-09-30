package com.ao.character

import com.ao.SkillsList
import com.ao.items.Item
import com.ao.monster.Monster
import com.ao.character.Job
import com.ao.places.Map

class Quest {
	
	String title
	String description
	int minLevel
	int maxLevel
	boolean repetible = false
	Long exp
	Long gold
	Job jobReward
	SkillsList skillsNeeded
	Map starting_location
	
	static hasMany = [itemsNeeded:Item, itemsRewarded:Item]

    static constraints = {
		title(nullable:false,blank:false)
		description(nullable:false,blank:false)
		minLevel(min:1)
		maxLevel(min:1)
		jobReward(nullable:true)
		skillsNeeded(nullable:true)
    }
	
	static def getAvailableQuests(Warrior warrior){
		def quests = Quest.withCriteria {
			ge("maxLevel",warrior.level)
			le("minLevel",warrior.level)
			eq("starting_location",warrior.actualLocation)
		}
		
		def available_quests = []
		quests.each{
			if(!warrior.questsInProgress.contains(it)){
				if(it.repetible){
					available_quests.add(it)
				}else if(it.jobReward){
					def otherJobQuest = false
					warrior.questsInProgress.each{
						if(it.jobReward)
							otherJobQuest = true
					}
					if(!otherJobQuest){
						if(warrior.job.generation < it.jobReward.generation)
							available_quests.add(it)
					}
				}else if(!warrior.questsDone.contains(it)){
					available_quests.add(it)
				}
			}
		}
		
		return available_quests
	}
}
