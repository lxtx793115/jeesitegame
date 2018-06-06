package com.thinkgem.jeesite.modules.websocket;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonElement;

public class Test {
	
	public static void main(String[] args){
		String message="{'phone':'12','message':'sdfs'}";
		JSONObject json=JSONObject.parseObject(message);
		String phone=json.getString("phone");
		String message2=json.getString("message");
		System.out.println(phone);
		System.out.println(message2);	
		
		Gson gson=new Gson();
		JsonElement str = gson.toJsonTree(message);
		String s = str.getAsString();
	}

}
