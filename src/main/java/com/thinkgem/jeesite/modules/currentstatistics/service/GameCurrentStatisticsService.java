/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.currentstatistics.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.currentstatistics.entity.GameCurrentStatistics;
import com.thinkgem.jeesite.modules.currentstatistics.dao.GameCurrentStatisticsDao;

/**
 * 当期统计Service
 * @author ss
 * @version 2018-05-21
 */
@Service
@Transactional(readOnly = true)
public class GameCurrentStatisticsService extends CrudService<GameCurrentStatisticsDao, GameCurrentStatistics> {

	public GameCurrentStatistics get(String id) {
		return super.get(id);
	}
	
	public List<GameCurrentStatistics> findList(GameCurrentStatistics gameCurrentStatistics) {
		return super.findList(gameCurrentStatistics);
	}
	
	public Page<GameCurrentStatistics> findPage(Page<GameCurrentStatistics> page, GameCurrentStatistics gameCurrentStatistics) {
		return super.findPage(page, gameCurrentStatistics);
	}
	
	@Transactional(readOnly = false)
	public void save(GameCurrentStatistics gameCurrentStatistics) {
		super.save(gameCurrentStatistics);
	}
	
	@Transactional(readOnly = false)
	public void delete(GameCurrentStatistics gameCurrentStatistics) {
		super.delete(gameCurrentStatistics);
	}
	
}