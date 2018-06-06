package com.thinkgem.jeesite.modules.gameuser.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.modules.gameuser.service.GameUserServiceCy;

/**
 * 生成验证码
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/api/LoginController")
public class GameUserLoginController {
	
	@Autowired
	private GameUserServiceCy gameUserService;
	//放房间的map
	private static Map<String,Object> roomMap = new HashMap<String,Object>();
	
	@RequestMapping(value="login2",method = RequestMethod.POST) 
	@ResponseBody
    public Map<String,String> login2(String username,String password,String roomNo,HttpServletRequest request,HttpServletResponse response, HttpSession session){  
		Map<String,String> map = new HashMap();
		try {
        	map=gameUserService.getGameUserBynamepwd2(username,password,roomNo,session,roomMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;  
    }  
	@RequestMapping(value="login",method = RequestMethod.POST) 
	@ResponseBody
	public Map<String,String> login(String username,String password ,HttpServletRequest request,HttpServletResponse response, HttpSession session){  
		Map<String,String> map = new HashMap();
		try {
			map=gameUserService.getGameUserBynamepwd(username,password,session,roomMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;  
	}  
	@RequestMapping(value="login_test",method = RequestMethod.POST) 
	@ResponseBody
    public void login_test(String username,String password,String roomNo,HttpServletRequest request,HttpServletResponse response, HttpSession session){  
        try {
        	Map<String,String> map = new HashMap();
        	
        	map=gameUserService.getGameUserBynamepwd2(username,password,roomNo,session,roomMap);
        	
        	request.getRequestDispatcher("/socketChart_room.jsp").forward(request, response);  
		} catch (Exception e) {
			e.printStackTrace();
		}
    }  

}
