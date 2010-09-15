package aristeiaonline

import com.ao.Warrior
import groovyx.net.http.RESTClient;

class MainController {
	
	static final String FB_APP_URL = "http://apps.facebook.com/aristeia_online/"
	static final String FB_APP_ADD_URL = "http://www.facebook.com/add.php?api_key="
	static final String FB_API_KEY = "41f82a404dc9b0bbb4579a993c51ae4d"
	static final String FB_SECRET_KEY = "c5b463359f752c1070dcd15db30cdcf9"
	static final String FB_APP_ID = "141786259185672"
	
	def ok = {
		def client = new RESTClient()
		def resp = client.get(uri:"https://graph.facebook.com/oauth/access_token?client_id=${FB_APP_ID}&redirect_uri=http://localhost:8080/main/ok&client_secret=${FB_SECRET_KEY}&code=${params.code.encodeAsURL()}")
		print resp
		
		render(view:"index",model:[warriorlist:Warrior.findAllByOwner_id(123L)])
	}
	
	def index = {
		
		redirect(uri:"https://graph.facebook.com/oauth/authorize?client_id=${FB_APP_ID}&redirect_uri=http://localhost:8080/main/ok")
		
		
		def cookie = request.getCookie("fbs_"+FB_APP_ID)
		if(cookie){
			def cookie_params = [:] 
			cookie.split("&").each{
				cookie_params[it.split("=")[0]] = it.split("=")[1] 
			}
			println cookie_params.uid
			
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