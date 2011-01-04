package com.ao.environments.prod

class ProductionEnvironment {
	
	static def init = {
		Jobs.init()
		Maps.init()
		Cities.init()
		Items.init()
		Stores.init()
		Monsters.init()
		TrainingPlaces.init()
	}

}
