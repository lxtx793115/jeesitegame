/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuser.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.gameuser.service.GameUserService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.unit.MD5Util;
import com.thinkgem.jeesite.modules.unit.MakeNoUtil;
import com.thinkgem.jeesite.modules.unit.UUIDUtils;

/**
 * 游戏用户Controller
 * @author chenye
 * @version 2018-04-14
 */
@Controller
@RequestMapping(value = "${adminPath}/gameuser/gameUser")
public class GameUserController extends BaseController {

	@Autowired
	private GameUserService gameUserService;
	

	
	@ModelAttribute
	public GameUser get(@RequestParam(required=false) String id) {
		GameUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gameUserService.get(id);
		}
		if (entity == null){
			entity = new GameUser();
		}
		return entity;
	}
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(GameUser gameUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GameUser> page = gameUserService.findPage(new Page<GameUser>(request, response), gameUser); 
		model.addAttribute("page", page);
		return "modules/gameuser/gameUserList";
	}
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = {"yuesetform"})
	public String yuesetform(GameUser gameUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("gameUser", gameUser);
		return "modules/gameuser/gameUseryue";
	}
	
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = {"yueset"})
	public String yueset(GameUser gameUser, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response, Model model) {
		String yueString=gameUser.getSetyue();
		String balanceString=gameUser.getBalance();
		if (balanceString!=null&&!"".equals(balanceString)&&yueString!=null&&!"".equals(yueString)) {
			balanceString=(Double.parseDouble(balanceString)+Double.parseDouble(yueString))+"";
		}else {
			balanceString="0";
			yueString="0";
			balanceString=(Double.parseDouble(balanceString)+Double.parseDouble(yueString))+"";
		}
		gameUser.setBalance(balanceString);
		gameUserService.save(gameUser);
		addMessage(redirectAttributes, "保存用户余额成功");
		return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/?repage";
	}
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = {"listfenghao"})
	public String listfenghao(GameUser gameUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		gameUser.setFenghaostatus("3");
		Page<GameUser> page = gameUserService.findPage(new Page<GameUser>(request, response), gameUser); 
		model.addAttribute("page", page);
		return "modules/gameuser/gameUserList_fenghao";
	}
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = {"listfengIP"})
	public String listfengIP(GameUser gameUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		gameUser.setFengip("1");
		Page<GameUser> page = gameUserService.findPage(new Page<GameUser>(request, response), gameUser); 
		model.addAttribute("page", page);
		return "modules/gameuser/gameUserList_fengip";
	}
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = {"listjinyan"})
	public String listjinyan(GameUser gameUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		gameUser.setStatus("1");
		Page<GameUser> page = gameUserService.findPage(new Page<GameUser>(request, response), gameUser); 
		model.addAttribute("page", page);
		return "modules/gameuser/gameUserList_jinyan";
	}


	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = "formbutton")
	public String formbutton(GameUser gameUser, Model model) {
		GameUser gameUser2=new GameUser();
		gameUser2.setId(gameUser.getId());
		List<GameUser> gameUsers=gameUserService.findList(gameUser2);
		if (gameUsers!=null&&gameUsers.size()>0) {
			gameUser2=gameUsers.get(0);
		}
		model.addAttribute("gameUser", gameUser2);
		return "modules/gameuser/gameUserbuttonfeng";
	}
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = "form")
	public String form(GameUser gameUser, Model model) {
		model.addAttribute("gameUser", gameUser);
		return "modules/gameuser/gameUserForm";
	}
	
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = "forminfo")
	public String forminfo(GameUser gameUser, Model model) {
		model.addAttribute("gameUser", gameUser);
		return "modules/gameuser/gameUserFormInfo";
	}
	
	@RequiresPermissions("gameuser:gameUser:view")
	@RequestMapping(value = "resetPassword")
	public String resetPassword(GameUser gameUser, Model model) {
		model.addAttribute("gameUser", gameUser);
		return "modules/gameuser/resetPassword";
	}

	@RequiresPermissions("gameuser:gameUser:edit")
	@RequestMapping(value = "save")
	public String save(GameUser gameUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, gameUser)){
			return form(gameUser, model);
		}
		gameUser.setNo(MakeNoUtil.makeOrderNum());
		gameUserService.save(gameUser);
		addMessage(redirectAttributes, "保存游戏用户成功");
		return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/?repage";
	}
	
	
	@RequiresPermissions("gameuser:gameUser:edit")
	@RequestMapping(value = "savepassword")
	public String savepassword(GameUser gameUser,@RequestParam("reset") String reset,@RequestParam("rere") String rere, Model model, RedirectAttributes redirectAttributes) {
		
		if (!beanValidator(model, gameUser)){
			return form(gameUser, model);
		}
		GameUser gameUser2=new GameUser();
		gameUser2.setId(gameUser.getId());
		String salt = UUIDUtils.randomUUID();
		//生成订单号
		String no=MakeNoUtil.makeOrderNum();
		GameUser gameUser3=new GameUser();
		List<GameUser> gameUsers=gameUserService.findList(gameUser2);
		if (reset!=null&&!"".equals(reset)&&reset.equals("1")) {
			if (gameUsers!=null&&gameUsers.size()>0) {
				gameUser3=gameUsers.get(0);
				//密码加盐
				String pwd=MD5Util.md5(MD5Util.md5(gameUser.getPasszhongjie()), salt);
				gameUser3.setPassword(pwd);
				gameUser3.setSalt(salt);
				gameUser3.setNo(no);
				gameUserService.save(gameUser3);

				addMessage(redirectAttributes, "重置用户密码成功");
			}else {
				addMessage(redirectAttributes, "重置用户密码失败");
			}
		}else {
			if (gameUsers!=null&&gameUsers.size()>0) {
				gameUser3=gameUsers.get(0);
				gameUser3.setSalt(salt);
				String pwd=MD5Util.md5(MD5Util.md5(gameUser.getPasszhongjiepayment()), salt);
				gameUser3.setPaymentPassword(pwd);
				gameUser3.setNo(no);
				gameUserService.save(gameUser3);
				addMessage(redirectAttributes, "重置支付密码成功");
			}else {
				addMessage(redirectAttributes, "重置支付密码失败");
			}
		}
		
		
		
		return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/?repage";
	}
	@RequiresPermissions("gameuser:gameUser:edit")
	@RequestMapping(value = "delete")
	public String delete(GameUser gameUser, RedirectAttributes redirectAttributes) {
		gameUserService.delete(gameUser);
		addMessage(redirectAttributes, "删除游戏用户成功");
		return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/?repage";
	}
	
	@RequiresPermissions("gameuser:gameUser:edit")
	@RequestMapping(value = "cancelfenghao")
	public String cancelfenghao(GameUser gameUser,@RequestParam("feng") String feng, RedirectAttributes redirectAttributes) {
		List<GameUser> gameUsers=gameUserService.findList(gameUser);
		GameUser gameUser2=null;
		if (gameUsers!=null&&gameUsers.size()>0) {
			gameUser2=gameUsers.get(0);
			String statusString=gameUser2.getFenghaostatus();
			String statusStringjinyan=gameUser2.getStatus();
			if (feng.equals("1")) {
				if (statusString!=null&&!"".equals(statusString)&&statusString.equals("1")) {
					gameUser2.setFenghaostatus("0");
					addMessage(redirectAttributes, "解除封号成功");

					gameUserService.save(gameUser2);
				}else {
					
					addMessage(redirectAttributes, "该玩家不需要解除封号");
				}
			}else if (feng.equals("2")){
				if (statusString!=null&&!"".equals(statusString)&&statusString.equals("2")) {
					gameUser2.setFenghaostatus("0");
					addMessage(redirectAttributes, "解除封IP成功");

					gameUserService.save(gameUser2);
				}else {
					
					addMessage(redirectAttributes, "该玩家不需要解除封IP");
				}
			}else {
				if (statusStringjinyan!=null&&!"".equals(statusStringjinyan)&&statusStringjinyan.equals("1")) {
					gameUser2.setStatus("0");
					addMessage(redirectAttributes, "解除禁言成功");

					gameUserService.save(gameUser2);
				}else {
					
					addMessage(redirectAttributes, "该玩家不需要解除禁言");
				}
			}
			
			
		}else {

			addMessage(redirectAttributes, "该用户不存在");
		}
		if (feng.equals("1")) {

			return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/listfenghao?repage";
		}else if (feng.equals("2")) {

			return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/listfenghao?repage";
		}else {

			return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/listjinyan?repage";
		}
	}
	

	
	@RequiresPermissions("gameuser:gameUser:edit")
	@RequestMapping(value = "changefenghao")
	public String changefenghao(GameUser gameUser,@RequestParam("feng") String feng, RedirectAttributes redirectAttributes) {
		List<GameUser> gameUsers=gameUserService.findList(gameUser);
		GameUser gameUser2=null;
		if (gameUsers!=null&&gameUsers.size()>0) {
			gameUser2=gameUsers.get(0);
			String statusString=gameUser2.getFenghaostatus();
			String statusStringip=gameUser2.getFengip();
			if (feng.equals("1")) {
				if (statusString!=null&&!"".equals(statusString)&&statusString.equals("1")) {

					addMessage(redirectAttributes, "该玩家已封号");
				}else if (statusString!=null&&!"".equals(statusString)&&statusString.equals("2")){
					addMessage(redirectAttributes, "该玩家已封IP,不能执行封号操作");
				}
				
				else  {
					gameUser2.setFenghaostatus("1");
					addMessage(redirectAttributes, "封号成功");

					gameUserService.save(gameUser2);
				}
			}else {
				if (statusString!=null&&!"".equals(statusString)&&statusString.equals("2")) {

					addMessage(redirectAttributes, "该玩家已封IP");
				}else {
					gameUser2.setFenghaostatus("2");
					addMessage(redirectAttributes, "封IP成功");

					gameUserService.save(gameUser2);
				}
			}
			
			
		}else {

			addMessage(redirectAttributes, "该用户不存在");
		}
		return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/?repage";
	}


	
	@RequiresPermissions("gameuser:gameUser:edit")
	@RequestMapping(value = "changefengIP")
	public String changefengIP(GameUser gameUser, RedirectAttributes redirectAttributes) {
		List<GameUser> gameUsers=gameUserService.findList(gameUser);
		GameUser gameUser2=null;
		if (gameUsers!=null&&gameUsers.size()>0) {
			gameUser2=gameUsers.get(0);
			String statusString=gameUser2.getFengip();
			if (statusString!=null&&!"".equals(statusString)&&statusString.equals("1")) {

				addMessage(redirectAttributes, "该玩家已封IP");
			}else {
				gameUser2.setFengip("1");
				addMessage(redirectAttributes, "封IP成功");

				gameUserService.save(gameUser2);
			}
		}else {

			addMessage(redirectAttributes, "该用户不存在");
		}
		return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/?repage";
	}


	
	@RequiresPermissions("gameuser:gameUser:edit")
	@RequestMapping(value = "changeJinyan")
	public String changeJinyan(GameUser gameUser, RedirectAttributes redirectAttributes) {
		List<GameUser> gameUsers=gameUserService.findList(gameUser);
		GameUser gameUser2=null;
		if (gameUsers!=null&&gameUsers.size()>0) {
			gameUser2=gameUsers.get(0);
			String statusString=gameUser2.getStatus();
			if (statusString!=null&&!"".equals(statusString)&&statusString.equals("1")) {

				addMessage(redirectAttributes, "该玩家已禁言");
			}else {
				gameUser2.setStatus("1");
				addMessage(redirectAttributes, "禁言成功");

				gameUserService.save(gameUser2);
			}
		}else {

			addMessage(redirectAttributes, "该用户不存在");
		}
		return "redirect:"+Global.getAdminPath()+"/gameuser/gameUser/?repage";
	}


}