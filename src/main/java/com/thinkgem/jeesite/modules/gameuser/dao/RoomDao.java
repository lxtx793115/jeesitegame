package com.thinkgem.jeesite.modules.gameuser.dao;

import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

import java.util.List;

/**
 * 游戏用户DAO接口
 * @author chenye
 * @version 2018-03-25
 */
@MyBatisDao
public interface RoomDao extends BaseDao{

	void createRoom(@Param("id") String id, @Param("name") String name, @Param("no") String no);
	int queryRoomNameCount(@Param("name") String name);

	List<GameRoom> queryRoomList(@Param("start") int start, @Param("size") int size);

	Integer queryRoomCount();
	
	GameRoom queryRoomByRoomNo(@Param("roomnumber")String roomnumber);
}