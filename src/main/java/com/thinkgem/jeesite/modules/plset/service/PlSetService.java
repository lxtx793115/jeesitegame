/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plset.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.plset.entity.PlSet;
import com.thinkgem.jeesite.modules.plset.dao.PlSetDao;

/**
 * 赔率设置Service
 * @author ss
 * @version 2018-05-07
 */
@Service
@Transactional(readOnly = true)
public class PlSetService extends CrudService<PlSetDao, PlSet> {

	public PlSet get(String id) {
		return super.get(id);
	}
	
	public List<PlSet> findList(PlSet plSet) {
		return super.findList(plSet);
	}
	
	public Page<PlSet> findPage(Page<PlSet> page, PlSet plSet) {
		return super.findPage(page, plSet);
	}
	
	@Transactional(readOnly = false)
	public void save(PlSet plSet) {
		super.save(plSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(PlSet plSet) {
		super.delete(plSet);
	}
	
}