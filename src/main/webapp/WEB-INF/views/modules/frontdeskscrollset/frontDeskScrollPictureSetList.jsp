<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>前台滚动图片设置管理</title>
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
		<li class="active"><a href="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/">前台滚动图片设置列表</a></li>
		<shiro:hasPermission name="frontdeskscrollset:frontDeskScrollPictureSet:edit"><li><a href="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/form">前台滚动图片设置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="frontDeskScrollPictureSet" action="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>图片地址：</label>
				<form:input path="pictureAddress" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<!-- <li><label>图片地址：</label>
			</li> -->
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>图片</th>
				<th>图片地址</th>
				<shiro:hasPermission name="frontdeskscrollset:frontDeskScrollPictureSet:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="frontDeskScrollPictureSet">
			<tr>
				<td><a href="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/form?id=${frontDeskScrollPictureSet.id}">
					${frontDeskScrollPictureSet.picturenumber}
				</td>
				<td>
				<img src="${frontDeskScrollPictureSet.pictureAddress}">
					
				</a></td>
				<td>
					${frontDeskScrollPictureSet.pictureAddress}
				</td>
				<shiro:hasPermission name="frontdeskscrollset:frontDeskScrollPictureSet:edit"><td>
    				<a href="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/form?id=${frontDeskScrollPictureSet.id}">修改</a>
					<a href="${ctx}/frontdeskscrollset/frontDeskScrollPictureSet/delete?id=${frontDeskScrollPictureSet.id}" onclick="return confirmx('确认要删除该前台滚动图片设置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>