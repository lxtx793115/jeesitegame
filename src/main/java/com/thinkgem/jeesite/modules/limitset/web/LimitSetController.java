/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.limitset.web;

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
import com.thinkgem.jeesite.modules.limitset.entity.LimitSet;
import com.thinkgem.jeesite.modules.limitset.service.LimitSetService;

/**
 * 限额设置Controller
 * @author ddd
 * @version 2018-05-09
 */
@Controller
@RequestMapping(value = "${adminPath}/limitset/limitSet")
public class LimitSetController extends BaseController {

	@Autowired
	private LimitSetService limitSetService;
	
	@ModelAttribute
	public LimitSet get(@RequestParam(required=false) String id) {
		LimitSet entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = limitSetService.get(id);
		}
		if (entity == null){
			entity = new LimitSet();
		}
		return entity;
	}
	
	@RequiresPermissions("limitset:limitSet:view")
	@RequestMapping(value = {"list", ""})
	public String list(LimitSet limitSet, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LimitSet> page = limitSetService.findPage(new Page<LimitSet>(request, response), limitSet); 
		model.addAttribute("page", page);
		return "modules/limitset/limitSetList";
	}

	@RequiresPermissions("limitset:limitSet:view")
	@RequestMapping(value = "form")
	public String form(LimitSet limitSet, Model model) {
		List<LimitSet> limitSets=limitSetService.findList(limitSet);
		if (limitSets!=null&&limitSets.size()>0) {
			model.addAttribute("limitSet", limitSets.get(0));
		}else {

			model.addAttribute("limitSet", limitSet);
		}
		return "modules/limitset/limitSetForm";
	}

	@RequiresPermissions("limitset:limitSet:edit")
	@RequestMapping(value = "save")
	public String save(LimitSet limitSet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, limitSet)){
			return form(limitSet, model);
		}
		limitSetService.save(limitSet);
		addMessage(redirectAttributes, "保存限额设置成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}
	
	@RequiresPermissions("limitset:limitSet:edit")
	@RequestMapping(value = "delete")
	public String delete(LimitSet limitSet, RedirectAttributes redirectAttributes) {
		limitSetService.delete(limitSet);
		addMessage(redirectAttributes, "删除限额设置成功");
		return "redirect:"+Global.getAdminPath()+"/limitset/limitSet/?repage";
	}

}