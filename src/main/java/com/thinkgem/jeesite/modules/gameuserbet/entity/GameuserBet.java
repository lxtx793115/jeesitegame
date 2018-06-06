/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserbet.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户投注记录Entity
 * @author ss
 * @version 2018-05-21
 */
public class GameuserBet extends DataEntity<GameuserBet> {
	
	private static final long serialVersionUID = 1L;
	private String gameroomId;		// 游戏房间ID
	private String roomnumber;		// 房间编号
	private String roomname;		// 房间名称
	private String username;		// 用户名
	private String nickname;		// 昵称
	private String gameuserid;		// 用户ID
	private String userDa;		// 大
	private String userDan;		// 单
	private String userShuang;		// 双
	private String userXiao;		// 小
	private String userDadan;		// 大单
	private String userDashuang;		// 大双
	private String userXiaodan;		// 小单
	private String xiaoshuang;		// 小双
	private String userJida;		// 极大
	private String userJixiao;		// 极小
	private String userHongbo;		// 红波
	private String userLanbo;		// 蓝波
	private String userLvbo;		// 绿波
	private String userBaizi;		// 豹子
	private String userShunzi;		// 顺子
	private String userDuizi;		// 对子
	private String userTema0;		// 特码0
	private String userTema1;		// 特码1
	private String userTema2;		// 特码2
	private String userTema3;		// 特码3
	private String userTema4;		// 特码4
	private String userTema5;		// 特码5
	private String userTema6;		// 特码6
	private String userTema7;		// 特码7
	private String userTema8;		// 特码8
	private String userTema9;		// 特码9
	private String userTema10;		// 特码10
	private String userTema11;		// 特码11
	private String userTema12;		// 特码12
	private String userTema13;		// 特码13
	private String userTema14;		// 特码14
	private String userTema15;		// 特码15
	private String userTema16;		// 特码16
	private String userTema17;		// 特码17
	private String userTema18;		// 特码18
	private String userTema19;		// 特码19
	private String userTema20;		// 特码20
	private String userTema21;		// 特码21
	private String userTema22;		// 特码22
	private String userTema23;		// 特码23
	private String userTema24;		// 特码24
	private String userTema25;		// 特码25
	private String userTema26;		// 特码26
	private String userTema27;		// 特码27
	
	public GameuserBet() {
		super();
	}

	public GameuserBet(String id){
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
	
	@Length(min=0, max=55, message="用户名长度必须介于 0 和 55 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Length(min=0, max=55, message="昵称长度必须介于 0 和 55 之间")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Length(min=1, max=64, message="用户ID长度必须介于 1 和 64 之间")
	public String getGameuserid() {
		return gameuserid;
	}

	public void setGameuserid(String gameuserid) {
		this.gameuserid = gameuserid;
	}
	
	@Length(min=0, max=20, message="大长度必须介于 0 和 20 之间")
	public String getUserDa() {
		return userDa;
	}

	public void setUserDa(String userDa) {
		this.userDa = userDa;
	}
	
	@Length(min=0, max=20, message="单长度必须介于 0 和 20 之间")
	public String getUserDan() {
		return userDan;
	}

	public void setUserDan(String userDan) {
		this.userDan = userDan;
	}
	
	@Length(min=0, max=20, message="双长度必须介于 0 和 20 之间")
	public String getUserShuang() {
		return userShuang;
	}

	public void setUserShuang(String userShuang) {
		this.userShuang = userShuang;
	}
	
	@Length(min=0, max=20, message="小长度必须介于 0 和 20 之间")
	public String getUserXiao() {
		return userXiao;
	}

	public void setUserXiao(String userXiao) {
		this.userXiao = userXiao;
	}
	
	@Length(min=0, max=20, message="大单长度必须介于 0 和 20 之间")
	public String getUserDadan() {
		return userDadan;
	}

	public void setUserDadan(String userDadan) {
		this.userDadan = userDadan;
	}
	
	@Length(min=0, max=20, message="大双长度必须介于 0 和 20 之间")
	public String getUserDashuang() {
		return userDashuang;
	}

	public void setUserDashuang(String userDashuang) {
		this.userDashuang = userDashuang;
	}
	
	@Length(min=0, max=20, message="小单长度必须介于 0 和 20 之间")
	public String getUserXiaodan() {
		return userXiaodan;
	}

	public void setUserXiaodan(String userXiaodan) {
		this.userXiaodan = userXiaodan;
	}
	
	@Length(min=0, max=20, message="小双长度必须介于 0 和 20 之间")
	public String getXiaoshuang() {
		return xiaoshuang;
	}

	public void setXiaoshuang(String xiaoshuang) {
		this.xiaoshuang = xiaoshuang;
	}
	
	@Length(min=0, max=20, message="极大长度必须介于 0 和 20 之间")
	public String getUserJida() {
		return userJida;
	}

	public void setUserJida(String userJida) {
		this.userJida = userJida;
	}
	
	@Length(min=0, max=20, message="极小长度必须介于 0 和 20 之间")
	public String getUserJixiao() {
		return userJixiao;
	}

	public void setUserJixiao(String userJixiao) {
		this.userJixiao = userJixiao;
	}
	
	@Length(min=0, max=20, message="红波长度必须介于 0 和 20 之间")
	public String getUserHongbo() {
		return userHongbo;
	}

	public void setUserHongbo(String userHongbo) {
		this.userHongbo = userHongbo;
	}
	
	@Length(min=0, max=20, message="蓝波长度必须介于 0 和 20 之间")
	public String getUserLanbo() {
		return userLanbo;
	}

	public void setUserLanbo(String userLanbo) {
		this.userLanbo = userLanbo;
	}
	
	@Length(min=0, max=20, message="绿波长度必须介于 0 和 20 之间")
	public String getUserLvbo() {
		return userLvbo;
	}

	public void setUserLvbo(String userLvbo) {
		this.userLvbo = userLvbo;
	}
	
	@Length(min=0, max=20, message="豹子长度必须介于 0 和 20 之间")
	public String getUserBaizi() {
		return userBaizi;
	}

	public void setUserBaizi(String userBaizi) {
		this.userBaizi = userBaizi;
	}
	
	@Length(min=0, max=20, message="顺子长度必须介于 0 和 20 之间")
	public String getUserShunzi() {
		return userShunzi;
	}

	public void setUserShunzi(String userShunzi) {
		this.userShunzi = userShunzi;
	}
	
	@Length(min=0, max=20, message="对子长度必须介于 0 和 20 之间")
	public String getUserDuizi() {
		return userDuizi;
	}

	public void setUserDuizi(String userDuizi) {
		this.userDuizi = userDuizi;
	}
	
	@Length(min=0, max=20, message="特码0长度必须介于 0 和 20 之间")
	public String getUserTema0() {
		return userTema0;
	}

	public void setUserTema0(String userTema0) {
		this.userTema0 = userTema0;
	}
	
	@Length(min=0, max=20, message="特码1长度必须介于 0 和 20 之间")
	public String getUserTema1() {
		return userTema1;
	}

	public void setUserTema1(String userTema1) {
		this.userTema1 = userTema1;
	}
	
	@Length(min=0, max=20, message="特码2长度必须介于 0 和 20 之间")
	public String getUserTema2() {
		return userTema2;
	}

	public void setUserTema2(String userTema2) {
		this.userTema2 = userTema2;
	}
	
	@Length(min=0, max=20, message="特码3长度必须介于 0 和 20 之间")
	public String getUserTema3() {
		return userTema3;
	}

	public void setUserTema3(String userTema3) {
		this.userTema3 = userTema3;
	}
	
	@Length(min=0, max=20, message="特码4长度必须介于 0 和 20 之间")
	public String getUserTema4() {
		return userTema4;
	}

	public void setUserTema4(String userTema4) {
		this.userTema4 = userTema4;
	}
	
	@Length(min=0, max=20, message="特码5长度必须介于 0 和 20 之间")
	public String getUserTema5() {
		return userTema5;
	}

	public void setUserTema5(String userTema5) {
		this.userTema5 = userTema5;
	}
	
	@Length(min=0, max=20, message="特码6长度必须介于 0 和 20 之间")
	public String getUserTema6() {
		return userTema6;
	}

	public void setUserTema6(String userTema6) {
		this.userTema6 = userTema6;
	}
	
	@Length(min=0, max=20, message="特码7长度必须介于 0 和 20 之间")
	public String getUserTema7() {
		return userTema7;
	}

	public void setUserTema7(String userTema7) {
		this.userTema7 = userTema7;
	}
	
	@Length(min=0, max=20, message="特码8长度必须介于 0 和 20 之间")
	public String getUserTema8() {
		return userTema8;
	}

	public void setUserTema8(String userTema8) {
		this.userTema8 = userTema8;
	}
	
	@Length(min=0, max=20, message="特码9长度必须介于 0 和 20 之间")
	public String getUserTema9() {
		return userTema9;
	}

	public void setUserTema9(String userTema9) {
		this.userTema9 = userTema9;
	}
	
	@Length(min=0, max=20, message="特码10长度必须介于 0 和 20 之间")
	public String getUserTema10() {
		return userTema10;
	}

	public void setUserTema10(String userTema10) {
		this.userTema10 = userTema10;
	}
	
	@Length(min=0, max=20, message="特码11长度必须介于 0 和 20 之间")
	public String getUserTema11() {
		return userTema11;
	}

	public void setUserTema11(String userTema11) {
		this.userTema11 = userTema11;
	}
	
	@Length(min=0, max=20, message="特码12长度必须介于 0 和 20 之间")
	public String getUserTema12() {
		return userTema12;
	}

	public void setUserTema12(String userTema12) {
		this.userTema12 = userTema12;
	}
	
	@Length(min=0, max=20, message="特码13长度必须介于 0 和 20 之间")
	public String getUserTema13() {
		return userTema13;
	}

	public void setUserTema13(String userTema13) {
		this.userTema13 = userTema13;
	}
	
	@Length(min=0, max=20, message="特码14长度必须介于 0 和 20 之间")
	public String getUserTema14() {
		return userTema14;
	}

	public void setUserTema14(String userTema14) {
		this.userTema14 = userTema14;
	}
	
	@Length(min=0, max=20, message="特码15长度必须介于 0 和 20 之间")
	public String getUserTema15() {
		return userTema15;
	}

	public void setUserTema15(String userTema15) {
		this.userTema15 = userTema15;
	}
	
	@Length(min=0, max=20, message="特码16长度必须介于 0 和 20 之间")
	public String getUserTema16() {
		return userTema16;
	}

	public void setUserTema16(String userTema16) {
		this.userTema16 = userTema16;
	}
	
	@Length(min=0, max=20, message="特码17长度必须介于 0 和 20 之间")
	public String getUserTema17() {
		return userTema17;
	}

	public void setUserTema17(String userTema17) {
		this.userTema17 = userTema17;
	}
	
	@Length(min=0, max=20, message="特码18长度必须介于 0 和 20 之间")
	public String getUserTema18() {
		return userTema18;
	}

	public void setUserTema18(String userTema18) {
		this.userTema18 = userTema18;
	}
	
	@Length(min=0, max=20, message="特码19长度必须介于 0 和 20 之间")
	public String getUserTema19() {
		return userTema19;
	}

	public void setUserTema19(String userTema19) {
		this.userTema19 = userTema19;
	}
	
	@Length(min=0, max=20, message="特码20长度必须介于 0 和 20 之间")
	public String getUserTema20() {
		return userTema20;
	}

	public void setUserTema20(String userTema20) {
		this.userTema20 = userTema20;
	}
	
	@Length(min=0, max=20, message="特码21长度必须介于 0 和 20 之间")
	public String getUserTema21() {
		return userTema21;
	}

	public void setUserTema21(String userTema21) {
		this.userTema21 = userTema21;
	}
	
	@Length(min=0, max=20, message="特码22长度必须介于 0 和 20 之间")
	public String getUserTema22() {
		return userTema22;
	}

	public void setUserTema22(String userTema22) {
		this.userTema22 = userTema22;
	}
	
	@Length(min=0, max=20, message="特码23长度必须介于 0 和 20 之间")
	public String getUserTema23() {
		return userTema23;
	}

	public void setUserTema23(String userTema23) {
		this.userTema23 = userTema23;
	}
	
	@Length(min=0, max=20, message="特码24长度必须介于 0 和 20 之间")
	public String getUserTema24() {
		return userTema24;
	}

	public void setUserTema24(String userTema24) {
		this.userTema24 = userTema24;
	}
	
	@Length(min=0, max=20, message="特码25长度必须介于 0 和 20 之间")
	public String getUserTema25() {
		return userTema25;
	}

	public void setUserTema25(String userTema25) {
		this.userTema25 = userTema25;
	}
	
	@Length(min=0, max=20, message="特码26长度必须介于 0 和 20 之间")
	public String getUserTema26() {
		return userTema26;
	}

	public void setUserTema26(String userTema26) {
		this.userTema26 = userTema26;
	}
	
	@Length(min=0, max=20, message="特码27长度必须介于 0 和 20 之间")
	public String getUserTema27() {
		return userTema27;
	}

	public void setUserTema27(String userTema27) {
		this.userTema27 = userTema27;
	}
	
}