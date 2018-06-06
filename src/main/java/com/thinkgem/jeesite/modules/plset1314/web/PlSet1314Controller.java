/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plset1314.web;

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
import com.thinkgem.jeesite.modules.plset1314.entity.PlSet1314;
import com.thinkgem.jeesite.modules.plset1314.service.PlSet1314Service;

/**
 * 13|14赔率Controller
 * @author ddd
 * @version 2018-05-08
 */
@Controller
@RequestMapping(value = "${adminPath}/plset1314/plSet1314")
public class PlSet1314Controller extends BaseController {

	@Autowired
	private PlSet1314Service plSet1314Service;
	
	@ModelAttribute
	public PlSet1314 get(@RequestParam(required=false) String id) {
		PlSet1314 entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = plSet1314Service.get(id);
		}
		if (entity == null){
			entity = new PlSet1314();
		}
		return entity;
	}
	
	@RequiresPermissions("plset1314:plSet1314:view")
	@RequestMapping(value = {"list", ""})
	public String list(PlSet1314 plSet1314, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PlSet1314> page = plSet1314Service.findPage(new Page<PlSet1314>(request, response), plSet1314); 
		model.addAttribute("page", page);
		return "modules/plset1314/plSet1314List";
	}

	@RequiresPermissions("plset1314:plSet1314:view")
	@RequestMapping(value = "form")
	public String form(PlSet1314 plSet1314, Model model) {
		List<PlSet1314> plSet1314s=plSet1314Service.findList(plSet1314);
		if (plSet1314s!=null&&plSet1314s.size()>0) {
			model.addAttribute("plSet1314", plSet1314s.get(0));
		}else {

			model.addAttribute("plSet1314", plSet1314);
		}
		return "modules/plset1314/plSet1314Form";
	}

	@RequiresPermissions("plset1314:plSet1314:edit")
	@RequestMapping(value = "save")
	public String save(PlSet1314 plSet1314, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, plSet1314)){
			return form(plSet1314, model);
		}
		plSet1314Service.save(plSet1314);
		addMessage(redirectAttributes, "保存13|14赔率成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}
	
	@RequiresPermissions("plset1314:plSet1314:edit")
	@RequestMapping(value = "delete")
	public String delete(PlSet1314 plSet1314, RedirectAttributes redirectAttributes) {
		plSet1314Service.delete(plSet1314);
		addMessage(redirectAttributes, "删除13|14赔率成功");
		return "redirect:"+Global.getAdminPath()+"/plset1314/plSet1314/?repage";
	}

}