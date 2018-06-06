/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserbet.web;

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
import com.thinkgem.jeesite.modules.gameuserbet.entity.GameuserBet;
import com.thinkgem.jeesite.modules.gameuserbet.service.GameuserBetService;

/**
 * 用户投注记录Controller
 * @author ss
 * @version 2018-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/gameuserbet/gameuserBet")
public class GameuserBetController extends BaseController {

	@Autowired
	private GameuserBetService gameuserBetService;
	
	@ModelAttribute
	public GameuserBet get(@RequestParam(required=false) String id) {
		GameuserBet entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameuserBetService.get(id);
		}
		if (entity == null){
			entity = new GameuserBet();
		}
		return entity;
	}
	
	@RequiresPermissions("gameuserbet:gameuserBet:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameuserBet gameuserBet, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameuserBet> page = gameuserBetService.findPage(new Page<GameuserBet>(request, response), gameuserBet); 
		model.addAttribute("page", page);
		return "modules/gameuserbet/gameuserBetList";
	}

	@RequiresPermissions("gameuserbet:gameuserBet:view")
	@RequestMapping(value = "form")
	public String form(GameuserBet gameuserBet, Model model) {
		model.addAttribute("gameuserBet", gameuserBet);
		return "modules/gameuserbet/gameuserBetForm";
	}

	@RequiresPermissions("gameuserbet:gameuserBet:edit")
	@RequestMapping(value = "save")
	public String save(GameuserBet gameuserBet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameuserBet)){
			return form(gameuserBet, model);
		}
		gameuserBetService.save(gameuserBet);
		addMessage(redirectAttributes, "保存用户投注记录成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserbet/gameuserBet/?repage";
	}
	
	@RequiresPermissions("gameuserbet:gameuserBet:edit")
	@RequestMapping(value = "delete")
	public String delete(GameuserBet gameuserBet, RedirectAttributes redirectAttributes) {
		gameuserBetService.delete(gameuserBet);
		addMessage(redirectAttributes, "删除用户投注记录成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserbet/gameuserBet/?repage";
	}

}