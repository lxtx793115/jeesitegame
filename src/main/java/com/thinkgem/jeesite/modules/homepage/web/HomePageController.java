/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.homepage.web;

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
import com.thinkgem.jeesite.modules.homepage.entity.HomePage;
import com.thinkgem.jeesite.modules.homepage.service.HomePageService;

/**
 * 首页Controller
 * @author aa
 * @version 2018-05-29
 */
@Controller
@RequestMapping(value = "${adminPath}/homepage/homePage")
public class HomePageController extends BaseController {

	@Autowired
	private HomePageService homePageService;
	
	@ModelAttribute
	public HomePage get(@RequestParam(required=false) String id) {
		HomePage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = homePageService.get(id);
		}
		if (entity == null){
			entity = new HomePage();
		}
		return entity;
	}
	
	@RequiresPermissions("homepage:homePage:view")
	@RequestMapping(value = {"list", ""})
	public String list(HomePage homePage, HttpServletRequest request, HttpServletResponse response, Model model) {
		/*Page<HomePage> page = homePageService.findPage(new Page<HomePage>(request, response), homePage); */
		List<HomePage> homePages=homePageService.findList(homePage);
		if (homePages!=null&&homePages.size()>0) {
			homePage=homePages.get(0);
		}else {
			homePage=new HomePage();
		}
		model.addAttribute("homePage", homePage);
		return "modules/homepage/homePageList";
	}

	@RequiresPermissions("homepage:homePage:view")
	@RequestMapping(value = "form")
	public String form(HomePage homePage, Model model) {
		model.addAttribute("homePage", homePage);
		return "modules/homepage/homePageForm";
	}

	@RequiresPermissions("homepage:homePage:edit")
	@RequestMapping(value = "save")
	public String save(HomePage homePage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, homePage)){
			return form(homePage, model);
		}
		homePageService.save(homePage);
		addMessage(redirectAttributes, "保存首页成功");
		return "redirect:"+Global.getAdminPath()+"/homepage/homePage/?repage";
	}
	
	@RequiresPermissions("homepage:homePage:edit")
	@RequestMapping(value = "delete")
	public String delete(HomePage homePage, RedirectAttributes redirectAttributes) {
		homePageService.delete(homePage);
		addMessage(redirectAttributes, "删除首页成功");
		return "redirect:"+Global.getAdminPath()+"/homepage/homePage/?repage";
	}

}