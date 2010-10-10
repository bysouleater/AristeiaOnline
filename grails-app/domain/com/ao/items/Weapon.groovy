package com.ao.items

import com.ao.*
import com.ao.character.Job;

class Weapon extends ItemType{
	
	static int HEAVY = 1
	static int NORMAL = 2
	static int LIGHT = 3
	static int DISTANCE = 4
	static int DUAL = 5
	static int SPECIAL = 6
	
	int type
	int handsQty
	StatsList stats
	boolean equipable = true
	boolean weapon = true
	
	static hasMany = [jobs:Job]
	
	boolean canEquip(def warrior_job){
		if(!jobs || jobs.size() == 0)
			return true
		def canequip = false
		jobs.each{
			if(it.id == warrior_job.id)
				canequip = true
		}
		return canequip
	}

    static constraints = {
		type(inList:[HEAVY,NORMAL,LIGHT,DISTANCE,DUAL,SPECIAL])
		handsQty(minSize:1, maxSize:2)
		stats(nullable:false)
    }
	
	def titleStats(){
		def text = ""
		stats.all().each{
			if(it.value > 0)
				text += " ${it.key} ${it.value} "
		}
		return text
	}
}
