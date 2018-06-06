/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.web;

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
import com.thinkgem.jeesite.modules.gameuserrank.entity.GameUserAccount;
import com.thinkgem.jeesite.modules.gameuserrank.service.GameUserAccountService;

/**
 * 用户银行Controller
 * @author dd
 * @version 2018-05-04
 */
@Controller
@RequestMapping(value = "${adminPath}/gameuserrank/gameUserAccount")
public class GameUserAccountController extends BaseController {

	@Autowired
	private GameUserAccountService gameUserAccountService;
	
	@ModelAttribute
	public GameUserAccount get(@RequestParam(required=false) String id) {
		GameUserAccount entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameUserAccountService.get(id);
		}
		if (entity == null){
			entity = new GameUserAccount();
		}
		return entity;
	}
	
	@RequiresPermissions("gameuserrank:gameUserAccount:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameUserAccount gameUserAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameUserAccount> page = gameUserAccountService.findPage(new Page<GameUserAccount>(request, response), gameUserAccount); 
		model.addAttribute("page", page);
		return "modules/gameuserrank/gameUserAccountList";
	}

	@RequiresPermissions("gameuserrank:gameUserAccount:view")
	@RequestMapping(value = "form")
	public String form(GameUserAccount gameUserAccount, Model model) {
		model.addAttribute("gameUserAccount", gameUserAccount);
		return "modules/gameuserrank/gameUserAccountForm";
	}

	@RequiresPermissions("gameuserrank:gameUserAccount:edit")
	@RequestMapping(value = "save")
	public String save(GameUserAccount gameUserAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameUserAccount)){
			return form(gameUserAccount, model);
		}
		gameUserAccountService.save(gameUserAccount);
		addMessage(redirectAttributes, "保存用户银行成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserrank/gameUserAccount/?repage";
	}
	
	@RequiresPermissions("gameuserrank:gameUserAccount:edit")
	@RequestMapping(value = "delete")
	public String delete(GameUserAccount gameUserAccount, RedirectAttributes redirectAttributes) {
		gameUserAccountService.delete(gameUserAccount);
		addMessage(redirectAttributes, "删除用户银行成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserrank/gameUserAccount/?repage";
	}

}