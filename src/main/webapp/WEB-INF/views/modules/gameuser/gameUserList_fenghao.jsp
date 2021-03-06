<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>封号管理</title>
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
	
	<form:form id="searchForm" modelAttribute="gameUser" action="${ctx}/gameuser/gameUser/listfenghao" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<ul class="ul-form">
			
			<li><label>电话：</label>
				<form:input path="phone" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<%-- <li><label>用户编号：</label>
				<form:input path="no" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>余额：</label>
				<form:input path="balance" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>微信：</label>
				<form:input path="wechat" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>qq：</label>
				<form:input path="qq" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTablefenghao" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>ID</th>
				<th>用户名</th>
				<!-- <th>头像</th> -->
				<th>帐号</th>
				<th>封号|IP状态</th>
				<!-- <th>微信</th>
				<th>支付宝</th>
				<th>ip</th> -->
				<shiro:hasPermission name="gameuser:gameUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameUser">
			<tr>
				<td width="auto">
					${gameUser.gameusernumber}
				</td>
				<td>
					${gameUser.username}
				</td>
				<td>
					${gameUser.phone}
				</td>
				
				<td width="50">
				<c:choose>
  	 		<c:when test="${gameUser.fenghaostatus== '0'||gameUser.fenghaostatus== null||gameUser.fenghaostatus== ''}">  
         		未封号 
   			</c:when>
   				<c:when test="${gameUser.fenghaostatus== '1'}">  
         		已封号 
   			</c:when>
   			<c:when test="${gameUser.fenghaostatus== '2'}">  
         		已封IP 
   			</c:when>
   			<c:otherwise> 
    			未知
   			</c:otherwise>

		</c:choose>
				</td>
					
				
				<shiro:hasPermission name="gameuser:gameUser:edit"><td>
					
						<c:choose>
  	 	
   				<c:when test="${gameUser.fenghaostatus== '1'}">  
         		<a class="btn btn-primary" href="${ctx}/gameuser/gameUser/cancelfenghao?id=${gameUser.id}&feng=1" onclick="return confirmx('确认要执行该操作吗？', this.href)">取消封号</a>&nbsp; 
   			</c:when>
   			<c:when test="${gameUser.fenghaostatus== '2'}">  
         		<a class="btn btn-primary" href="${ctx}/gameuser/gameUser/cancelfenghao?id=${gameUser.id}&feng=2" onclick="return confirmx('确认要执行该操作吗？', this.href)">取消封IP</a>&nbsp;
   			</c:when>
   			<c:otherwise> 
    			未知
   			</c:otherwise>
   			</c:choose>
					
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>