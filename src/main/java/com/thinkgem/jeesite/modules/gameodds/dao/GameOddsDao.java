/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameodds.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.gameodds.entity.GameOdds;

/**
 * 游戏描述DAO接口
 * @author cy
 * @version 2018-04-19
 */
@MyBatisDao
public interface GameOddsDao extends CrudDao<GameOdds> {

	GameOdds getByRoomId(@Param("roomId")String roomId);
	
}