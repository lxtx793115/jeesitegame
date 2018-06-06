/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.updownreport.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 上下分报表Entity
 * @author qq
 * @version 2018-05-25
 */
public class UpAndDownReport extends DataEntity<UpAndDownReport> {
	
	private static final long serialVersionUID = 1L;
	private String gameuserId;		// 用户ID
	private String reportnumber;		// 订单ID
	private String nickname;		// 昵称
	private String photourl;		// 头像
	private String bankAccount;		// 账号
	private String applyType;		// 申请类型
	private String applyTypeContext;		// 申请类型名称
	private String payType;		// 支付类型
	private String applyMoneyAmount;		// 申请金额
	private Date applyTime;		// 申请时间
	private String operatorId;		// 操作员用户ID
	private String operatorUsername;		// 操作员用户名
	private Date operateTime;		// 操作时间
	private String status;		// 状态
	private String statusContext;		// 状态名称
	
	public UpAndDownReport() {
		super();
	}

	public UpAndDownReport(String id){
		super(id);
	}

	@Length(min=1, max=64, message="用户ID长度必须介于 1 和 64 之间")
	public String getGameuserId() {
		return gameuserId;
	}

	public void setGameuserId(String gameuserId) {
		this.gameuserId = gameuserId;
	}
	
	@Length(min=0, max=11, message="订单ID长度必须介于 0 和 11 之间")
	public String getReportnumber() {
		return reportnumber;
	}

	public void setReportnumber(String reportnumber) {
		this.reportnumber = reportnumber;
	}
	
	@Length(min=0, max=100, message="昵称长度必须介于 0 和 100 之间")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Length(min=0, max=155, message="头像长度必须介于 0 和 155 之间")
	public String getPhotourl() {
		return photourl;
	}

	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}
	
	@Length(min=0, max=255, message="账号长度必须介于 0 和 255 之间")
	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	
	@Length(min=0, max=55, message="申请类型长度必须介于 0 和 55 之间")
	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}
	
	@Length(min=0, max=55, message="申请类型名称长度必须介于 0 和 55 之间")
	public String getApplyTypeContext() {
		return applyTypeContext;
	}

	public void setApplyTypeContext(String applyTypeContext) {
		this.applyTypeContext = applyTypeContext;
	}
	
	@Length(min=0, max=55, message="支付类型长度必须介于 0 和 55 之间")
	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}
	
	@Length(min=0, max=155, message="申请金额长度必须介于 0 和 155 之间")
	public String getApplyMoneyAmount() {
		return applyMoneyAmount;
	}

	public void setApplyMoneyAmount(String applyMoneyAmount) {
		this.applyMoneyAmount = applyMoneyAmount;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	
	@Length(min=0, max=155, message="操作员用户ID长度必须介于 0 和 155 之间")
	public String getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}
	
	@Length(min=0, max=155, message="操作员用户名长度必须介于 0 和 155 之间")
	public String getOperatorUsername() {
		return operatorUsername;
	}

	public void setOperatorUsername(String operatorUsername) {
		this.operatorUsername = operatorUsername;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getOperateTime() {
		return operateTime;
	}

	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	
	@Length(min=0, max=55, message="状态长度必须介于 0 和 55 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=155, message="状态名称长度必须介于 0 和 155 之间")
	public String getStatusContext() {
		return statusContext;
	}

	public void setStatusContext(String statusContext) {
		this.statusContext = statusContext;
	}
	
}