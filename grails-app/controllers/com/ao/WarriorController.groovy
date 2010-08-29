package com.ao


import com.ao.Warrior
import com.ao.City
import com.facebook.api.*
import org.w3c.dom.Document

class WarriorController {
	
	static final String FB_APP_URL = "http://apps.facebook.com/aristeia_online/"
	static final String FB_APP_ADD_URL = "http://www.facebook.com/add.php?api_key="
	static final String FB_API_KEY = "41f82a404dc9b0bbb4579a993c51ae4d"
	static final String FB_SECRET_KEY = "c5b463359f752c1070dcd15db30cdcf9"
		
	def getAuthenticatedFacebookClient(def request, def response){
		Facebook fb = new Facebook(request, response,FB_API_KEY, FB_SECRET_KEY)
		String next = request.getServletPath().substring(1)
		
		if (fb.requireLogin(next))
			return null
		return fb.getFacebookRestClient()
	}

	def index = { }

	def create = {
		FacebookRestClient facebook = getAuthenticatedFacebookClient(request, response)
		if(facebook){
			if(getFacebookInfo(request, facebook)){
				[cities:City.list(), levels:Level.list()]
			}	
		}
	}

	def save = {
		FacebookRestClient facebook = getAuthenticatedFacebookClient(request, response)
			if(facebook){
				if(getFacebookInfo(request, facebook)){
					def city = City.get(params.origin as Long)
					def job = Job.get(1);
					StatsList stats = new StatsList()
					city.stats.all().each{key, val -> stats."$key" += val}
					job.stats.all().each{key, val -> stats."$key" += val}
					params.gender == "M"?stats.STR++:stats.AGI++
					stats."PAtk" = stats."STR"
					stats."PDef" = stats."CON"
					stats."Acc" = stats."DEX" / 5
					stats."Eva" = stats."AGI" / 5
					stats."ARate" = stats."AGI" / 5
					stats."CRate" = stats."DEX" / 5
					stats."Init" = stats."DEX" / 10
					stats."Luck" = stats."AGI" / 10
					
					stats."STAP" = stats."STR" / 100
					stats."HPP" = stats."CON" / 100
					stats.save()
					def warrior = new Warrior(name:params.name, gender:params.gender, 
							actualHP:job.stats.HP, actualSTA:job.stats.STA,
							job:job,origin:city,stats:stats, owner_id: request.getAttribute("uid") as Long)
					if(warrior.validate()){
						warrior.save()
					}
					redirect(controller:"main",action:"index")
				}	
			}
	}

	def game = {
		if(!params.id)
			redirect(controller:"main",action:"index")

		def warrior = Warrior.get(params.id)
		if(!warrior)
			redirect(controller:"main",action:"index")

		[warrior:warrior]
	}
	
	def levelup = {
		def warrior = Warrior.get(params.id)
		warrior.actualExp = warrior.nextLvlExp() + 1000
		warrior.statPoints += 2
		warrior.level++
		warrior.job.stats.all().each{key, val -> warrior.stats."$key" += val}
		warrior.save()
		redirect(controller:"warrior",action:"game",id:params.id)
	}
	
	def updateStat = {
		def warrior = Warrior.get(params.id)
		warrior.stats."$params.stat"++
		warrior.statPoints--
//		warrior.stats."PAtk" = warrior.stats."STR"
//		warrior.stats."PDef" = warrior.stats."CON"
//		warrior.stats."Acc" = warrior.stats."DEX" / 5
//		warrior.stats."Eva" = warrior.stats."AGI" / 5
//		warrior.stats."ARate" = warrior.stats."AGI" / 5
//		warrior.stats."CRate" = warrior.stats."DEX" / 5
//		warrior.stats."Init" = warrior.stats."DEX" / 10
//		warrior.stats."Luck" = warrior.stats."AGI" / 10
		warrior.stats."STAP" = (double)((double)(warrior.stats."STR") / 100)
		warrior.stats."HPP" = (double)((double)(warrior.stats."CON") / 100)
		
		println warrior.stats."PAtk"
		println warrior.stats."PDef"
		println warrior.stats."Acc"
		println warrior.stats."Eva"
		println warrior.stats."ARate"
		println warrior.stats."CRate"
		println warrior.stats."Init"
		println warrior.stats."Luck"
		println warrior.stats."STAP"
		println warrior.stats."HPP"
		warrior.save()
		redirect(controller:"warrior",action:"game",id:params.id)
	}

	/*
	 * This method obtains some basic Facebook profile
	 * information from the logged in user who is
	 * accessing our application in the current HTTP request.
	 */
	private boolean getFacebookInfo(def request, FacebookRestClient facebook){
		try {
			long userID = facebook.users_getLoggedInUser()
				Collection<Long> users = new ArrayList<Long>()
				users.add(userID)


				EnumSet<ProfileField> fields = EnumSet.of (
						com.facebook.api.ProfileField.NAME,
						com.facebook.api.ProfileField.PIC);

			Document d = facebook.users_getInfo(users, fields);
			String name =
				d.getElementsByTagName("name").item(0).getTextContent();
			String picture =
				d.getElementsByTagName("pic").item(0).getTextContent();

			request.setAttribute("uid", userID);
			request.setAttribute("profile_name", name);
			request.setAttribute("profile_picture_url", picture);
		} catch (FacebookException e) {

			//			HttpSession session = request.getSession();
			//			session.setAttribute("facebookSession", null);
			return false;
		} catch (IOException e) {

			e.printStackTrace();
			return false;
		}
		return true;
	}
}
