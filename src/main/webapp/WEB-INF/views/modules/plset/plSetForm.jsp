<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>赔率设置管理</title>
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
		<li ><a href="${ctx}/gameroom/gameRoom/roomOddII?gameroomId=${plSet.gameroomId}">${plSet.roomnumber}</a></a></li>
		<li class="active"><a href="${ctx}/plset/plSet/form?id=${plSet.id}">赔率设置<shiro:hasPermission name="plset:plSet:edit">${not empty plSet.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="plset:plSet:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="plSet" action="${ctx}/plset/plSet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<%-- <div class="control-group">
			<label class="control-label">游戏房间ID：</label>
			<div class="controls">
				<form:input path="gameroomId" type="hidden" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<form:input path="roomnumber" type="hidden" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
		<form:input path="gameroomId" type="hidden" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
	
		<div class="control-group">
			<label class="control-label">小：</label>
			<div class="controls">
				<form:input type="number" step="0.01"  path="xiaoPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大：</label>
			<div class="controls">
				<form:input type="number" step="0.01"  path="daPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">单：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="danPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">双：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="shuangPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大单：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="dadanPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大双：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="dashuangPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小单：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="xiaodanPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小双：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="xiaoshuangPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">极大：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="jidaPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">极小：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="jixiaoPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">红波：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="hongboPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">蓝波：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="lanboPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">绿波：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="lvboPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">豹子：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="baiziPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">顺子：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="shunziPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">对子：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="duiziPl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码0：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema0Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码1：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema1Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码2：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema2Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码3：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema3Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码4：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema4Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码5：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema5Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码6：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema6Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码7：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema7Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码8：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema8Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码9：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema9Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码10：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema10Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码11：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema11Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码12：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema12Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码13：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema13Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码14：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema14Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码15：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema15Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码16：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema16Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码17：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema17Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码18：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema18Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码19：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema19Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码20：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema20Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码21：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema21Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码22：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema22Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码23：</label>
			<div class="controls">
				<form:input type="number" step="0.01"  path="tema23Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码24：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema24Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码25：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema25Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码26：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema26Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">特码27：</label>
			<div class="controls">
				<form:input  type="number" step="0.01" path="tema27Pl" htmlEscape="false" class="input-xlarge  number"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="plset:plSet:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>