/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.frontdeskscrollset.web;

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
import com.thinkgem.jeesite.modules.frontdeskscrollset.entity.FrontDeskScrollPictureSet;
import com.thinkgem.jeesite.modules.frontdeskscrollset.service.FrontDeskScrollPictureSetService;

/**
 * 前台滚动图片设置Controller
 * @author sss
 * @version 2018-05-11
 */
@Controller
@RequestMapping(value = "${adminPath}/frontdeskscrollset/frontDeskScrollPictureSet")
public class FrontDeskScrollPictureSetController extends BaseController {

	@Autowired
	private FrontDeskScrollPictureSetService frontDeskScrollPictureSetService;
	
	@ModelAttribute
	public FrontDeskScrollPictureSet get(@RequestParam(required=false) String id) {
		FrontDeskScrollPictureSet entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = frontDeskScrollPictureSetService.get(id);
		}
		if (entity == null){
			entity = new FrontDeskScrollPictureSet();
		}
		return entity;
	}
	
	@RequiresPermissions("frontdeskscrollset:frontDeskScrollPictureSet:view")
	@RequestMapping(value = {"list", ""})
	public String list(FrontDeskScrollPictureSet frontDeskScrollPictureSet, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FrontDeskScrollPictureSet> page = frontDeskScrollPictureSetService.findPage(new Page<FrontDeskScrollPictureSet>(request, response), frontDeskScrollPictureSet); 
		model.addAttribute("page", page);
		return "modules/frontdeskscrollset/frontDeskScrollPictureSetList";
	}

	@RequiresPermissions("frontdeskscrollset:frontDeskScrollPictureSet:view")
	@RequestMapping(value = "form")
	public String form(FrontDeskScrollPictureSet frontDeskScrollPictureSet, Model model) {
		model.addAttribute("frontDeskScrollPictureSet", frontDeskScrollPictureSet);
		return "modules/frontdeskscrollset/frontDeskScrollPictureSetForm";
	}

	@RequiresPermissions("frontdeskscrollset:frontDeskScrollPictureSet:edit")
	@RequestMapping(value = "save")
	public String save(FrontDeskScrollPictureSet frontDeskScrollPictureSet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, frontDeskScrollPictureSet)){
			return form(frontDeskScrollPictureSet, model);
		}
		frontDeskScrollPictureSetService.save(frontDeskScrollPictureSet);
		addMessage(redirectAttributes, "保存前台滚动图片设置成功");
		return "redirect:"+Global.getAdminPath()+"/frontdeskscrollset/frontDeskScrollPictureSet/?repage";
	}
	
	@RequiresPermissions("frontdeskscrollset:frontDeskScrollPictureSet:edit")
	@RequestMapping(value = "delete")
	public String delete(FrontDeskScrollPictureSet frontDeskScrollPictureSet, RedirectAttributes redirectAttributes) {
		frontDeskScrollPictureSetService.delete(frontDeskScrollPictureSet);
		addMessage(redirectAttributes, "删除前台滚动图片设置成功");
		return "redirect:"+Global.getAdminPath()+"/frontdeskscrollset/frontDeskScrollPictureSet/?repage";
	}

}