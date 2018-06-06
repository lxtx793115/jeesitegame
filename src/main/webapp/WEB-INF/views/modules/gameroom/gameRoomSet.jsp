<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏描述管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(function() {
			var tip = '<span class="help-inline"><font color="red">取值范围1.00-10.00</font> </span>';
			$(".input-xlarge").on("input",function(){
				$(this).siblings(".help-inline").remove();
				this.value = this.value.replace(/[^\d|\.]/g,"");
			});
			function myValidate(){
				var v = true;
				var patt 
				= /^([1-9]|10)(\.[0-9]{1,2})?$/;
				$(".input-xlarge").each(function(index,item){
					if(!patt.test(item.value)){
						v = false;
						$(item).siblings(".help-inline").remove();
						$(item).after($(tip));
					}
				})
				return v;
			}
/* 			$("#inputForm").validate({
				submitHandler: function(form){
					if(myValidate()){
						loading('正在提交，请稍等...');
						form.submit();
					}
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
			});*/
		}); 
		
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gameroom/gameRoom/">游戏房间列表</a></li>
		<%-- <li><a href="${ctx}/gameroom/gameRoom/form">游戏房间添加</a></li> --%>
		<li class="active"><a href="${ctx}/gameroom/gameRoom/roomOddII?gameroomId=${plSet.gameroomId}">${plSet.roomnumber}</a></li>
	</ul><br/><br/>
	
	<%-- <form:form id="inputForm" modelAttribute="gameOdds" action="${ctx}/gameodds/gameOdds/save" method="post" class="form-horizontal"> --%>
	<form:form id="inputForm" modelAttribute="gameOdds" action="${ctx}/gameroom/gameRoom/saveRoomOdds" method="post" class="form-horizontal">
		<div class="control-group">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<shiro:hasPermission name="plset:plSet:view"><a class="btn btn-primary" href="${ctx}/plset/plSet/form?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">赔率设置</a></shiro:hasPermission>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<shiro:hasPermission name="plset1314:plSet1314:view"><a class="btn btn-primary" href="${ctx}/plset1314/plSet1314/form?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">13|14赔率</a></shiro:hasPermission>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<shiro:hasPermission name="limitset:limitSet:view"><a class="btn btn-primary" href="${ctx}/limitset/limitSet/form?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">限额设置</a></shiro:hasPermission>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<shiro:hasPermission name="limitset:limitSet:view"><a class="btn btn-primary" href="${ctx}/entertainedset/entertainedSet/list?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">封盘设置</a></shiro:hasPermission>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="btn btn-primary" >玩法规则</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="btn btn-primary" >赔率说明</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<shiro:hasPermission name="virtualnumberset:virtualNumberSet:view"><a class="btn btn-primary" href="${ctx}/virtualnumberset/virtualNumberSet/list?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">虚拟人数设置</a></shiro:hasPermission>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%-- <a class="btn btn-primary" href="${ctx}/gameroom/gameRoom/form?id=0">虚拟人数设置</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
		<a class="btn btn-primary">下注机器人设置</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		
		
		</div>
		<%-- <div class="form-actions">
			<shiro:hasPermission name="gameodds:gameOdds:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> --%>
	</form:form>
</body>
</html>