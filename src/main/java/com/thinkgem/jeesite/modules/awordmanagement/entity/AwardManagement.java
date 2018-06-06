/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awordmanagement.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 开奖管理Entity
 * @author ww
 * @version 2018-05-27
 */
public class AwardManagement extends DataEntity<AwardManagement> {
	
	private static final long serialVersionUID = 1L;
	private String roomName;		// 房间名称
	private String roomnumber;		// 房间序号
	private String gameroomId;		// 游戏房间ID
	private String termNum;		// 期数
	private String awardNum;		// 开奖号码
	private Date entertainedTime;		// 封盘时间
	private Date awardTime;		// 开奖时间
	private String totalAmountOfInvestment;		// 投注总额
	private String totalPeopleOfInvestment;		// 投注人数
	private String playerWinLoss;		// 玩家赢亏
	
	public AwardManagement() {
		super();
	}

	public AwardManagement(String id){
		super(id);
	}

	@Length(min=0, max=55, message="房间名称长度必须介于 0 和 55 之间")
	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
	@Length(min=0, max=55, message="房间序号长度必须介于 0 和 55 之间")
	public String getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}
	
	@Length(min=0, max=64, message="游戏房间ID长度必须介于 0 和 64 之间")
	public String getGameroomId() {
		return gameroomId;
	}

	public void setGameroomId(String gameroomId) {
		this.gameroomId = gameroomId;
	}
	
	@Length(min=0, max=55, message="期数长度必须介于 0 和 55 之间")
	public String getTermNum() {
		return termNum;
	}

	public void setTermNum(String termNum) {
		this.termNum = termNum;
	}
	
	@Length(min=0, max=55, message="开奖号码长度必须介于 0 和 55 之间")
	public String getAwardNum() {
		return awardNum;
	}

	public void setAwardNum(String awardNum) {
		this.awardNum = awardNum;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEntertainedTime() {
		return entertainedTime;
	}

	public void setEntertainedTime(Date entertainedTime) {
		this.entertainedTime = entertainedTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAwardTime() {
		return awardTime;
	}

	public void setAwardTime(Date awardTime) {
		this.awardTime = awardTime;
	}
	
	@Length(min=0, max=55, message="投注总额长度必须介于 0 和 55 之间")
	public String getTotalAmountOfInvestment() {
		return totalAmountOfInvestment;
	}

	public void setTotalAmountOfInvestment(String totalAmountOfInvestment) {
		this.totalAmountOfInvestment = totalAmountOfInvestment;
	}
	
	@Length(min=0, max=55, message="投注人数长度必须介于 0 和 55 之间")
	public String getTotalPeopleOfInvestment() {
		return totalPeopleOfInvestment;
	}

	public void setTotalPeopleOfInvestment(String totalPeopleOfInvestment) {
		this.totalPeopleOfInvestment = totalPeopleOfInvestment;
	}
	
	@Length(min=0, max=155, message="玩家赢亏长度必须介于 0 和 155 之间")
	public String getPlayerWinLoss() {
		return playerWinLoss;
	}

	public void setPlayerWinLoss(String playerWinLoss) {
		this.playerWinLoss = playerWinLoss;
	}
	
}