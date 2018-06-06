/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserbet.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.gameuserbet.entity.GameuserBet;
import com.thinkgem.jeesite.modules.gameuserbet.dao.GameuserBetDao;

/**
 * 用户投注记录Service
 * @author ss
 * @version 2018-05-21
 */
@Service
@Transactional(readOnly = true)
public class GameuserBetService extends CrudService<GameuserBetDao, GameuserBet> {

	public GameuserBet get(String id) {
		return super.get(id);
	}
	
	public List<GameuserBet> findList(GameuserBet gameuserBet) {
		return super.findList(gameuserBet);
	}
	
	public Page<GameuserBet> findPage(Page<GameuserBet> page, GameuserBet gameuserBet) {
		return super.findPage(page, gameuserBet);
	}
	
	@Transactional(readOnly = false)
	public void save(GameuserBet gameuserBet) {
		super.save(gameuserBet);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameuserBet gameuserBet) {
		super.delete(gameuserBet);
	}
	
}