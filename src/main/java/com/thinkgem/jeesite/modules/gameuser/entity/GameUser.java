/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuser.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 游戏用户Entity
 * @author chenye
 * @version 2018-04-14
 */
public class GameUser extends DataEntity<GameUser> {
	
	private static final long serialVersionUID = 1L;
	private String username;		// 用户名
	private String password;		// 密码
	private String salt;		// 盐
	private String nickname;		// 昵称
	private String phone;		// 电话
	private Office photo;		// 头像(已废弃，不用）
	private String no;		// 用户帐号
	private String balance;		// 余额
	private String point;		// 积分
	private String wechat;		// 微信
	private String qq;		// qq
	private String introducer;//介绍人
	private String alipay;		// 支付宝账号
	private String account;		// 下分账户
	private String ip;		// ip
	private String agent;		// 代理
	private String superiors;		// 上级
	private String createAdress;		// 创建地区
	private String status;		// 禁言状态(0或null：正常状态，未禁言，1：已禁言)
	private String roomNo;		// 房号
	private String photourl;// 头像路径
	private String fenghaostatus;// 封号状态(0或null：正常状态，未封号，1：封号,2：已封IP)
	private String fengip;//(此这段已废弃，不用)
	private String gameusernumber;// 排序编号
	private String userOnlineStatus;//用户在线状态（0：离线，1：在线）
	private String paymentPassword;//支付密码

	private String passzhongjie;//虚拟属性（数据库中没有该字段）
	private String passzhongjiepayment;//虚拟属性（数据库中没有该字段）
	
	private String usertype;//用户类型
	private String tuijianplayer;//推荐玩家
	private String gexingqianming;//个性签名
	private String registerip;//注册IP
	private String lastlogin;//最后登录
	
	private Date registerTime;//注册时间
	private String registerIpArea;//注册IP地区
	private Date loginTime;	//登录时间
	private String loginIpArea;//登录IP地区
	private String loginEnvironment;//登录环境
	
	private String setyue;//余额操作数值
	private String setyuestyle;//余额操作类型
	
	
	
	
	
	public String getSetyue() {
		return setyue;
	}

	public void setSetyue(String setyue) {
		this.setyue = setyue;
	}

	public String getSetyuestyle() {
		return setyuestyle;
	}

	public void setSetyuestyle(String setyuestyle) {
		this.setyuestyle = setyuestyle;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public String getRegisterIpArea() {
		return registerIpArea;
	}

	public void setRegisterIpArea(String registerIpArea) {
		this.registerIpArea = registerIpArea;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getLoginIpArea() {
		return loginIpArea;
	}

	public void setLoginIpArea(String loginIpArea) {
		this.loginIpArea = loginIpArea;
	}

	public String getLoginEnvironment() {
		return loginEnvironment;
	}

	public void setLoginEnvironment(String loginEnvironment) {
		this.loginEnvironment = loginEnvironment;
	}

	public String getIntroducer() {
		return introducer;
	}

	public void setIntroducer(String introducer) {
		this.introducer = introducer;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getTuijianplayer() {
		return tuijianplayer;
	}

	public void setTuijianplayer(String tuijianplayer) {
		this.tuijianplayer = tuijianplayer;
	}

	public String getGexingqianming() {
		return gexingqianming;
	}

	public void setGexingqianming(String gexingqianming) {
		this.gexingqianming = gexingqianming;
	}

	public String getRegisterip() {
		return registerip;
	}

	public void setRegisterip(String registerip) {
		this.registerip = registerip;
	}

	public String getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}

	public String getPasszhongjiepayment() {
		return passzhongjiepayment;
	}

	public void setPasszhongjiepayment(String passzhongjiepayment) {
		this.passzhongjiepayment = passzhongjiepayment;
	}

	public String getPasszhongjie() {
		return passzhongjie;
	}

	public void setPasszhongjie(String passzhongjie) {
		this.passzhongjie = passzhongjie;
	}

	public String getUserOnlineStatus() {
		return userOnlineStatus;
	}

	public String getPaymentPassword() {
		return paymentPassword;
	}

	public void setPaymentPassword(String paymentPassword) {
		this.paymentPassword = paymentPassword;
	}

	public void setUserOnlineStatus(String userOnlineStatus) {
		this.userOnlineStatus = userOnlineStatus;
	}

	public String getFengip() {
		return fengip;
	}

	public void setFengip(String fengip) {
		this.fengip = fengip;
	}

	public String getGameusernumber() {
		return gameusernumber;
	}

	public void setGameusernumber(String gameusernumber) {
		this.gameusernumber = gameusernumber;
	}

	public String getFenghaostatus() {
		return fenghaostatus;
	}

	public void setFenghaostatus(String fenghaostatus) {
		this.fenghaostatus = fenghaostatus;
	}

	public String getPhotourl() {
		return photourl;
	}

	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}

	public GameUser() {
		super();
	}

	public GameUser(String id){
		super(id);
	}

	@Length(min=1, max=64, message="用户名长度必须介于 1 和 64 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Length(min=1, max=64, message="密码长度必须介于 1 和 64 之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Length(min=1, max=64, message="盐长度必须介于 1 和 64 之间")
	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	@Length(min=0, max=100, message="昵称长度必须介于 0 和 100 之间")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Length(min=0, max=11, message="电话长度必须介于 0 和 11 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Office getPhoto() {
		return photo;
	}

	public void setPhoto(Office photo) {
		this.photo = photo;
	}
	
	@Length(min=0, max=100, message="用户帐号长度必须介于 0 和 100 之间")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}
	
	@Length(min=0, max=100, message="微信长度必须介于 0 和 100 之间")
	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	
	@Length(min=0, max=100, message="qq长度必须介于 0 和 100 之间")
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	@Length(min=0, max=32, message="支付宝账号长度必须介于 0 和 32 之间")
	public String getAlipay() {
		return alipay;
	}

	public void setAlipay(String alipay) {
		this.alipay = alipay;
	}
	
	@Length(min=0, max=100, message="下分账户长度必须介于 0 和 100 之间")
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
	@Length(min=0, max=15, message="ip长度必须介于 0 和 15 之间")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Length(min=0, max=64, message="代理长度必须介于 0 和 64 之间")
	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}
	
	@Length(min=0, max=64, message="上级长度必须介于 0 和 64 之间")
	public String getSuperiors() {
		return superiors;
	}

	public void setSuperiors(String superiors) {
		this.superiors = superiors;
	}
	
	@Length(min=0, max=20, message="创建地区长度必须介于 0 和 20 之间")
	public String getCreateAdress() {
		return createAdress;
	}

	public void setCreateAdress(String createAdress) {
		this.createAdress = createAdress;
	}
	
	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public GameUser(String id,
					String username,
					String password,
					String phone,
					String no,
					String salt,
					String qq,
					String introducer) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.salt = salt;
		this.phone = phone;
		this.no = no;
		this.qq = qq;
		this.introducer = introducer;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
}