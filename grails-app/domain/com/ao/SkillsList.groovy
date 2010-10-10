package com.ao

class SkillsList {
	
	//DEX
	double Aiming = 0
	double Thievery = 0
	//STR
	double Athletics = 0
	double Climb = 0
	//AGI
	double Escape_Artist = 0
	double Stealth = 0
	//CON
	double Endurance = 0
	double Concentration = 0
	
	def all(){
		def map = [:]
		map["Aiming"] = Aiming
		map["Thievery"] = Thievery
		map["Athletics"] = Athletics
		map["Climb"] = Climb
		map["Escape_Artist"] = Escape_Artist
		map["Stealth"] = Stealth
		map["Endurance"] = Endurance
		map["Concentration"] = Concentration
		return map
	}
	
	def titleStats(){
		def text = ""
		all().each{
			if(it.value > 0)
				text += " ${it.key} (Max ${it.value}) "
		}
		return text
	}

    static constraints = {
    }
}
