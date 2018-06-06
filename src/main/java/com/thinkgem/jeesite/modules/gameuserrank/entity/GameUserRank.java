/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户级别IIEntity
 * @author dan
 * @version 2018-05-04
 */
public class GameUserRank extends DataEntity<GameUserRank> {
	
	private static final long serialVersionUID = 1L;
	private String minAvail;		// 最低可用金额
	private String maxAvail;		// 最高可用金额
	private String userLevel;		// 用户级别
	private String levelno;
	
	private String levelPhotourl;//用户级别图片
	
	public String getLevelPhotourl() {
		return levelPhotourl;
	}

	public void setLevelPhotourl(String levelPhotourl) {
		this.levelPhotourl = levelPhotourl;
	}

	public String getLevelno() {
		return levelno;
	}

	public void setLevelno(String levelno) {
		this.levelno = levelno;
	}

	public GameUserRank() {
		super();
	}

	public GameUserRank(String id){
		super(id);
	}

	public String getMinAvail() {
		return minAvail;
	}

	public void setMinAvail(String minAvail) {
		this.minAvail = minAvail;
	}
	
	public String getMaxAvail() {
		return maxAvail;
	}

	public void setMaxAvail(String maxAvail) {
		this.maxAvail = maxAvail;
	}
	
	@Length(min=0, max=10, message="用户级别长度必须介于 0 和 10 之间")
	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	
}