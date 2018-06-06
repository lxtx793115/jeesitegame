package com.thinkgem.jeesite.modules.gameuser.web;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.modules.gameuser.entity.ValidateCode;
import com.thinkgem.jeesite.modules.gameuser.service.GameUserServiceCy;
import com.thinkgem.jeesite.modules.unit.SendMessage;
import com.thinkgem.jeesite.modules.unit.SmsPianYunUtil;
import com.thinkgem.jeesite.modules.unit.ValidateUtils;

/**
 * 注册
 * @author chenye
 *
 */
@Controller
@RequestMapping(value="/api/Registercontroller")
public class Registercontroller {
	@Autowired
	private GameUserServiceCy gameUserService;
	
	/** 
	 * 给手机号发送短信，的图片验证码 
	 * @return validatePhone
	 */  
	@RequestMapping("/photoCode")  
	public void photoCode(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		// 设置响应的类型格式为图片格式  
		response.setContentType("image/jpeg");  
		//禁止图像缓存。  
		response.setHeader("Pragma", "no-cache");  
		response.setHeader("Cache-Control", "no-cache");  
		response.setDateHeader("Expires", 0);  
		//生成验证码图片                                                                                            长              宽     高  干扰线条数
		ValidateCode vCode = new ValidateCode(120,40,4,80);  
		//验证码放入session中
		HttpSession session = request.getSession();  
		session.setAttribute("photo_code", vCode.getCode());  
		//设置验证码过期时间为5分钟
		session.setMaxInactiveInterval(5*60);
		vCode.write(response.getOutputStream());  
	}  
	@RequestMapping("sendMsg")
	@ResponseBody
	public Map<String,String> sendMsg(String phone,String photoCode,HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();  
		String sessionCode = (String) session.getAttribute("photo_code"); 
		Map<String,String> map=new HashMap();
		if(!ValidateUtils.isNull(photoCode)) {
			map.put("message", "验证码不能为空！");
			map.put("status", "fail");
			return map;
		}
		if(!ValidateUtils.isNull(phone)) {
			map.put("message", "手机号不能为空！");
			map.put("status", "fail");
			return map;
		}
		boolean b=ValidateUtils.isMobile(phone);
		if(!b) {
			map.put("message", "手机号格式输入错误，发送验证码失败!");
			map.put("status", "fail");
			return map;
		}
		if (photoCode.equalsIgnoreCase(sessionCode)) {  //忽略验证码大小写
			try {
				int code=(int)(Math.random()*8999)+1000;
				System.out.println(code);
				HttpSession session2 = request.getSession();  
				session2.setAttribute("regist_phone_code", code);  
				SendMessage.sendmessage(phone, code+"");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  else {
			map.put("message", "验证码错误，发送验证码失败!");
			map.put("status", "fail");
			return map;
		}
		map.put("message", "发送成功!");
		map.put("status", "success！");
		return map;
	}
	/** 
	 * 注册
	 * @return 
	 */  
	@RequestMapping("/registUser")
	@ResponseBody
	public Map<String,String> regist(
			String username,
			String password,
			String phone,
			String phoneCode,
			String code,
			String qq,
			String introducer,
			HttpSession session) throws Exception {
		Map<String,String> map = new HashMap();
		map = gameUserService.validate_register(username, password, phone, phoneCode,qq,introducer, session);
		return map;
	}
	public static void main(String[] arg) {
		try {
			SmsPianYunUtil.sendmessage("15001110000","123456");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (URISyntaxException e2) {
			e2.printStackTrace();
		}
	}
}
