package com.thinkgem.jeesite.modules.bet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.modules.bet.dao.BetDao;

/**
 * 游戏用户下注Service
 * @author chenye
 * @version 2018-04-25
 */
@Service
public class BetService {
	@Autowired
	BetDao betDao;

	/**
	 * 通过游戏期号获取游戏场次
	 * @param issue    开奖期号
	 * @return List<Map<String, Object>>
	 */
	public List<Map<String, Object>> getGamelistByIssue(String issue) {
		return betDao.getGamelistByIssue(issue);
	}
	/**
	 * 通过游戏场次id 获取到所有参加游戏的人，和押注数据
	 * @param gameid
	 * @return
	 */
	public List<Map<String, Object>> getUserListByGameid(String gameid) {
		return betDao.getUserListByGameid(gameid);
	}
	/**
	 * 获取房间 游戏赔率
	 * 
	 */
	public Map<String, Object> getOddbyRoomid(String room_id) {
		return betDao.getOddbyRoomid(room_id);
	}
	
	public void increaseUserMoney(float money,String id) {
		betDao.increaseUserMoney(money,id);
	}
	public void saveUserBalanceChange(float money, String userid) {
		betDao.saveUserBalanceChange(money,userid);
	}
}