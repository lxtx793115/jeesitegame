package com.thinkgem.jeesite.modules.websocketWithMyHandle;  
  
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.modules.gameuser.dao.GameUserDaoCy;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.websocket.WebSocket;  
  
  
@Controller  
@RequestMapping("websocketWithHandle")  
public class WebsocketController {
	@Autowired
	GameUserDaoCy GameUserDao;
    @RequestMapping("login")  
    public void login(String username,HttpServletRequest request,HttpServletResponse response) throws Exception{  
        HttpSession session=request.getSession(); 
        GameUser gameUser=GameUserDao.getGameUserByUserName(username);
        session.setAttribute("username", username);
        session.setAttribute("GAMEUSER", gameUser); 
        WebSocket.setHttpSession(session);  
        request.getRequestDispatcher("/websocket.jsp").forward(request, response);  
    }  
    @RequestMapping("loginOut")  
    public void loginOut(HttpServletRequest request,HttpServletResponse response) throws Exception{  
        HttpSession session=request.getSession();  
        session.removeAttribute("username");  
        request.getRequestDispatcher("/websocket.jsp").forward(request, response);  
    }  
}  
