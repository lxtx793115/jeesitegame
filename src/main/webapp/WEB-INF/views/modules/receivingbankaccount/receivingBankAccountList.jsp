<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收款账户设置管理</title>
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
		<li class="active"><a href="${ctx}/receivingbankaccount/receivingBankAccount/">收款账户设置列表</a></li>
		<shiro:hasPermission name="receivingbankaccount:receivingBankAccount:edit"><li><a href="${ctx}/receivingbankaccount/receivingBankAccount/form">收款账户设置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="receivingBankAccount" action="${ctx}/receivingbankaccount/receivingBankAccount/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			
			<li><label>账号：</label>
				<form:input path="account" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>账户类型：</label>
				<form:input path="accountType" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>真实姓名：</label>
				<form:input path="realName" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>ID</th>
				<th>账号</th>
				<th>账户类型</th>
				<th>真实姓名</th>
				<th>图标</th>
				<th>二维码</th>
				<shiro:hasPermission name="receivingbankaccount:receivingBankAccount:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="receivingBankAccount">
			<tr>
				<td><a href="${ctx}/receivingbankaccount/receivingBankAccount/form?id=${receivingBankAccount.id}">
					${receivingBankAccount.accountSequence}
				</td>
				<td>
					${receivingBankAccount.account}
				</td>
				<td>
					${receivingBankAccount.accountType}
				</td>
				<td>
					${receivingBankAccount.realName}
				</td>
				<td>
				<img src="${receivingBankAccount.iconPhoto}"  height="40" width="40">
					
				</td>
				<td>
				<img src="${receivingBankAccount.twoDimensionalCode}"  height="40" width="40">
					
				</td>
				<shiro:hasPermission name="receivingbankaccount:receivingBankAccount:edit"><td>
    				<a href="${ctx}/receivingbankaccount/receivingBankAccount/form?id=${receivingBankAccount.id}">修改</a>
					<a href="${ctx}/receivingbankaccount/receivingBankAccount/delete?id=${receivingBankAccount.id}" onclick="return confirmx('确认要删除该收款账户设置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>