/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameodds.web;

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
import com.thinkgem.jeesite.modules.gameodds.entity.GameOdds;
import com.thinkgem.jeesite.modules.gameodds.service.GameOddsService;

/**
 * 游戏赔率Controller
 * @author cy
 * @version 2018-04-19
 */
@Controller
@RequestMapping(value = "${adminPath}/gameodds/gameOdds")
public class GameOddsController extends BaseController {

	@Autowired
	private GameOddsService gameOddsService;
	
	@ModelAttribute
	public GameOdds get(@RequestParam(required=false) String id) {
		GameOdds entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameOddsService.get(id);
		}
		if (entity == null){
			entity = new GameOdds();
		}
		return entity;
	}
	
	@RequiresPermissions("gameodds:gameOdds:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameOdds gameOdds, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameOdds> page = gameOddsService.findPage(new Page<GameOdds>(request, response), gameOdds); 
		model.addAttribute("page", page);
		return "modules/gameodds/gameOddsList";
	}

	@RequiresPermissions("gameodds:gameOdds:view")
	@RequestMapping(value = "form")
	public String form(GameOdds gameOdds, Model model) {
		model.addAttribute("gameOdds", gameOdds);
		return "modules/gameodds/gameOddsForm";
	}
	@RequestMapping(value = "roomOdd")
	public String roomOdd(GameOdds gameOdds, Model model) {
		model.addAttribute("gameOdds", gameOdds);
		return "modules/gameodds/gameOddsForm2";
	}

	//@RequiresPermissions("gameodds:gameOdds:edit")
	@RequestMapping(value = "save")
	public String save(GameOdds gameOdds, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameOdds)){
			return form(gameOdds, model);
		}
		gameOddsService.save(gameOdds);
		addMessage(redirectAttributes, "保存游戏描述成功");
		return "redirect:"+Global.getAdminPath()+"/gameodds/gameOdds/?repage";
	}
	
	@RequiresPermissions("gameodds:gameOdds:edit")
	@RequestMapping(value = "delete")
	public String delete(GameOdds gameOdds, RedirectAttributes redirectAttributes) {
		gameOddsService.delete(gameOdds);
		addMessage(redirectAttributes, "删除游戏描述成功");
		return "redirect:"+Global.getAdminPath()+"/gameodds/gameOdds/?repage";
	}

}