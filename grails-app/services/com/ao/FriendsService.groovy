package com.ao

import groovyx.net.http.RESTClient;

class FriendsService {

    def getFriends(def access_token) {
		return []
		def client = new RESTClient("https://graph.facebook.com")
		try{
			def resp = client.get(path: '/me/friends', query: [access_token:access_token])
			return resp.data.data.collect{it.id as Long}
		}catch(e){
			e.printStackTrace()
			return null
		}
    }
}