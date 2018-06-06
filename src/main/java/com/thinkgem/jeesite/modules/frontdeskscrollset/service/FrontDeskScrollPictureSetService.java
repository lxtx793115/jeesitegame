/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.frontdeskscrollset.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.frontdeskscrollset.entity.FrontDeskScrollPictureSet;
import com.thinkgem.jeesite.modules.frontdeskscrollset.dao.FrontDeskScrollPictureSetDao;

/**
 * 前台滚动图片设置Service
 * @author sss
 * @version 2018-05-11
 */
@Service
@Transactional(readOnly = true)
public class FrontDeskScrollPictureSetService extends CrudService<FrontDeskScrollPictureSetDao, FrontDeskScrollPictureSet> {

	public FrontDeskScrollPictureSet get(String id) {
		return super.get(id);
	}
	
	public List<FrontDeskScrollPictureSet> findList(FrontDeskScrollPictureSet frontDeskScrollPictureSet) {
		return super.findList(frontDeskScrollPictureSet);
	}
	
	public Page<FrontDeskScrollPictureSet> findPage(Page<FrontDeskScrollPictureSet> page, FrontDeskScrollPictureSet frontDeskScrollPictureSet) {
		return super.findPage(page, frontDeskScrollPictureSet);
	}
	
	@Transactional(readOnly = false)
	public void save(FrontDeskScrollPictureSet frontDeskScrollPictureSet) {
		super.save(frontDeskScrollPictureSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(FrontDeskScrollPictureSet frontDeskScrollPictureSet) {
		super.delete(frontDeskScrollPictureSet);
	}
	
}