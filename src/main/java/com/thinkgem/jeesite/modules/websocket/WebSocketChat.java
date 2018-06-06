package com.thinkgem.jeesite.modules.websocket;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;  
import java.util.Map;  
import java.util.Map.Entry;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;  
import javax.websocket.OnClose;  
import javax.websocket.OnError;  
import javax.websocket.OnMessage;  
import javax.websocket.OnOpen;  
import javax.websocket.Session;  
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;


import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;  
  
/** 
 * @ServerEndpoint 
 */  
@ServerEndpoint("/websocket3")  
public class WebSocketChat{  
	Logger logger = LoggerFactory.getLogger(WebSocket.class);
    private static int onlineCount = 0;  
    private static int guessCount = 0; //游客统计 
    //存放所有登录用户的Map集合，键：每个用户的唯一标识（用户名）  
    private static Map<String,WebSocketChat> webSocketMap=new HashMap<String,WebSocketChat>();;  
    private static CopyOnWriteArraySet<WebSocketChat> webSocketSet = new CopyOnWriteArraySet<WebSocketChat>();
    //session作为用户简历连接的唯一会话，可以用来区别每个用户  
    private Session session;  
    //httpsession用以在建立连接的时候获取登录用户的唯一标识（登录名）,获取到之后以键值对的方式存在Map对象里面  
    private static HttpSession httpSession;  
      
    public static void setHttpSession(HttpSession httpSession){  
    	WebSocketChat.httpSession=httpSession;  
    }
    //当前发消息的人员编号
    //private String    phone = "";
    private GameUser  gameUser;
    
    /** 
     * 连接建立成功调用的方法 
     * @param session 
     * 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据 
     */  
    @OnOpen  
    public void onOpen(Session session) {  
    	logger.info("开启websocket");
    	String phone=null;
        this.session = session;  
        if(httpSession!=null){
        	gameUser= (GameUser) httpSession.getAttribute("GAMEUSER");
        }
        if(gameUser!=null){
        	phone = gameUser.getPhone();//接收到发送消息的人员编号
            webSocketMap.put(phone, this);
            addOnlineCount();
        }else{
        	addGuessCount();
        	webSocketMap.put("guess"+guessCount, this);
        }
        /*else{
        	WebApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
    		ac.getServletContext();
    		GameUserServiceCy gameUserDaoCy=(GameUserServiceCy)ac.getBean("gameUserServiceCy");
    		List<GameUser> list=gameUserDaoCy.getAllUser(null);
    		for(GameUser user:list){
    			String phone = user.getPhone();//接收到发送消息的人员编号
                webSocketMap.put(phone, this);
                //addOnlineCount();
    		}
        }*/
        logger.info(phone+"上线，当前在线数量"+getOnlineCount());  
    }  
    /** 
     * 向所有在线用户发送在线人数 
     * @param message 
     */  
    public void sendOnlineCount(String message){  
        for (Entry<String,WebSocketChat> entry  : webSocketMap.entrySet()) {  
            try {  
                entry.getValue().sendMessage(message);  
            } catch (IOException e) {  
                continue;  
            }  
        }  
    }  
      
    /** 
     * 连接关闭调用的方法 
     */  
    @OnClose  
    public void onClose() {  
        for (Entry<String,WebSocketChat> entry  : webSocketMap.entrySet()) {  
            if(entry.getValue().session==this.session){  
                webSocketMap.remove(entry.getKey()); 
                break;  
            }  
        }  
        //webSocketMap.remove(httpSession.getAttribute("username"));  
        subOnlineCount(); //   
        logger.info("在线用户个数"+getOnlineCount());  
    }  
  
    /** 
     * 服务器接收到客户端消息时调用的方法，（通过“@”截取接收用户的用户名） 
     *  
     * @param message 
     *            客户端发送过来的消息 
     * @param session 
     *            数据源客户端的session 
     */  
    @OnMessage  
    public void onMessage(String message, Session session) {  
    	JSONObject json=JSONObject.parseObject(message);
		String phone=json.getString("phone");
    	logger.info("用户名："+phone+"发消息，收到客户端的消息:" + message);
        Map<String,Object> map= new HashMap<String,Object>();
        map.put("onlineCount", onlineCount);
        map.put("senduser", phone);
        map.put("message", message);
        sendToSingleOrAllUser(message);
    }  
  
    /** 
     * 发生错误时调用 
     *  
     * @param session 
     * @param error 
     */  
    @OnError  
    public void onError(Session session, Throwable error) {  
        error.printStackTrace();  
    }  
  
    /** 
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。 
     *  
     * @param message 
     * @throws IOException 
     */  
    public void sendMessage(String message) throws IOException {  
        this.session.getBasicRemote().sendText(message);  
        // this.session.getAsyncRemote().sendText(message);  
    }  
  
    public static synchronized int getOnlineCount() {  
        return onlineCount;  
    }  
  
    public static synchronized void addOnlineCount() {  
    	WebSocketChat.onlineCount++;  
    }  
    //游客统计
    public static synchronized void addGuessCount() {  
    	WebSocketChat.guessCount++;  
    }  
  
    public static synchronized void subOnlineCount() {  
    	WebSocketChat.onlineCount--;  
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

    
    
    /**
     * 私聊或者群聊
     * @param message
     */
    private void sendToSingleOrAllUser(String message) {
    	if(message!=null&&!"".equals(message)){
    		JSONObject json=JSONObject.parseObject(message);
    		String phone=json.getString("phone");
    		String sendMessage=json.getString("message");
    		logger.info(phone);
    		logger.info(sendMessage);
    		Map<String,Object> map= new HashMap<String,Object>();
    		String nickname="",photourl="";
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
    		for (String key : webSocketMap.keySet()) {
	    		try {
	    			if(phone!=null&&!"".equals(phone)){
	    				if(!phone.equals(key)){
	    					webSocketMap.get(key).sendMessage(jsonmsg);
	    				}
	    			}else{
	    				webSocketMap.get(key).sendMessage(jsonmsg);
	    			}
	    		} catch (IOException e) {
	    			e.printStackTrace();
	    			logger.info(e.getMessage());
	    		}
	    	}
    	}
    }
    
   
    
 

}  
