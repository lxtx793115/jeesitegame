<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>封盘设置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gameroom/gameRoom/">游戏房间列表</a></li>
		<li ><a href="${ctx}/gameroom/gameRoom/roomOddIIentertained?gameroomId=${entertainedSet.gameroomId}">${entertainedSet.roomnumber}</a></li>
		<li><a href="${ctx}/entertainedset/entertainedSet/list?roomnumber=${entertainedSet.roomnumber}&gameroomId=${entertainedSet.gameroomId}">封盘设置列表</a></li>
		<li class="active"><a href="${ctx}/entertainedset/entertainedSet/form?id=${entertainedSet.id}&roomnumber=${entertainedSet.roomnumber}&gameroomId=${entertainedSet.gameroomId}">封盘设置<shiro:hasPermission name="entertainedset:entertainedSet:edit">${not empty entertainedSet.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="entertainedset:entertainedSet:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="entertainedSet" action="${ctx}/entertainedset/entertainedSet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
				<form:input  type="hidden"  path="roomnumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<form:input  type="hidden"  path="gameroomId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				
		<div class="control-group">
			<label class="control-label">提示类型：</label>
			<div class="controls">
				<%-- <form:input path="guessFlag" htmlEscape="false" maxlength="1" class="input-xlarge "/> --%>
				<select name="promptStyle">
					<option value="封盘提示">封盘提示</option>
					<option value="按时提示">按时提示</option>
				</select>
			</div>
		<div class="control-group">
			<label class="control-label">倒计时：</label>
				<form:input path="countdown"  style="width:30px;" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>秒封盘
			
		</div>
		<div class="control-group">
			<label class="control-label">提示语：</label>
			
				<form:textarea path="prompt" style="width:830px;" htmlEscape="false" rows="3" maxlength="3550" class="input-xlarge "/>
			
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="entertainedset:entertainedSet:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>