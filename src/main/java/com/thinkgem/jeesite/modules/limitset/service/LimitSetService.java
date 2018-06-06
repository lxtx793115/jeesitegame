/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.limitset.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.limitset.entity.LimitSet;
import com.thinkgem.jeesite.modules.limitset.dao.LimitSetDao;

/**
 * 限额设置Service
 * @author ddd
 * @version 2018-05-09
 */
@Service
@Transactional(readOnly = true)
public class LimitSetService extends CrudService<LimitSetDao, LimitSet> {

	public LimitSet get(String id) {
		return super.get(id);
	}
	
	public List<LimitSet> findList(LimitSet limitSet) {
		return super.findList(limitSet);
	}
	
	public Page<LimitSet> findPage(Page<LimitSet> page, LimitSet limitSet) {
		return super.findPage(page, limitSet);
	}
	
	@Transactional(readOnly = false)
	public void save(LimitSet limitSet) {
		super.save(limitSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(LimitSet limitSet) {
		super.delete(limitSet);
	}
	
}