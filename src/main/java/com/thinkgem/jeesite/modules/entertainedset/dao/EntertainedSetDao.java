/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.entertainedset.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.entertainedset.entity.EntertainedSet;

/**
 * 封盘设置DAO接口
 * @author ss
 * @version 2018-05-10
 */
@MyBatisDao
public interface EntertainedSetDao extends CrudDao<EntertainedSet> {
	
}