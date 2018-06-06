/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.entertainedset.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.entertainedset.entity.EntertainedSet;
import com.thinkgem.jeesite.modules.entertainedset.dao.EntertainedSetDao;

/**
 * 封盘设置Service
 * @author ss
 * @version 2018-05-10
 */
@Service
@Transactional(readOnly = true)
public class EntertainedSetService extends CrudService<EntertainedSetDao, EntertainedSet> {

	public EntertainedSet get(String id) {
		return super.get(id);
	}
	
	public List<EntertainedSet> findList(EntertainedSet entertainedSet) {
		return super.findList(entertainedSet);
	}
	
	public Page<EntertainedSet> findPage(Page<EntertainedSet> page, EntertainedSet entertainedSet) {
		return super.findPage(page, entertainedSet);
	}
	
	@Transactional(readOnly = false)
	public void save(EntertainedSet entertainedSet) {
		super.save(entertainedSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(EntertainedSet entertainedSet) {
		super.delete(entertainedSet);
	}
	
}