/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.gameuser.dao.GameUserDaoCy;
import com.thinkgem.jeesite.modules.gameuser.service.GameUserServiceCy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.UserAgentUtils;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * 手机端视图拦截器
 * @author ThinkGem
 * @version 2014-9-1
 */
public class MobileInterceptor extends BaseService implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(MobileInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		WebApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		ac.getServletContext();
		/*GameUserDaoCy gameUserDaoCy=wac.getBean(GameUserDaoCy.class);*/

		//ApplicationContext ac = new FileSystemXmlApplicationContext("classpath*:/spring-context*.xml");
		GameUserServiceCy gameUserDaoCy=(GameUserServiceCy)ac.getBean("gameUserServiceCy");
		//GameUserDaoCy gameUserDao =(GameUserDaoCy) wac.getBean("gameUserDaoCy");*/
		String requestURI=request.getRequestURI();
		String tokenStr=request.getParameter("accessToken");
		String token="";
		if(requestURI.contains("/api/")&&
				!requestURI.contains("api/LoginController")&&
				!requestURI.contains("/api/Registercontroller")&&
				!requestURI.contains("/api/test")&&
				!requestURI.contains("/api/RoomController")&&
				!requestURI.contains("/api/chatWebsocket")&&
				!requestURI.contains("/api/bet")
				){//排查登陆与注册接口
			token=request.getHeader("accessToken");
			if(token==null && tokenStr==null){
				logger.info("real token:======================is null");
				String str="{'errorCode':401,'message':'缺少token，无法验证','data':null}";
				dealErrorReturn(request,response,str);
				return false;
			}
			if(tokenStr!=null){
				token=tokenStr;
			}
			//token=jwtUtil.updateToken(token);
			Integer judgeTokenIfExists=gameUserDaoCy.queryAccessTokenByToken(token);
			if(judgeTokenIfExists==0){
				logger.info("real token:======================is null");
				String str="{'errorCode':402,'message':'token不正确，无法访问接口','data':null}";
				dealErrorReturn(request,response,str);
				return false;
			}
			logger.info("real token:=============================="+token);
			logger.info("real ohter:=============================="+request.getHeader("Cookie"));
			response.setHeader("token",token);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		if (modelAndView != null){
			// 如果是手机或平板访问的话，则跳转到手机视图页面。
			if(UserAgentUtils.isMobileOrTablet(request) && !StringUtils.startsWithIgnoreCase(modelAndView.getViewName(), "redirect:")){
				modelAndView.setViewName("mobile/" + modelAndView.getViewName());
			}
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {
		
	}



	/**
	 * 检测到没有token，直接返回不验证
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param obj
	 */
	public void dealErrorReturn(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,Object obj){
		String json = (String)obj;
		PrintWriter writer = null;
		httpServletResponse.setCharacterEncoding("UTF-8");
		httpServletResponse.setContentType("text/html; charset=utf-8");
		try {
			writer = httpServletResponse.getWriter();
			writer.print(json);
		} catch (IOException ex) {
			logger.error("response error",ex);
		} finally {
			if (writer != null)
				writer.close();
		}
	}
}
