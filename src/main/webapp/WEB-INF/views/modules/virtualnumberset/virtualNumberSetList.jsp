<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>虚拟人数设置管理</title>
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
		<li class="active"><a href="${ctx}/virtualnumberset/virtualNumberSet/list?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">虚拟人数设置列表</a></li>
		<shiro:hasPermission name="virtualnumberset:virtualNumberSet:edit"><li><a href="${ctx}/virtualnumberset/virtualNumberSet/form?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">虚拟人数设置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="virtualNumberSet" action="${ctx}/virtualnumberset/virtualNumberSet/list?roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form"><%-- 
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li> --%>
			<%-- <li><label>房间编号：</label>
				<form:input path="roomnumber" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>游戏房间ID：</label>
				<form:input path="gameroomId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li> --%>
			<li><label>开始时间：</label>
				<form:input  type="time" path="begintime" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>截止时间：</label>
				<form:input  type="time" path="endtime" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<%-- <li><label>虚拟人数最小值：</label>
				<form:input type="number" min="1"  path="virtualNumber" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>房间编号</th>
				<th>开始时间</th>
				<th>截止时间</th>
				<th>虚拟人数最小值</th>
				<th>虚拟人数最大值</th>
				<shiro:hasPermission name="virtualnumberset:virtualNumberSet:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="virtualNumberSet">
			<tr>
				<td><a href="${ctx}/virtualnumberset/virtualNumberSet/form?id=${virtualNumberSet.id}&roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">
					${virtualNumberSet.roomnumber}
				</a></td>
				<td>
					${virtualNumberSet.begintime}
				</td>
				<td>
					${virtualNumberSet.endtime}
				</td>
				<td>
					${virtualNumberSet.virtualNumber}
				</td>
				<td>
					${virtualNumberSet.virtualNumberMax}
				</td>
				<shiro:hasPermission name="virtualnumberset:virtualNumberSet:edit"><td>
    				<a href="${ctx}/virtualnumberset/virtualNumberSet/form?id=${virtualNumberSet.id}&roomnumber=${plSet.roomnumber}&gameroomId=${plSet.gameroomId}">修改</a>
					<a href="${ctx}/virtualnumberset/virtualNumberSet/delete?id=${virtualNumberSet.id}" onclick="return confirmx('确认要删除该虚拟人数设置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>