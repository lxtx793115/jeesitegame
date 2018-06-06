/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.homepage.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 首页Entity
 * @author aa
 * @version 2018-05-29
 */
public class HomePage extends DataEntity<HomePage> {
	
	private static final long serialVersionUID = 1L;
	private Integer userTotalNumber;		// 会员总数
	private Integer todayNewlyAddedUser;		// 今日新增会员
	private Integer todayActiveUser;		// 今日活跃会员
	private Integer currentOnlineUser;		// 当前在线会员
	private Integer weekNewlyAddedUser;		// 周新增会员
	private Integer monthNewlyAddedUser;		// 月新增会员
	private String intradiscalTotalFraction;		// 盘内总分数
	private String todayRecharge;		// 今日充值
	private String todayWithdrawCash;		// 今日提现
	private String todayTotalWinLoss;		// 今日总盈亏
	private String todayBetslStatement;		// 今日投注流水
	private String todayGivePresent;		// 今日赠送
	
	public HomePage() {
		super();
	}

	public HomePage(String id){
		super(id);
	}

	public Integer getUserTotalNumber() {
		return userTotalNumber;
	}

	public void setUserTotalNumber(Integer userTotalNumber) {
		this.userTotalNumber = userTotalNumber;
	}
	
	public Integer getTodayNewlyAddedUser() {
		return todayNewlyAddedUser;
	}

	public void setTodayNewlyAddedUser(Integer todayNewlyAddedUser) {
		this.todayNewlyAddedUser = todayNewlyAddedUser;
	}
	
	public Integer getTodayActiveUser() {
		return todayActiveUser;
	}

	public void setTodayActiveUser(Integer todayActiveUser) {
		this.todayActiveUser = todayActiveUser;
	}
	
	public Integer getCurrentOnlineUser() {
		return currentOnlineUser;
	}

	public void setCurrentOnlineUser(Integer currentOnlineUser) {
		this.currentOnlineUser = currentOnlineUser;
	}
	
	public Integer getWeekNewlyAddedUser() {
		return weekNewlyAddedUser;
	}

	public void setWeekNewlyAddedUser(Integer weekNewlyAddedUser) {
		this.weekNewlyAddedUser = weekNewlyAddedUser;
	}
	
	public Integer getMonthNewlyAddedUser() {
		return monthNewlyAddedUser;
	}

	public void setMonthNewlyAddedUser(Integer monthNewlyAddedUser) {
		this.monthNewlyAddedUser = monthNewlyAddedUser;
	}
	
	@Length(min=0, max=55, message="盘内总分数长度必须介于 0 和 55 之间")
	public String getIntradiscalTotalFraction() {
		return intradiscalTotalFraction;
	}

	public void setIntradiscalTotalFraction(String intradiscalTotalFraction) {
		this.intradiscalTotalFraction = intradiscalTotalFraction;
	}
	
	public String getTodayRecharge() {
		return todayRecharge;
	}

	public void setTodayRecharge(String todayRecharge) {
		this.todayRecharge = todayRecharge;
	}
	
	public String getTodayWithdrawCash() {
		return todayWithdrawCash;
	}

	public void setTodayWithdrawCash(String todayWithdrawCash) {
		this.todayWithdrawCash = todayWithdrawCash;
	}
	
	public String getTodayTotalWinLoss() {
		return todayTotalWinLoss;
	}

	public void setTodayTotalWinLoss(String todayTotalWinLoss) {
		this.todayTotalWinLoss = todayTotalWinLoss;
	}
	
	public String getTodayBetslStatement() {
		return todayBetslStatement;
	}

	public void setTodayBetslStatement(String todayBetslStatement) {
		this.todayBetslStatement = todayBetslStatement;
	}
	
	public String getTodayGivePresent() {
		return todayGivePresent;
	}

	public void setTodayGivePresent(String todayGivePresent) {
		this.todayGivePresent = todayGivePresent;
	}
	
}