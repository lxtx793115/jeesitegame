<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
<head>  
<base href="<%=basePath%>">  
  
<title>My JSP 'login.jsp' starting page</title>  
  
</head>  
  
<body>  
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
	function getPhoneCode(){
		console.log($("#phone").val()+$("#photoCode").val())
		//alert($("#phone").val()+$("#photoCode").val())
		$.get("http://192.168.1.7:8080/api/Registercontroller/sendMsg.do",
				{phone:$("#phone").val(),photoCode:$("#photoCode").val()},
				function(data){
					$("body").append(data.status+"<br>");
					$("body").append(data.message+"<br>");
				}
		);
	}
		
</script>
<center>  
    <form action="/api/Registercontroller/registUser.do" method="post">  
        <table>  
            <tr>  
                <td>username:</td><td><input type="text" id="username" name="username"/></td>  
            </tr>  
            <tr>  
                <td>password:</td><td><input type="text" id="password" name="password"/></td>  
            </tr> 
            
             <tr>  
              	<td><img src="/api/Registercontroller/photoCode.do" ></td>
                <td>图片验证码:<input type="text" id="photoCode" name="photoCode"/></td>
            </tr> 
            <tr>  
                <td>phone:</td><td><input type="text" id="phone" name="phone"/> 
               	 <!-- <button onclick="getPhoneCode()">获取验证码</button> -->
               	 <a onclick="getPhoneCode()">获取验证码</a>
                </td>  
            </tr> 
            <tr>  
                <td>phoneCode:</td><td><input type="text" id="phoneCode" name="phoneCode"/> 
                </td>  
            </tr> 
            <tr>  
                <td colspan="2"> <input type="submit" value="注册"/></td>  
            </tr>  
        </table>  
    </form>  
</center>  
</body>  
</html>  