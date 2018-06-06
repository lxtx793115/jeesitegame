package com.thinkgem.jeesite.modules.bet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
/**
 * 游戏用户DAO接口
 * @author chenye
 * @version 2018-03-25
 */
@MyBatisDao
public interface BetDao extends BaseDao{
	/**
	 * 通过游戏期号获取游戏场次
	 * @param issue  开奖期号
	 * @return
	 */
	List<Map<String, Object>> getGamelistByIssue(@Param("issue")String issue);
	/**
	 * 通过游戏场次id 获取到所有参加游戏的人，和押注数据
	 * @param gameid
	 * @return
	 */
	List<Map<String, Object>> getUserListByGameid(@Param("gameid")String gameid);
	
	Map<String, Object> getOddbyRoomid(@Param("room_id")String room_id);
	
	void increaseUserMoney(@Param("money")float money,@Param("id")String id);
	void saveUserBalanceChange(@Param("money")float money, @Param("userid")String userid);
}