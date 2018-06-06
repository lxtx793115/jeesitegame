/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.virtualnumberset.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.virtualnumberset.entity.VirtualNumberSet;
import com.thinkgem.jeesite.modules.virtualnumberset.dao.VirtualNumberSetDao;

/**
 * 虚拟人数设置Service
 * @author ddd
 * @version 2018-05-09
 */
@Service
@Transactional(readOnly = true)
public class VirtualNumberSetService extends CrudService<VirtualNumberSetDao, VirtualNumberSet> {

	public VirtualNumberSet get(String id) {
		return super.get(id);
	}
	
	public List<VirtualNumberSet> findList(VirtualNumberSet virtualNumberSet) {
		return super.findList(virtualNumberSet);
	}
	
	public Page<VirtualNumberSet> findPage(Page<VirtualNumberSet> page, VirtualNumberSet virtualNumberSet) {
		return super.findPage(page, virtualNumberSet);
	}
	
	@Transactional(readOnly = false)
	public void save(VirtualNumberSet virtualNumberSet) {
		super.save(virtualNumberSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(VirtualNumberSet virtualNumberSet) {
		super.delete(virtualNumberSet);
	}
	
}