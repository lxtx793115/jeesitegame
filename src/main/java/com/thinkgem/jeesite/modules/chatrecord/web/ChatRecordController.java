/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.chatrecord.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.chatrecord.entity.ChatRecord;
import com.thinkgem.jeesite.modules.chatrecord.service.ChatRecordService;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameroom.service.GameRoomService;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.gameuser.service.GameUserService;

/**
 * 聊天记录管理Controller
 * @author ss
 * @version 2018-05-11
 */
@Controller
@RequestMapping(value = "${adminPath}/chatrecord/chatRecord")
public class ChatRecordController extends BaseController {


	@Autowired
	private GameUserService gameUserService;
	
	@Autowired
	private GameRoomService gameRoomService;
	
	@Autowired
	private ChatRecordService chatRecordService;
	
	@ModelAttribute
	public ChatRecord get(@RequestParam(required=false) String id) {
		ChatRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = chatRecordService.get(id);
		}
		if (entity == null){
			entity = new ChatRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("chatrecord:chatRecord:view")
	@RequestMapping(value = {"list"})
	public String list(ChatRecord chatRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ChatRecord> page = chatRecordService.findPage(new Page<ChatRecord>(request, response), chatRecord); 
		model.addAttribute("page", page);
		return "modules/chatrecord/chatRecordList";
	}

	@RequiresPermissions("chatrecord:chatRecord:view")
	@RequestMapping(value = "form")
	public String form(ChatRecord chatRecord, Model model) {
		GameUser gameUser=new GameUser();
		List<GameUser> gameUsers=gameUserService.findList(gameUser);
		GameRoom gameRoom=new GameRoom();
		model.addAttribute("chatRecord", chatRecord);
		List<GameRoom> gameRooms=gameRoomService.findList(gameRoom);
		model.addAttribute("gameRooms", gameRooms);
		model.addAttribute("gameUsers", gameUsers);
		return "modules/chatrecord/chatRecordForm";
	}

	@RequiresPermissions("chatrecord:chatRecord:edit")
	@RequestMapping(value = "save")
	public String save(ChatRecord chatRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, chatRecord)){
			return form(chatRecord, model);
		}
		String chattype="";
		String senderUserid=chatRecord.getSenderUserid();
		String senderPhone="";
		String receiverUserid=chatRecord.getReceiverUserid();
		String receiverPhone="";
		String gameroomId=chatRecord.getGameroomId();
		String roomnumber="";
		GameRoom gameRoom=new GameRoom();
		if (gameroomId!=null&&!"".equals(gameroomId)) {
			gameRoom.setId(gameroomId);
			List<GameRoom> gameRooms=gameRoomService.findList(gameRoom);
			if (gameRooms!=null&&gameRooms.size()>0) {
				chatRecord.setRoomnumber(gameRooms.get(0).getRoomnumber());
				chatRecord.setCalx(gameRooms.get(0).getRoomLotteryTicketType());
			}
		}
		GameUser gameUser=new GameUser();
		if (senderUserid!=null&&!"".equals(senderUserid)) {
			gameUser.setId(senderUserid);
			List<GameUser> gameUsers=gameUserService.findList(gameUser);
			if (gameUsers!=null&&gameUsers.size()>0) {
				chatRecord.setSenderPhone(gameUsers.get(0).getPhone());
			}
			chatRecord.setSenderphoto(gameUsers.get(0).getPhotourl());
			chatRecord.setSendernickname(gameUsers.get(0).getNickname());
		}
		GameUser gameUserII=new GameUser();
		if (receiverUserid!=null&&!"".equals(receiverUserid)) {
			gameUserII.setId(receiverUserid);
			List<GameUser> gameUserIIs=gameUserService.findList(gameUserII);
			if (gameUserIIs!=null&&gameUserIIs.size()>0) {
				chatRecord.setReceiverPhone(gameUserIIs.get(0).getPhone());
			}
		}
		chattype=chatRecord.getChatType();
		if (chattype!=null&&!"".equals(chattype)&&chattype.equals("customerservicechat")) {
			chatRecord.setMessageStatus("0");
		}
		if (chatRecord.getId()!=null&&!"".equals(chatRecord.getId())) {

		}else {

			chatRecord.setTimestamp(new Date());
		}
		chatRecordService.save(chatRecord);
		addMessage(redirectAttributes, "保存聊天记录管理成功");
		return "redirect:"+Global.getAdminPath()+"/chatrecord/chatRecord/listIII?repage";
	}
	@RequiresPermissions("chatrecord:chatRecord:view")
	@RequestMapping(value = {"list2"})
	public String list2(ChatRecord chatRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ChatRecord> page = chatRecordService.findPageII(new Page<ChatRecord>(request, response), chatRecord); 
		model.addAttribute("page", page);
		return "modules/chatrecord/chatRecordList2";
	}
	
	
	@RequiresPermissions("chatrecord:chatRecord:view")
	@RequestMapping(value = {"listIII", ""})
	public String listIII(ChatRecord chatRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<GameRoom> gameRoomAlls=new ArrayList<GameRoom>();
		List<String> calxids=chatRecord.getCalxids();
		if (calxids!=null&&calxids.size()>0) {
			for (String string : calxids) {
				GameRoom gameRoom1=new GameRoom();
				gameRoom1.setRoomLotteryTicketType(string);
				List<GameRoom> gameRooms1=gameRoomService.findList(gameRoom1);
				if (gameRooms1!=null&&gameRooms1.size()>0) {
					for (GameRoom gameRoom2 : gameRooms1) {
						ChatRecord chatRecord2=new ChatRecord();
						chatRecord2.setRoomnumber(gameRoom2.getRoomnumber());
						chatRecord2.setGameroomId(gameRoom2.getId());
						Integer seString=chatRecord.getSelectnum();
						if (seString!=null&&!"".equals(seString)) {

							chatRecord2.setSelectnum(seString);
						}
						chatRecord2.setChatType("groupchat");
						List<ChatRecord> chatRecords=chatRecordService.findListIII(chatRecord2);
						if (chatRecords!=null&&chatRecords.size()>0) {
							Integer integer=0;
							Integer integer2=0;
							for (ChatRecord chatRecord3 : chatRecords) {
								if (integer!=0 ) {
									if (chatRecords.get(integer).getSenderUserid().equals(chatRecords.get(integer-1).getSenderUserid())) {
										
									}else {
										integer2=integer2+1;
									}
									if (integer2%2==0) {
										chatRecord3.setFenbain("0");
									}else {
										chatRecord3.setFenbain("1");
									}
								}else {
									
									chatRecord3.setFenbain("0");
								}
								integer=integer+1;
							}
							gameRoom2.setChatRecordList(chatRecords);
							gameRoomAlls.add(gameRoom2);
						}
						
					}
				}
			}
			
		}
		model.addAttribute("gameRooms", gameRoomAlls);
		return "modules/chatrecord/chatRecordList2";
	}
	
	@RequiresPermissions("chatrecord:chatRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(ChatRecord chatRecord, RedirectAttributes redirectAttributes) {
		chatRecordService.delete(chatRecord);
		addMessage(redirectAttributes, "删除聊天记录管理成功");
		return "redirect:"+Global.getAdminPath()+"/chatrecord/chatRecord/listIII?repage";
	}

}