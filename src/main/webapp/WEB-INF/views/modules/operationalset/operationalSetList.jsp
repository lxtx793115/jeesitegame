<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运营设置管理</title>
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
		<li class="active"><a href="${ctx}/operationalset/operationalSet/">运营设置列表</a></li>
		<shiro:hasPermission name="operationalset:operationalSet:edit"><li><a href="${ctx}/operationalset/operationalSet/form">运营设置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="operationalSet" action="${ctx}/operationalset/operationalSet/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			
			<li><label>网站标题：</label>
				<form:input path="websiteTitle" htmlEscape="false" maxlength="85" class="input-medium"/>
			</li>
			
			<li><label>广告提示语：</label>
				<form:input path="advertisementPrompt" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>网站标题</th>
				<th>房间聊天关键词屏蔽</th>
				<th>APP下载地址</th>
				<th>广告提示语</th>
				<th>房间广告</th>
				<th>短信接口密钥</th>
				<shiro:hasPermission name="operationalset:operationalSet:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="operationalSet">
			<tr>
				<td><a href="${ctx}/operationalset/operationalSet/form?id=${operationalSet.id}">
					${operationalSet.websiteTitle}
				</a></td>
				<td>
					${operationalSet.roomKeyWordsShielding}
				</td>
				<td>
					${operationalSet.appDownloadLink}
				</td>
				<td>
					${operationalSet.advertisementPrompt}
				</td>
				<td>
					${operationalSet.roomAdvertisement}
				</td>
				<td>
					${operationalSet.smsInterfaceKey}
				</td>
				<shiro:hasPermission name="operationalset:operationalSet:edit"><td>
    				<a href="${ctx}/operationalset/operationalSet/form?id=${operationalSet.id}">修改</a>
					<a href="${ctx}/operationalset/operationalSet/delete?id=${operationalSet.id}" onclick="return confirmx('确认要删除该运营设置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>