/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.game_bets.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.game_bets.entity.GameBets;

/**
 * 游戏下注DAO接口
 * @author cy
 * @version 2018-05-03
 */
@MyBatisDao
public interface GameBetsDao extends CrudDao<GameBets> {
	
}