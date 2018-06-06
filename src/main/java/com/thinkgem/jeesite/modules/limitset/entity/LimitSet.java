/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.limitset.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 限额设置Entity
 * @author ddd
 * @version 2018-05-09
 */
public class LimitSet extends DataEntity<LimitSet> {
	
	private static final long serialVersionUID = 1L;
	private String roomnumber;		// 房间编号
	private String gameroomId;		// 游戏房间ID
	private Integer totalQuota;		// 总额度
	private Integer temaMin;		// 特码最小
	private Integer temaMax;		// 特码最大
	private Integer daxiaodanshuangMin;		// 大小单双最小
	private Integer daxiaodanshuangMax;		// 大小单双最大
	private Integer zuhedanshuangMin;		// 组合单双最小
	private Integer zuhedanshuangMax;		// 组合单双最大
	private Integer jizhiMin;		// 极值最小
	private Integer jizhiMax;		// 极值最大
	private Integer bosheMin;		// 波色最小
	private Integer bosheMax;		// 波色最大
	private Integer baoziduiziMin;		// 豹子对子最小
	private Integer baoziduiziMax;		// 豹子对子最大
	
	public LimitSet() {
		super();
	}

	public LimitSet(String id){
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
	
	public Integer getTotalQuota() {
		return totalQuota;
	}

	public void setTotalQuota(Integer totalQuota) {
		this.totalQuota = totalQuota;
	}
	
	public Integer getTemaMin() {
		return temaMin;
	}

	public void setTemaMin(Integer temaMin) {
		this.temaMin = temaMin;
	}
	
	public Integer getTemaMax() {
		return temaMax;
	}

	public void setTemaMax(Integer temaMax) {
		this.temaMax = temaMax;
	}
	
	public Integer getDaxiaodanshuangMin() {
		return daxiaodanshuangMin;
	}

	public void setDaxiaodanshuangMin(Integer daxiaodanshuangMin) {
		this.daxiaodanshuangMin = daxiaodanshuangMin;
	}
	
	public Integer getDaxiaodanshuangMax() {
		return daxiaodanshuangMax;
	}

	public void setDaxiaodanshuangMax(Integer daxiaodanshuangMax) {
		this.daxiaodanshuangMax = daxiaodanshuangMax;
	}
	
	public Integer getZuhedanshuangMin() {
		return zuhedanshuangMin;
	}

	public void setZuhedanshuangMin(Integer zuhedanshuangMin) {
		this.zuhedanshuangMin = zuhedanshuangMin;
	}
	
	public Integer getZuhedanshuangMax() {
		return zuhedanshuangMax;
	}

	public void setZuhedanshuangMax(Integer zuhedanshuangMax) {
		this.zuhedanshuangMax = zuhedanshuangMax;
	}
	
	public Integer getJizhiMin() {
		return jizhiMin;
	}

	public void setJizhiMin(Integer jizhiMin) {
		this.jizhiMin = jizhiMin;
	}
	
	public Integer getJizhiMax() {
		return jizhiMax;
	}

	public void setJizhiMax(Integer jizhiMax) {
		this.jizhiMax = jizhiMax;
	}
	
	public Integer getBosheMin() {
		return bosheMin;
	}

	public void setBosheMin(Integer bosheMin) {
		this.bosheMin = bosheMin;
	}
	
	public Integer getBosheMax() {
		return bosheMax;
	}

	public void setBosheMax(Integer bosheMax) {
		this.bosheMax = bosheMax;
	}
	
	public Integer getBaoziduiziMin() {
		return baoziduiziMin;
	}

	public void setBaoziduiziMin(Integer baoziduiziMin) {
		this.baoziduiziMin = baoziduiziMin;
	}
	
	public Integer getBaoziduiziMax() {
		return baoziduiziMax;
	}

	public void setBaoziduiziMax(Integer baoziduiziMax) {
		this.baoziduiziMax = baoziduiziMax;
	}
	
}