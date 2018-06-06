/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.game_bets.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.game_bets.entity.GameBets;
import com.thinkgem.jeesite.modules.game_bets.dao.GameBetsDao;

/**
 * 游戏下注Service
 * @author cy
 * @version 2018-05-03
 */
@Service
//@Transactional(readOnly = true)
public class GameBetsService extends CrudService<GameBetsDao, GameBets> {

	public GameBets get(String id) {
		return super.get(id);
	}
	
	public List<GameBets> findList(GameBets gameBets) {
		return super.findList(gameBets);
	}
	
	public Page<GameBets> findPage(Page<GameBets> page, GameBets gameBets) {
		return super.findPage(page, gameBets);
	}
	
	@Transactional(readOnly = false)
	public void save(GameBets gameBets) {
		super.save(gameBets);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameBets gameBets) {
		super.delete(gameBets);
	}
	
}