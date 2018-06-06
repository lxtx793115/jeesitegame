/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.currentstatistics.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 当期统计Entity
 * @author ss
 * @version 2018-05-21
 */
public class GameCurrentStatistics extends DataEntity<GameCurrentStatistics> {
	
	private static final long serialVersionUID = 1L;
	private String gameroomId;		// 游戏房间ID
	private String roomnumber;		// 房间编号
	private String roomname;		// 房间名称
	private String da;		// 大
	private String dan;		// 单
	private String shuang;		// 双
	private String xiao;		// 小
	private String dadan;		// 大单
	private String dashuang;		// 大双
	private String xiaodan;		// 小单
	private String xiaoshuang;		// 小双
	private String jida;		// 极大
	private String jixiao;		// 极小
	private String hongbo;		// 红波
	private String lanbo;		// 蓝波
	private String lvbo;		// 绿波
	private String baizi;		// 豹子
	private String shunzi;		// 顺子
	private String duizi;		// 对子
	private String tema0;		// 特码0
	private String tema1;		// 特码1
	private String tema2;		// 特码2
	private String tema3;		// 特码3
	private String tema4;		// 特码4
	private String tema5;		// 特码5
	private String tema6;		// 特码6
	private String tema7;		// 特码7
	private String tema8;		// 特码8
	private String tema9;		// 特码9
	private String tema10;		// 特码10
	private String tema11;		// 特码11
	private String tema12;		// 特码12
	private String tema13;		// 特码13
	private String tema14;		// 特码14
	private String tema15;		// 特码15
	private String tema16;		// 特码16
	private String tema17;		// 特码17
	private String tema18;		// 特码18
	private String tema19;		// 特码19
	private String tema20;		// 特码20
	private String tema21;		// 特码21
	private String tema22;		// 特码22
	private String tema23;		// 特码23
	private String tema24;		// 特码24
	private String tema25;		// 特码25
	private String tema26;		// 特码26
	private String tema27;		// 特码27
	
	public GameCurrentStatistics() {
		super();
	}

	public GameCurrentStatistics(String id){
		super(id);
	}

	@Length(min=1, max=64, message="游戏房间ID长度必须介于 1 和 64 之间")
	public String getGameroomId() {
		return gameroomId;
	}

	public void setGameroomId(String gameroomId) {
		this.gameroomId = gameroomId;
	}
	
	@Length(min=1, max=20, message="房间编号长度必须介于 1 和 20 之间")
	public String getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}
	
	@Length(min=0, max=55, message="房间名称长度必须介于 0 和 55 之间")
	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	
	@Length(min=0, max=20, message="大长度必须介于 0 和 20 之间")
	public String getDa() {
		return da;
	}

	public void setDa(String da) {
		this.da = da;
	}
	
	@Length(min=0, max=20, message="单长度必须介于 0 和 20 之间")
	public String getDan() {
		return dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}
	
	@Length(min=0, max=20, message="双长度必须介于 0 和 20 之间")
	public String getShuang() {
		return shuang;
	}

	public void setShuang(String shuang) {
		this.shuang = shuang;
	}
	
	@Length(min=0, max=20, message="小长度必须介于 0 和 20 之间")
	public String getXiao() {
		return xiao;
	}

	public void setXiao(String xiao) {
		this.xiao = xiao;
	}
	
	@Length(min=0, max=20, message="大单长度必须介于 0 和 20 之间")
	public String getDadan() {
		return dadan;
	}

	public void setDadan(String dadan) {
		this.dadan = dadan;
	}
	
	@Length(min=0, max=20, message="大双长度必须介于 0 和 20 之间")
	public String getDashuang() {
		return dashuang;
	}

	public void setDashuang(String dashuang) {
		this.dashuang = dashuang;
	}
	
	@Length(min=0, max=20, message="小单长度必须介于 0 和 20 之间")
	public String getXiaodan() {
		return xiaodan;
	}

	public void setXiaodan(String xiaodan) {
		this.xiaodan = xiaodan;
	}
	
	@Length(min=0, max=20, message="小双长度必须介于 0 和 20 之间")
	public String getXiaoshuang() {
		return xiaoshuang;
	}

	public void setXiaoshuang(String xiaoshuang) {
		this.xiaoshuang = xiaoshuang;
	}
	
	@Length(min=0, max=20, message="极大长度必须介于 0 和 20 之间")
	public String getJida() {
		return jida;
	}

	public void setJida(String jida) {
		this.jida = jida;
	}
	
	@Length(min=0, max=20, message="极小长度必须介于 0 和 20 之间")
	public String getJixiao() {
		return jixiao;
	}

	public void setJixiao(String jixiao) {
		this.jixiao = jixiao;
	}
	
	@Length(min=0, max=20, message="红波长度必须介于 0 和 20 之间")
	public String getHongbo() {
		return hongbo;
	}

	public void setHongbo(String hongbo) {
		this.hongbo = hongbo;
	}
	
	@Length(min=0, max=20, message="蓝波长度必须介于 0 和 20 之间")
	public String getLanbo() {
		return lanbo;
	}

	public void setLanbo(String lanbo) {
		this.lanbo = lanbo;
	}
	
	@Length(min=0, max=20, message="绿波长度必须介于 0 和 20 之间")
	public String getLvbo() {
		return lvbo;
	}

	public void setLvbo(String lvbo) {
		this.lvbo = lvbo;
	}
	
	@Length(min=0, max=20, message="豹子长度必须介于 0 和 20 之间")
	public String getBaizi() {
		return baizi;
	}

	public void setBaizi(String baizi) {
		this.baizi = baizi;
	}
	
	@Length(min=0, max=20, message="顺子长度必须介于 0 和 20 之间")
	public String getShunzi() {
		return shunzi;
	}

	public void setShunzi(String shunzi) {
		this.shunzi = shunzi;
	}
	
	@Length(min=0, max=20, message="对子长度必须介于 0 和 20 之间")
	public String getDuizi() {
		return duizi;
	}

	public void setDuizi(String duizi) {
		this.duizi = duizi;
	}
	
	@Length(min=0, max=20, message="特码0长度必须介于 0 和 20 之间")
	public String getTema0() {
		return tema0;
	}

	public void setTema0(String tema0) {
		this.tema0 = tema0;
	}
	
	@Length(min=0, max=20, message="特码1长度必须介于 0 和 20 之间")
	public String getTema1() {
		return tema1;
	}

	public void setTema1(String tema1) {
		this.tema1 = tema1;
	}
	
	@Length(min=0, max=20, message="特码2长度必须介于 0 和 20 之间")
	public String getTema2() {
		return tema2;
	}

	public void setTema2(String tema2) {
		this.tema2 = tema2;
	}
	
	@Length(min=0, max=20, message="特码3长度必须介于 0 和 20 之间")
	public String getTema3() {
		return tema3;
	}

	public void setTema3(String tema3) {
		this.tema3 = tema3;
	}
	
	@Length(min=0, max=20, message="特码4长度必须介于 0 和 20 之间")
	public String getTema4() {
		return tema4;
	}

	public void setTema4(String tema4) {
		this.tema4 = tema4;
	}
	
	@Length(min=0, max=20, message="特码5长度必须介于 0 和 20 之间")
	public String getTema5() {
		return tema5;
	}

	public void setTema5(String tema5) {
		this.tema5 = tema5;
	}
	
	@Length(min=0, max=20, message="特码6长度必须介于 0 和 20 之间")
	public String getTema6() {
		return tema6;
	}

	public void setTema6(String tema6) {
		this.tema6 = tema6;
	}
	
	@Length(min=0, max=20, message="特码7长度必须介于 0 和 20 之间")
	public String getTema7() {
		return tema7;
	}

	public void setTema7(String tema7) {
		this.tema7 = tema7;
	}
	
	@Length(min=0, max=20, message="特码8长度必须介于 0 和 20 之间")
	public String getTema8() {
		return tema8;
	}

	public void setTema8(String tema8) {
		this.tema8 = tema8;
	}
	
	@Length(min=0, max=20, message="特码9长度必须介于 0 和 20 之间")
	public String getTema9() {
		return tema9;
	}

	public void setTema9(String tema9) {
		this.tema9 = tema9;
	}
	
	@Length(min=0, max=20, message="特码10长度必须介于 0 和 20 之间")
	public String getTema10() {
		return tema10;
	}

	public void setTema10(String tema10) {
		this.tema10 = tema10;
	}
	
	@Length(min=0, max=20, message="特码11长度必须介于 0 和 20 之间")
	public String getTema11() {
		return tema11;
	}

	public void setTema11(String tema11) {
		this.tema11 = tema11;
	}
	
	@Length(min=0, max=20, message="特码12长度必须介于 0 和 20 之间")
	public String getTema12() {
		return tema12;
	}

	public void setTema12(String tema12) {
		this.tema12 = tema12;
	}
	
	@Length(min=0, max=20, message="特码13长度必须介于 0 和 20 之间")
	public String getTema13() {
		return tema13;
	}

	public void setTema13(String tema13) {
		this.tema13 = tema13;
	}
	
	@Length(min=0, max=20, message="特码14长度必须介于 0 和 20 之间")
	public String getTema14() {
		return tema14;
	}

	public void setTema14(String tema14) {
		this.tema14 = tema14;
	}
	
	@Length(min=0, max=20, message="特码15长度必须介于 0 和 20 之间")
	public String getTema15() {
		return tema15;
	}

	public void setTema15(String tema15) {
		this.tema15 = tema15;
	}
	
	@Length(min=0, max=20, message="特码16长度必须介于 0 和 20 之间")
	public String getTema16() {
		return tema16;
	}

	public void setTema16(String tema16) {
		this.tema16 = tema16;
	}
	
	@Length(min=0, max=20, message="特码17长度必须介于 0 和 20 之间")
	public String getTema17() {
		return tema17;
	}

	public void setTema17(String tema17) {
		this.tema17 = tema17;
	}
	
	@Length(min=0, max=20, message="特码18长度必须介于 0 和 20 之间")
	public String getTema18() {
		return tema18;
	}

	public void setTema18(String tema18) {
		this.tema18 = tema18;
	}
	
	@Length(min=0, max=20, message="特码19长度必须介于 0 和 20 之间")
	public String getTema19() {
		return tema19;
	}

	public void setTema19(String tema19) {
		this.tema19 = tema19;
	}
	
	@Length(min=0, max=20, message="特码20长度必须介于 0 和 20 之间")
	public String getTema20() {
		return tema20;
	}

	public void setTema20(String tema20) {
		this.tema20 = tema20;
	}
	
	@Length(min=0, max=20, message="特码21长度必须介于 0 和 20 之间")
	public String getTema21() {
		return tema21;
	}

	public void setTema21(String tema21) {
		this.tema21 = tema21;
	}
	
	@Length(min=0, max=20, message="特码22长度必须介于 0 和 20 之间")
	public String getTema22() {
		return tema22;
	}

	public void setTema22(String tema22) {
		this.tema22 = tema22;
	}
	
	@Length(min=0, max=20, message="特码23长度必须介于 0 和 20 之间")
	public String getTema23() {
		return tema23;
	}

	public void setTema23(String tema23) {
		this.tema23 = tema23;
	}
	
	@Length(min=0, max=20, message="特码24长度必须介于 0 和 20 之间")
	public String getTema24() {
		return tema24;
	}

	public void setTema24(String tema24) {
		this.tema24 = tema24;
	}
	
	@Length(min=0, max=20, message="特码25长度必须介于 0 和 20 之间")
	public String getTema25() {
		return tema25;
	}

	public void setTema25(String tema25) {
		this.tema25 = tema25;
	}
	
	@Length(min=0, max=20, message="特码26长度必须介于 0 和 20 之间")
	public String getTema26() {
		return tema26;
	}

	public void setTema26(String tema26) {
		this.tema26 = tema26;
	}
	
	@Length(min=0, max=20, message="特码27长度必须介于 0 和 20 之间")
	public String getTema27() {
		return tema27;
	}

	public void setTema27(String tema27) {
		this.tema27 = tema27;
	}
	
}