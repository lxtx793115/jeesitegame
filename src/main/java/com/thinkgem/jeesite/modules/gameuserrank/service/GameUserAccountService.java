/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.gameuserrank.entity.GameUserAccount;
import com.thinkgem.jeesite.modules.gameuserrank.dao.GameUserAccountDao;

/**
 * 用户银行Service
 * @author dd
 * @version 2018-05-04
 */
@Service
@Transactional(readOnly = true)
public class GameUserAccountService extends CrudService<GameUserAccountDao, GameUserAccount> {

	public GameUserAccount get(String id) {
		return super.get(id);
	}
	
	public List<GameUserAccount> findList(GameUserAccount gameUserAccount) {
		return super.findList(gameUserAccount);
	}
	
	public Page<GameUserAccount> findPage(Page<GameUserAccount> page, GameUserAccount gameUserAccount) {
		return super.findPage(page, gameUserAccount);
	}
	
	@Transactional(readOnly = false)
	public void save(GameUserAccount gameUserAccount) {
		super.save(gameUserAccount);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameUserAccount gameUserAccount) {
		super.delete(gameUserAccount);
	}
	
}