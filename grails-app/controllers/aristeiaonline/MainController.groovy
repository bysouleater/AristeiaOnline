package aristeiaonline

import com.ao.character.Warrior;

import grails.converters.JSON;
import groovyx.net.http.RESTClient;

class MainController {
	
	static final String FB_APP_URL = "http://apps.facebook.com/aristeia_online/"
	static final String FB_APP_ADD_URL = "http://www.facebook.com/add.php?api_key="
	static final String FB_API_KEY = "41f82a404dc9b0bbb4579a993c51ae4d"
	static final String FB_SECRET_KEY = "c5b463359f752c1070dcd15db30cdcf9"
	static final String FB_APP_ID = "141786259185672"
	
	
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
			def url_params = parse_signed_request(params.signed_request)
			if(!url_params.user_id){
				redirect(uri:"https://graph.facebook.com/oauth/authorize?client_id=${FB_APP_ID}&redirect_uri=http://apps.facebook.com/aristeia_online/")
			}
			session.fb_user_id = url_params.user_id
			session.fb_access_token = url_params.oauth_token
		}
		return [warriorlist:Warrior.findAllByOwner_id(session.fb_user_id)]		
	}
}