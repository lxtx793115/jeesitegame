/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameroom.web;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.entertainedset.entity.EntertainedSet;
import com.thinkgem.jeesite.modules.gameodds.entity.GameOdds;
import com.thinkgem.jeesite.modules.gameodds.service.GameOddsService;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameroom.service.GameRoomService;
import com.thinkgem.jeesite.modules.limitset.entity.LimitSet;
import com.thinkgem.jeesite.modules.plset.entity.PlSet;
import com.thinkgem.jeesite.modules.plset.service.PlSetService;
import com.thinkgem.jeesite.modules.plset1314.entity.PlSet1314;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.virtualnumberset.entity.VirtualNumberSet;

/**
 * 游戏房间Controller
 * @author chenye
 * @version 2018-04-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gameroom/gameRoom")
public class GameRoomController extends BaseController {

	@Autowired
	private GameRoomService gameRoomService;
	
	@Autowired
	private GameOddsService gameOddsService;
	
	@Autowired
	private PlSetService plSetService;
	
	@ModelAttribute
	public GameRoom get(@RequestParam(required=false) String id) {
		GameRoom entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameRoomService.get(id);
		}
		if (entity == null){
			entity = new GameRoom();
		}
		return entity;
	}
	
	@RequiresPermissions("gameroom:gameRoom:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameRoom gameRoom, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameRoom> page = gameRoomService.findPage(new Page<GameRoom>(request, response), gameRoom); 
		model.addAttribute("page", page);
		return "modules/gameroom/gameRoomList";
	}

	@RequiresPermissions("gameroom:gameRoom:view")
	@RequestMapping(value = "form")
	public String form(GameRoom gameRoom, Model model) {
		model.addAttribute("gameRoom", gameRoom);
		return "modules/gameroom/gameRoomForm";
	}
	/**
	 * 去房间规则设置
	 * @param gameOdds
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roomOdd")
	public String roomOdd(GameOdds gameOdds, Model model, RedirectAttributes redirectAttributes) {
		//GameOdds go = gameOddsService.get(gameOdds.getRoomId()); 
		GameOdds go = gameOddsService.getByRoomId(gameOdds.getRoomId()); 
		//GameOdds go = gameOddsService.findList(gameOdds).get(0);
		model.addAttribute("go", go);
		return "modules/gameroom/gameRoomOddsForm";
	}
	
	
	/**
	 * 去房间规则设置
	 * @param gameOdds
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getroomList")
	@ResponseBody
	public List<GameRoom> getroomList() {
		GameRoom gameRoom=new GameRoom();
	List<GameRoom> gameRooms=gameRoomService.findList(gameRoom);
		return gameRooms;
	}
	
	/**
	 * 去房间设置
	 * @param gameOdds
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roomOddII")
	public String roomOddII(PlSet plSet, Model model, RedirectAttributes redirectAttributes) {
		GameRoom gaRoom=new GameRoom();
		gaRoom.setId(plSet.getGameroomId());
		GameRoom gameRoom=gameRoomService.findList(gaRoom).get(0);
		plSet.setRoomnumber(gameRoom.getRoomnumber());
		model.addAttribute("plSet", plSet);
		return "modules/gameroom/gameRoomSet";
	}
	
	/**
	 * 去房间设置
	 * @param gameOdds
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roomOddIIentertained")
	public String roomOddIIentertained(EntertainedSet entertainedSet, Model model, RedirectAttributes redirectAttributes) {
		GameRoom gaRoom=new GameRoom();
		gaRoom.setId(entertainedSet.getGameroomId());
		GameRoom gameRoom=gameRoomService.findList(gaRoom).get(0);
		entertainedSet.setRoomnumber(gameRoom.getRoomnumber());
		model.addAttribute("plSet", entertainedSet);
		return "modules/gameroom/gameRoomSet";
	}
	
	
	/**
	 * 去房间设置
	 * @param gameOdds
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roomOddIIvirtual")
	public String roomOddIIvirtual(VirtualNumberSet virtualNumberSet, Model model, RedirectAttributes redirectAttributes) {
		GameRoom gaRoom=new GameRoom();
		gaRoom.setId(virtualNumberSet.getGameroomId());
		GameRoom gameRoom=gameRoomService.findList(gaRoom).get(0);
		virtualNumberSet.setRoomnumber(gameRoom.getRoomnumber());
		model.addAttribute("plSet", virtualNumberSet);
		return "modules/gameroom/gameRoomSet";
	}
	
	/**
	 * 去房间设置
	 * @param gameOdds
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roomOddIILimitset")
	public String roomOddIILimitset(LimitSet limitSet, Model model, RedirectAttributes redirectAttributes) {
		GameRoom gaRoom=new GameRoom();
		gaRoom.setId(limitSet.getGameroomId());
		GameRoom gameRoom=gameRoomService.findList(gaRoom).get(0);
		limitSet.setRoomnumber(gameRoom.getRoomnumber());
		model.addAttribute("plSet", limitSet);
		return "modules/gameroom/gameRoomSet";
	}
	
	
	/**
	 * 去房间设置
	 * @param gameOdds
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "roomOddII1314")
	public String roomOddII1314(PlSet1314 plSet1314, Model model, RedirectAttributes redirectAttributes) {
		GameRoom gaRoom=new GameRoom();
		gaRoom.setId(plSet1314.getGameroomId());
		GameRoom gameRoom=gameRoomService.findList(gaRoom).get(0);
		plSet1314.setRoomnumber(gameRoom.getRoomnumber());
		model.addAttribute("plSet", plSet1314);
		return "modules/gameroom/gameRoomSet";
	}
	/**
	 * 保存房间规则设置
	 * @param gameOdds
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("gameroom:gameRoom:edit")
	@RequestMapping(value = "GuessFlag")
	public String GuessFlag(@RequestParam ("id") String id, Model model, RedirectAttributes redirectAttributes) {
		GameRoom gameRoom=new GameRoom();
		gameRoom.setId(id);
		List<GameRoom> gameRooms=gameRoomService.findList(gameRoom);
		GameRoom gameRoomII=gameRooms.get(0);
		String string="";
		if (gameRoomII.getGuessFlag().equals("0")) {
			gameRoomII.setGuessFlag("1");
			gameRoomII.setGuessFlagContext("竞猜已开启");
			string="开启";
		}else {
			gameRoomII.setGuessFlag("0");
			gameRoomII.setGuessFlagContext("竞猜已关闭");
			string="关闭";
		}
		gameRoomService.save(gameRoomII);
		addMessage(redirectAttributes, string+"竞猜成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}

	/**
	 * 保存房间规则设置
	 * @param gameOdds
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("gameroom:gameRoom:edit")
	@RequestMapping(value = "OpenFlag")
	public String OpenFlag(@RequestParam ("id") String id, Model model, RedirectAttributes redirectAttributes) {
		GameRoom gameRoom=new GameRoom();
		gameRoom.setId(id);
		List<GameRoom> gameRooms=gameRoomService.findList(gameRoom);
		GameRoom gameRoomII=gameRooms.get(0);
		String string="";
		if (gameRoomII.getOpenFlag().equals("0")) {
			gameRoomII.setOpenFlag("1");
			gameRoomII.setOpenFlagContext("房间已开启");
			string="开启";
		}else {
			gameRoomII.setOpenFlag("0");
			gameRoomII.setOpenFlagContext("房间已关闭");
			string="关闭";
		}
		gameRoomService.save(gameRoomII);
		addMessage(redirectAttributes, string+"房间成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}
	
	@RequiresPermissions("gameroom:gameRoom:edit")
	@RequestMapping(value = "save")
	public String save(GameRoom gameRoom, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameRoom)){
			return form(gameRoom, model);
		}
		DictUtils dictUtils=new DictUtils();
		String roomLotteryTicketTypeContext=dictUtils.getDictLabel(gameRoom.getRoomLotteryTicketType(), "room_lottery_ticket_type", "空");
		gameRoom.setRoomLotteryTicketTypeContext(roomLotteryTicketTypeContext);
		if (gameRoom.getGuessFlag().equals("0")) {
			gameRoom.setGuessFlagContext("竞猜已关闭");
		}else {
			gameRoom.setGuessFlagContext("竞猜已开启");
		}
		if (gameRoom.getOpenChat().equals("0")) {
			gameRoom.setOpenChatContext("聊天已关闭");
		}else {
			gameRoom.setOpenChatContext("聊天已开启");
		}
		
		if (gameRoom.getOpenFlag().equals("0")) {
			gameRoom.setOpenFlagContext("房间已关闭");
		}else {
			gameRoom.setOpenFlagContext("房间已开启");
		}
		
		gameRoomService.save(gameRoom);
		addMessage(redirectAttributes, "保存游戏房间成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}
	
	@RequiresPermissions("gameroom:gameRoom:edit")
	@RequestMapping(value = "delete")
	public String delete(GameRoom gameRoom, RedirectAttributes redirectAttributes) {
		gameRoomService.delete(gameRoom);
		addMessage(redirectAttributes, "删除游戏房间成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}
	
	/**
	 * 保存房间规则设置
	 * @param gameOdds
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("gameroom:gameRoom:edit")
	@RequestMapping(value = "openChat")
	public String saveRoomOddsII(@RequestParam ("id") String id,Model model, RedirectAttributes redirectAttributes) {
		GameRoom gameRoom=new GameRoom();
		gameRoom.setId(id);
		List<GameRoom> gameRooms=gameRoomService.findList(gameRoom);
		GameRoom gameRoomII=gameRooms.get(0);
		String string="";
		if (gameRoomII.getOpenChat().equals("0")) {
			gameRoomII.setOpenChat("1");
			gameRoomII.setOpenChatContext("聊天已开启");
			string="开启";
		}else {
			gameRoomII.setOpenChat("0");
			gameRoomII.setOpenChatContext("聊天已关闭");
			string="关闭";
		}
		gameRoomService.save(gameRoomII);
		addMessage(redirectAttributes, string+"聊天成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}

	
	/**
	 * 保存房间规则设置
	 * @param gameOdds
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "saveRoomOdds")
	public String saveRoomOdds(GameOdds gameOdds, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameOdds)){
			return list(null, null, null, model);
		}
		gameOddsService.save(gameOdds);
		addMessage(redirectAttributes, "保存房间赔率描述成功");
		return "redirect:"+Global.getAdminPath()+"/gameroom/gameRoom/?repage";
	}

}