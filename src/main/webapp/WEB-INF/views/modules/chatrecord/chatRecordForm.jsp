<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>聊天记录管理管理</title>
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
		<li><a href="${ctx}/chatrecord/chatRecord/">聊天记录管理列表</a></li>
		<li class="active"><a href="${ctx}/chatrecord/chatRecord/form?id=${chatRecord.id}">聊天记录管理<shiro:hasPermission name="chatrecord:chatRecord:edit">${not empty chatRecord.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="chatrecord:chatRecord:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="chatRecord" action="${ctx}/chatrecord/chatRecord/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">房间编号：</label>
			<div class="controls">
			<form:select path="gameroomId" name="gameroomId" id="gameroomId" class="input-xlarge ">
					<form:option value="" label="无"/>
					<form:options items="${gameRooms}" itemLabel="roomnumber" itemValue="id" htmlEscape="false"/>
				</form:select>
				<%-- <form:input path="roomnumber" htmlEscape="false" maxlength="20" class="input-xlarge "/> --%>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">游戏房间ID：</label>
			<div class="controls">
				<form:input path="gameroomId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div> --%>
		<%-- <div class="control-group">
			<label class="control-label">发送者用户ID：</label>
			<div class="controls">
				<form:input path="senderUserid" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">发送者账号：</label>
			<div class="controls">
				<form:select path="senderUserid" name="senderUserid" id="senderUserid" class="input-xlarge ">
					<form:option value="" label="无"/>
					<form:options items="${gameUsers}" itemLabel="phone" itemValue="id" htmlEscape="false"/>
				</form:select>
				<%-- <form:input path="senderPhone" htmlEscape="false" maxlength="55" class="input-xlarge "/> --%>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">接受者用户ID：</label>
			<div class="controls">
				<form:input path="receiverUserid" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">接受者账号：</label>
			<div class="controls">
			<form:select path="receiverUserid" class="input-xlarge ">
					<form:option value="" label="无"/>
					<form:options items="${gameUsers}" itemLabel="phone" itemValue="id" htmlEscape="false"/>
				</form:select>
				<%-- <form:input path="receiverPhone" htmlEscape="false" maxlength="55" class="input-xlarge "/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">聊天类型：</label>
			<div class="controls">
			<select name="chatType" class="input-xxlarge ">
					<option value="groupchat">群聊类型</option>
					<option value="chat">单聊类型</option>
					<option value="customerservicechat">和客服系统聊天类型</option>
				</select>
				<%-- <form:input path="chatType" htmlEscape="false" maxlength="25" class="input-xlarge "/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">消息内容：</label>
			<div class="controls">
				<form:textarea path="msgContent" htmlEscape="false" rows="4" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">消息类型：</label>
			<div class="controls">
			<select name="msgType" class="input-xxlarge ">
					<option value="txt">文本消息</option>
					<option value="img">图片</option>
					<option value="loc">位置</option>
					<option value="audio">语音</option>
				</select>
				<%-- <form:input path="msgType" htmlEscape="false" maxlength="55" class="input-xlarge "/> --%>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">语音时长：</label>
			<div class="controls">
				<form:input path="voiceLength" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">文件路径：</label>
			<div class="controls">
				<form:input path="url" htmlEscape="false" maxlength="155" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">文件名字：</label>
			<div class="controls">
				<form:input path="filename" htmlEscape="false" maxlength="155" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">文件密钥：</label>
			<div class="controls">
				<form:input path="secret" htmlEscape="false" maxlength="155" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">纬度：</label>
			<div class="controls">
				<form:input path="lat" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">经度：</label>
			<div class="controls">
				<form:input path="lng" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">位置消息详细地址：</label>
			<div class="controls">
				<form:input path="addr" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">消息发送时间：</label>
			<div class="controls">
				<input name="timestamp" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${chatRecord.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div> --%>
		<div class="form-actions">
			<shiro:hasPermission name="chatrecord:chatRecord:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>