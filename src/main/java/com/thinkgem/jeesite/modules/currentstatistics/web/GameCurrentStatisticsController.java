/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.currentstatistics.web;

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
import com.thinkgem.jeesite.modules.currentstatistics.entity.GameCurrentStatistics;
import com.thinkgem.jeesite.modules.currentstatistics.service.GameCurrentStatisticsService;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameroom.service.GameRoomService;
import com.thinkgem.jeesite.modules.gameuserbet.entity.GameuserBet;

/**
 * 当期统计Controller
 * @author ss
 * @version 2018-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/currentstatistics/gameCurrentStatistics")
public class GameCurrentStatisticsController extends BaseController {

	@Autowired
	private GameCurrentStatisticsService gameCurrentStatisticsService;
	
	@Autowired
	private GameRoomService gameRoomService;
	
	@ModelAttribute
	public GameCurrentStatistics get(@RequestParam(required=false) String id) {
		GameCurrentStatistics entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameCurrentStatisticsService.get(id);
		}
		if (entity == null){
			entity = new GameCurrentStatistics();
		}
		return entity;
	}
	
	@RequiresPermissions("currentstatistics:gameCurrentStatistics:view")
	@RequestMapping(value = {"listRoom"})
	public String listRoom(GameCurrentStatistics gameCurrentStatistics,@RequestParam("roomnum") String roomnum,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		/*Page<GameCurrentStatistics> page = gameCurrentStatisticsService.findPage(new Page<GameCurrentStatistics>(request, response), gameCurrentStatistics); */
		List<GameuserBet> gameuserBets=new ArrayList<GameuserBet>();
		List<GameRoom> gameRooms=null;
		GameRoom gameRoom=new GameRoom();
		gameRooms=gameRoomService.findList(gameRoom);
		if (gameRooms!=null&&gameRooms.size()>0) {
			model.addAttribute("gameRooms", gameRooms);
		}else {
			gameRooms=new ArrayList<GameRoom>();
			model.addAttribute("gameRooms", gameRooms);
		}
		model.addAttribute("roomhao", roomnum);
		model.addAttribute("gameuserBets", gameuserBets);
		/*model.addAttribute("page", page);*/
		return "modules/currentstatistics/gameCurrentStatisticsList";
	}
	
	@RequiresPermissions("currentstatistics:gameCurrentStatistics:view")
	@RequestMapping(value = {"listII", ""})
	public String listII(GameCurrentStatistics gameCurrentStatistics, HttpServletRequest request, HttpServletResponse response, Model model) {
		/*Page<GameCurrentStatistics> page = gameCurrentStatisticsService.findPage(new Page<GameCurrentStatistics>(request, response), gameCurrentStatistics); */
		List<GameuserBet> gameuserBets=new ArrayList<GameuserBet>();
		List<GameRoom> gameRooms=null;
		GameRoom gameRoom=new GameRoom();
		gameRooms=gameRoomService.findList(gameRoom);
		if (gameRooms!=null&&gameRooms.size()>0) {
			model.addAttribute("gameRooms", gameRooms);

			model.addAttribute("roomhao", gameRooms.get(0).getRoomnumber());
		}else {
			gameRooms=new ArrayList<GameRoom>();
			model.addAttribute("gameRooms", gameRooms);
		}
		model.addAttribute("gameuserBets", gameuserBets);
		/*model.addAttribute("page", page);*/
		return "modules/currentstatistics/gameCurrentStatisticsList";
	}
	
	@RequiresPermissions("currentstatistics:gameCurrentStatistics:view")
	@RequestMapping(value = {"list"})
	public String list(GameCurrentStatistics gameCurrentStatistics, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameCurrentStatistics> page = gameCurrentStatisticsService.findPage(new Page<GameCurrentStatistics>(request, response), gameCurrentStatistics); 
		List<GameRoom> gameRooms=null;
		GameRoom gameRoom=new GameRoom();
	/*	gameRooms=gameRoomService.findList(gameRoom);
		if (gameRooms!=null&&gameRooms.size()>0) {
			model.addAttribute("gameRooms", gameRooms);
		}else {
			gameRooms=new ArrayList<GameRoom>();
			model.addAttribute("gameRooms", gameRooms);
		}*/
		model.addAttribute("page", page);
		return "modules/currentstatistics/gameCurrentStatisticsList";
	}

	@RequiresPermissions("currentstatistics:gameCurrentStatistics:view")
	@RequestMapping(value = "form")
	public String form(GameCurrentStatistics gameCurrentStatistics, Model model) {
		model.addAttribute("gameCurrentStatistics", gameCurrentStatistics);
		return "modules/currentstatistics/gameCurrentStatisticsForm";
	}

	@RequiresPermissions("currentstatistics:gameCurrentStatistics:edit")
	@RequestMapping(value = "save")
	public String save(GameCurrentStatistics gameCurrentStatistics, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameCurrentStatistics)){
			return form(gameCurrentStatistics, model);
		}
		gameCurrentStatisticsService.save(gameCurrentStatistics);
		addMessage(redirectAttributes, "保存当期统计成功");
		return "redirect:"+Global.getAdminPath()+"/currentstatistics/gameCurrentStatistics/?repage";
	}
	
	@RequiresPermissions("currentstatistics:gameCurrentStatistics:edit")
	@RequestMapping(value = "delete")
	public String delete(GameCurrentStatistics gameCurrentStatistics, RedirectAttributes redirectAttributes) {
		gameCurrentStatisticsService.delete(gameCurrentStatistics);
		addMessage(redirectAttributes, "删除当期统计成功");
		return "redirect:"+Global.getAdminPath()+"/currentstatistics/gameCurrentStatistics/?repage";
	}

}