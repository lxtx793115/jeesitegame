<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>开奖详细报表管理</title>
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
		<li><a href="${ctx}/awarddetailreport/awardDetailedReport/">开奖详细报表列表</a></li>
		<li class="active"><a href="${ctx}/awarddetailreport/awardDetailedReport/form?id=${awardDetailedReport.id}">开奖详细报表<shiro:hasPermission name="awarddetailreport:awardDetailedReport:edit">${not empty awardDetailedReport.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="awarddetailreport:awardDetailedReport:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="awardDetailedReport" action="${ctx}/awarddetailreport/awardDetailedReport/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">开奖管理ID：</label>
			<div class="controls">
				<form:input path="awardManageId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单ID：</label>
			<div class="controls">
				<form:input path="reportnumber" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">账号：</label>
			<div class="controls">
				<form:input path="accountNumber" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下注内容：</label>
			<div class="controls">
				<form:input path="betsDetail" htmlEscape="false" maxlength="2550" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下注总额：</label>
			<div class="controls">
				<form:input path="totalAmountBets" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下注时间：</label>
			<div class="controls">
				<input name="betsTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${awardDetailedReport.betsTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开奖结果：</label>
			<div class="controls">
				<form:input path="awardResults" htmlEscape="false" maxlength="155" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">玩家盈亏：</label>
			<div class="controls">
				<form:input path="playerWinLoss" htmlEscape="false" maxlength="155" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:input path="status" htmlEscape="false" maxlength="25" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="awarddetailreport:awardDetailedReport:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>