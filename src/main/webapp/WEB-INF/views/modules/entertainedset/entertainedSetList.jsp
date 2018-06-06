<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>封盘设置管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gameroom/gameRoom/">游戏房间列表</a></li>
		<li ><a href="${ctx}/gameroom/gameRoom/roomOddIIvirtual?gameroomId=${plSet.gameroomId}">${plSet.roomnumber}</a></li>
		<li class="active"><a href="${ctx}/entertainedset/entertainedSet/list?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">封盘设置列表</a></li>
		<%-- <shiro:hasPermission name="entertainedset:entertainedSet:edit"><li><a href="${ctx}/entertainedset/entertainedSet/form?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">封盘设置添加</a></li></shiro:hasPermission> --%>
	</ul>
	<%-- <form:form id="searchForm" modelAttribute="entertainedSet" action="${ctx}/entertainedset/entertainedSet/list?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}" method="post"> --%>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<%-- <ul class="ul-form">
			<li><label>倒计时：</label>
				<form:input path="countdown" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>封盘提示音：</label>
				<form:checkboxes path="entertainedPromptTone" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li><label>提示语：</label>
				<form:input path="prompt" htmlEscape="false" maxlength="3550" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul> --%>
	<%-- </form:form> --%>
	<sys:message content="${message}"/>
	
   
         
 
		<h4>封盘提示</h4>
		<c:forEach items="${page.list}" var="entertainedSet" varStatus="status">
		<c:choose>
		 <c:when test="${entertainedSet.promptStyle=='封盘提示'}"> 
			<form:form id="inputForm${status.index}" modelAttribute="entertainedSet" action="${ctx}/entertainedset/entertainedSet/save" method="post" class="form-horizontal">
		<input  type="hidden"  name="id" value="${entertainedSet.id}"/>
		<sys:message content="${message}"/>	
				<input  type="hidden" value="${entertainedSet.roomnumber}"  name="roomnumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<input  type="hidden" value="${entertainedSet.gameroomId}" name="gameroomId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<input  type="hidden" value="${entertainedSet.promptStyle}" name="promptStyle" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
		
				<div class="breadcrumb form-search">
			<label >倒计时：</label>
				<input id="countdown${status.index}" name="countdown" value="${entertainedSet.countdown}" style="width:30px;" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>&nbsp;&nbsp;秒封盘<br><br>
		
	
			<label >提示语：</label>
			
				<textarea name="prompt"  style="width:830px;" htmlEscape="false" rows="3" maxlength="3550" class="input-xlarge ">${entertainedSet.prompt}</textarea><br><br>
			
		
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<shiro:hasPermission name="entertainedset:entertainedSet:edit"><input  id="btnSubmit${status.index}" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		</div>
	</form:form>
			  </c:when>
   <c:otherwise> 
   </c:otherwise>
   </c:choose>
		</c:forEach>
	
	
		<h4>按时提示</h4>
		<c:forEach items="${page.list}" var="entertainedSetII" varStatus="status">
		<c:choose>
		 <c:when test="${entertainedSetII.promptStyle=='按时提示'}"> 
			<form:form id="IIinputForm${status.index}" modelAttribute="entertainedSet" action="${ctx}/entertainedset/entertainedSet/save" method="post" class="form-horizontal">
		<input  type="hidden"  name="id" value="${entertainedSetII.id}"/>
		<sys:message content="${message}"/>	
				<input  type="hidden" value="${entertainedSetII.roomnumber}"  name="roomnumber" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<input  type="hidden" value="${entertainedSetII.gameroomId}" name="gameroomId" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<input  type="hidden" value="${entertainedSetII.promptStyle}" name="promptStyle" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
		
				<div class="breadcrumb form-search">
			<label >倒计时：</label>
				<input id="countdown${status.index}" name="countdown" value="${entertainedSetII.countdown}" style="width:30px;" htmlEscape="false" maxlength="25" class="input-xlarge  digits"/>&nbsp;&nbsp;秒封盘<br><br>
		
	
			<label >提示语：</label>
			
				<textarea name="prompt"  style="width:830px;" htmlEscape="false" rows="3" maxlength="3550" class="input-xlarge ">${entertainedSetII.prompt}</textarea><br><br>
			
		
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<shiro:hasPermission name="entertainedset:entertainedSet:edit"><input  id="IIbtnSubmit${status.index}" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		</div>
	</form:form>
		<div class="control-group">
		</div>
			  </c:when>
   <c:otherwise> 
   </c:otherwise>
   </c:choose>
		</c:forEach>
	
	<div class="pagination">${page}</div>
</body>
</html>