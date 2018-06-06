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
			});
		}); */
		
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gameroom/gameRoom/">游戏房间列表</a></li>
		<%-- <li><a href="${ctx}/gameroom/gameRoom/form">游戏房间添加</a></li> --%>
		<li class="active"><a href="${ctx}/gameodds/gameOdds/form?id=${gameOdds.id}">房间赔率<shiro:hasPermission name="gameodds:gameOdds:edit">${not empty gameOdds.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gameodds:gameOdds:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<%-- <form:form id="inputForm" modelAttribute="gameOdds" action="${ctx}/gameodds/gameOdds/save" method="post" class="form-horizontal"> --%>
	<form:form id="inputForm" modelAttribute="gameOdds" action="${ctx}/gameroom/gameRoom/saveRoomOdds" method="post" class="form-horizontal">
		<form:hidden  path="id" value="${go.id}" hidden=""/>
		<sys:message content="${message}"/>		
		<div class="control-group" hidden="">
			<label class="control-label">房间id：</label>
			<div class="controls" hidden>
				<input path="roomId" value="${go.roomId}" htmlEscape="false"  class="input-xlarge required" hidden/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> 
		<div class="control-group">
			<label class="control-label">大：</label>
			<div class="controls">
				<input path="da"  value="${go.da}" htmlEscape="false" class="input-xlarge required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小：</label>
			<div class="controls">
				<input path="xiao" value="${go.xiao}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">单：</label>
			<div class="controls">
				<input path="dan" value="${go.dan}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">双：</label>
			<div class="controls">
				<input path="shuang" value="${go.shuang}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大单：</label>
			<div class="controls">
				<input path="dadan" value="${go.dadan}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">大双：</label>
			<div class="controls">
				<input path="dashuang" value="${go.dashuang}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小双：</label>
			<div class="controls">
				<input path="xiaodan" value="${go.xiaodan}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">小双：</label>
			<div class="controls">
				<input path="xiaoshaung" value="${go.xiaoshaung}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">极大：</label>
			<div class="controls">
				<input path="jida" value="${go.jida}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">极小：</label>
			<div class="controls">
				<input path="jixiao" value="${go.jixiao}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">洪波：</label>
			<div class="controls">
				<input path="hongbo" value="${go.hongbo}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">蓝波：</label>
			<div class="controls">
				<input path="lanbo" value="${go.lanbo}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">绿波：</label>
			<div class="controls">
				<input path="lvbo" value="${go.lvbo}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">豹子：</label>
			<div class="controls">
				<input path="baozi" value="${go.baozi}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">顺子：</label>
			<div class="controls">
				<input path="shunzi" value="${go.shunzi}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">对子：</label>
			<div class="controls">
				<input path="duizi" value="${go.duizi}" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "></textarea>
			</div>
		</div>
		<div class="form-actions">
			<%-- <shiro:hasPermission name="gameodds:gameOdds:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission> --%>
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>