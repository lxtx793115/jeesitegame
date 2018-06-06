/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.receivingbankaccount.web;

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
import com.thinkgem.jeesite.modules.receivingbankaccount.entity.ReceivingBankAccount;
import com.thinkgem.jeesite.modules.receivingbankaccount.service.ReceivingBankAccountService;

/**
 * 收款账户设置Controller
 * @author ss
 * @version 2018-05-23
 */
@Controller
@RequestMapping(value = "${adminPath}/receivingbankaccount/receivingBankAccount")
public class ReceivingBankAccountController extends BaseController {

	@Autowired
	private ReceivingBankAccountService receivingBankAccountService;
	
	@ModelAttribute
	public ReceivingBankAccount get(@RequestParam(required=false) String id) {
		ReceivingBankAccount entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = receivingBankAccountService.get(id);
		}
		if (entity == null){
			entity = new ReceivingBankAccount();
		}
		return entity;
	}
	
	@RequiresPermissions("receivingbankaccount:receivingBankAccount:view")
	@RequestMapping(value = {"list", ""})
	public String list(ReceivingBankAccount receivingBankAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ReceivingBankAccount> page = receivingBankAccountService.findPage(new Page<ReceivingBankAccount>(request, response), receivingBankAccount); 
		model.addAttribute("page", page);
		return "modules/receivingbankaccount/receivingBankAccountList";
	}

	@RequiresPermissions("receivingbankaccount:receivingBankAccount:view")
	@RequestMapping(value = "form")
	public String form(ReceivingBankAccount receivingBankAccount, Model model) {
		model.addAttribute("receivingBankAccount", receivingBankAccount);
		return "modules/receivingbankaccount/receivingBankAccountForm";
	}

	@RequiresPermissions("receivingbankaccount:receivingBankAccount:edit")
	@RequestMapping(value = "save")
	public String save(ReceivingBankAccount receivingBankAccount, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, receivingBankAccount)){
			return form(receivingBankAccount, model);
		}
		receivingBankAccountService.save(receivingBankAccount);
		addMessage(redirectAttributes, "保存收款账户设置成功");
		return "redirect:"+Global.getAdminPath()+"/receivingbankaccount/receivingBankAccount/?repage";
	}
	
	@RequiresPermissions("receivingbankaccount:receivingBankAccount:edit")
	@RequestMapping(value = "delete")
	public String delete(ReceivingBankAccount receivingBankAccount, RedirectAttributes redirectAttributes) {
		receivingBankAccountService.delete(receivingBankAccount);
		addMessage(redirectAttributes, "删除收款账户设置成功");
		return "redirect:"+Global.getAdminPath()+"/receivingbankaccount/receivingBankAccount/?repage";
	}

}