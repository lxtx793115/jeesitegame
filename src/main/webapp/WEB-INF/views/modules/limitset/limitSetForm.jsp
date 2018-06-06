<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>限额设置管理</title>
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
		<li ><a href="${ctx}/gameroom/gameRoom/roomOddII1314?gameroomId=${limitSet.gameroomId}">${limitSet.roomnumber}</a></a></li>
		
		<li class="active"><a href="${ctx}/limitset/limitSet/form?id=${limitSet.id}">限额设置<shiro:hasPermission name="limitset:limitSet:edit">${not empty limitSet.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="limitset:limitSet:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="limitSet" action="${ctx}/limitset/limitSet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<form:input path="roomnumber" type="hidden" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
		<form:input path="gameroomId" type="hidden" htmlEscape="false" maxlength="64" class="input-xlarge required"/>	
		<%-- <div class="control-group">
			<label class="control-label">房间编号：</label>
			<div class="controls">
				<form:input path="roomnumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">游戏房间ID：</label>
			<div class="controls">
				<form:input path="gameroomId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<table  border="0" >
		<tr>
		<td><label class="control-label">总额度：</label>
			<div class="controls">
				<form:input  type="number" min="1" path="totalQuota" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		<td></td>
		</tr>
		<tr>
		<td>
			<label class="control-label">&nbsp;</label>
		<td>
			<label class="control-label">&nbsp;</label>
		</tr>
		<tr>
		<td>	<label class="control-label">特码最小：</label>
			<div class="controls">
				<form:input path="temaMin" type="number" min="1"  htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		<td><label class="control-label">特码最大：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="temaMax" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		</tr>
		<tr>
		<td>
			<label class="control-label">&nbsp;</label>
		<td>
			<label class="control-label">&nbsp;</label>
		</tr>
		<tr>
		<td><label class="control-label">大小单双最小：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="daxiaodanshuangMin" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		<td><label class="control-label">大小单双最大：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="daxiaodanshuangMax" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		</tr>
		<tr>
		<td>
			<label class="control-label">&nbsp;</label>
		<td>
			<label class="control-label">&nbsp;</label>
		</tr>
		<tr>
		<td><label class="control-label">组合单双最小：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="zuhedanshuangMin" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		<td><label class="control-label">组合单双最大：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="zuhedanshuangMax" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		</tr>
		<tr>
		<td>
			<label class="control-label">&nbsp;</label>
		<td>
			<label class="control-label">&nbsp;</label>
		</tr>
		<tr>
		<td><label class="control-label">极值最小：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="jizhiMin" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		<td>	<label class="control-label">极值最大：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="jizhiMax" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		</tr>
		<tr>
		<td>
			<label class="control-label">&nbsp;</label>
		<td>
			<label class="control-label">&nbsp;</label>
		</tr>
		<tr>
		<td><label class="control-label">波色最小：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="bosheMin" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		<td><label class="control-label">波色最大：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="bosheMax" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		</tr>
		<tr>
		<td>
			<label class="control-label">&nbsp;</label>
		<td>
			<label class="control-label">&nbsp;</label>
		</tr>
		<tr>
		<td><label class="control-label">豹子对子最小：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="baoziduiziMin" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		<td><label class="control-label">豹子对子最大：</label>
			<div class="controls">
				<form:input type="number" min="1"  path="baoziduiziMax" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>
			</div></td>
		</tr>
		<tr>
		<td></td>
		<td></td>
		</tr>
		</table>
		<div class="form-actions">
			<shiro:hasPermission name="limitset:limitSet:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>