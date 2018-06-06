/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.operationalset.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.operationalset.entity.OperationalSet;
import com.thinkgem.jeesite.modules.operationalset.dao.OperationalSetDao;

/**
 * 运营设置Service
 * @author ddd
 * @version 2018-05-11
 */
@Service
@Transactional(readOnly = true)
public class OperationalSetService extends CrudService<OperationalSetDao, OperationalSet> {

	public OperationalSet get(String id) {
		return super.get(id);
	}
	
	public List<OperationalSet> findList(OperationalSet operationalSet) {
		return super.findList(operationalSet);
	}
	
	public Page<OperationalSet> findPage(Page<OperationalSet> page, OperationalSet operationalSet) {
		return super.findPage(page, operationalSet);
	}
	
	@Transactional(readOnly = false)
	public void save(OperationalSet operationalSet) {
		super.save(operationalSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(OperationalSet operationalSet) {
		super.delete(operationalSet);
	}
	
}