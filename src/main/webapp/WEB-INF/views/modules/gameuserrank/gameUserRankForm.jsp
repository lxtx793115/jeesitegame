<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户级别管理</title>
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
		<li><a href="${ctx}/gameuserrank/gameUserRank/">用户级别列表</a></li>
		<li class="active"><a href="${ctx}/gameuserrank/gameUserRank/form?id=${gameUserRank.id}">用户级别<shiro:hasPermission name="gameuserrank:gameUserRank:edit">${not empty gameUserRank.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gameuserrank:gameUserRank:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gameUserRank" action="${ctx}/gameuserrank/gameUserRank/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">最低可用金额：</label>
			<div class="controls">
				<form:input path="minAvail" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最高可用金额：</label>
			<div class="controls">
				<form:input path="maxAvail" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户级别：</label>
			<div class="controls">
				<form:input path="userLevel" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">级别图片：</label>
			<div class="controls">
				<form:hidden id="levelPhotourl" path="levelPhotourl" htmlEscape="false" maxlength="155" class="input-xlarge"/>
				<sys:ckfinder input="levelPhotourl" type="images" uploadPath="/gameuserrank/gameUserRank" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div> 
		<div class="form-actions">
			<shiro:hasPermission name="gameuserrank:gameUserRank:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>