/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameroom.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameroom.dao.GameRoomDao;

/**
 * 游戏房间Service
 * @author chenye
 * @version 2018-04-15
 */
@Service
@Transactional(readOnly = true)
public class GameRoomService extends CrudService<GameRoomDao, GameRoom> {

	public GameRoom get(String id) {
		return super.get(id);
	}
	
	public List<GameRoom> findList(GameRoom gameRoom) {
		return super.findList(gameRoom);
	}
	
	public Page<GameRoom> findPage(Page<GameRoom> page, GameRoom gameRoom) {
		return super.findPage(page, gameRoom);
	}
	
	@Transactional(readOnly = false)
	public void save(GameRoom gameRoom) {
		super.save(gameRoom);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameRoom gameRoom) {
		super.delete(gameRoom);
	}
	
}