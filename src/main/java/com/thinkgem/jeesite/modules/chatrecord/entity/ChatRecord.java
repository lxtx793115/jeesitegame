/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.chatrecord.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 聊天记录管理Entity
 * @author ss
 * @version 2018-05-11
 */
public class ChatRecord extends DataEntity<ChatRecord> {
	
	private static final long serialVersionUID = 1L;
	private String roomnumber;		// 房间编号
	private String gameroomId;		// 游戏房间ID
	private String senderUserid;		// 发送者用户ID
	private String senderPhone;		// 发送者手机账号
	private String receiverUserid;		// 接受者用户ID
	private String receiverPhone;		// 接受者手机账号
	private String chatType;		// 聊天类型(chat:单聊类型，groupchat:群聊类型，customerservicechat:与客服系统聊天类型)
	private String msgContent;		// 消息内容
	private String msgType;		// 消息类型(txt:文本消息，img:图片，loc:位置，audio:语音)
	private String voiceLength;		// 语音时长，单位为秒，只有语音消息有
	private String url;		// 文件路径（图片语音等文件的网络url）
	private String filename;		// 文件名字（图片语音有）
	private String secret;		// 文件密钥
	private String lat;		// 纬度
	private String lng;		// 经度
	private String addr;		// 位置消息详细地址
	private Date timestamp;		// 消息发送时间
	private List<String> calxids;//采种类型集合
	private Integer selectnum;//查询条数
	private String calx;//采种类型
	private String chatnumber;//排序编号
	private String senderphoto;  //发送者头像
	private String sendernickname;  //发送者昵称
	
	private String messageStatus;//0或null:未读，1:已读
	private String respondentUserid;//回复人用户ID
	private String fenbain;//分辨是不是同一个发送人
	
	public String getFenbain() {
		return fenbain;
	}

	public void setFenbain(String fenbain) {
		this.fenbain = fenbain;
	}

	public String getRespondent() {
		return respondentUserid;
	}

	public void setRespondent(String respondentUserid) {
		this.respondentUserid = respondentUserid;
	}

	public String getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}

	public Integer getSelectnum() {
		return selectnum;
	}

	public void setSelectnum(Integer selectnum) {
		this.selectnum = selectnum;
	}
	public String getSendernickname() {
		return sendernickname;
	}

	public void setSendernickname(String sendernickname) {
		this.sendernickname = sendernickname;
	}

	public List<String> getCalxids() {
		return calxids;
	}

	public void setCalxids(List<String> calxids) {
		this.calxids = calxids;
	}
	public String getCalx() {
		return calx;
	}

	public void setCalx(String calx) {
		this.calx = calx;
	}

	public String getChatnumber() {
		return chatnumber;
	}

	public void setChatnumber(String chatnumber) {
		this.chatnumber = chatnumber;
	}

	public String getSenderphoto() {
		return senderphoto;
	}

	public void setSenderphoto(String senderphoto) {
		this.senderphoto = senderphoto;
	}

	public ChatRecord() {
		super();
	}

	public ChatRecord(String id){
		super(id);
	}

	@Length(min=0, max=20, message="房间编号长度必须介于 0 和 20 之间")
	public String getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}
	
	@Length(min=0, max=64, message="游戏房间ID长度必须介于 0 和 64 之间")
	public String getGameroomId() {
		return gameroomId;
	}

	public void setGameroomId(String gameroomId) {
		this.gameroomId = gameroomId;
	}
	
	@Length(min=0, max=64, message="发送者用户ID长度必须介于 0 和 64 之间")
	public String getSenderUserid() {
		return senderUserid;
	}

	public void setSenderUserid(String senderUserid) {
		this.senderUserid = senderUserid;
	}
	
	@Length(min=0, max=55, message="发送者手机号长度必须介于 0 和 55 之间")
	public String getSenderPhone() {
		return senderPhone;
	}

	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}
	
	@Length(min=0, max=64, message="接受者用户ID长度必须介于 0 和 64 之间")
	public String getReceiverUserid() {
		return receiverUserid;
	}

	public void setReceiverUserid(String receiverUserid) {
		this.receiverUserid = receiverUserid;
	}
	
	@Length(min=0, max=55, message="接受者手机号长度必须介于 0 和 55 之间")
	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	
	@Length(min=0, max=25, message="聊天类型长度必须介于 0 和 25 之间")
	public String getChatType() {
		return chatType;
	}

	public void setChatType(String chatType) {
		this.chatType = chatType;
	}
	
	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	
	@Length(min=0, max=55, message="消息类型长度必须介于 0 和 55 之间")
	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	
	@Length(min=0, max=55, message="语音时长长度必须介于 0 和 55 之间")
	public String getVoiceLength() {
		return voiceLength;
	}

	public void setVoiceLength(String voiceLength) {
		this.voiceLength = voiceLength;
	}
	
	@Length(min=0, max=155, message="文件路径长度必须介于 0 和 155 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=155, message="文件名字长度必须介于 0 和 155 之间")
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Length(min=0, max=155, message="文件密钥长度必须介于 0 和 155 之间")
	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	@Length(min=0, max=55, message="维度长度必须介于 0 和 55 之间")
	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}
	
	@Length(min=0, max=55, message="经度长度必须介于 0 和 55 之间")
	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}
	
	@Length(min=0, max=255, message="位置消息详细地址长度必须介于 0 和 255 之间")
	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	
}