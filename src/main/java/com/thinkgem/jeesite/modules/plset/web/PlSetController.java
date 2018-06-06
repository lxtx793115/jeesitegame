/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plset.web;

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
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameroom.service.GameRoomService;
import com.thinkgem.jeesite.modules.plset.entity.PlSet;
import com.thinkgem.jeesite.modules.plset.service.PlSetService;

/**
 * 赔率设置Controller
 * @author ss
 * @version 2018-05-07
 */
@Controller
@RequestMapping(value = "${adminPath}/plset/plSet")
public class PlSetController extends BaseController {

	@Autowired
	private PlSetService plSetService;
	
	@Autowired
	private GameRoomService gameRoomService;
	
	@ModelAttribute
	public PlSet get(@RequestParam(required=false) String id) {
		PlSet entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = plSetService.get(id);
		}
		if (entity == null){
			entity = new PlSet();
		}
		return entity;
	}
	
	@RequiresPermissions("plset:plSet:view")
	@RequestMapping(value = {"list", ""})
	public String list(PlSet plSet, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PlSet> page = plSetService.findPage(new Page<PlSet>(request, response), plSet); 
		model.addAttribute("page", page);
		return "modules/plset/plSetList";
	}

	@RequiresPermissions("plset:plSet:view")
	@RequestMapping(value = "form")
	public String form(PlSet plSet, Model model) {
		List<PlSet> plSets=plSetService.findList(plSet);
		if (plSets!=null&&plSets.size()>0) {
			model.addAttribute("plSet", plSets.get(0));
		}else {

			model.addAttribute("plSet", plSet);
		}
		
		
		return "modules/plset/plSetForm";
	}

	@RequiresPermissions("plset:plSet:edit")
	@RequestMapping(value = "save")
	public String save(PlSet plSet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, plSet)){
			return form(plSet, model);
		}
		plSetService.save(plSet);
		addMessage(redirectAttributes, "保存赔率设置成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}
	
	@RequiresPermissions("plset:plSet:edit")
	@RequestMapping(value = "delete")
	public String delete(PlSet plSet, RedirectAttributes redirectAttributes) {
		plSetService.delete(plSet);
		addMessage(redirectAttributes, "删除赔率设置成功");
		return "redirect:"+Global.getAdminPath()+"/plset/plSet/?repage";
	}

}