/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.receivingbankaccount.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.receivingbankaccount.entity.ReceivingBankAccount;
import com.thinkgem.jeesite.modules.receivingbankaccount.dao.ReceivingBankAccountDao;

/**
 * 收款账户设置Service
 * @author ss
 * @version 2018-05-23
 */
@Service
@Transactional(readOnly = true)
public class ReceivingBankAccountService extends CrudService<ReceivingBankAccountDao, ReceivingBankAccount> {

	public ReceivingBankAccount get(String id) {
		return super.get(id);
	}
	
	public List<ReceivingBankAccount> findList(ReceivingBankAccount receivingBankAccount) {
		return super.findList(receivingBankAccount);
	}
	
	public Page<ReceivingBankAccount> findPage(Page<ReceivingBankAccount> page, ReceivingBankAccount receivingBankAccount) {
		return super.findPage(page, receivingBankAccount);
	}
	
	@Transactional(readOnly = false)
	public void save(ReceivingBankAccount receivingBankAccount) {
		super.save(receivingBankAccount);
	}
	
	@Transactional(readOnly = false)
	public void delete(ReceivingBankAccount receivingBankAccount) {
		super.delete(receivingBankAccount);
	}
	
}