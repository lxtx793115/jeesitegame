/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awarddetailreport.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 开奖详细报表Entity
 * @author 开奖详细报表
 * @version 2018-05-27
 */
public class AwardDetailedReport extends DataEntity<AwardDetailedReport> {
	
	private static final long serialVersionUID = 1L;
	private String awardManageId;		// 开奖管理ID
	private String reportnumber;		// 订单ID
	private String accountNumber;		// 账号
	private String betsDetail;		// 下注内容
	private String totalAmountBets;		// 下注总额
	private Date betsTime;		// 下注时间
	private String awardResults;		// 开奖结果
	private String playerWinLoss;		// 玩家盈亏
	private String status;		// 状态
	
	public AwardDetailedReport() {
		super();
	}

	public AwardDetailedReport(String id){
		super(id);
	}

	@Length(min=1, max=64, message="开奖管理ID长度必须介于 1 和 64 之间")
	public String getAwardManageId() {
		return awardManageId;
	}

	public void setAwardManageId(String awardManageId) {
		this.awardManageId = awardManageId;
	}
	
	@Length(min=1, max=11, message="订单ID长度必须介于 1 和 11 之间")
	public String getReportnumber() {
		return reportnumber;
	}

	public void setReportnumber(String reportnumber) {
		this.reportnumber = reportnumber;
	}
	
	@Length(min=0, max=55, message="账号长度必须介于 0 和 55 之间")
	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	@Length(min=0, max=2550, message="下注内容长度必须介于 0 和 2550 之间")
	public String getBetsDetail() {
		return betsDetail;
	}

	public void setBetsDetail(String betsDetail) {
		this.betsDetail = betsDetail;
	}
	
	@Length(min=0, max=55, message="下注总额长度必须介于 0 和 55 之间")
	public String getTotalAmountBets() {
		return totalAmountBets;
	}

	public void setTotalAmountBets(String totalAmountBets) {
		this.totalAmountBets = totalAmountBets;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBetsTime() {
		return betsTime;
	}

	public void setBetsTime(Date betsTime) {
		this.betsTime = betsTime;
	}
	
	@Length(min=0, max=155, message="开奖结果长度必须介于 0 和 155 之间")
	public String getAwardResults() {
		return awardResults;
	}

	public void setAwardResults(String awardResults) {
		this.awardResults = awardResults;
	}
	
	@Length(min=0, max=155, message="玩家盈亏长度必须介于 0 和 155 之间")
	public String getPlayerWinLoss() {
		return playerWinLoss;
	}

	public void setPlayerWinLoss(String playerWinLoss) {
		this.playerWinLoss = playerWinLoss;
	}
	
	@Length(min=0, max=25, message="状态长度必须介于 0 和 25 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}