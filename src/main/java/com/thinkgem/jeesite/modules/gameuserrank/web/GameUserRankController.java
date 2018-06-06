/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.web;

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
import com.thinkgem.jeesite.modules.gameuserrank.entity.GameUserRank;
import com.thinkgem.jeesite.modules.gameuserrank.service.GameUserRankService;

/**
 * 用户级别Controller
 * @author dan
 * @version 2018-05-04
 */
@Controller
@RequestMapping(value = "${adminPath}/gameuserrank/gameUserRank")
public class GameUserRankController extends BaseController {

	@Autowired
	private GameUserRankService gameUserRankService;
	
	@ModelAttribute
	public GameUserRank get(@RequestParam(required=false) String id) {
		GameUserRank entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameUserRankService.get(id);
		}
		if (entity == null){
			entity = new GameUserRank();
		}
		return entity;
	}
	
	@RequiresPermissions("gameuserrank:gameUserRank:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameUserRank gameUserRank, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameUserRank> page = gameUserRankService.findPage(new Page<GameUserRank>(request, response), gameUserRank); 
		model.addAttribute("page", page);
		return "modules/gameuserrank/gameUserRankList";
	}

	@RequiresPermissions("gameuserrank:gameUserRank:view")
	@RequestMapping(value = "form")
	public String form(GameUserRank gameUserRank, Model model) {
		model.addAttribute("gameUserRank", gameUserRank);
		return "modules/gameuserrank/gameUserRankForm";
	}

	@RequiresPermissions("gameuserrank:gameUserRank:edit")
	@RequestMapping(value = "save")
	public String save(GameUserRank gameUserRank, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameUserRank)){
			return form(gameUserRank, model);
		}
		GameUserRank gameUserRank2=new GameUserRank();
		GameUserRank gameUserRank3=new GameUserRank();
		String leString=gameUserRank.getLevelno();
		String lee="";
		Double min=0.00;
		Double maxInteger=0.00;
		Double minII=0.00;
		Double maxIntegerII=0.00;
		if (leString.equals("1")) {
			min=Double.parseDouble(gameUserRank.getMinAvail());
			maxInteger=Double.parseDouble(gameUserRank.getMaxAvail());
			Integer leInteger=Integer.parseInt(leString);
			leInteger=leInteger+1;
			lee=leInteger+"";
			if (maxInteger<=min) {
				addMessage(model, "最大可用余额必须大于最小可用余额");
				return "modules/gameuserrank/gameUserRankForm";
			}
			gameUserRank2.setLevelno(lee);
			List<GameUserRank> gameUserRanks=gameUserRankService.findList(gameUserRank2);
			gameUserRank3=gameUserRanks.get(0);
			minII=Double.parseDouble(gameUserRank3.getMinAvail());
			maxIntegerII=Double.parseDouble(gameUserRank3.getMaxAvail());
			if (maxInteger>=minII) {
				addMessage(model, "最大可用余额必须小于"+gameUserRank3.getUserLevel()+"的最小可用余额");
				return "modules/gameuserrank/gameUserRankForm";
			}
		}else {
			Integer leInteger=Integer.parseInt(leString);
			leInteger=leInteger-1;
			lee=leInteger+"";
			gameUserRank2.setLevelno(lee);
			List<GameUserRank> gameUserRanks=gameUserRankService.findList(gameUserRank2);
			gameUserRank3=gameUserRanks.get(0);
			min=Double.parseDouble(gameUserRank.getMinAvail());
			maxInteger=Double.parseDouble(gameUserRank.getMaxAvail());
			minII=Double.parseDouble(gameUserRank3.getMinAvail());
			maxIntegerII=Double.parseDouble(gameUserRank3.getMaxAvail());
			if (maxInteger<=min) {
				addMessage(model, "最大可用余额必须大于最小可用余额");
				return "modules/gameuserrank/gameUserRankForm";
			}
			if (min<=maxIntegerII) {
				addMessage(model, "最小可用余额必须大于"+gameUserRank3.getUserLevel()+"的最大可用余额");
				return "modules/gameuserrank/gameUserRankForm";
			}
			
		}
		gameUserRankService.save(gameUserRank);
		addMessage(redirectAttributes, "保存用户级别成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserrank/gameUserRank/?repage";
	}
	
	@RequiresPermissions("gameuserrank:gameUserRank:edit")
	@RequestMapping(value = "delete")
	public String delete(GameUserRank gameUserRank, RedirectAttributes redirectAttributes) {
		gameUserRankService.delete(gameUserRank);
		addMessage(redirectAttributes, "删除用户级别成功");
		return "redirect:"+Global.getAdminPath()+"/gameuserrank/gameUserRank/?repage";
	}

}