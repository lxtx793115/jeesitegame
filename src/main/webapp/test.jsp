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
<center>  
    <a href="/test/regist.jsp">注册</a><br>
    <a href="/test/login.jsp">登录</a><br>
     <a href="/test/creatRoom.jsp">创建房间</a><br>
    <a href="/">后台登录</a><br>
    <a href="/socketChart.jsp">聊天</a><br>
    <a href="/api/GameUserController/getGameUserListdata.do">用户数据</a><br>
    <a href="/socketChart.jsp">聊天</a><br>
</center>  
</body>  
</html>  