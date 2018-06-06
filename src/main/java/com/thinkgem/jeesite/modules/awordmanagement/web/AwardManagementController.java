/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awordmanagement.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.awordmanagement.entity.AwardManagement;
import com.thinkgem.jeesite.modules.awordmanagement.service.AwardManagementService;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameroom.service.GameRoomService;

/**
 * 开奖管理Controller
 * @author ww
 * @version 2018-05-27
 */
@Controller
@RequestMapping(value = "${adminPath}/awordmanagement/awardManagement")
public class AwardManagementController extends BaseController {
	@Autowired
	private GameRoomService gameRoomService;
	
	@Autowired
	private AwardManagementService awardManagementService;
	
	@ModelAttribute
	public AwardManagement get(@RequestParam(required=false) String id) {
		AwardManagement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = awardManagementService.get(id);
		}
		if (entity == null){
			entity = new AwardManagement();
		}
		return entity;
	}
	
	@RequiresPermissions("awordmanagement:awardManagement:view")
	@RequestMapping(value = {"listII"})
	public String listII(AwardManagement awardManagement,@RequestParam("roomnum") String roomnum,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AwardManagement> page = awardManagementService.findPage(new Page<AwardManagement>(request, response), awardManagement); 
		List<GameRoom> gameRooms=null;
		GameRoom gameRoom=new GameRoom();
		gameRooms=gameRoomService.findList(gameRoom);
		if (gameRooms!=null&&gameRooms.size()>0) {
			model.addAttribute("gameRooms", gameRooms);
		}else {
			gameRooms=new ArrayList<GameRoom>();
			model.addAttribute("gameRooms", gameRooms);
		}
		if (roomnum!=null&&!"".equals(roomnum)) {

			model.addAttribute("roomhao", roomnum);
		}else {
			if (gameRooms!=null&&gameRooms.size()>0) {

				model.addAttribute("roomhao", gameRooms.get(0).getRoomnumber());
			}
		}
		
		model.addAttribute("page", page);
		return "modules/awordmanagement/awardManagementList";
	}
	
	@RequiresPermissions("awordmanagement:awardManagement:view")
	@RequestMapping(value = {"list", ""})
	public String list(AwardManagement awardManagement,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AwardManagement> page = awardManagementService.findPage(new Page<AwardManagement>(request, response), awardManagement); 
		List<GameRoom> gameRooms=null;
		GameRoom gameRoom=new GameRoom();
		gameRooms=gameRoomService.findList(gameRoom);
		if (gameRooms!=null&&gameRooms.size()>0) {
			model.addAttribute("gameRooms", gameRooms);
		}else {
			gameRooms=new ArrayList<GameRoom>();
			model.addAttribute("gameRooms", gameRooms);
		}
		
			if (gameRooms!=null&&gameRooms.size()>0) {

				model.addAttribute("roomhao", gameRooms.get(0).getRoomnumber());
			}
		
		
		model.addAttribute("page", page);
		return "modules/awordmanagement/awardManagementList";
	}

	@RequiresPermissions("awordmanagement:awardManagement:view")
	@RequestMapping(value = "form")
	public String form(AwardManagement awardManagement, Model model) {
		model.addAttribute("awardManagement", awardManagement);
		return "modules/awordmanagement/awardManagementForm";
	}

	@RequiresPermissions("awordmanagement:awardManagement:edit")
	@RequestMapping(value = "save")
	public String save(AwardManagement awardManagement, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, awardManagement)){
			return form(awardManagement, model);
		}
		awardManagementService.save(awardManagement);
		addMessage(redirectAttributes, "保存开奖管理成功");
		return "redirect:"+Global.getAdminPath()+"/awordmanagement/awardManagement/?repage";
	}
	
	@RequiresPermissions("awordmanagement:awardManagement:edit")
	@RequestMapping(value = "delete")
	public String delete(AwardManagement awardManagement, RedirectAttributes redirectAttributes) {
		awardManagementService.delete(awardManagement);
		addMessage(redirectAttributes, "删除开奖管理成功");
		return "redirect:"+Global.getAdminPath()+"/awordmanagement/awardManagement/?repage";
	}

}