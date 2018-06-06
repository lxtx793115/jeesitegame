/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.chatrecord.service;

import java.util.List;

import org.apache.poi.hssf.record.chart.ChartRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.chatrecord.entity.ChatRecord;
import com.thinkgem.jeesite.modules.chatrecord.dao.ChatRecordDao;

/**
 * 聊天记录管理Service
 * @author ss
 * @version 2018-05-11
 */
@Service
@Transactional(readOnly = true)
public class ChatRecordService extends CrudService<ChatRecordDao, ChatRecord> {
	@Autowired
	private ChatRecordDao chatRecordDao;
	
	public ChatRecord get(String id) {
		return super.get(id);
	}
	
	public List<ChatRecord> findList(ChatRecord chatRecord) {
		return super.findList(chatRecord);
	}
	
	public List<ChatRecord> findListIII(ChatRecord chatRecord) {
		return chatRecordDao.findListIII(chatRecord);
	}
	
	public List<ChatRecord> findListIIIBySenderUserid(ChatRecord chatRecord) {
		return chatRecordDao.findListIIIBySenderUserid(chatRecord);
	}
	
	public Page<ChatRecord> findPageII(Page<ChatRecord> page,ChatRecord chatRecord) {
		chatRecord.setPage(page);
		return page.setList(chatRecordDao.findListII(chatRecord));
	}
	
	public Page<ChatRecord> findPage(Page<ChatRecord> page, ChatRecord chatRecord) {
		page.setOrderBy("chatnumber ASC");
		return super.findPage(page, chatRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(ChatRecord chatRecord) {
		super.save(chatRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(ChatRecord chatRecord) {
		super.delete(chatRecord);
	}
	
}