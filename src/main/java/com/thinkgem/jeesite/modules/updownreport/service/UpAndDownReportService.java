/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.updownreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.updownreport.entity.UpAndDownReport;
import com.thinkgem.jeesite.modules.updownreport.dao.UpAndDownReportDao;

/**
 * 上下分报表Service
 * @author qq
 * @version 2018-05-25
 */
@Service
@Transactional(readOnly = true)
public class UpAndDownReportService extends CrudService<UpAndDownReportDao, UpAndDownReport> {
	@Autowired
	private UpAndDownReportDao upAndDownReportDao;
	
	
	public UpAndDownReport get(String id) {
		return super.get(id);
	}
	
	public List<UpAndDownReport> findListtotal(UpAndDownReport upAndDownReport) {
		return upAndDownReportDao.findListtotal(upAndDownReport);
	}
	
	public List<UpAndDownReport> findList(UpAndDownReport upAndDownReport) {
		return super.findList(upAndDownReport);
	}
	
	public Page<UpAndDownReport> findPage(Page<UpAndDownReport> page, UpAndDownReport upAndDownReport) {
		return super.findPage(page, upAndDownReport);
	}
	
	@Transactional(readOnly = false)
	public void save(UpAndDownReport upAndDownReport) {
		super.save(upAndDownReport);
	}
	
	@Transactional(readOnly = false)
	public void delete(UpAndDownReport upAndDownReport) {
		super.delete(upAndDownReport);
	}
	
}