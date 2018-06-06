/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.updownreport.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.updownreport.entity.UpAndDownReport;

/**
 * 上下分报表DAO接口
 * @author qq
 * @version 2018-05-25
 */
@MyBatisDao
public interface UpAndDownReportDao extends CrudDao<UpAndDownReport> {
	public List<UpAndDownReport> findListtotal(UpAndDownReport upAndDownReport);
}