/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;
import com.thinkgem.jeesite.modules.gameuser.dao.GameUserDao;

/**
 * 游戏用户Service
 * @author chenye
 * @version 2018-04-14
 */
@Service
@Transactional(readOnly = true)
public class GameUserService extends CrudService<GameUserDao, GameUser> {

	public GameUser get(String id) {
		return super.get(id);
	}
	
	public List<GameUser> findList(GameUser gameUser) {
		return super.findList(gameUser);
	}
	
	public Page<GameUser> findPage(Page<GameUser> page, GameUser gameUser) {
		return super.findPage(page, gameUser);
	}
	
	@Transactional(readOnly = false)
	public void save(GameUser gameUser) {
		super.save(gameUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameUser gameUser) {
		super.delete(gameUser);
	}
	
}