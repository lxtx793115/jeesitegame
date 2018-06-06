/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.receivingbankaccount.entity;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 收款账户设置Entity
 * @author ss
 * @version 2018-05-23
 */
public class ReceivingBankAccount extends DataEntity<ReceivingBankAccount> {
	
	private static final long serialVersionUID = 1L;
	private Integer accountSequence;		// 自增序列
	private String account;		// 账号
	private String accountType;		// 账户类型
	private String realName;		// 真实姓名
	private String iconPhoto;		// 图标
	private String twoDimensionalCode;		// 二维码
	private String kindlyReminder;//温馨提示
	
	public String getKindlyReminder() {
		return kindlyReminder;
	}

	public void setKindlyReminder(String kindlyReminder) {
		this.kindlyReminder = kindlyReminder;
	}

	public ReceivingBankAccount() {
		super();
	}

	public ReceivingBankAccount(String id){
		super(id);
	}

	public Integer getAccountSequence() {
		return accountSequence;
	}

	public void setAccountSequence(Integer accountSequence) {
		this.accountSequence = accountSequence;
	}
	
	@Length(min=0, max=255, message="账号长度必须介于 0 和 255 之间")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Length(min=0, max=55, message="账户类型长度必须介于 0 和 55 之间")
	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	
	@Length(min=0, max=55, message="真实姓名长度必须介于 0 和 55 之间")
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	@Length(min=0, max=255, message="图标长度必须介于 0 和 255 之间")
	public String getIconPhoto() {
		return iconPhoto;
	}

	public void setIconPhoto(String iconPhoto) {
		this.iconPhoto = iconPhoto;
	}
	
	@Length(min=0, max=255, message="二维码长度必须介于 0 和 255 之间")
	public String getTwoDimensionalCode() {
		return twoDimensionalCode;
	}

	public void setTwoDimensionalCode(String twoDimensionalCode) {
		this.twoDimensionalCode = twoDimensionalCode;
	}
	
}