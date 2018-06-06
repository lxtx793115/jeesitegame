/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameroom.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;

/**
 * 游戏房间DAO接口
 * @author chenye
 * @version 2018-04-15
 */
@MyBatisDao
public interface GameRoomDao extends CrudDao<GameRoom> {
	/**
	 * 根据房间号查询房间
	 * @param roomNo
	 * @return
	 */
	public GameRoom queryRoomCount(@Param("roomNo")String roomNo);
	//Integer queryUserCount(@Param("username")String username, @Param("phone")String phone);
}