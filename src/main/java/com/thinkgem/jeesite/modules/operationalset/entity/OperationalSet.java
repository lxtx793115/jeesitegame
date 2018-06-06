/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.operationalset.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 运营设置Entity
 * @author ddd
 * @version 2018-05-11
 */
public class OperationalSet extends DataEntity<OperationalSet> {
	
	private static final long serialVersionUID = 1L;
	private String websiteTitle;		// 网站标题
	private String roomKeyWordsShielding;		// 房间聊天关键词屏蔽
	private String appDownloadLink;		// APP下载地址
	private String advertisementPrompt;		// 广告提示语
	private String roomAdvertisement;		// 房间广告
	private String smsInterfaceKey;		// 短信接口密钥
	
	public OperationalSet() {
		super();
	}

	public OperationalSet(String id){
		super(id);
	}

	@Length(min=0, max=85, message="网站标题长度必须介于 0 和 85 之间")
	public String getWebsiteTitle() {
		return websiteTitle;
	}

	public void setWebsiteTitle(String websiteTitle) {
		this.websiteTitle = websiteTitle;
	}
	
	@Length(min=0, max=4255, message="房间聊天关键词屏蔽长度必须介于 0 和 4255 之间")
	public String getRoomKeyWordsShielding() {
		return roomKeyWordsShielding;
	}

	public void setRoomKeyWordsShielding(String roomKeyWordsShielding) {
		this.roomKeyWordsShielding = roomKeyWordsShielding;
	}
	
	@Length(min=0, max=255, message="APP下载地址长度必须介于 0 和 255 之间")
	public String getAppDownloadLink() {
		return appDownloadLink;
	}

	public void setAppDownloadLink(String appDownloadLink) {
		this.appDownloadLink = appDownloadLink;
	}
	
	@Length(min=0, max=255, message="广告提示语长度必须介于 0 和 255 之间")
	public String getAdvertisementPrompt() {
		return advertisementPrompt;
	}

	public void setAdvertisementPrompt(String advertisementPrompt) {
		this.advertisementPrompt = advertisementPrompt;
	}
	
	@Length(min=0, max=2550, message="房间广告长度必须介于 0 和 2550 之间")
	public String getRoomAdvertisement() {
		return roomAdvertisement;
	}

	public void setRoomAdvertisement(String roomAdvertisement) {
		this.roomAdvertisement = roomAdvertisement;
	}
	
	@Length(min=0, max=255, message="短信接口密钥长度必须介于 0 和 255 之间")
	public String getSmsInterfaceKey() {
		return smsInterfaceKey;
	}

	public void setSmsInterfaceKey(String smsInterfaceKey) {
		this.smsInterfaceKey = smsInterfaceKey;
	}
	
}