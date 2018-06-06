package com.thinkgem.jeesite.modules.gameuser.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.gameuser.service.RoomService;

/**
 * 房间
 * @author chenye
 *
 */
@Controller
@RequestMapping(value="${adminPath}/RoomController")
public class SystemController {
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping(value = {"list", ""})
	public String list(GameUser gameUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/systemSet/sysSet";
	}
	@RequestMapping(value = {"set", ""})
	public String form(GameUser gameUser, Model model) {
		model.addAttribute("gameUser", gameUser);
		return "modules/systemSet/sysSet";
	}
}
