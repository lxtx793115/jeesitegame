/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuser.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameuser.entity.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.modules.gameuser.dao.RoomDao;
import com.thinkgem.jeesite.modules.unit.MakeNoUtil;
import com.thinkgem.jeesite.modules.unit.UUIDUtils;

/**
 * 游戏用户Service
 * @author chenye
 * @version 2018-03-25
 */
@Service
//@Transactional(readOnly = true)
public class RoomService {
	@Autowired
	RoomDao roomDao;
	//@Autowired
	//GameUserDao GameUserDao;

	public Map<String,String> createRoom(String name) {
		String no=MakeNoUtil.makeOrderNum();
		String id=UUIDUtils.randomUUID();
		Map<String,String> map = new HashMap();
		map.put("message", "创建房间成功！");
		map.put("status", "success");
		Integer b=roomDao.queryRoomNameCount(name);
		if (b != null && b.longValue() > 0) {
			// 用户名、手机、电子邮件存在
			map.put("message", "用户名或者手机已经存在！");
			map.put("status", "fail");
		}
		roomDao.createRoom(id,name,no);
		return map;
	}
	// 查询用户是否存在

	public ResponseData queryRoomList(
			Integer start,
			Integer size){
		List<GameRoom> list=roomDao.queryRoomList(start,size);
		Integer count=roomDao.queryRoomCount();
		ResponseData rs=new ResponseData();
		rs.setTotal(Long.valueOf(count));
		rs.setRows(list);
		return rs;
	}
	
	public GameRoom queryRoomByRoomNo(
			String  roomnumber){
		return roomDao.queryRoomByRoomNo(roomnumber);
	}
}