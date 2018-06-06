/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awarddetailreport.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.awarddetailreport.entity.AwardDetailedReport;

/**
 * 开奖详细报表DAO接口
 * @author 开奖详细报表
 * @version 2018-05-27
 */
@MyBatisDao
public interface AwardDetailedReportDao extends CrudDao<AwardDetailedReport> {
	
}