/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.homepage.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.homepage.entity.HomePage;
import com.thinkgem.jeesite.modules.homepage.dao.HomePageDao;

/**
 * 首页Service
 * @author aa
 * @version 2018-05-29
 */
@Service
@Transactional(readOnly = true)
public class HomePageService extends CrudService<HomePageDao, HomePage> {

	public HomePage get(String id) {
		return super.get(id);
	}
	
	public List<HomePage> findList(HomePage homePage) {
		return super.findList(homePage);
	}
	
	public Page<HomePage> findPage(Page<HomePage> page, HomePage homePage) {
		return super.findPage(page, homePage);
	}
	
	@Transactional(readOnly = false)
	public void save(HomePage homePage) {
		super.save(homePage);
	}
	
	@Transactional(readOnly = false)
	public void delete(HomePage homePage) {
		super.delete(homePage);
	}
	
}