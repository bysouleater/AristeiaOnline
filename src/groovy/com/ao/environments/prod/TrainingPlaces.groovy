package com.ao.environments.prod


import com.ao.SkillsList;
import com.ao.places.TrainingPlace;

class TrainingPlaces {
	
	static def init = {
		println "Creando Training Places"
		
		def cebrene_speed_ring_skills = new SkillsList(Athletics:1d)
		assertSave cebrene_speed_ring_skills
		def cebrene_speed_ring = new TrainingPlace(name:"Cebrene Speed Ring", STArequired:5, skills:cebrene_speed_ring_skills)
		assertSave cebrene_speed_ring
		
		Maps.cebrene_map.addToTrainingPlaces(cebrene_speed_ring)
		assertSave Maps.cebrene_map
	}

	static def assertSave(def domain){
		assert domain.save() != null
	}
}
