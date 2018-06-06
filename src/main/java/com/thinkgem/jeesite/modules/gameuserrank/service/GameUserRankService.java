/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.gameuserrank.entity.GameUserRank;
import com.thinkgem.jeesite.modules.gameuserrank.dao.GameUserRankDao;

/**
 * 用户级别IIService
 * @author dan
 * @version 2018-05-04
 */
@Service
@Transactional(readOnly = true)
public class GameUserRankService extends CrudService<GameUserRankDao, GameUserRank> {

	public GameUserRank get(String id) {
		return super.get(id);
	}
	
	public List<GameUserRank> findList(GameUserRank gameUserRank) {
		return super.findList(gameUserRank);
	}
	
	public Page<GameUserRank> findPage(Page<GameUserRank> page, GameUserRank gameUserRank) {
		return super.findPage(page, gameUserRank);
	}
	
	@Transactional(readOnly = false)
	public void save(GameUserRank gameUserRank) {
		super.save(gameUserRank);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameUserRank gameUserRank) {
		super.delete(gameUserRank);
	}
	
}