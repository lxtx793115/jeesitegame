<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>限额设置管理</title>
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
		<li class="active"><a href="${ctx}/limitset/limitSet/">限额设置列表</a></li>
		<shiro:hasPermission name="limitset:limitSet:edit"><li><a href="${ctx}/limitset/limitSet/form">限额设置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="limitSet" action="${ctx}/limitset/limitSet/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>房间编号：</label>
				<form:input path="roomnumber" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>游戏房间ID：</label>
				<form:input path="gameroomId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>总额度：</label>
				<form:input path="totalQuota" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>特码最小：</label>
				<form:input path="temaMin" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>特码最大：</label>
				<form:input path="temaMax" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>大小单双最小：</label>
				<form:input path="daxiaodanshuangMin" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>大小单双最大：</label>
				<form:input path="daxiaodanshuangMax" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>组合单双最小：</label>
				<form:input path="zuhedanshuangMin" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>组合单双最大：</label>
				<form:input path="zuhedanshuangMax" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>极值最小：</label>
				<form:input path="jizhiMin" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>极值最大：</label>
				<form:input path="jizhiMax" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>波色最小：</label>
				<form:input path="bosheMin" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>波色最大：</label>
				<form:input path="bosheMax" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>豹子对子最小：</label>
				<form:input path="baoziduiziMin" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li><label>豹子对子最大：</label>
				<form:input path="baoziduiziMax" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<shiro:hasPermission name="limitset:limitSet:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="limitSet">
			<tr>
				<shiro:hasPermission name="limitset:limitSet:edit"><td>
    				<a href="${ctx}/limitset/limitSet/form?id=${limitSet.id}">修改</a>
					<a href="${ctx}/limitset/limitSet/delete?id=${limitSet.id}" onclick="return confirmx('确认要删除该限额设置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>