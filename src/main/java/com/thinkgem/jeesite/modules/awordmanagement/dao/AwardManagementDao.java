/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awordmanagement.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.awordmanagement.entity.AwardManagement;

/**
 * 开奖管理DAO接口
 * @author ww
 * @version 2018-05-27
 */
@MyBatisDao
public interface AwardManagementDao extends CrudDao<AwardManagement> {
	
}