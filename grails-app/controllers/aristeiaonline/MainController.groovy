package aristeiaonline

import com.ao.character.Warrior
import grails.converters.JSON;
import groovyx.net.http.RESTClient;

class MainController {
	
	static final String FB_SECRET_KEY = "236efa3a85bf560f2cfc123a2debee30"
	static final String FB_APP_ID = "165864820091012"
	
	def friendsService
	
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
	
	def auth = {
		// Redirect to allow app
	}
	
	def index = {
		if(params.signed_request){
			def url_params = parse_signed_request(params.signed_request)
			if(!url_params.user_id){
				redirect(action:auth)
			}
			session.fb_user_id = url_params.user_id
			session.fb_access_token = url_params.oauth_token
		}else{
			redirect(action:illegalAccess)
		}
		redirect(action:warriorList)
	}
	
	def illegalAccess = {
		// Param signed_request is null
	}
	
	def warriorList = {
		if(!session.fb_user_id)
			redirect(action:sessionExpired)
		
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
		
		def friends_id = friendsService.getFriends(session.fb_access_token)
		def criteria = Warrior.createCriteria()
		def friendWarriors = criteria {
			eq("status","A")
			'in'("owner_id",friends_id)
			order("level", "desc")
		}
		
		return [warriorlist:warrior_list, top10fwar:friendWarriors.size()>10?friendWarriors[0..9]:friendWarriors, totalfwar:friendWarriors.size()]		
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
	
	def inviteFriends = {
		def friends_id = friendsService.getFriends(session.fb_access_token)
		def criteria = Warrior.createCriteria()
		def friendWarriors = criteria {
			eq("status","A")
			'in'("owner_id",friends_id)
			order("level", "desc")
		}
		[exclude_list:friendWarriors*.owner_id]
	}
	
	def invitationSent = {
		flash.message = "Thanks for inviting friends."
		redirect(action:warriorList)
	}
}