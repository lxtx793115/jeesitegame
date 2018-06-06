<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户银行管理</title>
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
		<li class="active"><a href="${ctx}/gameuserrank/gameUserAccount/">用户银行列表</a></li>
		<shiro:hasPermission name="gameuserrank:gameUserAccount:edit"><li><a href="${ctx}/gameuserrank/gameUserAccount/form">用户银行添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gameUserAccount" action="${ctx}/gameuserrank/gameUserAccount/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>账号：</label>
				<form:input path="accountNo" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>开户地址：</label>
				<form:input path="accountAddress" htmlEscape="false" maxlength="155" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>用户账号</th>
				<th>账户类型</th>
				<th>账户详情</th>
				<th>开户地址</th>
				<th>支行名称</th>
				<shiro:hasPermission name="gameuserrank:gameUserAccount:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameUserAccount">
			<tr>
				<td>
					${gameUserAccount.rownum}
				</td>
				<td><a href="${ctx}/gameuserrank/gameUserAccount/form?id=${gameUserAccount.id}">
					${gameUserAccount.accountNo}
				</a></td>
				<td>
					${gameUserAccount.accountType}
				</td>
				<td>
					${gameUserAccount.accountDetail}
				</td>
				<td>
					${gameUserAccount.accountAddress}
				</td>
				<td>
					${gameUserAccount.bankname}
				</td>
				<shiro:hasPermission name="gameuserrank:gameUserAccount:edit"><td>
    				<a href="${ctx}/gameuserrank/gameUserAccount/form?id=${gameUserAccount.id}">修改</a>
					<a href="${ctx}/gameuserrank/gameUserAccount/delete?id=${gameUserAccount.id}" onclick="return confirmx('确认要删除该用户银行吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>