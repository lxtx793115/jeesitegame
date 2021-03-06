<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>前台滚动图片设置管理</title>
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
		<li><a href="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/">前台滚动图片设置列表</a></li>
		<li class="active"><a href="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/form?id=${frontDeskScrollPictureSet.id}">前台滚动图片设置<shiro:hasPermission name="frontdeskscrollset:frontDeskScrollPictureSet:edit">${not empty frontDeskScrollPictureSet.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="frontdeskscrollset:frontDeskScrollPictureSet:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="frontDeskScrollPictureSet" action="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">图片地址：</label>
			<div class="controls">
				<form:hidden id="pictureAddress" path="pictureAddress" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="pictureAddress" type="images" uploadPath="/frontdeskscrollset/frontDeskScrollPictureSet" selectMultiple="false"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="frontdeskscrollset:frontDeskScrollPictureSet:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>