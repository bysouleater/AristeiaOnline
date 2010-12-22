package com.ao.environments.dev

import com.ao.StatsList;
import com.ao.character.Job;

class Jobs {
	
	static def init = {
		println "Creando Jobs"
//		println "\tNEWBIE"
		def newbie_base_stats = new StatsList(HP:50,STA:20)
		def newbie_levelup_stats = new StatsList(HP:25,STA:5)
		assertSave {newbie_base_stats.save()}
		assertSave {newbie_levelup_stats.save()}
		def newbie = new Job(name:"Newbie", baseStats:newbie_base_stats,
			levelUpStats: newbie_levelup_stats, maxLevel: 5, maxSkillsValue: 20,
			generation:Job.NEWBIE_GENERATION)
		assertSave {newbie.save()}
		
//		println "\tBARBARIAN"
		def barbarian_base_stats = new StatsList(HP:400,STA:50,CON:5,STR:3,DEX:2,AGI:1)
		def barbarian_levelup_stats = new StatsList(HP:75,STA:10,CON:2,STR:1,DEX:0,AGI:0)
		assertSave {barbarian_base_stats.save()}
		assertSave {barbarian_levelup_stats.save()}
		def barbarian = new Job(name:"Barbarian", baseStats:barbarian_base_stats,
			levelUpStats: barbarian_levelup_stats, maxLevel: 15, maxSkillsValue: 60,
			generation:Job.FIRST_GENERATION)
		assertSave {barbarian.save()}
		
//		println "\tSOLDIER"
		def soldier_base_stats = new StatsList(HP:250,STA:80,STR:5,CON:3,AGI:2,DEX:1)
		def soldier_levelup_stats = new StatsList(HP:50,STA:15,STR:2,CON:1,AGI:0,DEX:0)
		assertSave {soldier_base_stats.save()}
		assertSave {soldier_levelup_stats.save()}
		def soldier = new Job(name:"Soldier", baseStats:soldier_base_stats,
			levelUpStats: soldier_levelup_stats, maxLevel: 15, maxSkillsValue: 60,
			generation:Job.FIRST_GENERATION)
		assertSave {soldier.save()}
		
//		println "\tADEPT"
		def adept_base_stats = new StatsList(HP:100,STA:30,AGI:5,DEX:3,STR:2,CON:1)
		def adept_levelup_stats = new StatsList(HP:25,STA:8,AGI:2,DEX:1,STR:0,CON:0)
		assertSave {adept_base_stats.save()}
		assertSave {adept_levelup_stats.save()}
		def adept = new Job(name:"Adept", baseStats:adept_base_stats,
			levelUpStats: adept_levelup_stats, maxLevel: 15, maxSkillsValue: 60,
			generation:Job.FIRST_GENERATION)
		assertSave {adept.save()}
		
//		println "\tSHOOTER"
		def shooter_base_stats = new StatsList(HP:100,STA:30,DEX:5,AGI:3,STR:2,CON:1)
		def shooter_levelup_stats = new StatsList(HP:25,STA:8,DEX:2,AGI:1,STR:0,CON:0)
		assertSave {shooter_base_stats.save()}
		assertSave {shooter_levelup_stats.save()}
		def shooter = new Job(name:"Shooter", baseStats:shooter_base_stats,
			levelUpStats: shooter_levelup_stats, maxLevel: 15, maxSkillsValue: 60,
			generation:Job.FIRST_GENERATION)
		assertSave {shooter.save()}
		
//		println "\tCOMPETENT"
		def competent_base_stats = new StatsList(HP:250,STA:20,DEX:5,CON:3,AGI:2,STR:1)
		def competent_levelup_stats = new StatsList(HP:50,STA:5,DEX:2,CON:1,AGI:0,STR:0)
		assertSave {competent_base_stats.save()}
		assertSave {competent_levelup_stats.save()}
		def competent = new Job(name:"Competent", baseStats:competent_base_stats,
			levelUpStats: competent_levelup_stats, maxLevel: 15, maxSkillsValue: 60,
			generation:Job.FIRST_GENERATION)
		assertSave {competent.save()}
		
//		println "\tSPECIALIST"
		def specialist_base_stats = new StatsList(HP:150,STA:20,DEX:5,STR:3,CON:2,AGI:1)
		def specialist_levelup_stats = new StatsList(HP:30,STA:5,DEX:2,STR:1,CON:0,AGI:0)
		assertSave {specialist_base_stats.save()}
		assertSave {specialist_levelup_stats.save()}
		def specialist = new Job(name:"Specialist", baseStats:specialist_base_stats,
			levelUpStats: specialist_levelup_stats, maxLevel: 15, maxSkillsValue: 60,
			generation:Job.FIRST_GENERATION)
		assertSave {specialist.save()}
	}
	
	static def assertSave(def clos){
		assert clos() != null
	}
}
