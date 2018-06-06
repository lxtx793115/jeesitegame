<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页管理</title>
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
		<li><a href="${ctx}/homepage/homePage/">首页列表</a></li>
		<li class="active"><a href="${ctx}/homepage/homePage/form?id=${homePage.id}">首页<shiro:hasPermission name="homepage:homePage:edit">${not empty homePage.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="homepage:homePage:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="homePage" action="${ctx}/homepage/homePage/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">会员总数：</label>
			<div class="controls">
				<form:input path="userTotalNumber" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">今日新增会员：</label>
			<div class="controls">
				<form:input path="todayNewlyAddedUser" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">今日活跃会员：</label>
			<div class="controls">
				<form:input path="todayActiveUser" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">当前在线会员：</label>
			<div class="controls">
				<form:input path="currentOnlineUser" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">周新增会员：</label>
			<div class="controls">
				<form:input path="weekNewlyAddedUser" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">月新增会员：</label>
			<div class="controls">
				<form:input path="monthNewlyAddedUser" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">盘内总分数：</label>
			<div class="controls">
				<form:input path="intradiscalTotalFraction" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">今日充值：</label>
			<div class="controls">
				<form:input path="todayRecharge" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">今日提现：</label>
			<div class="controls">
				<form:input path="todayWithdrawCash" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">今日总盈亏：</label>
			<div class="controls">
				<form:input path="todayTotalWinLoss" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">今日投注流水：</label>
			<div class="controls">
				<form:input path="todayBetslStatement" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">今日赠送：</label>
			<div class="controls">
				<form:input path="todayGivePresent" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="homepage:homePage:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>