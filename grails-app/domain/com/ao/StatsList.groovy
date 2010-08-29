package com.ao

class StatsList {
	
	double STR = 0
	double STRP = 0
	double DEX = 0
	double DEXP = 0
	double CON = 0
	double CONP = 0
	double AGI = 0
	double AGIP = 0
	
	int HP = 0
	int HPP = 0
	int STA = 0
	int STAP = 0
	
	int PAtk = 0
	int PDef = 0
	int Acc = 0
	int Eva = 0
	int ARate = 0
	int CRate = 0
	int Luck = 0
	int Init = 0
	
	def all(){
		def map = [:]
		map["STR"] = STR
		map["STRP"] = STRP
		map["DEX"] = DEX
		map["DEXP"] = DEXP
		map["CON"] = CON
		map["CONP"] = CONP
		map["AGI"] = AGI
		map["AGIP"] = AGIP
		map["HP"] = HP
		map["HPP"] = HPP
		map["STA"] = STA
		map["STAP"] = STAP
		map["PAtk"] = PAtk
		map["PDef"] = PDef
		map["Acc"] = Acc
		map["Eva"] = Eva
		map["ARate"] = ARate
		map["CRate"] = CRate
		map["Luck"] = Luck
		map["Init"] = Init
		return map
	}

    static constraints = {
    }
}
