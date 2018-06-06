<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>当期统计管理</title>
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
		<li><a href="${ctx}/currentstatistics/gameCurrentStatistics/">当期统计列表</a></li>
		<li class="active"><a href="${ctx}/currentstatistics/gameCurrentStatistics/form?id=${gameCurrentStatistics.id}">当期统计<shiro:hasPermission name="currentstatistics:gameCurrentStatistics:edit">${not empty gameCurrentStatistics.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="currentstatistics:gameCurrentStatistics:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gameCurrentStatistics" action="${ctx}/currentstatistics/gameCurrentStatistics/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">游戏房间ID：</label>
			<div class="controls">
				<form:input path="gameroomId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">房间编号：</label>
			<div class="controls">
				<form:input path="roomnumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">房间名称：</label>
			<div class="controls">
				<form:input path="roomname" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大：</label>
			<div class="controls">
				<form:input path="da" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">单：</label>
			<div class="controls">
				<form:input path="dan" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">双：</label>
			<div class="controls">
				<form:input path="shuang" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小：</label>
			<div class="controls">
				<form:input path="xiao" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大单：</label>
			<div class="controls">
				<form:input path="dadan" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大双：</label>
			<div class="controls">
				<form:input path="dashuang" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小单：</label>
			<div class="controls">
				<form:input path="xiaodan" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小双：</label>
			<div class="controls">
				<form:input path="xiaoshuang" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">极大：</label>
			<div class="controls">
				<form:input path="jida" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">极小：</label>
			<div class="controls">
				<form:input path="jixiao" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">红波：</label>
			<div class="controls">
				<form:input path="hongbo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">蓝波：</label>
			<div class="controls">
				<form:input path="lanbo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">绿波：</label>
			<div class="controls">
				<form:input path="lvbo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">豹子：</label>
			<div class="controls">
				<form:input path="baizi" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">顺子：</label>
			<div class="controls">
				<form:input path="shunzi" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">对子：</label>
			<div class="controls">
				<form:input path="duizi" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码0：</label>
			<div class="controls">
				<form:input path="tema0" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码1：</label>
			<div class="controls">
				<form:input path="tema1" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码2：</label>
			<div class="controls">
				<form:input path="tema2" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码3：</label>
			<div class="controls">
				<form:input path="tema3" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码4：</label>
			<div class="controls">
				<form:input path="tema4" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码5：</label>
			<div class="controls">
				<form:input path="tema5" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码6：</label>
			<div class="controls">
				<form:input path="tema6" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码7：</label>
			<div class="controls">
				<form:input path="tema7" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码8：</label>
			<div class="controls">
				<form:input path="tema8" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码9：</label>
			<div class="controls">
				<form:input path="tema9" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码10：</label>
			<div class="controls">
				<form:input path="tema10" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码11：</label>
			<div class="controls">
				<form:input path="tema11" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码12：</label>
			<div class="controls">
				<form:input path="tema12" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码13：</label>
			<div class="controls">
				<form:input path="tema13" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码14：</label>
			<div class="controls">
				<form:input path="tema14" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码15：</label>
			<div class="controls">
				<form:input path="tema15" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码16：</label>
			<div class="controls">
				<form:input path="tema16" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码17：</label>
			<div class="controls">
				<form:input path="tema17" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码18：</label>
			<div class="controls">
				<form:input path="tema18" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码19：</label>
			<div class="controls">
				<form:input path="tema19" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码20：</label>
			<div class="controls">
				<form:input path="tema20" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码21：</label>
			<div class="controls">
				<form:input path="tema21" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码22：</label>
			<div class="controls">
				<form:input path="tema22" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码23：</label>
			<div class="controls">
				<form:input path="tema23" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码24：</label>
			<div class="controls">
				<form:input path="tema24" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码25：</label>
			<div class="controls">
				<form:input path="tema25" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码26：</label>
			<div class="controls">
				<form:input path="tema26" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码27：</label>
			<div class="controls">
				<form:input path="tema27" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="currentstatistics:gameCurrentStatistics:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>