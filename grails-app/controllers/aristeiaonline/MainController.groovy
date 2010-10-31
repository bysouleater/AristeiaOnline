package aristeiaonline

import com.ao.character.Warrior;

import grails.converters.JSON;
import groovyx.net.http.RESTClient;

class MainController {
	
	static final String FB_SECRET_KEY = "236efa3a85bf560f2cfc123a2debee30"
	static final String FB_APP_ID = "165864820091012"
	
	
	def parse_signed_request(String signed_request){
		def encoded_sig = signed_request.split("\\.")[0]
		def payload = signed_request.split("\\.")[1]
		
		def sig = base64_url_decode(encoded_sig)
		def data = JSON.parse(base64_url_decode(payload))
		
		if(data.algorithm.toUpperCase() != 'HMAC-SHA256')
			throw new Exception("Unknow algorithm. Expected HMAC-SHA256")
		
		//TODO: Verificar el encodeo
		//check sig
		/*def expected_sig = hash_hmac('sha256', payload, FB_SECRET_KEY, $raw = true)
		
		if(sig != expected_sig)
			throw new Exception("Bad signed JSON signature!")
			*/
		println data
		return data
	}
	
	def base64_url_decode(def input) {
		def data = input.replaceAll("-","+").replaceAll("_","/")
		def decodedBytes = data.decodeBase64()
		return new String(decodedBytes)
	}
	
	def index = {
		if(!session.fb_user_id){
			if(params.signed_request){
				def url_params = parse_signed_request(params.signed_request)
				if(!url_params.user_id){
					redirect(uri:"https://graph.facebook.com/oauth/authorize?client_id=${FB_APP_ID}&redirect_uri=http://apps.facebook.com/aristeia_onlinealpha/")
				}
				session.fb_user_id = url_params.user_id
				session.fb_access_token = url_params.oauth_token
			}else{
				redirect(action:sessionExpired)
			}
		}
		def warrior_list = []
		Warrior.findAllByOwner_id(session.fb_user_id).each{ w ->
			if(w.status == "A"){
				w.refreshSTA()
				w.refreshHP()
				w.save(flush:true)
				warrior_list.add(w)
			}else if(w.status == "B"){
				warrior_list.add(w)
			}
		}		
		return [warriorlist:warrior_list]		
	}
	
	def sessionExpired = {
		
	}
	
	def top100 = {
		def wlist = Warrior.withCriteria {
			maxResults(100)
			order("level", "desc")
		}
		return [warriors:wlist]
	}
}