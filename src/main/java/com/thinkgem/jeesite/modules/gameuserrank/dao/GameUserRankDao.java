/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.gameuserrank.entity.GameUserRank;

/**
 * 用户级别IIDAO接口
 * @author dan
 * @version 2018-05-04
 */
@MyBatisDao
public interface GameUserRankDao extends CrudDao<GameUserRank> {
	
}