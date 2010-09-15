package aristeiaonline

import com.ao.Warrior

class MainController {
	
	static final String FB_APP_URL = "http://apps.facebook.com/aristeia_online/"
	static final String FB_APP_ADD_URL = "http://www.facebook.com/add.php?api_key="
	static final String FB_API_KEY = "41f82a404dc9b0bbb4579a993c51ae4d"
	static final String FB_SECRET_KEY = "c5b463359f752c1070dcd15db30cdcf9"
	static final String FB_API_ID = "141786259185672"
	
	def ok = {
		
		render(view:"index",model:[warriorlist:Warrior.findAllByOwner_id(123L)])
	}
	
	def index = {
		def cookie = request.getCookie("fbs_"+FB_API_ID)
		if(cookie){
			def cookie_params = [:] 
			cookie.split("&").each{
				cookie_params[it.split("=")[0]] = it.split("=")[1] 
			}
			println cookie_params.uid
			redirect("https://graph.facebook.com/oauth/authorize?client_id=...&redirect_uri=http://localhost:8080/ok")
		}
			
//		FacebookRestClient facebook = getAuthenticatedFacebookClient(request, response)
//		if(facebook){
//			if(getFacebookInfo(request, facebook)){
//				[warriorlist:Warrior.findAllByOwner_id(request.getAttribute("uid") as Long)]
//			}
//		}
		
		[warriorlist:Warrior.findAllByOwner_id(123L)]
	}
}