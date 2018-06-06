package com.thinkgem.jeesite.modules.gameuser.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.gameroom.entity.GameRoom;
import com.thinkgem.jeesite.modules.gameuser.dao.GameUserDaoCy;
import com.thinkgem.jeesite.modules.gameuser.entity.ResponseData;
import com.thinkgem.jeesite.modules.gameuser.service.GameUserServiceCy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.modules.gameuser.service.RoomService;

/**
 * 房间
 * @author chenye
 *
 */
@Controller
@RequestMapping(value="/api/RoomController")
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping("createRoom") 
	@ResponseBody
    public Map<String,String> createRoom(String name,HttpServletRequest request,HttpServletResponse response, HttpSession session){  
		Map<String,String> map = new HashMap();
		if(null==name||""==name) {
			map.put("message", "房间名不能为空，创建房间失败！");
			map.put("status", "success");
		}
		try {
			map=roomService.createRoom(name);
		} catch (Exception e) {
			map.put("message", "出现错误！创建房间失败！");
			map.put("status", "fail");
			e.printStackTrace();
		}
		return map;  
    }

	@RequestMapping("/queryRoomList")
	@ResponseBody
	public String queryRoom(
			Integer pageNo,
			Integer pageSize,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session){
		
		    if(pageNo==null||"".equals(pageNo)
		    	||pageSize==null||"".equals(pageSize)){
		    	ResponseData rs=new ResponseData();
		    	rs.setCode("-1");
		    	rs.setMessage("页数或页面不能为空");
		    	Gson gson=new Gson();
		    	String returnStr=gson.toJson(rs);
				return returnStr;
		    }
		    
		    if(pageNo==0){
			    	ResponseData rs=new ResponseData();
			    	rs.setCode("-1");
			    	rs.setMessage("页数要从1开始");
			    	Gson gson=new Gson();
			    	String returnStr=gson.toJson(rs);
					return returnStr;
			    }
		    	
		    int start= (pageNo-1)*pageSize;
			int size=pageSize;
			
			
			ResponseData rs=roomService.queryRoomList(start,size);
			Gson gson=new Gson();
			rs.setCode("0");
			String returnStr=gson.toJson(rs);
			return returnStr;
		}
	
	@RequestMapping("/queryRoomByRoomNo")
	@ResponseBody
	public String queryRoom(
			String roomnumber,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session){
		   if(roomnumber==null||"".equals(roomnumber)){
			   String str="{'message', '房间序号不能为空！','status', 'fail'}";
			   return str;
		   }
			GameRoom rs=roomService.queryRoomByRoomNo(roomnumber);
			Gson gson=new Gson();
			if(rs!=null){
				String returnStr=gson.toJson(rs);
				return returnStr;
			}else{
				String str="{'message', '根据房间序号未找到相关房间！','status', 'fail'}";
				return str;
			}
		}

}
