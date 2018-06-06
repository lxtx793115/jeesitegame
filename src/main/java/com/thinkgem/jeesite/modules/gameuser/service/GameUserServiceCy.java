/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuser.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.modules.gameroom.dao.GameRoomDao;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameroom.service.GameRoomService;
import com.thinkgem.jeesite.modules.gametoken.entity.TokenEntity;
import com.thinkgem.jeesite.modules.gameuser.dao.GameUserDaoCy;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.unit.MD5Util;
import com.thinkgem.jeesite.modules.unit.MakeNoUtil;
import com.thinkgem.jeesite.modules.unit.UUIDUtils;
import com.thinkgem.jeesite.modules.unit.ValidateUtils;
import com.thinkgem.jeesite.modules.websocket.WebSocketChat;
import com.thinkgem.jeesite.modules.websocket.WebSocketTest;
import com.thinkgem.jeesite.modules.websocketWithMyHandle.MyHandler;

/**
 * 游戏用户Service
 * @author chenye
 * @version 2018-03-25
 */
@Service
//@Transactional(readOnly = true)
public class GameUserServiceCy {
	@Autowired
	GameUserDaoCy GameUserDao;
	
	@Autowired
	private GameRoomService gameRoomService;
	
	@Autowired
	private GameRoomDao gameRoomDao;
	
	
	@SuppressWarnings("unchecked")	
	public Map<String,String> validate_register(
			String username,
			String password,
			String phone,
			String phoneCode,
			String qq,
			String introducer,
			HttpSession session)  throws Exception {
		Map<String,String> map = new HashMap();
		
		if("".equals(username)||username==null) {
			map.put("message", "用户名不能为空");
			map.put("status", "fail");
			return map;
		}
		// 判断用户名是否正确  //4-18字母的组合，最少一个字母
		if(!ValidateUtils.isUserName(username)) {
			map.put("message", "用户名应为4到18为大写字母，小写字母，数字的组合！");
			map.put("status", "fail");
			return map;
		}
		if(password.length()<6||password.length()>18) {
			map.put("message", "密码长度应为6到18位");
			map.put("status", "fail");
			return map;
		}
		if(!ValidateUtils.isNull(phone)) {
			map.put("message", "手机号不能为空！");
			map.put("status", "fail");
			return map;
		}
		if(!ValidateUtils.isNull(phoneCode)) {
			map.put("message", "验证码不能为空！");
			map.put("status", "fail");
			return map;
		}
		if(!ValidateUtils.isCode(phoneCode)) {
			map.put("message", "验证码格式错误！");
			map.put("status", "fail");
			return map;
		}
		// 判断手机验号是否正确
		if(!ValidateUtils.isMobile(phone)) {
			map.put("message", "手机号格式错误！");
			map.put("status", "fail");
			return map;
		}
		Object phone_code = session.getAttribute("regist_phone_code");
		if (phone_code == null || !(phone_code.toString().equals(phoneCode))) {
			// 验证码错误
			map.put("message", "手机验证码错误！");
			map.put("status", "fail");
			return map;
		}
		// 查询用户是否存在
		Integer b=GameUserDao.queryUserCount(username, phone);
		if (b != null && b.longValue() > 0) {
			// 用户名、手机、电子邮件存在
			map.put("message", "用户名或者手机已经存在！");
			map.put("status", "fail");
			return map;
		}
		//盐。 随机生成
		String salt = UUIDUtils.randomUUID();
		//生成订单号
		String no=MakeNoUtil.makeOrderNum();
		//密码加盐
		String pwd=MD5Util.md5(MD5Util.md5(password), salt);
		GameUser user = new GameUser(UUIDUtils.randomUUID(),username, pwd, phone, no,salt,qq,introducer);
		GameUserDao.insertUser(user);
		map.put("message", "注册成功!");
		map.put("status", "success");
		return map;
	}
	public Map<String,String> getGameUserBynamepwd2(String username,String password,String roomNo,HttpSession session,Map<String,Object> roomMap) {
		String salt=GameUserDao.getSaltByUsername(username);
		Map<String,String> map=new HashMap();
		// 判断号是否正确
		if(username==null||"".equals(username)) {
			map.put("message", "用户名不能为空！");
			map.put("status", "fail");
		}
		// 判断手机验号是否正确
		if(username==null||"".equals(username)) {
			map.put("message", "用户名不能为空！");
			map.put("status", "fail");
		}
		if(password==null||"".equals(password)) {
			map.put("message", "密码不能为空！");
			map.put("status", "fail");
		}
		map.put("message", "用户名或者密码错误！");
		map.put("status", "fail");
		if(""==salt||null==salt) {
			return map;
		}
		String pwd = MD5Util.md5(MD5Util.md5(password), salt);
		GameUser gameUser=GameUserDao.getGameUserBynamepwd(username,pwd);
		if(gameUser!=null) {
			gameUser.setRoomNo(roomNo);
			session.setAttribute("GAMEUSER", gameUser);  
	        map.put("message", "登录成功！");
			map.put("status", "success");
			
			// 查询房间是否存在
			GameRoom gameRoom=gameRoomDao.queryRoomCount(roomNo);
			if (gameRoom == null) {
				map.put("message", "该房间不存在！");
				map.put("status", "fail");
				return map;
			}else {
				System.out.println("有房间");
				//roomMap.put("room", gameRoom);
			}
			WebSocketTest.setHttpSession(session);  
		}
		return map;
	}
	public Map<String,String> getGameUserBynamepwd(String username,String password,HttpSession session,Map<String,Object> roomMap) {
		String salt=GameUserDao.getSaltByUsername(username);
		Map<String,String> map=new HashMap();
		// 判断号是否正确
		if(username==null||"".equals(username)) {
			map.put("message", "用户名不能为空！");
			map.put("status", "fail");
		}
		// 判断手机验号是否正确
		if(username==null||"".equals(username)) {
			map.put("message", "用户名不能为空！");
			map.put("status", "fail");
		}
		if(password==null||"".equals(password)) {
			map.put("message", "密码不能为空！");
			map.put("status", "fail");
		}
		map.put("message", "用户名或者密码错误！");
		map.put("status", "fail");
		if(""==salt||null==salt) {
			return map;
		}
		String pwd = MD5Util.md5(MD5Util.md5(password), salt);
		GameUser gameUser=GameUserDao.getGameUserBynamepwd(username,pwd);
		if(gameUser!=null) {
			//gameUser.setRoomNo(roomNo);
			Map<String,GameUser> sessionMap=new HashMap<String,GameUser>();
			session.setAttribute(gameUser.getPhone(), gameUser.getPhone());  
			//session.setAttribute("GAMEUSER", gameUser);  
			//WebSocketChat.setHttpSession(session);  
			MyHandler.setHttpSession(session);  
			map.put("message", "登录成功！");
			map.put("status", "success");
			String accessToken=UUIDUtils.randomUUID();
			map.put("accessToken",accessToken);//返回token
			map.put("username",gameUser.getUsername());
			map.put("salt",gameUser.getSalt());
			map.put("nickname",gameUser.getNickname());// 昵称
			map.put("phone",gameUser.getPhone());// 电话
			map.put("no",gameUser.getNo());// 用户帐号
			map.put("balance",gameUser.getBalance());// 余额
			map.put("point",gameUser.getPoint());// 积分
			map.put("wechat",gameUser.getWechat());// 微信
			map.put("qq",gameUser.getQq());// qq
			map.put("introducer",gameUser.getIntroducer());//介绍人
			map.put("alipay",gameUser.getAlipay());// 支付宝账号
			map.put("account",gameUser.getAccount());// 下分账户
			map.put("ip",gameUser.getIp());// ip
			map.put("agent",gameUser.getAgent());// 代理
			map.put("superiors",gameUser.getSuperiors());// 上级
			map.put("createAdress",gameUser.getCreateAdress());// 创建地区
			map.put("roomNo",gameUser.getRoomNo());	// 状态
			map.put("status",gameUser.getStatus());	// 状态
			map.put("photourl",gameUser.getPhotourl());	// 头像路径
			TokenEntity tokenEntity=new TokenEntity();
			tokenEntity.setAccessToken(accessToken);
			tokenEntity.setClientId(username);
			String id=UUIDUtils.randomUUID();
			tokenEntity.setId(id);
			Integer count=GameUserDao.queryAccessTokenByClientId(username);
			if(count>0){
				GameUserDao.updateAccessToken(tokenEntity);//更新token信息
			}else{
				GameUserDao.insertAccessToken(tokenEntity);//保存token信息
			}

			
			// 查询房间是否存在
//			GameRoom gameRoom=gameRoomDao.queryRoomCount(roomNo);
//			if (gameRoom == null) {
//				map.put("message", "该房间不存在！");
//				map.put("status", "fail");
//				return map;
//			}else {
//				System.out.println("有房间");
//				//roomMap.put("room", gameRoom);
//			}
//			WebSocketTest.setHttpSession(session);  
		}
		return map;
	}
	public Map<String,Object> getGameUserListdata(Map<String,Object> map) {
		return GameUserDao.getGameUserListdata(map);
	}
	
	public Map<String,Object> getGameUserLevel(Map<String,Object> map) {
		return GameUserDao.getGameUserLevel(map);
	}
	public Integer getGameUserListdataCount(Map<String,Object> map) {
		return GameUserDao.getGameUserListdataCount(map);
	}

	public Integer queryAccessTokenByToken(String accessToken){return GameUserDao.queryAccessTokenByToken(accessToken);}

	public Integer queryAccessTokenByClientId(String clientId){return GameUserDao.queryAccessTokenByClientId(clientId);}

	public GameUser getUserByPhone(String phone){
		return GameUserDao.getUserByPhone(phone);
	}

}