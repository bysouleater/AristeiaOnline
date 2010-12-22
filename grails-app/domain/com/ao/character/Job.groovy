package com.ao.character

import com.ao.StatsList 


class Job {
	
	static Long NEWBIE = 1
	static Long BARBARIAN = 2
	static Long SOLDIER = 3
	static Long ADEPT = 4
	static Long SHOOTER = 5
	static Long COMPETENT = 6
	static Long SPECIALIST = 7
	
	static int NEWBIE_GENERATION = 0
	static int FIRST_GENERATION = 1
	static int SECOND_GENERATION = 2
	
	String name
	StatsList baseStats
	StatsList levelUpStats
	int maxLevel
	int maxSkillsValue
	int generation
	String picture

    static constraints = {
		name(blank:false,maxSize:30,unique:true)
		picture(nullable:true)
    }
	
	public String toString() {
		return name
	}
}
