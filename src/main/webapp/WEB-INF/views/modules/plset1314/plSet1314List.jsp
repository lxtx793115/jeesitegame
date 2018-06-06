<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>13|14赔率管理</title>
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
		<li class="active"><a href="${ctx}/plset1314/plSet1314/">13|14赔率列表</a></li>
		<shiro:hasPermission name="plset1314:plSet1314:edit"><li><a href="${ctx}/plset1314/plSet1314/form">13|14赔率添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="plSet1314" action="${ctx}/plset1314/plSet1314/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<shiro:hasPermission name="plset1314:plSet1314:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="plSet1314">
			<tr>
				<shiro:hasPermission name="plset1314:plSet1314:edit"><td>
    				<a href="${ctx}/plset1314/plSet1314/form?id=${plSet1314.id}">修改</a>
					<a href="${ctx}/plset1314/plSet1314/delete?id=${plSet1314.id}" onclick="return confirmx('确认要删除该13|14赔率吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>