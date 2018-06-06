/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuser.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;

/**
 * 游戏用户DAO接口
 * @author chenye
 * @version 2018-04-14
 */
@MyBatisDao
public interface GameUserDao extends CrudDao<GameUser> {
	
}