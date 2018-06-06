/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plset1314.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 13|14赔率Entity
 * @author ddd
 * @version 2018-05-08
 */
public class PlSet1314 extends DataEntity<PlSet1314> {
	
	private static final long serialVersionUID = 1L;
	private String roomnumber;		// 房间编号
	private String gameroomId;		// 游戏房间ID
	private Double dxdsSum1;		// 大小单双金额1
	private Double dxdsPrice1;		// 大小单双赔率1
	private Double dxdsSum2;		// 大小单双金额2
	private Double dxdsPrice2;		// 大小单双赔率2
	private Double dxdsPrice3;		// 大小单双赔率3
	private Double combinationSum1;		// 组合金额1
	private Double combinationPrice1;		// 组合赔率1
	private Double combinationSum2;		// 组合金额2
	private Double combinationPrice2;		// 组合赔率2
	private Double combinationPrice3;		// 组合赔率3
	private Double baoziPrice;		// 豹子赔率
	private Double duiziPrice;		// 对子赔率
	
	public PlSet1314() {
		super();
	}

	public PlSet1314(String id){
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
	
	public Double getDxdsSum1() {
		return dxdsSum1;
	}

	public void setDxdsSum1(Double dxdsSum1) {
		this.dxdsSum1 = dxdsSum1;
	}
	
	public Double getDxdsPrice1() {
		return dxdsPrice1;
	}

	public void setDxdsPrice1(Double dxdsPrice1) {
		this.dxdsPrice1 = dxdsPrice1;
	}
	
	public Double getDxdsSum2() {
		return dxdsSum2;
	}

	public void setDxdsSum2(Double dxdsSum2) {
		this.dxdsSum2 = dxdsSum2;
	}
	
	public Double getDxdsPrice2() {
		return dxdsPrice2;
	}

	public void setDxdsPrice2(Double dxdsPrice2) {
		this.dxdsPrice2 = dxdsPrice2;
	}
	
	public Double getDxdsPrice3() {
		return dxdsPrice3;
	}

	public void setDxdsPrice3(Double dxdsPrice3) {
		this.dxdsPrice3 = dxdsPrice3;
	}
	
	public Double getCombinationSum1() {
		return combinationSum1;
	}

	public void setCombinationSum1(Double combinationSum1) {
		this.combinationSum1 = combinationSum1;
	}
	
	public Double getCombinationPrice1() {
		return combinationPrice1;
	}

	public void setCombinationPrice1(Double combinationPrice1) {
		this.combinationPrice1 = combinationPrice1;
	}
	
	public Double getCombinationSum2() {
		return combinationSum2;
	}

	public void setCombinationSum2(Double combinationSum2) {
		this.combinationSum2 = combinationSum2;
	}
	
	public Double getCombinationPrice2() {
		return combinationPrice2;
	}

	public void setCombinationPrice2(Double combinationPrice2) {
		this.combinationPrice2 = combinationPrice2;
	}
	
	public Double getCombinationPrice3() {
		return combinationPrice3;
	}

	public void setCombinationPrice3(Double combinationPrice3) {
		this.combinationPrice3 = combinationPrice3;
	}
	
	public Double getBaoziPrice() {
		return baoziPrice;
	}

	public void setBaoziPrice(Double baoziPrice) {
		this.baoziPrice = baoziPrice;
	}
	
	public Double getDuiziPrice() {
		return duiziPrice;
	}

	public void setDuiziPrice(Double duiziPrice) {
		this.duiziPrice = duiziPrice;
	}
	
}