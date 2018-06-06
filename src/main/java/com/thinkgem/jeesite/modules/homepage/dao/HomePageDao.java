/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.homepage.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.homepage.entity.HomePage;

/**
 * 首页DAO接口
 * @author aa
 * @version 2018-05-29
 */
@MyBatisDao
public interface HomePageDao extends CrudDao<HomePage> {
	
}