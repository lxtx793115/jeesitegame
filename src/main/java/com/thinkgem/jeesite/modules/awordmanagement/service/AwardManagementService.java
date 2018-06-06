/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awordmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.awordmanagement.entity.AwardManagement;
import com.thinkgem.jeesite.modules.awordmanagement.dao.AwardManagementDao;

/**
 * 开奖管理Service
 * @author ww
 * @version 2018-05-27
 */
@Service
@Transactional(readOnly = true)
public class AwardManagementService extends CrudService<AwardManagementDao, AwardManagement> {

	public AwardManagement get(String id) {
		return super.get(id);
	}
	
	public List<AwardManagement> findList(AwardManagement awardManagement) {
		return super.findList(awardManagement);
	}
	
	public Page<AwardManagement> findPage(Page<AwardManagement> page, AwardManagement awardManagement) {
		return super.findPage(page, awardManagement);
	}
	
	@Transactional(readOnly = false)
	public void save(AwardManagement awardManagement) {
		super.save(awardManagement);
	}
	
	@Transactional(readOnly = false)
	public void delete(AwardManagement awardManagement) {
		super.delete(awardManagement);
	}
	
}