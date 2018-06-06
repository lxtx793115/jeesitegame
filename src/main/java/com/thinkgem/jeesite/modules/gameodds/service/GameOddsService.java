/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameodds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.gameodds.entity.GameOdds;
import com.thinkgem.jeesite.modules.gameodds.dao.GameOddsDao;

/**
 * 游戏描述Service
 * @author cy
 * @version 2018-04-19
 */
@Service
//@Transactional(readOnly = true)
public class GameOddsService extends CrudService<GameOddsDao, GameOdds> {
	@Autowired
	GameOddsDao gameOddsDao;
	public GameOdds get(String id) {
		return super.get(id);
	}
	
	public List<GameOdds> findList(GameOdds gameOdds) {
		return super.findList(gameOdds);
	}
	
	public Page<GameOdds> findPage(Page<GameOdds> page, GameOdds gameOdds) {
		return super.findPage(page, gameOdds);
	}
	
	@Transactional(readOnly = false)
	public void save(GameOdds gameOdds) {
		super.save(gameOdds);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameOdds gameOdds) {
		super.delete(gameOdds);
	}

	public GameOdds getByRoomId(String roomId) {
		return gameOddsDao.getByRoomId(roomId);
	}
	
}