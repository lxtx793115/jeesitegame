//登录
$(function(){
	
	
	//账号密码登录
	$("#submitLoginByPwd").click(function(){
		$.getJSON("/api/qpUserController/pwdLogin.do",{"phone":$("#username").val(),"pwd":$("#password").val()},function(data){
			if(data=="true"){
				window.location.href="/webpage/jsp/wanjia.jsp";
			}else{
				$("#errorMsg").css("display","block");
			}
		});
	});
	
	$("#send-code").click(function(){
		if($("#send-code").text()=="点击获取"){		
				$.getJSON("/api/qpUserController/sendSMS.do",{"phone":$("#userMobile").val()});	
			}else{
				alert("计时结束后才能重新发送");
			}	
		//樣式
			var no=60;
			var timer1=setInterval(
			function(){
				no--;
				//console.log(no);
				$("#send-code").text(no+"秒重新发送");
				if(no==0){
					$("#send-code").text('点击获取');
					window.clearInterval(timer1);
				return
				};
			},1000);
			
	
	});
	
	
	//手机验证码登录
	$("#submitLoginByMobile").click(function(){
			$.getJSON("/api/qpUserController/phoneLogin.do",{"phoneYz":$("#userMobileCode").val(),"phone":$("#userMobile").val()},function(data){
			if(data=="true"){
				window.location.href="/webpage/jsp/wanjia.jsp";
			}else if(data=="no"){
				alert("该号码未注册,自动跳转注册页面")
				window.location.href="/webpage/jsp/denglu/zhuce.jsp";
			}else{
				alert("验证码错误!");
			}
		});
	});
	
	
	
});