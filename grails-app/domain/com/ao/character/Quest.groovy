package com.ao.character

import com.ao.SkillsList
import com.ao.items.Item
import com.ao.monster.Monster
import com.ao.character.Job

class Quest {
	
	String title
	String description
	int minLevel
	int maxLevel
	Long exp
	Long gold
	boolean jobQuest
	Job jobReward
	SkillsList skillsNeeded
	
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
		//TODO: Filtrar mejor
		def all = list()
		def quests = []
		all.each{
			if(warrior.level >= it.minLevel && warrior.level <= it.maxLevel){
				if(!warrior.questsInProgress.contains(it))
					quests.add(it)
			}
		}
		
		return quests
	}
}
