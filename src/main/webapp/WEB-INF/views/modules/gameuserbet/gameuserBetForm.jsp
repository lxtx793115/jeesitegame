<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户投注记录管理</title>
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
		<li><a href="${ctx}/gameuserbet/gameuserBet/">用户投注记录列表</a></li>
		<li class="active"><a href="${ctx}/gameuserbet/gameuserBet/form?id=${gameuserBet.id}">用户投注记录<shiro:hasPermission name="gameuserbet:gameuserBet:edit">${not empty gameuserBet.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gameuserbet:gameuserBet:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gameuserBet" action="${ctx}/gameuserbet/gameuserBet/save" method="post" class="form-horizontal">
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
			<label class="control-label">用户名：</label>
			<div class="controls">
				<form:input path="username" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">昵称：</label>
			<div class="controls">
				<form:input path="nickname" htmlEscape="false" maxlength="55" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户ID：</label>
			<div class="controls">
				<form:input path="gameuserid" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大：</label>
			<div class="controls">
				<form:input path="userDa" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">单：</label>
			<div class="controls">
				<form:input path="userDan" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">双：</label>
			<div class="controls">
				<form:input path="userShuang" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小：</label>
			<div class="controls">
				<form:input path="userXiao" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大单：</label>
			<div class="controls">
				<form:input path="userDadan" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大双：</label>
			<div class="controls">
				<form:input path="userDashuang" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小单：</label>
			<div class="controls">
				<form:input path="userXiaodan" htmlEscape="false" maxlength="20" class="input-xlarge "/>
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
				<form:input path="userJida" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">极小：</label>
			<div class="controls">
				<form:input path="userJixiao" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">红波：</label>
			<div class="controls">
				<form:input path="userHongbo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">蓝波：</label>
			<div class="controls">
				<form:input path="userLanbo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">绿波：</label>
			<div class="controls">
				<form:input path="userLvbo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">豹子：</label>
			<div class="controls">
				<form:input path="userBaizi" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">顺子：</label>
			<div class="controls">
				<form:input path="userShunzi" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">对子：</label>
			<div class="controls">
				<form:input path="userDuizi" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码0：</label>
			<div class="controls">
				<form:input path="userTema0" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码1：</label>
			<div class="controls">
				<form:input path="userTema1" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码2：</label>
			<div class="controls">
				<form:input path="userTema2" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码3：</label>
			<div class="controls">
				<form:input path="userTema3" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码4：</label>
			<div class="controls">
				<form:input path="userTema4" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码5：</label>
			<div class="controls">
				<form:input path="userTema5" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码6：</label>
			<div class="controls">
				<form:input path="userTema6" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码7：</label>
			<div class="controls">
				<form:input path="userTema7" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码8：</label>
			<div class="controls">
				<form:input path="userTema8" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码9：</label>
			<div class="controls">
				<form:input path="userTema9" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码10：</label>
			<div class="controls">
				<form:input path="userTema10" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码11：</label>
			<div class="controls">
				<form:input path="userTema11" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码12：</label>
			<div class="controls">
				<form:input path="userTema12" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码13：</label>
			<div class="controls">
				<form:input path="userTema13" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码14：</label>
			<div class="controls">
				<form:input path="userTema14" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码15：</label>
			<div class="controls">
				<form:input path="userTema15" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码16：</label>
			<div class="controls">
				<form:input path="userTema16" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码17：</label>
			<div class="controls">
				<form:input path="userTema17" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码18：</label>
			<div class="controls">
				<form:input path="userTema18" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码19：</label>
			<div class="controls">
				<form:input path="userTema19" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码20：</label>
			<div class="controls">
				<form:input path="userTema20" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码21：</label>
			<div class="controls">
				<form:input path="userTema21" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码22：</label>
			<div class="controls">
				<form:input path="userTema22" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码23：</label>
			<div class="controls">
				<form:input path="userTema23" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码24：</label>
			<div class="controls">
				<form:input path="userTema24" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码25：</label>
			<div class="controls">
				<form:input path="userTema25" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码26：</label>
			<div class="controls">
				<form:input path="userTema26" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码27：</label>
			<div class="controls">
				<form:input path="userTema27" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="gameuserbet:gameuserBet:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>