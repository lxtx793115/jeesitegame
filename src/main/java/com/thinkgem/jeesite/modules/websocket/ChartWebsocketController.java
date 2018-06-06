package com.thinkgem.jeesite.modules.websocket;  
  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.modules.gameuser.dao.GameUserDaoCy;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;  
  
  
@Controller  
@RequestMapping("/api/chatWebsocket")  
public class ChartWebsocketController {
	
	@Autowired
	GameUserDaoCy GameUserDao;
	
	@RequestMapping("/startChat")  
	public void startChat(String phone,HttpServletRequest request,HttpServletResponse response) throws Exception{  
	        HttpSession session=request.getSession();  
	        session.setAttribute("phone", phone);  
	        GameUser gameUser=GameUserDao.getGameUserByUserName(phone);
	        session.setAttribute("GAMEUSER", gameUser); 
	        WebSocketChat.setHttpSession(session);  
	} 
    @RequestMapping("/login")  
    public void login(String username,HttpServletRequest request,HttpServletResponse response) throws Exception{  
        HttpSession session=request.getSession();  
        session.setAttribute("username", username);  
        GameUser gameUser=GameUserDao.getGameUserByUserName(username);
        session.setAttribute("GAMEUSER", gameUser); 
        WebSocketChat.setHttpSession(session);  
        request.getRequestDispatcher("/socketChart.jsp").forward(request, response);  
    }  
    @RequestMapping("/loginOut")  
    public void loginOut(HttpServletRequest request,HttpServletResponse response) throws Exception{  
        HttpSession session=request.getSession();  
        session.removeAttribute("username");  
        request.getRequestDispatcher("/socketChart.jsp").forward(request, response);  
    }  
}  
