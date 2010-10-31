package com.ao.character

import com.ao.items.Item 
import com.ao.items.Weapon 

class Equipment {
	
	Item head
	Item shoulder
	Item body
	Item shield
	Item foot
	Item accesory1
	Item accesory2
	Item weapon

    static constraints = {
		head(nullable:true)
		shoulder(nullable:true)
		body(nullable:true)
		shield(nullable:true)
		foot(nullable:true)
		accesory1(nullable:true)
		accesory2(nullable:true)
		weapon(nullable:true)
    }
	
	/**
	* Stat bonus redondeado del equip
	*/
	double equipStat(String stat){
		double value = 0
		if(head)
			value += head.type.stats."$stat"
		if(shoulder)
			value += shoulder.type.stats."$stat"
		if(body)
			value += body.type.stats."$stat"
		if(shield)
			value += shield.type.stats."$stat"
		if(foot)
			value += foot.type.stats."$stat"
		if(accesory1)
			value += accesory1.type.stats."$stat"
		if(accesory2)
			value += accesory2.type.stats."$stat"
		if(weapon)
			value += weapon.type.stats."$stat"
		
		return value
	}
}
