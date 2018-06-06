/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awarddetailreport.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.awarddetailreport.entity.AwardDetailedReport;
import com.thinkgem.jeesite.modules.awarddetailreport.dao.AwardDetailedReportDao;

/**
 * 开奖详细报表Service
 * @author 开奖详细报表
 * @version 2018-05-27
 */
@Service
@Transactional(readOnly = true)
public class AwardDetailedReportService extends CrudService<AwardDetailedReportDao, AwardDetailedReport> {

	public AwardDetailedReport get(String id) {
		return super.get(id);
	}
	
	public List<AwardDetailedReport> findList(AwardDetailedReport awardDetailedReport) {
		return super.findList(awardDetailedReport);
	}
	
	public Page<AwardDetailedReport> findPage(Page<AwardDetailedReport> page, AwardDetailedReport awardDetailedReport) {
		return super.findPage(page, awardDetailedReport);
	}
	
	@Transactional(readOnly = false)
	public void save(AwardDetailedReport awardDetailedReport) {
		super.save(awardDetailedReport);
	}
	
	@Transactional(readOnly = false)
	public void delete(AwardDetailedReport awardDetailedReport) {
		super.delete(awardDetailedReport);
	}
	
}