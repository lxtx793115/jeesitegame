/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gameuserrank.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.gameuserrank.entity.GameUserAccount;

/**
 * 用户银行DAO接口
 * @author dd
 * @version 2018-05-04
 */
@MyBatisDao
public interface GameUserAccountDao extends CrudDao<GameUserAccount> {
	
}