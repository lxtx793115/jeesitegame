/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.virtualnumberset.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.virtualnumberset.entity.VirtualNumberSet;

/**
 * 虚拟人数设置DAO接口
 * @author ddd
 * @version 2018-05-09
 */
@MyBatisDao
public interface VirtualNumberSetDao extends CrudDao<VirtualNumberSet> {
	
}