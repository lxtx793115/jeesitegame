/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.chatrecord.dao;

import java.util.List;

import org.apache.poi.hssf.record.chart.ChartRecord;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.chatrecord.entity.ChatRecord;

/**
 * 聊天记录管理DAO接口
 * @author ss
 * @version 2018-05-11
 */
@MyBatisDao
public interface ChatRecordDao extends CrudDao<ChatRecord> {
	
	List<ChatRecord> findListII(ChatRecord chatRecord);
	
	List<ChatRecord> findListIII(ChatRecord chatRecord);
	
	List<ChatRecord> findListIIIBySenderUserid(ChatRecord chatRecord);
	
}