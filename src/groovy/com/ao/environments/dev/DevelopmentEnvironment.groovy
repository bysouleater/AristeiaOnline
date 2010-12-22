package com.ao.environments.dev

class DevelopmentEnvironment {
	
	static def init = {
		Jobs.init()
		Maps.init()
		Cities.init()
		Items.init()
	}

}
