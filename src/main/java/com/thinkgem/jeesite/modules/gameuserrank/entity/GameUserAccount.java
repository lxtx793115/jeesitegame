/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户银行Entity
 * @author dd
 * @version 2018-05-04
 */
public class GameUserAccount extends DataEntity<GameUserAccount> {
	
	private static final long serialVersionUID = 1L;
	private String accountNo;		// 账号
	private String accountType;		// 账户类型
	private String accountDetail;		// 账户详情
	private String accountAddress;		// 开户地址
	private String rownum;		//序号
	private String bankname;		//支行名称
	
	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getRownum() {
		return rownum;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public GameUserAccount() {
		super();
	}

	public GameUserAccount(String id){
		super(id);
	}

	@Length(min=0, max=50, message="账号长度必须介于 0 和 50 之间")
	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	
	@Length(min=0, max=30, message="账户类型长度必须介于 0 和 30 之间")
	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	
	@Length(min=0, max=255, message="账户详情长度必须介于 0 和 255 之间")
	public String getAccountDetail() {
		return accountDetail;
	}

	public void setAccountDetail(String accountDetail) {
		this.accountDetail = accountDetail;
	}
	
	@Length(min=0, max=155, message="开户地址长度必须介于 0 和 155 之间")
	public String getAccountAddress() {
		return accountAddress;
	}

	public void setAccountAddress(String accountAddress) {
		this.accountAddress = accountAddress;
	}
	
}