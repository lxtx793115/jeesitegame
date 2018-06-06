package com.thinkgem.jeesite.modules.websocketWithMyHandle;

import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.gameuser.service.GameUserServiceCy;
import com.thinkgem.jeesite.modules.websocket.WebSocket;
import com.thinkgem.jeesite.modules.websocket.WebSocketChat;

public class MyHandler extends TextWebSocketHandler implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private static final ArrayList<WebSocketSession> users;
	
	private static Map<String,WebSocketSession> webSocketMap = new HashMap<String,WebSocketSession>();  
	private static int onlineCount = 0;  
	private static int guessCount = 0; //游客统计 
	
	private static Session session;  
	private static HttpSession httpSession; 
	
	
	/** 日志 */
    private static Logger logger = LoggerFactory.getLogger(MyHandler.class);
	 
    static {
        users = new ArrayList<WebSocketSession>();
    }
    public static void setHttpSession(HttpSession httpSession){  
    	MyHandler.httpSession=httpSession;  
    }
	
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        super.handleTextMessage(session, message);  
        String strMessage=message.getPayload();
        String receiveMessage=message.getPayload();
        WebApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		GameUserServiceCy gameUserDaoCy=(GameUserServiceCy)ac.getBean("gameUserServiceCy");
    	if(receiveMessage!=null&&!"".equals(receiveMessage)){
    		JSONObject json=JSONObject.parseObject(receiveMessage);
    		String phone=json.getString("phone");
    		String sendMessage=json.getString("message");
    		logger.info(phone);
    		logger.info(sendMessage);
    		Map<String,Object> map= new HashMap<String,Object>();
    		String nickname="",photourl="";
    		GameUser gameUser=gameUserDaoCy.getUserByPhone(phone);
    		if(gameUser!=null){
    			nickname=gameUser.getUsername();
    			photourl=gameUser.getPhotourl();
    		}
    		Gson gson=new Gson();
		    map.put("onlineCount", onlineCount);
		    map.put("nickname",nickname );
		    map.put("message", sendMessage);
		    map.put("photourl", photourl);
		    map.put("sendTime", getNowTime());
		    String jsonmsg=gson.toJson(map);
		    TextMessage textMessage=new TextMessage(jsonmsg);
    		for (String key : webSocketMap.keySet()) {
	    		try {
	    			if(!phone.equals(key)){
	    				webSocketMap.get(key).sendMessage(textMessage);
	    			}
	    		} catch (IOException e) {
	    			e.printStackTrace();
	    			logger.info(e.getMessage());
	    		}
	    	}
    	}
        
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	logger.info("connect to the websocket success......");
        users.add(session);
        Map<String, Object>  attributes= session.getAttributes();
        for(String key:attributes.keySet()){ 
        	logger.info("key="+key+"and value=" +attributes.get(key));
        	if(isNumeric(key)||key.contains("guess")){
        		webSocketMap.put(key,session);
        	}
        }  
    }
    


    public static boolean isNumeric(String str){ 
    	  Pattern pattern = Pattern.compile("[0-9]*"); 
    	  return pattern.matcher(str).matches();  
    } 

    	
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if(session.isOpen()){
            session.close();
        }
        logger.info("websocket connection closed......");
        users.remove(session);
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
    	logger.info("websocket connection closed......");
        users.remove(session);
        for (Entry<String,WebSocketSession> entry  : webSocketMap.entrySet()) {  
            if(entry.getValue()==session){  
                webSocketMap.remove(entry.getKey()); 
                break;  
            }  
        }  
        subOnlineCount(); //   
        logger.info("在线用户个数"+getOnlineCount()); 
    }
    
    /**
     * 给所有在线用户发送消息
     *
     * @param message
     */
    public void sendMessageToUsers(TextMessage message) {
        for (WebSocketSession user : users) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
 
    /**
     * 发消息（无论是否在线）
     *
     * @param userCd
     * @param message
     */
    public void sendMessageToUser(String userCd, TextMessage message) {
        for (WebSocketSession user : users) {
            if (userCd.equals(user.getAttributes().get("WS_USER_CD"))) { // 应从session取CD对比
                try {
                    if (user.isOpen()) {
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }
    
    public static synchronized int getOnlineCount() {  
        return onlineCount;  
    }  
  
    public static synchronized void addOnlineCount() {  
    	MyHandler.onlineCount++;  
    }  
    //游客统计
    public static synchronized void addGuessCount() {  
    	MyHandler.guessCount++;  
    }  
  
    public static synchronized void subOnlineCount() {  
    	MyHandler.onlineCount--;  
    }  
    /**
     * 获取当前时间
     *
     * @return
     */
    private String getNowTime() {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(date);
        return time;
    }
}