<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏下注管理</title>
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
		<li class="active"><a href="${ctx}/game_bets/gameBets/">游戏下注列表</a></li>
		<shiro:hasPermission name="game_bets:gameBets:edit"><li><a href="${ctx}/game_bets/gameBets/form">游戏下注添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gameBets" action="${ctx}/game_bets/gameBets/" method="post" class="breadcrumb form-search">
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
				<th>房间id</th>
				<th>游戏用户id</th>
				<th>下注金额</th>
				<th>大</th>
				<th>小</th>
				<th>单</th>
				<th>双</th>
				<th>大单</th>
				<th>大双</th>
				<th>小双</th>
				<th>小双</th>
				<th>极大</th>
				<th>极小</th>
				<th>洪波</th>
				<th>蓝波</th>
				<th>绿波</th>
				<th>豹子</th>
				<th>顺子</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="game_bets:gameBets:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameBets">
			<tr>
				<td><a href="${ctx}/game_bets/gameBets/form?id=${gameBets.id}">
					${gameBets.roomId}
				</a></td>
				<td>
					${gameBets.gameUserId}
				</td>
				<td>
					${gameBets.point}
				</td>
				<td>
					${gameBets.da}
				</td>
				<td>
					${gameBets.xiao}
				</td>
				<td>
					${gameBets.dan}
				</td>
				<td>
					${gameBets.shuang}
				</td>
				<td>
					${gameBets.dadan}
				</td>
				<td>
					${gameBets.dashuang}
				</td>
				<td>
					${gameBets.xiaodan}
				</td>
				<td>
					${gameBets.xiaoshaung}
				</td>
				<td>
					${gameBets.jida}
				</td>
				<td>
					${gameBets.jixiao}
				</td>
				<td>
					${gameBets.hongbo}
				</td>
				<td>
					${gameBets.lanbo}
				</td>
				<td>
					${gameBets.lvbo}
				</td>
				<td>
					${gameBets.baozi}
				</td>
				<td>
					${gameBets.shunzi}
				</td>
				<td>
					<fmt:formatDate value="${gameBets.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${gameBets.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${gameBets.remarks}
				</td>
				<shiro:hasPermission name="game_bets:gameBets:edit"><td>
    				<a href="${ctx}/game_bets/gameBets/form?id=${gameBets.id}">修改</a>
					<a href="${ctx}/game_bets/gameBets/delete?id=${gameBets.id}" onclick="return confirmx('确认要删除该游戏下注吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>