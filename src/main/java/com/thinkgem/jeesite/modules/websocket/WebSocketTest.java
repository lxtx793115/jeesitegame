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

import org.activiti.engine.impl.util.json.JSONObject;

import com.alibaba.druid.support.json.JSONUtils;
import com.google.gson.Gson;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;  
//import com.google.gson.Gson;
  
/** 
 * @ServerEndpoint 
 */  
@ServerEndpoint("/websockettest")  
public class WebSocketTest {  
    private static int onlineCount = 0;  
    //存放所有登录用户的Map集合，键：每个用户的唯一标识（用户名）  
    private static Map<String,WebSocketTest> webSocketMap = new HashMap<String,WebSocketTest>();  
    private static CopyOnWriteArraySet<WebSocketTest> webSocketSet = new CopyOnWriteArraySet<WebSocketTest>();
    //session作为用户简历连接的唯一会话，可以用来区别每个用户  
    private Session session;  
    //httpsession用以在建立连接的时候获取登录用户的唯一标识（登录名）,获取到之后以键值对的方式存在Map对象里面  
    private static HttpSession httpSession;  
      
    public static void setHttpSession(HttpSession httpSession){  
        WebSocketTest.httpSession=httpSession;  
    }
    //当前发消息的人员编号
    private String username = "";
    private GameUser  gameUser;
    
    /** 
     * 连接建立成功调用的方法 
     * @param session 
     * 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据 
     */  
    @OnOpen  
    public void onOpen(Session session) {  
        
        this.session = session;  
        gameUser= (GameUser) httpSession.getAttribute("GAMEUSER");
        username = gameUser.getNo();//接收到发送消息的人员编号
        webSocketMap.put(username, this);  
        addOnlineCount(); //   
       // MessageDto md=new MessageDto();  
       // md.setMessageType("onlineCount");  
      //  md.setData(onlineCount+"");  
     //   sendOnlineCount(gson.toJson(md));  
        System.out.println(username+"上线，当前在线数量"+getOnlineCount());  
    }  
   
    public void onOpen1(Session session){
        this.session = session;
        webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1
        System.out.println(username+"加入，有新连接加入！当前在线人数为" + getOnlineCount());
    }
    /** 
     * 向所有在线用户发送在线人数 
     * @param message 
     */  
    public void sendOnlineCount(String message){  
        for (Entry<String,WebSocketTest> entry  : webSocketMap.entrySet()) {  
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
        for (Entry<String,WebSocketTest> entry  : webSocketMap.entrySet()) {  
            if(entry.getValue().session==this.session){  
                webSocketMap.remove(entry.getKey());  
                break;  
            }  
        }  
        //webSocketMap.remove(httpSession.getAttribute("username"));  
        subOnlineCount(); //   
        System.out.println("在线用户个数"+getOnlineCount());  
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
        //Gson gson=new Gson();  
    	//String sendMessage = message.split("[|]")[0];
        System.out.println("用户名："+username+"发消息，收到客户端的消息:" + message);  
        //给同一房间的人发消息
        Gson gson=new Gson();  
        Map<String,Object> map= new HashMap<String,Object>();
        map.put("onlineCount", onlineCount);
        map.put("sendusername", username);
        map.put("message", username);
        String jsonmsg=gson.toJson(map);
        sendRoommates(message);
        //群发消息
        if (1 > 2) {
            //sendAll(message);
        } else {
            //给指定的人发消息
            //sendToUser(message);
        }
//        StringBuffer messageStr=new StringBuffer(message);  
//        if(messageStr.indexOf("@")!=-1){  
//           // String targetname=messageStr.substring(0, messageStr.indexOf("@"));  
//            //String sourcename="";  
//            String targetname = message.split("@")[1];
//            String sourcename = message.split("@")[0];
//            
//            
//            for (Entry<String,WebSocketTest> entry  : webSocketMap.entrySet()) {  
//                //根据接收用户名遍历出接收对象  
//                if(targetname.equals(entry.getKey())){  
//                    try {  
//                        for (Entry<String,WebSocketTest> entry1  : webSocketMap.entrySet()) {  
//                            //session在这里作为客户端向服务器发送信息的会话，用来遍历出信息来源  
//                            if(entry1.getValue().session==session){  
//                                sourcename=entry1.getKey();  
//                                webSocketMap.get(targetname).sendMessage(getNowTime() + "用户" + 1 + "发来消息：" + " <br/> " + targetname);
//                            }  
//                        }  
//                        webSocketMap.get(targetname).sendMessage(getNowTime() + "用户" + 1 + "发来消息：" + " <br/> " + targetname);
//
//                       // MessageDto md=new MessageDto();  
//                       // md.setMessageType("message");  
//                       //md.setData(sourcename+":"+message.substring(messageStr.indexOf("@")+1));  
//                       // entry.getValue().sendMessage(gson.toJson(md));  
//                    } catch (Exception e) {  
//                        e.printStackTrace();  
//                        continue;  
//                    }  
//                }  
//                  
//            }  
//        }  
          
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
        WebSocketTest.onlineCount++;  
    }  
  
    public static synchronized void subOnlineCount() {  
        WebSocketTest.onlineCount--;  
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
     * 给所有人发消息
     * @param message
     */
    private void sendAll(String message) {
        String now = getNowTime();
        String sendMessage = message.split("[|]")[0];
        //遍历HashMap
        for (String key : webSocketMap.keySet()) {
            try {
                //判断接收用户是否是当前发消息的用户
                if (!username.equals(key)) {
                	webSocketMap.get(key).sendMessage(now + "用户" + username + "发来消息：" + " <br/> " + sendMessage);
                    System.out.println("key = " + key);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    /**
     * 给同一房间的人发消息.
     * @param message
     */
    private void sendRoommates(String message) {
    	String now = getNowTime();
    	//String sendMessage = message.split("[|]")[0];
    	//遍历HashMap
    	for (String key : webSocketMap.keySet()) {
    		try {
    			//判断接收用户是否是当前发消息的用户
    			if (!gameUser.getRoomNo().equals(key)) {
    				Map map= new HashMap();
    				map.put("username", username);
    				map.put("message", message);
    				 //JSONObject jsonObject = JSONObject..
    				String json = JSONUtils.toJSONString(map);
    				webSocketMap.get(key).sendMessage(json);
    				
    				//webSocketMap.get(key).sendMessage(now +"房间号："+gameUser.getRoomNo()+ "用户" + username + "发来消息：" + " <br/> " + message);
    				System.out.println("key = " + key);
    			}
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
    /**
     * 给指定的人发送消息
     * @param message
     */
    //@OnMessage
    public void sendToUser(String message) {
        String sendMessage  = message.split("@")[1];
        String  sendUserno= message.split("@")[0];
        String now = getNowTime();
        try {
            if (webSocketMap.get(sendUserno) != null) {
				Map map= new HashMap();
				map.put("username", username);
				map.put("message", message);
				//JSONObject jsonObject = JSONObject..
				String json = JSONUtils.toJSONString(map);
				webSocketMap.get(sendUserno).sendMessage(json);
            	//webSocketMap.get(sendUserno).sendMessage(now + "用户" + username + "发来消息：" + " <br/> " + sendMessage);
            } else {
                System.out.println("当前用户不在线");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}  
