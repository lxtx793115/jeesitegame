<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏房间管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function show_jbox_set_border(){
			
			alert("");
		/* 	top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
				if(v=="ok"){
					$("#searchForm").attr("action","${ctx}/sys/user/export");
					$("#searchForm").submit();
				}
			},{buttonsFocus:1});
			top.$('.jbox-body .jbox-icon').css('top','55px'); */
		};
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
		<li class="active"><a href="${ctx}/gameroom/gameRoom/">游戏房间列表</a></li>
		<%-- <li><a href="${ctx}/gameroom/gameRoom/roomOdd">游戏规则设置</a></li> --%>
		<shiro:hasPermission name="gameroom:gameRoom:edit"><li><a href="${ctx}/gameroom/gameRoom/form">游戏房间添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gameRoom" action="${ctx}/gameroom/gameRoom/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>房间名字：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
		<%-- 	<li><label>机器人名字：</label>
				<form:input path="robotName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>机器人头像：</label>
				<form:input path="robotPhoto" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>--%>
			<%-- <li><label>开启竞猜：</label>
				<form:input path="guessFlag" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li> 
			<li><label>open_flag：</label>
				<form:input path="openFlag" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>在线人数：</label>
				<form:input path="count" htmlEscape="false" maxlength="11" class="input-medium"/>
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
				<th>房间名字</th>
				<th>房间图标</th>
				<th>机器人名字</th>
				<th>机器人头像</th>
				<th>采种类型</th>
				<th>开启竞猜</th>
				<th>开启聊天</th>
				<th>开启房间</th>
				<th>更新时间</th>
				<!-- <th>备注信息</th> -->
				<shiro:hasPermission name="gameroom:gameRoom:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameRoom">
			<tr>
				<td>
					${gameRoom.roomnumber}号房间
				</td>
				<td><a href="${ctx}/gameroom/gameRoom/form?id=${gameRoom.id}">
					${gameRoom.name}
				</a></td>
				<td>
					<img src="${gameRoom.roomIcon}">
				</td>
				<td>
					${gameRoom.robotName}
				</td>
				<td>
					<img src="${gameRoom.robotPhoto}">
				</td>
				<td>
					${gameRoom.roomLotteryTicketTypeContext}
				</td>
				<td>
				<shiro:hasPermission name="gameroom:gameRoom:edit"><a class="btn btn-primary" 
				href="${ctx}/gameroom/gameRoom/GuessFlag?id=${gameRoom.id}" 
				 />${gameRoom.guessFlagContext}</a></shiro:hasPermission>
				</td>
				<td>
				<shiro:hasPermission name="gameroom:gameRoom:edit"><a class="btn btn-primary" 
				href="${ctx}/gameroom/gameRoom/openChat?id=${gameRoom.id}" 
				 />${gameRoom.openChatContext}</a></shiro:hasPermission>
					<!-- <button class="btn btn-primary" onClick="jygl()">禁言管理</button> -->
				</td>
				<td>
				<shiro:hasPermission name="gameroom:gameRoom:edit"><a class="btn btn-primary" 
				href="${ctx}/gameroom/gameRoom/OpenFlag?id=${gameRoom.id}" 
				 />${gameRoom.openFlagContext}</a></shiro:hasPermission>
				</td>
				<td>
					<fmt:formatDate value="${gameRoom.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<%-- <td>
					${gameRoom.remarks}
				</td> --%>
				<td>
					<a class="btn btn-primary"  href="${ctx}/gameroom/gameRoom/roomOddII?gameroomId=${gameRoom.id}">设置</a>
					<shiro:hasPermission name="gameroom:gameRoom:edit">
    				<a class="btn btn-primary" href="${ctx}/gameroom/gameRoom/form?id=${gameRoom.id}">编辑</a>
					<a class="btn btn-primary" href="${ctx}/gameroom/gameRoom/delete?id=${gameRoom.id}" onclick="return confirmx('确认要删除该游戏房间吗？', this.href)">删除</a>
					</shiro:hasPermission>
					<%-- <a href="${ctx}/gameroom/gameRoom/roomOdd?roomId=${gameRoom.id}">赔率设置</a> --%>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>