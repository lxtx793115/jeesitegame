<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收款账户设置管理</title>
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
		<li><a href="${ctx}/receivingbankaccount/receivingBankAccount/">收款账户设置列表</a></li>
		<li class="active"><a href="${ctx}/receivingbankaccount/receivingBankAccount/form?id=${receivingBankAccount.id}">收款账户设置<shiro:hasPermission name="receivingbankaccount:receivingBankAccount:edit">${not empty receivingBankAccount.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="receivingbankaccount:receivingBankAccount:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="receivingBankAccount" action="${ctx}/receivingbankaccount/receivingBankAccount/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<div class="control-group">
			<label class="control-label">账号：</label>
			<div class="controls">
				<form:input path="account" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">账户类型：</label>
			<div class="controls">
				<form:input path="accountType" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">真实姓名：</label>
			<div class="controls">
				<form:input path="realName" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图标：</label>
			<div class="controls">
				<form:hidden id="iconPhoto" path="iconPhoto" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="iconPhoto" type="images" uploadPath="/receivingbankaccount/receivingBankAccount" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">二维码：</label>
			<div class="controls">
				<form:hidden id="twoDimensionalCode" path="twoDimensionalCode" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="twoDimensionalCode" type="images" uploadPath="/receivingbankaccount/receivingBankAccount" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">温馨提示：</label>
			<div class="controls">
				<textarea name="kindlyReminder"  style="width:830px;" htmlEscape="false" rows="3" maxlength="3550" class="input-xlarge ">${receivingBankAccount.kindlyReminder}</textarea><br><br>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="receivingbankaccount:receivingBankAccount:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>