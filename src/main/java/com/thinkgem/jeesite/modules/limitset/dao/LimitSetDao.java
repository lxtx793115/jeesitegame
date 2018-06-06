/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.limitset.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.limitset.entity.LimitSet;

/**
 * 限额设置DAO接口
 * @author ddd
 * @version 2018-05-09
 */
@MyBatisDao
public interface LimitSetDao extends CrudDao<LimitSet> {
	
}