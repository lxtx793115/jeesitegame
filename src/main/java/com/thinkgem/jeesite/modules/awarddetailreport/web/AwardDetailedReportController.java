/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awarddetailreport.web;

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
import com.thinkgem.jeesite.modules.awarddetailreport.entity.AwardDetailedReport;
import com.thinkgem.jeesite.modules.awarddetailreport.service.AwardDetailedReportService;

/**
 * 开奖详细报表Controller
 * @author 开奖详细报表
 * @version 2018-05-27
 */
@Controller
@RequestMapping(value = "${adminPath}/awarddetailreport/awardDetailedReport")
public class AwardDetailedReportController extends BaseController {

	@Autowired
	private AwardDetailedReportService awardDetailedReportService;
	
	@ModelAttribute
	public AwardDetailedReport get(@RequestParam(required=false) String id) {
		AwardDetailedReport entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = awardDetailedReportService.get(id);
		}
		if (entity == null){
			entity = new AwardDetailedReport();
		}
		return entity;
	}
	
	@RequiresPermissions("awarddetailreport:awardDetailedReport:view")
	@RequestMapping(value = {"list", ""})
	public String list(AwardDetailedReport awardDetailedReport, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AwardDetailedReport> page = awardDetailedReportService.findPage(new Page<AwardDetailedReport>(request, response), awardDetailedReport); 
		model.addAttribute("page", page);
		return "modules/awarddetailreport/awardDetailedReportList";
	}

	@RequiresPermissions("awarddetailreport:awardDetailedReport:view")
	@RequestMapping(value = "form")
	public String form(AwardDetailedReport awardDetailedReport, Model model) {
		model.addAttribute("awardDetailedReport", awardDetailedReport);
		return "modules/awarddetailreport/awardDetailedReportForm";
	}

	@RequiresPermissions("awarddetailreport:awardDetailedReport:edit")
	@RequestMapping(value = "save")
	public String save(AwardDetailedReport awardDetailedReport, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, awardDetailedReport)){
			return form(awardDetailedReport, model);
		}
		awardDetailedReportService.save(awardDetailedReport);
		addMessage(redirectAttributes, "保存开奖详细报表成功");
		return "redirect:"+Global.getAdminPath()+"/awarddetailreport/awardDetailedReport/?repage";
	}
	
	@RequiresPermissions("awarddetailreport:awardDetailedReport:edit")
	@RequestMapping(value = "delete")
	public String delete(AwardDetailedReport awardDetailedReport, RedirectAttributes redirectAttributes) {
		awardDetailedReportService.delete(awardDetailedReport);
		addMessage(redirectAttributes, "删除开奖详细报表成功");
		return "redirect:"+Global.getAdminPath()+"/awarddetailreport/awardDetailedReport/?repage";
	}

}