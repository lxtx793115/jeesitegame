/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.operationalset.web;

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
import com.thinkgem.jeesite.modules.operationalset.entity.OperationalSet;
import com.thinkgem.jeesite.modules.operationalset.service.OperationalSetService;

/**
 * 运营设置Controller
 * @author ddd
 * @version 2018-05-11
 */
@Controller
@RequestMapping(value = "${adminPath}/operationalset/operationalSet")
public class OperationalSetController extends BaseController {

	@Autowired
	private OperationalSetService operationalSetService;
	
	@ModelAttribute
	public OperationalSet get(@RequestParam(required=false) String id) {
		OperationalSet entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = operationalSetService.get(id);
		}
		if (entity == null){
			entity = new OperationalSet();
		}
		return entity;
	}
	
	@RequiresPermissions("operationalset:operationalSet:view")
	@RequestMapping(value = {"list", ""})
	public String list(OperationalSet operationalSet, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OperationalSet> page = operationalSetService.findPage(new Page<OperationalSet>(request, response), operationalSet); 
		model.addAttribute("page", page);
		return "modules/operationalset/operationalSetList";
	}

	@RequiresPermissions("operationalset:operationalSet:view")
	@RequestMapping(value = "form")
	public String form(OperationalSet operationalSet, Model model) {
		model.addAttribute("operationalSet", operationalSet);
		return "modules/operationalset/operationalSetForm";
	}

	@RequiresPermissions("operationalset:operationalSet:edit")
	@RequestMapping(value = "save")
	public String save(OperationalSet operationalSet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, operationalSet)){
			return form(operationalSet, model);
		}
		operationalSetService.save(operationalSet);
		addMessage(redirectAttributes, "保存运营设置成功");
		return "redirect:"+Global.getAdminPath()+"/operationalset/operationalSet/?repage";
	}
	
	@RequiresPermissions("operationalset:operationalSet:edit")
	@RequestMapping(value = "delete")
	public String delete(OperationalSet operationalSet, RedirectAttributes redirectAttributes) {
		operationalSetService.delete(operationalSet);
		addMessage(redirectAttributes, "删除运营设置成功");
		return "redirect:"+Global.getAdminPath()+"/operationalset/operationalSet/?repage";
	}

}