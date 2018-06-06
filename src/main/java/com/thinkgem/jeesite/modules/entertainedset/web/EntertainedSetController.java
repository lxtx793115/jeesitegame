/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.entertainedset.web;

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
import com.thinkgem.jeesite.modules.entertainedset.entity.EntertainedSet;
import com.thinkgem.jeesite.modules.entertainedset.service.EntertainedSetService;

/**
 * 封盘设置Controller
 * @author ss
 * @version 2018-05-10
 */
@Controller
@RequestMapping(value = "${adminPath}/entertainedset/entertainedSet")
public class EntertainedSetController extends BaseController {

	@Autowired
	private EntertainedSetService entertainedSetService;
	
	@ModelAttribute
	public EntertainedSet get(@RequestParam(required=false) String id) {
		EntertainedSet entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = entertainedSetService.get(id);
		}
		if (entity == null){
			entity = new EntertainedSet();
		}
		return entity;
	}
	
	@RequiresPermissions("entertainedset:entertainedSet:view")
	@RequestMapping(value = {"list", ""})
	public String list(EntertainedSet entertainedSet, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EntertainedSet> page = entertainedSetService.findPage(new Page<EntertainedSet>(request, response), entertainedSet); 
		model.addAttribute("page", page);
		model.addAttribute("plSet", entertainedSet);
		return "modules/entertainedset/entertainedSetList";
	}

	@RequiresPermissions("entertainedset:entertainedSet:view")
	@RequestMapping(value = "form")
	public String form(EntertainedSet entertainedSet, Model model) {
		model.addAttribute("entertainedSet", entertainedSet);
		return "modules/entertainedset/entertainedSetForm";
	}

	@RequiresPermissions("entertainedset:entertainedSet:edit")
	@RequestMapping(value = "save")
	public String save(EntertainedSet entertainedSet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, entertainedSet)){
			return form(entertainedSet, model);
		}
		entertainedSetService.save(entertainedSet);
		addMessage(redirectAttributes, "保存封盘设置成功");
		return "redirect:"+Global.getAdminPath()+"/entertainedset/entertainedSet/list?repage&roomnumber="+entertainedSet.getRoomnumber()+"&gameroomId="+entertainedSet.getGameroomId();
	}
	
	@RequiresPermissions("entertainedset:entertainedSet:edit")
	@RequestMapping(value = "delete")
	public String delete(EntertainedSet entertainedSet, RedirectAttributes redirectAttributes) {
		EntertainedSet entertainedSet2=new EntertainedSet();
		List<EntertainedSet> entertainedSets=entertainedSetService.findList(entertainedSet);
		entertainedSet2.setRoomnumber(entertainedSets.get(0).getRoomnumber());
		entertainedSet2.setGameroomId(entertainedSets.get(0).getGameroomId());
		entertainedSetService.delete(entertainedSet);
		addMessage(redirectAttributes, "删除封盘设置成功");
		return "redirect:"+Global.getAdminPath()+"/entertainedset/entertainedSet/list?&roomnumber="+entertainedSet2.getRoomnumber()+"&gameroomId="+entertainedSet2.getGameroomId();
	}

}