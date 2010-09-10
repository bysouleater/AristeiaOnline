package com.ao

class TrainingPlace {
	
	String name
	SkillsList skills
	int STArequired
	//img

    static constraints = {
		name(nullable:false,blank:false)
		skills(nullable:false)
		STArequired(nullable:false)
    }
}
