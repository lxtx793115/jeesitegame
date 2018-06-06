<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>13|14赔率管理</title>
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
		<li ><a href="${ctx}/gameroom/gameRoom/roomOddII1314?gameroomId=${plSet1314.gameroomId}">${plSet1314.roomnumber}</a></a></li>
		<li class="active"><a href="${ctx}/plset1314/plSet1314/form?id=${plSet1314.id}">13|14赔率<shiro:hasPermission name="plset1314:plSet1314:edit">${not empty plSet1314.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="plset1314:plSet1314:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="plSet1314" action="${ctx}/plset1314/plSet1314/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<%-- <div class="control-group">
			<label class="control-label">房间编号：</label>
			<div class="controls">
				<form:input path="roomnumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<form:input path="roomnumber" type="hidden" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
		<form:input path="gameroomId" type="hidden" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
		<%-- <div class="control-group">
			<label class="control-label">游戏房间ID：</label>
			<div class="controls">
				<form:input path="gameroomId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label  style="font-size:30px;">大小单双赔率设置</label><br><br>
			<label class="control-label">金额1：</label>
			<div class="controls">
				<form:input  type="number" step="0.01"  path="dxdsSum1" htmlEscape="false" maxlength="22" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">赔率1：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="dxdsPrice1" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">金额2：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="dxdsSum2" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">赔率2：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="dxdsPrice2" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">赔率3：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="dxdsPrice3" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label  style="font-size:30px;">组合赔率设置</label><br><br>
			<label class="control-label">金额1：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="combinationSum1" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">赔率1：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="combinationPrice1" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">金额2：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="combinationSum2" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">赔率2：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="combinationPrice2" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">赔率3：</label>
			<div class="controls">
				<form:input type="number" step="0.01" path="combinationPrice3" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<br>
		</div>
		
		<div class="control-group">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label  style="font-size:30px;">开豹子顺子对子赔率设置</label><br><br>
			<label class="control-label">豹子赔率：</label>
			<div class="controls">
				<form:input type="number"  path="baoziPrice" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div><br>
			<label class="control-label">对子赔率：</label>
			<div class="controls">
				<form:input type="number"  path="duiziPrice" htmlEscape="false" maxlength="25" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="plset1314:plSet1314:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>