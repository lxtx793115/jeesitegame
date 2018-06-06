<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户级别管理</title>
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
		<li class="active"><a href="${ctx}/gameuserrank/gameUserRank/">用户级别列表</a></li>
		<%-- <shiro:hasPermission name="gameuserrank:gameUserRank:edit"><li><a href="${ctx}/gameuserrank/gameUserRank/form">用户级别添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="gameUserRank" action="${ctx}/gameuserrank/gameUserRank/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form"><%-- 
			<li><label>最低可用金额：</label>
				<form:input path="minAvail" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>最高可用金额：</label>
				<form:input path="maxAvail" htmlEscape="false" class="input-medium"/>
			</li> --%>
			<li><label>用户级别：</label>
				<form:input path="userLevel" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>最低可用余额</th>
				<th>最高可用余额</th>
				<th>用户级别</th>
				<th>备注</th>
				<shiro:hasPermission name="gameuserrank:gameUserRank:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameUserRank">
			<tr>
				<td>
					${gameUserRank.minAvail}
				</td>
				<td>
					${gameUserRank.maxAvail}
				</td>
				
				<td>
				<img src="${gameUserRank.levelPhotourl}"  height="20" width="40">
					
				</td>
				<td>
					${gameUserRank.userLevel}
				</td>
				<shiro:hasPermission name="gameuserrank:gameUserRank:edit"><td>
    				<a href="${ctx}/gameuserrank/gameUserRank/form?id=${gameUserRank.id}">修改</a>
					<%-- <a href="${ctx}/gameuserrank/gameUserRank/delete?id=${gameUserRank.id}" onclick="return confirmx('确认要删除该用户级别吗？', this.href)">删除</a> --%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>