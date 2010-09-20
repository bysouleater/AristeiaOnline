package com.ao.character

import com.ao.StatsList 


class Job {
	
	static Long NEWBIE
	static Long BARBARIAN
	static Long SOLDIER
	static Long ADEPT
	static Long SHOOTER
	static Long COMPETENT
	static Long SPECIALIST
	
	String name
	StatsList baseStats
	StatsList levelUpStats
	int maxLevel
	int maxSkillsValue

    static constraints = {
		name(nullable:false,blank:false,maxSize:30,unique:true)
		baseStats(nullable:false)
		levelUpStats(nullable:false)
    }
	
	static void initJobs(){
		//NEWBIE
		def newbie_base_stats = new StatsList(HP:50,STA:20)
		def newbie_levelup_stats = new StatsList(HP:25,STA:5)
		newbie_base_stats.save()
		newbie_levelup_stats.save()
		def newbie = new Job(name:"Newbie", baseStats:newbie_base_stats, 
			levelUpStats: newbie_levelup_stats, maxLevel: 5, maxSkillsValue: 20)
		newbie.save()
		NEWBIE = newbie.id
		
		//BARBARIAN
		def barbarian_base_stats = new StatsList(HP:400,STA:50,CON:8,STR:5,DEX:3,AGI:2)
		def barbarian_levelup_stats = new StatsList(HP:75,STA:10,CON:3,STR:2,DEX:1,AGI:0)
		barbarian_base_stats.save()
		barbarian_levelup_stats.save()
		def barbarian = new Job(name:"Barbarian", baseStats:barbarian_base_stats,
			levelUpStats: barbarian_levelup_stats, maxLevel: 15, maxSkillsValue: 60)
		barbarian.save()
		BARBARIAN = barbarian.id
		
		//SOLDIER
		def soldier_base_stats = new StatsList(HP:250,STA:80,STR:8,CON:5,AGI:3,DEX:2)
		def soldier_levelup_stats = new StatsList(HP:50,STA:15,STR:3,CON:2,AGI:1,DEX:0)
		soldier_base_stats.save()
		soldier_levelup_stats.save()
		def soldier = new Job(name:"Soldier", baseStats:soldier_base_stats,
			levelUpStats: soldier_levelup_stats, maxLevel: 15, maxSkillsValue: 60)
		soldier.save()
		SOLDIER = soldier.id
		
		//ADEPT
		def adept_base_stats = new StatsList(HP:100,STA:30,AGI:8,DEX:5,STR:3,CON:2)
		def adept_levelup_stats = new StatsList(HP:25,STA:8,AGI:3,DEX:2,STR:1,CON:0)
		adept_base_stats.save()
		adept_levelup_stats.save()
		def adept = new Job(name:"Adept", baseStats:adept_base_stats,
			levelUpStats: adept_levelup_stats, maxLevel: 15, maxSkillsValue: 60)
		adept.save()
		ADEPT = adept.id
		
		//SHOOTER
		def shooter_base_stats = new StatsList(HP:100,STA:30,DEX:8,AGI:5,STR:3,CON:2)
		def shooter_levelup_stats = new StatsList(HP:25,STA:8,DEX:3,AGI:2,STR:1,CON:0)
		shooter_base_stats.save()
		shooter_levelup_stats.save()
		def shooter = new Job(name:"Shooter", baseStats:shooter_base_stats,
			levelUpStats: shooter_levelup_stats, maxLevel: 15, maxSkillsValue: 60)
		shooter.save()
		SHOOTER = shooter.id
		
		//COMPETENT
		def competent_base_stats = new StatsList(HP:250,STA:20,DEX:8,CON:5,AGI:3,STR:2)
		def competent_levelup_stats = new StatsList(HP:50,STA:5,DEX:3,CON:2,AGI:1,STR:0)
		competent_base_stats.save()
		competent_levelup_stats.save()
		def competent = new Job(name:"Competent", baseStats:competent_base_stats,
			levelUpStats: competent_levelup_stats, maxLevel: 15, maxSkillsValue: 60)
		competent.save()
		COMPETENT = competent.id
		
		//SPECIALIST
		def specialist_base_stats = new StatsList(HP:150,STA:20,DEX:8,STR:5,CON:3,AGI:2)
		def specialist_levelup_stats = new StatsList(HP:30,STA:5,DEX:3,STR:2,CON:1,AGI:0)
		specialist_base_stats.save()
		specialist_levelup_stats.save()
		def specialist = new Job(name:"Specialist", baseStats:specialist_base_stats,
			levelUpStats: specialist_levelup_stats, maxLevel: 15, maxSkillsValue: 60)
		specialist.save()
		SPECIALIST = specialist.id
	}
	
}
