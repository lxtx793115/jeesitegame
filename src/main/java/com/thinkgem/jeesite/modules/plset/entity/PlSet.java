/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plset.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 赔率设置Entity
 * @author ss
 * @version 2018-05-07
 */
public class PlSet extends DataEntity<PlSet> {
	
	private static final long serialVersionUID = 1L;
	private String gameroomId;		// 游戏房间ID
	private String roomnumber;		//房间编号
	public String getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}

	private Double xiaoPl;		// 小
	private Double daPl;		// 大
	private Double danPl;		// 单
	private Double shuangPl;		// 双
	private Double dadanPl;		// 大单
	private Double dashuangPl;		// 大双
	private Double xiaodanPl;		// 小单
	private Double xiaoshuangPl;		// 小双
	private Double jidaPl;		// 极大
	private Double jixiaoPl;		// 极小
	private Double hongboPl;		// 红波
	private Double lanboPl;		// 蓝波
	private Double lvboPl;		// 绿波
	private Double baiziPl;		// 豹子
	private Double shunziPl;		// 顺子
	private Double duiziPl;		// 对子
	private Double tema0Pl;		// 特码0
	private Double tema1Pl;		// 特码1
	private Double tema2Pl;		// 特码2
	private Double tema3Pl;		// 特码3
	private Double tema4Pl;		// 特码4
	private Double tema5Pl;		// 特码5
	private Double tema6Pl;		// 特码6
	private Double tema7Pl;		// 特码7
	private Double tema8Pl;		// 特码8
	private Double tema9Pl;		// 特码9
	private Double tema10Pl;		// 特码10
	private Double tema11Pl;		// 特码11
	private Double tema12Pl;		// 特码12
	private Double tema13Pl;		// 特码13
	private Double tema14Pl;		// 特码14
	private Double tema15Pl;		// 特码15
	private Double tema16Pl;		// 特码16
	private Double tema17Pl;		// 特码17
	private Double tema18Pl;		// 特码18
	private Double tema19Pl;		// 特码19
	private Double tema20Pl;		// 特码20
	private Double tema21Pl;		// 特码21
	private Double tema22Pl;		// 特码22
	private Double tema23Pl;		// 特码23
	private Double tema24Pl;		// 特码24
	private Double tema25Pl;		// 特码25
	private Double tema26Pl;		// 特码26
	private Double tema27Pl;		// 特码27
	
	public PlSet() {
		super();
	}

	public PlSet(String id){
		super(id);
	}

	@Length(min=1, max=64, message="游戏房间ID长度必须介于 1 和 64 之间")
	public String getGameroomId() {
		return gameroomId;
	}

	public void setGameroomId(String gameroomId) {
		this.gameroomId = gameroomId;
	}
	
	public Double getXiaoPl() {
		return xiaoPl;
	}

	public void setXiaoPl(Double xiaoPl) {
		this.xiaoPl = xiaoPl;
	}
	
	public Double getDaPl() {
		return daPl;
	}

	public void setDaPl(Double daPl) {
		this.daPl = daPl;
	}
	
	public Double getDanPl() {
		return danPl;
	}

	public void setDanPl(Double danPl) {
		this.danPl = danPl;
	}
	
	public Double getShuangPl() {
		return shuangPl;
	}

	public void setShuangPl(Double shuangPl) {
		this.shuangPl = shuangPl;
	}
	
	public Double getDadanPl() {
		return dadanPl;
	}

	public void setDadanPl(Double dadanPl) {
		this.dadanPl = dadanPl;
	}
	
	public Double getDashuangPl() {
		return dashuangPl;
	}

	public void setDashuangPl(Double dashuangPl) {
		this.dashuangPl = dashuangPl;
	}
	
	public Double getXiaodanPl() {
		return xiaodanPl;
	}

	public void setXiaodanPl(Double xiaodanPl) {
		this.xiaodanPl = xiaodanPl;
	}
	
	public Double getXiaoshuangPl() {
		return xiaoshuangPl;
	}

	public void setXiaoshuangPl(Double xiaoshuangPl) {
		this.xiaoshuangPl = xiaoshuangPl;
	}
	
	public Double getJidaPl() {
		return jidaPl;
	}

	public void setJidaPl(Double jidaPl) {
		this.jidaPl = jidaPl;
	}
	
	public Double getJixiaoPl() {
		return jixiaoPl;
	}

	public void setJixiaoPl(Double jixiaoPl) {
		this.jixiaoPl = jixiaoPl;
	}
	
	public Double getHongboPl() {
		return hongboPl;
	}

	public void setHongboPl(Double hongboPl) {
		this.hongboPl = hongboPl;
	}
	
	public Double getLanboPl() {
		return lanboPl;
	}

	public void setLanboPl(Double lanboPl) {
		this.lanboPl = lanboPl;
	}
	
	public Double getLvboPl() {
		return lvboPl;
	}

	public void setLvboPl(Double lvboPl) {
		this.lvboPl = lvboPl;
	}
	
	public Double getBaiziPl() {
		return baiziPl;
	}

	public void setBaiziPl(Double baiziPl) {
		this.baiziPl = baiziPl;
	}
	
	public Double getShunziPl() {
		return shunziPl;
	}

	public void setShunziPl(Double shunziPl) {
		this.shunziPl = shunziPl;
	}
	
	public Double getDuiziPl() {
		return duiziPl;
	}

	public void setDuiziPl(Double duiziPl) {
		this.duiziPl = duiziPl;
	}
	
	public Double getTema0Pl() {
		return tema0Pl;
	}

	public void setTema0Pl(Double tema0Pl) {
		this.tema0Pl = tema0Pl;
	}
	
	public Double getTema1Pl() {
		return tema1Pl;
	}

	public void setTema1Pl(Double tema1Pl) {
		this.tema1Pl = tema1Pl;
	}
	
	public Double getTema2Pl() {
		return tema2Pl;
	}

	public void setTema2Pl(Double tema2Pl) {
		this.tema2Pl = tema2Pl;
	}
	
	public Double getTema3Pl() {
		return tema3Pl;
	}

	public void setTema3Pl(Double tema3Pl) {
		this.tema3Pl = tema3Pl;
	}
	
	public Double getTema4Pl() {
		return tema4Pl;
	}

	public void setTema4Pl(Double tema4Pl) {
		this.tema4Pl = tema4Pl;
	}
	
	public Double getTema5Pl() {
		return tema5Pl;
	}

	public void setTema5Pl(Double tema5Pl) {
		this.tema5Pl = tema5Pl;
	}
	
	public Double getTema6Pl() {
		return tema6Pl;
	}

	public void setTema6Pl(Double tema6Pl) {
		this.tema6Pl = tema6Pl;
	}
	
	public Double getTema7Pl() {
		return tema7Pl;
	}

	public void setTema7Pl(Double tema7Pl) {
		this.tema7Pl = tema7Pl;
	}
	
	public Double getTema8Pl() {
		return tema8Pl;
	}

	public void setTema8Pl(Double tema8Pl) {
		this.tema8Pl = tema8Pl;
	}
	
	public Double getTema9Pl() {
		return tema9Pl;
	}

	public void setTema9Pl(Double tema9Pl) {
		this.tema9Pl = tema9Pl;
	}
	
	public Double getTema10Pl() {
		return tema10Pl;
	}

	public void setTema10Pl(Double tema10Pl) {
		this.tema10Pl = tema10Pl;
	}
	
	public Double getTema11Pl() {
		return tema11Pl;
	}

	public void setTema11Pl(Double tema11Pl) {
		this.tema11Pl = tema11Pl;
	}
	
	public Double getTema12Pl() {
		return tema12Pl;
	}

	public void setTema12Pl(Double tema12Pl) {
		this.tema12Pl = tema12Pl;
	}
	
	public Double getTema13Pl() {
		return tema13Pl;
	}

	public void setTema13Pl(Double tema13Pl) {
		this.tema13Pl = tema13Pl;
	}
	
	public Double getTema14Pl() {
		return tema14Pl;
	}

	public void setTema14Pl(Double tema14Pl) {
		this.tema14Pl = tema14Pl;
	}
	
	public Double getTema15Pl() {
		return tema15Pl;
	}

	public void setTema15Pl(Double tema15Pl) {
		this.tema15Pl = tema15Pl;
	}
	
	public Double getTema16Pl() {
		return tema16Pl;
	}

	public void setTema16Pl(Double tema16Pl) {
		this.tema16Pl = tema16Pl;
	}
	
	public Double getTema17Pl() {
		return tema17Pl;
	}

	public void setTema17Pl(Double tema17Pl) {
		this.tema17Pl = tema17Pl;
	}
	
	public Double getTema18Pl() {
		return tema18Pl;
	}

	public void setTema18Pl(Double tema18Pl) {
		this.tema18Pl = tema18Pl;
	}
	
	public Double getTema19Pl() {
		return tema19Pl;
	}

	public void setTema19Pl(Double tema19Pl) {
		this.tema19Pl = tema19Pl;
	}
	
	public Double getTema20Pl() {
		return tema20Pl;
	}

	public void setTema20Pl(Double tema20Pl) {
		this.tema20Pl = tema20Pl;
	}
	
	public Double getTema21Pl() {
		return tema21Pl;
	}

	public void setTema21Pl(Double tema21Pl) {
		this.tema21Pl = tema21Pl;
	}
	
	public Double getTema22Pl() {
		return tema22Pl;
	}

	public void setTema22Pl(Double tema22Pl) {
		this.tema22Pl = tema22Pl;
	}
	
	public Double getTema23Pl() {
		return tema23Pl;
	}

	public void setTema23Pl(Double tema23Pl) {
		this.tema23Pl = tema23Pl;
	}
	
	public Double getTema24Pl() {
		return tema24Pl;
	}

	public void setTema24Pl(Double tema24Pl) {
		this.tema24Pl = tema24Pl;
	}
	
	public Double getTema25Pl() {
		return tema25Pl;
	}

	public void setTema25Pl(Double tema25Pl) {
		this.tema25Pl = tema25Pl;
	}
	
	public Double getTema26Pl() {
		return tema26Pl;
	}

	public void setTema26Pl(Double tema26Pl) {
		this.tema26Pl = tema26Pl;
	}
	
	public Double getTema27Pl() {
		return tema27Pl;
	}

	public void setTema27Pl(Double tema27Pl) {
		this.tema27Pl = tema27Pl;
	}
	
}