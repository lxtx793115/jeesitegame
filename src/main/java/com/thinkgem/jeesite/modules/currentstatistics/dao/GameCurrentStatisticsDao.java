/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.currentstatistics.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.currentstatistics.entity.GameCurrentStatistics;

/**
 * 当期统计DAO接口
 * @author ss
 * @version 2018-05-21
 */
@MyBatisDao
public interface GameCurrentStatisticsDao extends CrudDao<GameCurrentStatistics> {
	
}