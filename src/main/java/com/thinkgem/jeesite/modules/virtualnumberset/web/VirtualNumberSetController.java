/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.virtualnumberset.web;

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
import com.thinkgem.jeesite.modules.virtualnumberset.entity.VirtualNumberSet;
import com.thinkgem.jeesite.modules.virtualnumberset.service.VirtualNumberSetService;

/**
 * 虚拟人数设置Controller
 * @author ddd
 * @version 2018-05-09
 */
@Controller
@RequestMapping(value = "${adminPath}/virtualnumberset/virtualNumberSet")
public class VirtualNumberSetController extends BaseController {

	@Autowired
	private VirtualNumberSetService virtualNumberSetService;
	
	@ModelAttribute
	public VirtualNumberSet get(@RequestParam(required=false) String id) {
		VirtualNumberSet entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = virtualNumberSetService.get(id);
		}
		if (entity == null){
			entity = new VirtualNumberSet();
		}
		return entity;
	}
	
	@RequiresPermissions("virtualnumberset:virtualNumberSet:view")
	@RequestMapping(value = {"list", ""})
	public String list(VirtualNumberSet virtualNumberSet, HttpServletRequest request, HttpServletResponse response, Model model,RedirectAttributes redirectAttributes) {
		Page<VirtualNumberSet> page = virtualNumberSetService.findPage(new Page<VirtualNumberSet>(request, response), virtualNumberSet); 
		model.addAttribute("page", page);
			model.addAttribute("plSet", virtualNumberSet);
		
		return "modules/virtualnumberset/virtualNumberSetList";
	}

	@RequiresPermissions("virtualnumberset:virtualNumberSet:view")
	@RequestMapping(value = "form")
	public String form(VirtualNumberSet virtualNumberSet, Model model) {
		model.addAttribute("virtualNumberSet", virtualNumberSet);
		return "modules/virtualnumberset/virtualNumberSetForm";
	}

	@RequiresPermissions("virtualnumberset:virtualNumberSet:edit")
	@RequestMapping(value = "save")
	public String save(VirtualNumberSet virtualNumberSet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, virtualNumberSet)){
			return form(virtualNumberSet, model);
		}
		virtualNumberSetService.save(virtualNumberSet);
		addMessage(redirectAttributes, "保存虚拟人数设置成功");
		return "redirect:"+Global.getAdminPath()+"/virtualnumberset/virtualNumberSet/list?repage&roomnumber="+virtualNumberSet.getRoomnumber()+"&gameroomId="+virtualNumberSet.getGameroomId();
	}
	
	@RequiresPermissions("virtualnumberset:virtualNumberSet:view")
	@RequestMapping(value = {"list2"})
	public String list2(VirtualNumberSet virtualNumberSet, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<VirtualNumberSet> page = virtualNumberSetService.findPage(new Page<VirtualNumberSet>(request, response), virtualNumberSet); 
		model.addAttribute("page", page);
		return "modules/virtualnumberset/virtualNumberSetList";
	}

	
	@RequiresPermissions("virtualnumberset:virtualNumberSet:edit")
	@RequestMapping(value = "delete")
	public String delete(VirtualNumberSet virtualNumberSet, RedirectAttributes redirectAttributes) {
		VirtualNumberSet virtualNumberSet2=new VirtualNumberSet();
		List<VirtualNumberSet> virtualNumberSets=virtualNumberSetService.findList(virtualNumberSet);
		virtualNumberSet2.setRoomnumber(virtualNumberSets.get(0).getRoomnumber());
		virtualNumberSet2.setGameroomId(virtualNumberSets.get(0).getGameroomId());
		virtualNumberSetService.delete(virtualNumberSet);
		addMessage(redirectAttributes, "删除虚拟人数设置成功");
		return "redirect:"+Global.getAdminPath()+"/virtualnumberset/virtualNumberSet/?repage&roomnumber="+virtualNumberSet2.getRoomnumber()+"&gameroomId="+virtualNumberSet2.getGameroomId();
	}

}