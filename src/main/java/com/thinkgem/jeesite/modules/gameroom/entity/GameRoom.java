/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameroom.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.chatrecord.entity.ChatRecord;

/**
 * 游戏房间Entity
 * @author chenye
 * @version 2018-04-15
 */
public class GameRoom extends DataEntity<GameRoom> {
	
	private static final long serialVersionUID = 1L;
	private String no;		// 编号
	private String name;		// 房间名字
	private String robotName;		// 机器人名字
	private String robotPhoto;		// 机器人头像
	private String guessFlag;		// 是否开启竞猜(0:关闭；1：开启)
	private String openFlag;		// open_flag 房间开关 开启房间(0:关闭；1：开启)
	private String count;		// 在线人数
	private String roomIcon;		// 在线人数
	
	private String roomnumber;  // 房间编号
	private String openChat;		// 开启聊天(0:关闭；1：开启)
	private String openChatContext;
	private String guessFlagContext;
	private String openFlagContext;
	
	private String roomLotteryTicketType;//房间采种（1：北京28，2：加拿大28，3：北京赛车，4：时时彩）
	private String roomLotteryTicketTypeContext;
	
	private List<ChatRecord> chatRecordList =null;
	
	public List<ChatRecord> getChatRecordList() {
		return chatRecordList;
	}

	public void setChatRecordList(List<ChatRecord> chatRecordList) {
		this.chatRecordList = chatRecordList;
	}

	public String getRoomLotteryTicketTypeContext() {
		return roomLotteryTicketTypeContext;
	}

	public void setRoomLotteryTicketTypeContext(String roomLotteryTicketTypeContext) {
		this.roomLotteryTicketTypeContext = roomLotteryTicketTypeContext;
	}

	public String getRoomLotteryTicketType() {
		return roomLotteryTicketType;
	}

	public void setRoomLotteryTicketType(String roomLotteryTicketType) {
		this.roomLotteryTicketType = roomLotteryTicketType;
	}

	public String getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}

	public String getOpenChat() {
		return openChat;
	}

	public void setOpenChat(String openChat) {
		this.openChat = openChat;
	}

	public String getOpenChatContext() {
		return openChatContext;
	}

	public void setOpenChatContext(String openChatContext) {
		this.openChatContext = openChatContext;
	}

	public String getGuessFlagContext() {
		return guessFlagContext;
	}

	public void setGuessFlagContext(String guessFlagContext) {
		this.guessFlagContext = guessFlagContext;
	}

	public String getOpenFlagContext() {
		return openFlagContext;
	}

	public void setOpenFlagContext(String openFlagContext) {
		this.openFlagContext = openFlagContext;
	}

	public String getRoomIcon() {
		return roomIcon;
	}

	public void setRoomIcon(String roomIcon) {
		this.roomIcon = roomIcon;
	}

	public GameRoom() {
		super();
	}

	public GameRoom(String id){
		super(id);
	}

	@Length(min=1, max=32, message="编号长度必须介于 1 和 32 之间")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	@Length(min=1, max=64, message="房间名字长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="机器人名字长度必须介于 0 和 255 之间")
	public String getRobotName() {
		return robotName;
	}

	public void setRobotName(String robotName) {
		this.robotName = robotName;
	}
	
	@Length(min=0, max=255, message="机器人头像长度必须介于 0 和 255 之间")
	public String getRobotPhoto() {
		return robotPhoto;
	}

	public void setRobotPhoto(String robotPhoto) {
		this.robotPhoto = robotPhoto;
	}
	
	@Length(min=0, max=1, message="是否开启竞猜长度必须介于 0 和 1 之间")
	public String getGuessFlag() {
		return guessFlag;
	}

	public void setGuessFlag(String guessFlag) {
		this.guessFlag = guessFlag;
	}
	
	@Length(min=0, max=1, message="open_flag长度必须介于 0 和 1 之间")
	public String getOpenFlag() {
		return openFlag;
	}

	public void setOpenFlag(String openFlag) {
		this.openFlag = openFlag;
	}
	
	@Length(min=0, max=11, message="在线人数长度必须介于 0 和 11 之间")
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
}