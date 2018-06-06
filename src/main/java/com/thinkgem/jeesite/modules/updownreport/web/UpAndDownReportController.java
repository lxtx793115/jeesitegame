/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.updownreport.web;

import java.util.Date;
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
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.gameuser.service.GameUserService;
import com.thinkgem.jeesite.modules.updownreport.entity.UpAndDownReport;
import com.thinkgem.jeesite.modules.updownreport.service.UpAndDownReportService;

/**
 * 上下分报表Controller
 * @author qq
 * @version 2018-05-25
 */
@Controller
@RequestMapping(value = "${adminPath}/updownreport/upAndDownReport")
public class UpAndDownReportController extends BaseController {

	@Autowired
	private GameUserService gameUserService;
	@Autowired
	private UpAndDownReportService upAndDownReportService;
	
	@ModelAttribute
	public UpAndDownReport get(@RequestParam(required=false) String id) {
		UpAndDownReport entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = upAndDownReportService.get(id);
		}
		if (entity == null){
			entity = new UpAndDownReport();
		}
		return entity;
	}
	
	@RequiresPermissions("updownreport:upAndDownReport:view")
	@RequestMapping(value = {"listup", ""})
	public String listup(UpAndDownReport upAndDownReport, HttpServletRequest request, HttpServletResponse response, Model model) {
		upAndDownReport.setApplyType("1");
		Page<UpAndDownReport> page = upAndDownReportService.findPage(new Page<UpAndDownReport>(request, response), upAndDownReport); 
		model.addAttribute("page", page);
		List<UpAndDownReport> upAndDownReports=upAndDownReportService.findListtotal(upAndDownReport);
		if (upAndDownReports!=null&&upAndDownReports.size()>0) {
			model.addAttribute("shangfen", upAndDownReports.get(0));
		}else {
			UpAndDownReport upAndDownReport2=new UpAndDownReport();
			upAndDownReport2.setApplyMoneyAmount("0");
			upAndDownReport2.setBankAccount("0");
			model.addAttribute("shangfen", upAndDownReport2);
		}
		return "modules/updownreport/upReportList";
	}
	
	@RequiresPermissions("updownreport:upAndDownReport:view")
	@RequestMapping(value = {"listdown"})
	public String listdown(UpAndDownReport upAndDownReport, HttpServletRequest request, HttpServletResponse response, Model model) {
		upAndDownReport.setApplyType("2");
		Page<UpAndDownReport> page = upAndDownReportService.findPage(new Page<UpAndDownReport>(request, response), upAndDownReport); 
		model.addAttribute("page", page);
		List<UpAndDownReport> upAndDownReports=upAndDownReportService.findListtotal(upAndDownReport);
		if (upAndDownReports!=null&&upAndDownReports.size()>0) {
			model.addAttribute("xiafen", upAndDownReports.get(0));
		}else {
			UpAndDownReport upAndDownReport2=new UpAndDownReport();
			upAndDownReport2.setApplyMoneyAmount("0");
			upAndDownReport2.setBankAccount("0");
			model.addAttribute("xiafen", upAndDownReport2);
		}
		return "modules/updownreport/DownReportList";
	}
	
	@RequiresPermissions("updownreport:upAndDownReport:view")
	@RequestMapping(value = {"list"})
	public String list(UpAndDownReport upAndDownReport, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<UpAndDownReport> page = upAndDownReportService.findPage(new Page<UpAndDownReport>(request, response), upAndDownReport); 
		String appString=upAndDownReport.getApplyType();
		model.addAttribute("page", page);
		upAndDownReport.setApplyType("1");
		List<UpAndDownReport> upAndDownReports=upAndDownReportService.findListtotal(upAndDownReport);
		if (upAndDownReports!=null&&upAndDownReports.size()>0) {
			model.addAttribute("shangfen", upAndDownReports.get(0));
		}else {
			UpAndDownReport upAndDownReport2=new UpAndDownReport();
			upAndDownReport2.setApplyMoneyAmount("0");
			upAndDownReport2.setBankAccount("0");
			model.addAttribute("shangfen", upAndDownReport2);
		}
		
		upAndDownReport.setApplyType("2");
		List<UpAndDownReport> upAndDownReportsII=upAndDownReportService.findListtotal(upAndDownReport);
		if (upAndDownReportsII!=null&&upAndDownReportsII.size()>0) {
			model.addAttribute("xiafen", upAndDownReportsII.get(0));
		}
		upAndDownReport.setApplyType(appString);
		model.addAttribute("upAndDownReport", upAndDownReport);
		
		return "modules/updownreport/upAndDownReportList";
	}

	@RequiresPermissions("updownreport:upAndDownReport:view")
	@RequestMapping(value = "form")
	public String form(UpAndDownReport upAndDownReport, Model model) {
		GameUser gameUser=new GameUser();
		List<GameUser> gameUsers=gameUserService.findList(gameUser);
		model.addAttribute("gameUsers", gameUsers);
		model.addAttribute("upAndDownReport", upAndDownReport);
		return "modules/updownreport/upAndDownReportForm";
	}
	
	@RequiresPermissions("updownreport:upAndDownReport:edit")
	@RequestMapping(value = "Auditingsave")
	public String Auditingsave(UpAndDownReport upAndDownReport,@RequestParam ("auditsta") Integer auditsta,
			@RequestParam ("shangxia") Integer shangxia,
			Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, upAndDownReport)){
			return form(upAndDownReport, model);
		}
		String userid =upAndDownReport.getGameuserId();
		if (userid!=null&&!"".equals(userid)) {

			GameUser gameUser=gameUserService.get(upAndDownReport.getGameuserId());
			upAndDownReport.setNickname(gameUser.getNickname());
			upAndDownReport.setPhotourl(gameUser.getPhotourl());
		}
		String applyType=upAndDownReport.getApplyType();
		if (applyType!=null&&!"".equals(applyType)) {
			if (applyType.equals("1")) {

				upAndDownReport.setApplyTypeContext("上分");
			}else {
				upAndDownReport.setApplyTypeContext("下分");
			}
			
			
		}
		if (upAndDownReport.getId()!=null&&!"".equals(upAndDownReport.getId())) {
			
		}else {

			upAndDownReport.setApplyTime(new Date());	
		}
		String auString=upAndDownReport.getStatus();
		if (auString!=null&&!"".equals(auString)) {
			addMessage(redirectAttributes, "该订单已被审核，不能重复操作");
		}else {

			if (auditsta==1) {
				upAndDownReport.setStatusContext("已同意");
				upAndDownReport.setStatus("1");
				
				addMessage(redirectAttributes, "同意该订单成功");
			}else {
				upAndDownReport.setStatusContext("已拒绝");
				upAndDownReport.setStatus("2");
				addMessage(redirectAttributes, "拒绝该订单成功");
			}
			upAndDownReport.setOperatorId(upAndDownReport.getGameuserId());
			upAndDownReport.setOperatorUsername(upAndDownReport.getNickname());
			upAndDownReport.setOperateTime(new Date());

			upAndDownReportService.save(upAndDownReport);
		}
		
	
		return "redirect:"+Global.getAdminPath()+"/updownreport/upAndDownReport/list?repage";
	
		
	}

	@RequiresPermissions("updownreport:upAndDownReport:edit")
	@RequestMapping(value = "save")
	public String save(UpAndDownReport upAndDownReport, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, upAndDownReport)){
			return form(upAndDownReport, model);
		}
		String userid =upAndDownReport.getGameuserId();
		if (userid!=null&&!"".equals(userid)) {

			GameUser gameUser=gameUserService.get(upAndDownReport.getGameuserId());
			upAndDownReport.setNickname(gameUser.getNickname());
			upAndDownReport.setPhotourl(gameUser.getPhotourl());
		}
		String applyType=upAndDownReport.getApplyType();
		if (applyType!=null&&!"".equals(applyType)) {
			if (applyType.equals("1")) {

				upAndDownReport.setApplyTypeContext("上分");
			}else {
				upAndDownReport.setApplyTypeContext("下分");
			}
			
			
		}
		if (upAndDownReport.getId()!=null&&!"".equals(upAndDownReport.getId())) {
			
		}else {

			upAndDownReport.setApplyTime(new Date());	
		}
		
		
		
		upAndDownReportService.save(upAndDownReport);
		addMessage(redirectAttributes, "保存上下分报表成功");
		return "redirect:"+Global.getAdminPath()+"/updownreport/upAndDownReport/?repage";
	}
	
	@RequiresPermissions("updownreport:upAndDownReport:edit")
	@RequestMapping(value = "delete")
	public String delete(UpAndDownReport upAndDownReport,
			@RequestParam ("shangxia") Integer shangxia,
			RedirectAttributes redirectAttributes) {
		upAndDownReportService.delete(upAndDownReport);
		addMessage(redirectAttributes, "删除上下分报表成功");
		if (shangxia==1) {

			return "redirect:"+Global.getAdminPath()+"/updownreport/upAndDownReport/?repage";
		}else if (shangxia==2) {

			return "redirect:"+Global.getAdminPath()+"/updownreport/upAndDownReport/listdown?repage";
		} {
			return "redirect:"+Global.getAdminPath()+"/updownreport/upAndDownReport/list?repage";
		}
	}

}