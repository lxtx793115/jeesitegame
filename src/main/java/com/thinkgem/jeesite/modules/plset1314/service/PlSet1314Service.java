/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.plset1314.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.plset1314.entity.PlSet1314;
import com.thinkgem.jeesite.modules.plset1314.dao.PlSet1314Dao;

/**
 * 13|14赔率Service
 * @author ddd
 * @version 2018-05-08
 */
@Service
@Transactional(readOnly = true)
public class PlSet1314Service extends CrudService<PlSet1314Dao, PlSet1314> {

	public PlSet1314 get(String id) {
		return super.get(id);
	}
	
	public List<PlSet1314> findList(PlSet1314 plSet1314) {
		return super.findList(plSet1314);
	}
	
	public Page<PlSet1314> findPage(Page<PlSet1314> page, PlSet1314 plSet1314) {
		return super.findPage(page, plSet1314);
	}
	
	@Transactional(readOnly = false)
	public void save(PlSet1314 plSet1314) {
		super.save(plSet1314);
	}
	
	@Transactional(readOnly = false)
	public void delete(PlSet1314 plSet1314) {
		super.delete(plSet1314);
	}
	
}