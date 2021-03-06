<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运营设置管理</title>
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
		<li><a href="${ctx}/operationalset/operationalSet/">运营设置列表</a></li>
		<li class="active"><a href="${ctx}/operationalset/operationalSet/form?id=${operationalSet.id}">运营设置<shiro:hasPermission name="operationalset:operationalSet:edit">${not empty operationalSet.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="operationalset:operationalSet:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="operationalSet" action="${ctx}/operationalset/operationalSet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">网站标题：</label>
			<div class="controls">
				<form:input path="websiteTitle" htmlEscape="false" maxlength="85" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">房间聊天关键词屏蔽：</label>
			<div class="controls">
				<form:textarea path="roomKeyWordsShielding" htmlEscape="false" rows="4" maxlength="4255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">APP下载地址：</label>
			<div class="controls">
				<form:input path="appDownloadLink" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">广告提示语：</label>
			<div class="controls">
				<form:input path="advertisementPrompt" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">房间广告：</label>
			<div class="controls">
				<form:textarea path="roomAdvertisement" htmlEscape="false" rows="4" maxlength="2550" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">短信接口密钥：</label>
			<div class="controls">
				<form:input path="smsInterfaceKey" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="operationalset:operationalSet:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>