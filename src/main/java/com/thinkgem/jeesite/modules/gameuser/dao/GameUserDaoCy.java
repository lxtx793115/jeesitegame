package com.thinkgem.jeesite.modules.gameuser.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.gametoken.entity.TokenEntity;
import com.thinkgem.jeesite.modules.gameuser.entity.GameUser;


/**
 * 游戏用户DAO接口
 * @author chenye
 * @version 2018-0414
 */
@MyBatisDao
public interface GameUserDaoCy extends BaseDao{
	Integer queryUserCount(@Param("username")String username, @Param("phone")String phone);
	void insertUser(GameUser gameuser);
	public Map<String, Object>  pwdLogin(Map<String, Object> m);
	//通过用户名密码获取用户
	GameUser getGameUserBynamepwd(@Param("username")String username,@Param("password")String password);
	//通过用户名获取用户
	GameUser getGameUserByUserName(@Param("username")String username);
	/*
	 * 通过用户名得到盐
	 */
	String getSaltByUsername(String username);
	//获取用户列表数据
	public Map<String, Object>  getGameUserListdata(Map<String, Object> map);
	
	//获取用户列表级别信息
	public Map<String, Object>  getGameUserLevel(Map<String, Object> map);
	//获取用户数量
	public Integer  getGameUserListdataCount(Map<String, Object> map);
	
	//public Map<String, Object> 	phoneLogin(@Param("phone")String phone);
	//	public void xiugaiPwd(@Param("phone")String phone,@Param("pwd")String pwd);
	//	public List<Map<String, Object>> ccheckMainList(@Param("clinicId")String clinicId);
	//	public List<Map<String, Object>> allCCheckMain(Map<String, Object> m);
	//	public void addUser(Map<String, Object> m);
	//	public void updatePwd(@Param("userId")String userId,@Param("pwd")String pwd);
	//	public void addKeshi(@Param("userId")String userId,@Param("keshiId")String keshiId);
	//	public void delKeShi(@Param("userId")String userId );
	//	public void updateUserMain(String userId,String nickname,String bir,String address);
	//	public Map<String, Object> findUserById(String userId);
	//	public List<Map<String, Object>> findUserKeShi(String userId);


	void insertAccessToken(TokenEntity entity);

	Integer queryAccessTokenByClientId(@Param("clientId")String clientId);

	Integer queryAccessTokenByToken(@Param("accessToken")String accessToken);

	void updateAccessToken(TokenEntity entity);
	
	GameUser getUserByPhone(@Param("phone")String phone);
}