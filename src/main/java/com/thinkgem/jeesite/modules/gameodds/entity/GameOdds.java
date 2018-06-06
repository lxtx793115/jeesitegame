/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameodds.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 游戏赔率Entity
 * @author cy
 * @version 2018-04-19
 */
public class GameOdds extends DataEntity<GameOdds> {
	
	private static final long serialVersionUID = 1L;
	private String roomId;		// 房间id
	private float da;		// 大
	private float xiao;		// 小
	private float dan;		// 单
	private float shuang;		// 双
	private float dadan;		// 大单
	private float dashuang;		// 大双
	private float xiaodan;		// 小双
	private float xiaoshaung;		// 小双
	private float jida;		// 极大
	private float jixiao;		// 极小
	private float hongbo;		// 洪波
	private float lanbo;		// 蓝波
	private float lvbo;		// 绿波
	private float baozi;		// 豹子
	private float shunzi;		// 顺子
	private float duizi;		// 对子
	
	public GameOdds() {
		super();
	}
	public GameOdds(String id){
		super(id);
	}
	//@Length(min=1, max=32, message="房间id长度必须介于 1 和 32 之间")
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public float getDa() {
		return da;
	}
	public void setDa(float da) {
		this.da = da;
	}
	public float getXiao() {
		return xiao;
	}
	public void setXiao(float xiao) {
		this.xiao = xiao;
	}
	public float getDan() {
		return dan;
	}
	public void setDan(float dan) {
		this.dan = dan;
	}
	public float getShuang() {
		return shuang;
	}
	public void setShuang(float shuang) {
		this.shuang = shuang;
	}
	public float getDadan() {
		return dadan;
	}
	public void setDadan(float dadan) {
		this.dadan = dadan;
	}
	public float getDashuang() {
		return dashuang;
	}
	public void setDashuang(float dashuang) {
		this.dashuang = dashuang;
	}
	public float getXiaodan() {
		return xiaodan;
	}
	public void setXiaodan(float xiaodan) {
		this.xiaodan = xiaodan;
	}
	public float getXiaoshaung() {
		return xiaoshaung;
	}
	public void setXiaoshaung(float xiaoshaung) {
		this.xiaoshaung = xiaoshaung;
	}
	public float getJida() {
		return jida;
	}
	public void setJida(float jida) {
		this.jida = jida;
	}
	public float getJixiao() {
		return jixiao;
	}
	public void setJixiao(float jixiao) {
		this.jixiao = jixiao;
	}
	public float getHongbo() {
		return hongbo;
	}
	public void setHongbo(float hongbo) {
		this.hongbo = hongbo;
	}
	public float getLanbo() {
		return lanbo;
	}
	public void setLanbo(float lanbo) {
		this.lanbo = lanbo;
	}
	public float getLvbo() {
		return lvbo;
	}
	public void setLvbo(float lvbo) {
		this.lvbo = lvbo;
	}
	public float getBaozi() {
		return baozi;
	}
	public void setBaozi(float baozi) {
		this.baozi = baozi;
	}
	public float getShunzi() {
		return shunzi;
	}
	public void setShunzi(float shunzi) {
		this.shunzi = shunzi;
	}
	public float getDuizi() {
		return duizi;
	}
	public void setDuizi(float duizi) {
		this.duizi = duizi;
	}
}