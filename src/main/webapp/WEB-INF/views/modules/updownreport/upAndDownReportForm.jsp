<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>上下分报表管理</title>
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
		<li><a href="${ctx}/updownreport/upAndDownReport/">上下分报表列表</a></li>
		<li class="active"><a href="${ctx}/updownreport/upAndDownReport/form?id=${upAndDownReport.id}">上下分报表<shiro:hasPermission name="updownreport:upAndDownReport:edit">${not empty upAndDownReport.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="updownreport:upAndDownReport:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="upAndDownReport" action="${ctx}/updownreport/upAndDownReport/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">用户名：</label>
			<div class="controls">
			<form:select path="gameuserId" name="gameuserId" id="gameuserId" class="input-xlarge ">
					<form:options items="${gameUsers}" itemLabel="username" itemValue="id" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">账号：</label>
			<div class="controls">
				<form:input path="bankAccount" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">申请类型：</label>
			<div class="controls">
				<form:select path="applyType" class="input-xlarge ">
					<form:options items="${fns:getDictList('apply_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">支付类型：</label>
			<div class="controls">
				<form:input path="payType" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">申请金额：</label>
			<div class="controls">
				<form:input path="applyMoneyAmount" htmlEscape="false" maxlength="155" class="input-xlarge "/>
			</div>
		</div>
		
		<%-- <div class="control-group">
			<label class="control-label">操作时间：</label>
			<div class="controls">
				<input name="operateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${upAndDownReport.operateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:select path="status" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('report_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="updownreport:upAndDownReport:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>