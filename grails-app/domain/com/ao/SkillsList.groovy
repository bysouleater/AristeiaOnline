package com.ao

class SkillsList {
	
	double Aiming = 0
	double Thievery = 0
	
	double Athletics = 0
	double Climb = 0
	
	double Escape_Artist = 0
	double Stealth = 0
	
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

    static constraints = {
    }
}
