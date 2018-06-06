/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.virtualnumberset.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 虚拟人数设置Entity
 * @author ddd
 * @version 2018-05-09
 */
public class VirtualNumberSet extends DataEntity<VirtualNumberSet> {
	
	private static final long serialVersionUID = 1L;
	private String roomnumber;		// 房间编号
	private String gameroomId;		// 游戏房间ID
	private String begintime;		// 开始时间
	private String endtime;		// 截止时间
	private Integer virtualNumber;		// 虚拟人数
	private Integer virtualNumberMax;		// 虚拟人数最大值
	
	public VirtualNumberSet() {
		super();
	}

	public VirtualNumberSet(String id){
		super(id);
	}

	public Integer getVirtualNumberMax() {
		return virtualNumberMax;
	}

	public void setVirtualNumberMax(Integer virtualNumberMax) {
		this.virtualNumberMax = virtualNumberMax;
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
	
	@Length(min=0, max=30, message="开始时间长度必须介于 0 和 30 之间")
	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	
	@Length(min=0, max=30, message="截止时间长度必须介于 0 和 30 之间")
	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	public Integer getVirtualNumber() {
		return virtualNumber;
	}

	public void setVirtualNumber(Integer virtualNumber) {
		this.virtualNumber = virtualNumber;
	}
	
}