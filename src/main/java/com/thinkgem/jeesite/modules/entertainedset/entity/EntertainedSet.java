/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.entertainedset.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 封盘设置Entity
 * @author ss
 * @version 2018-05-10
 */
public class EntertainedSet extends DataEntity<EntertainedSet> {
	
	private static final long serialVersionUID = 1L;
	private String roomnumber;		// 房间编号
	private String gameroomId;		// 游戏房间ID
	private Integer countdown;		// 倒计时
	private String promptStyle;		// 提示类型
	private String prompt;		// 提示语
	
	public String getPromptStyle() {
		return promptStyle;
	}

	public void setPromptStyle(String promptStyle) {
		this.promptStyle = promptStyle;
	}

	public EntertainedSet() {
		super();
	}

	public EntertainedSet(String id){
		super(id);
	}

	@Length(min=1, max=20, message="房间编号长度必须介于 1 和 20 之间")
	public String getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}
	
	@Length(min=1, max=64, message="游戏房间ID长度必须介于 1 和 64 之间")
	public String getGameroomId() {
		return gameroomId;
	}

	public void setGameroomId(String gameroomId) {
		this.gameroomId = gameroomId;
	}
	
	public Integer getCountdown() {
		return countdown;
	}

	public void setCountdown(Integer countdown) {
		this.countdown = countdown;
	}
	
	
	@Length(min=0, max=3550, message="提示语长度必须介于 0 和 3550 之间")
	public String getPrompt() {
		return prompt;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}
	
}