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
	
	
	static final Long NEWBIE = 1
		
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
				[cities:City.list()]
			}	
		}
	}

	def save = {
		FacebookRestClient facebook = getAuthenticatedFacebookClient(request, response)
			if(facebook){
				if(getFacebookInfo(request, facebook)){
					def city = City.get(params.origin as Long)
					def job = Job.get(NEWBIE);
					def warrior = new Warrior(name:params.name, gender:params.gender,
						job:job,origin:city, owner_id: request.getAttribute("uid") as Long)
					warrior.initWarrior()
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
		warrior.levelUp()
		redirect(controller:"warrior",action:"game",id:params.id)
	}
	
	def updateStat = {
		def warrior = Warrior.get(params.id)
		warrior.updateStat(params.stat)
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
