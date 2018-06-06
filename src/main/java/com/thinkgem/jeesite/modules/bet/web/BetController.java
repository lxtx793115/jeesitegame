package com.thinkgem.jeesite.modules.bet.web;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.bet.service.BetService;
import com.thinkgem.jeesite.modules.game_bets.entity.GameBets;
import com.thinkgem.jeesite.modules.game_bets.service.GameBetsService;
import com.thinkgem.jeesite.modules.unit.ValidateUtils;

/**
 * 生成验证码
 * @author cy
 *
 */
@Controller
@RequestMapping(value="/api/bet")
public class BetController extends BaseController{
	@Autowired
	private GameBetsService gameBetsService;
	@Autowired
	private BetService betService;
	/**
	 * 计算游戏结果
	 * @param issue   期号
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value="calc") 
	@ResponseBody
    public Map<String,String> calc(@RequestParam(required=false)String issue,HttpServletRequest request, HttpSession session){  
		//游戏结果map
		Map<String,String> gameResuleMap = new HashMap();
		gameResuleMap.put("da", "da");
		try {
			//通过 开奖期号    获取  游戏场次列表
			List<Map<String,Object>>  gameListMap=  betService.getGamelistByIssue(issue);
			
			//对每一场游戏分别计算
			for(Map<String,Object> map : gameListMap) {
				//通过游戏场次id 获取到所有参加游戏的人，和押注数据
				List<Map<String,Object>>  userbetinfolistmap=  betService.getUserListByGameid((String) map.get("id"));
				//获取房间赔率
				Map<String,Object> oddmap= betService.getOddbyRoomid((String)map.get("room_id"));
				for(Map<String,Object> userbetinfomap : userbetinfolistmap) {
					//通过游戏场次id 获取到所有参加游戏的人，和押注数据
					for(Map.Entry<String, Object> userbetinfomapEntry:userbetinfomap.entrySet()) {
						
						for(Entry<String, String> gameResuleMapEntry:gameResuleMap.entrySet()) {
							//如果该下注种类，和结果相同，即压中 ，继续
							if(userbetinfomapEntry.getKey().equals(gameResuleMapEntry.getKey())) {
								//如果该压中下注种类，这个房间设置了赔率
								for(Map.Entry<String, Object> oddmapEntry:oddmap.entrySet()) {
									if(gameResuleMapEntry.getKey().equals(oddmapEntry.getKey())) {
										//修改用户余额                                                                        					下注金额                                                                                                                             赔率
										betService.increaseUserMoney(Float.valueOf(userbetinfomapEntry.getValue().toString())*Float.valueOf(oddmapEntry.getValue().toString()),userbetinfomap.get("game_user_id").toString());
										//保存余额变化明细
										betService.saveUserBalanceChange(Float.valueOf(userbetinfomapEntry.getValue().toString())*Float.valueOf(oddmapEntry.getValue().toString()),userbetinfomap.get("game_user_id").toString());
									}
								}
							}
						}
						
						
					}
					System.out.println(oddmap);
					System.out.println(userbetinfomap);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gameResuleMap;
    }  
	
	@RequestMapping(value="userBet") 
	@ResponseBody
	public Map userBet(GameBets gameBets) {
		Map map =new HashMap();
		if(ValidateUtils.isNull(gameBets.getGameUserId())) {
			map.put("message", "用户id不能为空");
			return map;
		}
		try {
			gameBetsService.save(gameBets);
		} catch (Exception e) {
			map.put("message", "下注失败");
			return map;
		}
		map.put("message", "下注成功");
		return null;
	}
	private void getRoomUserList(String roomId) {
		// TODO Auto-generated method stub
	}


	public static void timer1() {  
        Timer timer = new Timer();  
        timer.schedule(new TimerTask() {  
            public void run() {  
                System.out.println("-------设定要指定任务--------");  
            }  
        }, 2000);// 设定指定的时间time,此处为2000毫秒  
    }  
    public static void timer4() {  
        Calendar calendar = Calendar.getInstance();  
        calendar.set(Calendar.HOUR_OF_DAY, 12); // 控制时  
        calendar.set(Calendar.MINUTE, 0);       // 控制分  
        calendar.set(Calendar.SECOND, 0);       // 控制秒  
  
        Date time = calendar.getTime();         // 得出执行任务的时间,此处为今天的12：00：00  
  
        Timer timer = new Timer();  
        timer.scheduleAtFixedRate(new TimerTask() {  
            public void run() {  
                System.out.println("-------设定要指定任务--------");  
            }  
        }, time, 1000 * 60 * 60 * 24);// 这里设定将延时每天固定执行  
    }  
}
