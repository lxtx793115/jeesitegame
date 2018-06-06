<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>会员登录</title>
		<meta name="Keywords" content="关键字">
		<meta name="Description" content="描述文字">
		<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/webpage/jsp/denglu/css/standard-head.css">
		<link rel="stylesheet" type="text/css" media="all" href="/member-login.css">
		<script type="text/javascript" src="<%=path %>/webpage/static/jquery-ztree/3.5.12/js/jquery-1.4.4.min.js"></script>
   		<script type="text/javascript" src="dlLc.js"></script>
   		
   		</head>
	<body>
		<div class="pwd-reset-dialog-bg"></div>
		<div class="pwd-reset-dialog">
			<div class="pwd-form-list">
				<div class="pwd-reset-error-msg"></div>
			</div>
			<div class="pwd-form-list">
				<input id="newPassword" type="password" maxlength="16" placeholder="请输入新密码">
			</div>
			<div class="pwd-form-list">
				<input id="newPasswordVilidate" type="password" maxlength="16" placeholder="请再次输入新密码">
			</div>
			<div class="pwd-form-list">
				<input id="newPasswordPicCheck" type="text" class="pwd-form-list-msg-code" placeholder="验证码" maxlength="6">
				<input type="hidden" id="newPasswordPicSessionKey">
				<img id="newPasswordRandomImage" class="newPasswordYzm">
			</div>
			<div class="pwd-form-list">
				<a href="###" id="pwdResetBtn" class="pwd-reset-btn">重置密码</a>
			</div>
		</div>
		<!-- 页面主体 start -->
		<form action="https://passport.pinganwj.com/login" method="post" id="loginForm" autocomplete="off">
			<input type="hidden" id="targetType" name="targetType" value="">
			<input type="hidden" name="lt" value="LT-74890-mGzqfwntLcfuFpTMR070PY0oDTfFsG">
			<input type="hidden" name="execution" value="e1s1">
			<input type="hidden" id="fb" name="fb" value="">
			<input type="hidden" name="_eventId" value="submit">
			<input type="hidden" id="picSessionKey" name="picSessionKey" value="1510715025147">
			<input type="hidden" name="username">
			<input type="hidden" name="password">
			<div class="main-wrap login-main-wrap">
				<div class="top-main">
					<div class="mainbody css_head clearfix">
						<div class="css_home_link left">
							<a class="wanjia-link left" href="<%=path%>/webpage/jsp/wanjia.jsp"></a>
							<h1 class="left">会员登录</h1></div>
						<div class="support_link right">
							<div class="wechat_link right">
								<div class="erm_code">
									<a class="wechat_logo" href="###"></a>
									<a class="erm_img" href="###">
										<img src="<%=path %>/webpage/jsp/denglu/images/showqrcode.gif">
										<p>医疗超市微信服务号</p>
									</a>
								</div>
							</div>
							<div class="split right"></div>
							<div class="hotline right"><span class="right phonenum">400-8876678</span><span class="right">服务热线：</span></div>
						</div>
					</div>
				</div>
				<div class="css-login-main js_login_main" style="background: #12B5B0;">
					<div class="css-login-body clearfix" style="background: url(<%=path %>/webpage/jsp/denglu/images/dlt.jpg) 0 100% no-repeat;background-size: 50%;">
						<div class="login-body">
							<div class="css_login_with_pwd">
								<ul class="way-tab clearfix">
									<li class="num_dl tab-current">密码登录</li>
									<li class="no_border">手机短信登录</li>
								</ul>
								<div class="validation_summary error" id="errorMsg" style="display: none"><span><em></em>用户名或密码输入错误</span></div>
								<div>
									<div class="login-way login-way1" data-logintype="1" data-is-curr="1">
										<ul>
											<li>
												<span class="input_icon"></span>
												<input type="text" id="username" placeholder="用户名/手机号" maxlength="64">
											</li>
											<li>
												<span class="input_icon pwd_icon"></span>
												<input type="password" class="password" placeholder="账户密码" maxlength="16" id="password">
											</li>
											<li id="pickCheckEl" style="display: none">
												<span class="input_icon captcha_icon"></span>
												<input type="text" id="picCheck" name="picCheck" placeholder="请输入右侧验证码" maxlength="6">
												<div class="captcha">
											</li>
										</ul>

										<div class="css_cache clearfix">
											<label class="left css_account_cached"><input type="checkbox" id="rememberMe">记住账户名</label>
										</div>

										<div class="clearfix">
											<a class="commitBtn" id="submitLoginByPwd" name="submitLogin" >登录</a>
											<div class="login-link css_login_link clearfix">
												<a href="<%=path %>/webpage/jsp/denglu/zhuce.jsp" class="left" target="_blank">立即注册 </a>
												<a href="<%=path %>/webpage/jsp/denglu/wangjimima.jsp" target="_blank" class="right">忘记密码？</a>
											</div>
										</div>
									</div>
									<div class="login-way login-way2" style="display: none;" data-logintype="2" data-is-curr="0">
										<ul>
											<li>
												<span class="input_icon"></span>
												<input type="text" id="userMobile" placeholder="手机号" maxlength="11">
											</li>
											<li class="dynamic_code">
												<span class="input_icon pwd_icon"></span>
												<input type="text" id="userMobileCode" placeholder="短信验证码" maxlength="6">
												<span class="send_code" id="send-code">点击获取</span>
											</li>
										</ul>
										<div class="clearfix">
											<a class="commitBtn" id="submitLoginByMobile" name="submitLogin" href="###">登录</a>
											<div class="login-link css_login_link clearfix">
												<a href="###" target="_blank" class="left">立即注册</a>
												<a href="###" target="_blank" class="right">忘记密码？</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- 页面主体 end -->
		<!-- 底部：登录／注册通用 -->
		<div class="login_footer" style="margin-top: 40px;">
			<div class="mainbody">
				<ul class="clearfix support_link" id="aboutUl">
					<li>
						<a href="<%=path%>/webpage/jsp/about/about_us.jsp" js-title="关于我们"><em class="about"></em>关于我们</a>
						<div class="split"></div>
					</li>
					<li>
						<a href="<%=path%>/webpage/jsp/about/push_us.jsp" js-title="入驻平台"><em class="join"></em>诊所加盟</a>
						<div class="split"></div>
					</li>
					<li>
						<a href="<%=path%>/webpage/jsp/about/find_us.jsp" js-title="联系我们"><em class="contact"></em>联系我们</a>
						<div class="split"></div>
					</li>
					<li>
						<a href="<%=path%>/webpage/jsp/about/come_us.jsp" js-title="加入我们"><em class="employ"></em>加入我们</a>
					</li>
				</ul>
				<p class="css_footer_copyright">增值电信业务经营许可证：鄂B2-20100040 | 出版物经营许可证 | 鄂ICP备11014057号<br />Copyright(C) 医疗超市 2000-2017 版权所有 |  客服热线：400-8876678</p>
			</div>
		</div>

		<script type="text/javascript">
			$(function(){
				$(".num_dl").click(function(){
					$(this).addClass("tab-current").siblings().removeClass("tab-current");
					$(".login-way2").css("display","none");
					$("#pickCheckEl").css("display","none");
					$(".login-way1").css("display","block");
				})
				$(".no_border").click(function(){
					$(this).addClass("tab-current").siblings().removeClass("tab-current");
					$(".login-way2").css("display","block");
					$("#pickCheckEl").css("display","block");
					$(".login-way1").css("display","none");
				})
			})
			
		</script>

	</body>

</html>