/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.game_bets.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.formula.functions.T;
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
import com.thinkgem.jeesite.modules.game_bets.entity.GameBets;
import com.thinkgem.jeesite.modules.game_bets.service.GameBetsService;
import com.thinkgem.jeesite.modules.gameodds.entity.GameOdds;
import com.thinkgem.jeesite.modules.gameodds.service.GameOddsService;
import com.thinkgem.jeesite.modules.gameroom.service.GameRoomService;

/**
 * 游戏下注Controller
 * @author cy
 * @version 2018-05-03
 */
@Controller
@RequestMapping(value = "${adminPath}/game_bets/gameBets")
public class GameBetsController extends BaseController {

	@Autowired
	private GameBetsService gameBetsService;
	
	@ModelAttribute
	public GameBets get(@RequestParam(required=false) String id) {
		GameBets entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameBetsService.get(id);
		}
		if (entity == null){
			entity = new GameBets();
		}
		return entity;
	}
	
	@RequiresPermissions("game_bets:gameBets:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameBets gameBets, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameBets> page = gameBetsService.findPage(new Page<GameBets>(request, response), gameBets); 
		model.addAttribute("page", page);
		return "modules/game_bets/gameBetsList";
	}

	@RequiresPermissions("game_bets:gameBets:view")
	@RequestMapping(value = "form")
	public String form(GameBets gameBets, Model model) {
		model.addAttribute("gameBets", gameBets);
		return "modules/game_bets/gameBetsForm";
	}

	@RequiresPermissions("game_bets:gameBets:edit")
	@RequestMapping(value = "save")
	public String save(GameBets gameBets, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameBets)){
			return form(gameBets, model);
		}
		gameBetsService.save(gameBets);
		addMessage(redirectAttributes, "保存游戏下注成功");
		return "redirect:"+Global.getAdminPath()+"/game_bets/gameBets/?repage";
	}
	
	@RequiresPermissions("game_bets:gameBets:edit")
	@RequestMapping(value = "delete")
	public String delete(GameBets gameBets, RedirectAttributes redirectAttributes) {
		gameBetsService.delete(gameBets);
		addMessage(redirectAttributes, "删除游戏下注成功");
		return "redirect:"+Global.getAdminPath()+"/game_bets/gameBets/?repage";
	}
	
	
	@Autowired
	private GameOddsService gameOddsService;
	
	@RequestMapping(value = "calc")
	public void calc(GameBets gameBets,String roomId) {
		 List<GameBets> list =  (List<GameBets>) gameBetsService.findList(gameBets);
		 GameOdds gameOdds =   gameOddsService.getByRoomId(roomId);
		//gameBetsService
		for(GameBets o:list) {
//			if(o.getDa()!=null) {
//				
//			}
			
		}
	}
}