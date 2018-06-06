<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户投注记录管理</title>
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
		<li class="active"><a href="${ctx}/gameuserbet/gameuserBet/">用户投注记录列表</a></li>
		<shiro:hasPermission name="gameuserbet:gameuserBet:edit"><li><a href="${ctx}/gameuserbet/gameuserBet/form">用户投注记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gameuserBet" action="${ctx}/gameuserbet/gameuserBet/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>ID：</label>
				<form:input path="id" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>游戏房间ID：</label>
				<form:input path="gameroomId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>房间编号：</label>
				<form:input path="roomnumber" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>房间名称：</label>
				<form:input path="roomname" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>用户名：</label>
				<form:input path="username" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>昵称：</label>
				<form:input path="nickname" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>用户ID：</label>
				<form:input path="gameuserid" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>大：</label>
				<form:input path="userDa" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>单：</label>
				<form:input path="userDan" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>双：</label>
				<form:input path="userShuang" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>小：</label>
				<form:input path="userXiao" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>大单：</label>
				<form:input path="userDadan" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>大双：</label>
				<form:input path="userDashuang" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>小单：</label>
				<form:input path="userXiaodan" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>小双：</label>
				<form:input path="xiaoshuang" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>极大：</label>
				<form:input path="userJida" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>极小：</label>
				<form:input path="userJixiao" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>红波：</label>
				<form:input path="userHongbo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>蓝波：</label>
				<form:input path="userLanbo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>绿波：</label>
				<form:input path="userLvbo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>豹子：</label>
				<form:input path="userBaizi" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>顺子：</label>
				<form:input path="userShunzi" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>对子：</label>
				<form:input path="userDuizi" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码0：</label>
				<form:input path="userTema0" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码1：</label>
				<form:input path="userTema1" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码2：</label>
				<form:input path="userTema2" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码3：</label>
				<form:input path="userTema3" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码4：</label>
				<form:input path="userTema4" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码5：</label>
				<form:input path="userTema5" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码6：</label>
				<form:input path="userTema6" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码7：</label>
				<form:input path="userTema7" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码8：</label>
				<form:input path="userTema8" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码9：</label>
				<form:input path="userTema9" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码10：</label>
				<form:input path="userTema10" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码11：</label>
				<form:input path="userTema11" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码12：</label>
				<form:input path="userTema12" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码13：</label>
				<form:input path="userTema13" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码14：</label>
				<form:input path="userTema14" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码15：</label>
				<form:input path="userTema15" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码16：</label>
				<form:input path="userTema16" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码17：</label>
				<form:input path="userTema17" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码18：</label>
				<form:input path="userTema18" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码19：</label>
				<form:input path="userTema19" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码20：</label>
				<form:input path="userTema20" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码21：</label>
				<form:input path="userTema21" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码22：</label>
				<form:input path="userTema22" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码23：</label>
				<form:input path="userTema23" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码24：</label>
				<form:input path="userTema24" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码25：</label>
				<form:input path="userTema25" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码26：</label>
				<form:input path="userTema26" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码27：</label>
				<form:input path="userTema27" htmlEscape="false" maxlength="20" class="input-medium"/>
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
				<th>游戏房间ID</th>
				<th>房间编号</th>
				<th>房间名称</th>
				<th>用户名</th>
				<th>昵称</th>
				<th>用户ID</th>
				<th>大</th>
				<th>单</th>
				<th>双</th>
				<th>小</th>
				<th>大单</th>
				<th>大双</th>
				<th>小单</th>
				<th>小双</th>
				<th>极大</th>
				<th>极小</th>
				<th>红波</th>
				<th>蓝波</th>
				<th>绿波</th>
				<th>豹子</th>
				<th>顺子</th>
				<th>对子</th>
				<th>特码0</th>
				<th>特码1</th>
				<th>特码2</th>
				<th>特码3</th>
				<th>特码4</th>
				<th>特码5</th>
				<th>特码6</th>
				<th>特码7</th>
				<th>特码8</th>
				<th>特码9</th>
				<th>特码10</th>
				<th>特码11</th>
				<th>特码12</th>
				<th>特码13</th>
				<th>特码14</th>
				<th>特码15</th>
				<th>特码16</th>
				<th>特码17</th>
				<th>特码18</th>
				<th>特码19</th>
				<th>特码20</th>
				<th>特码21</th>
				<th>特码22</th>
				<th>特码23</th>
				<th>特码24</th>
				<th>特码25</th>
				<th>特码26</th>
				<th>特码27</th>
				<shiro:hasPermission name="gameuserbet:gameuserBet:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameuserBet">
			<tr>
				<td><a href="${ctx}/gameuserbet/gameuserBet/form?id=${gameuserBet.id}">
					${gameuserBet.id}
				</a></td>
				<td>
					${gameuserBet.gameroomId}
				</td>
				<td>
					${gameuserBet.roomnumber}
				</td>
				<td>
					${gameuserBet.roomname}
				</td>
				<td>
					${gameuserBet.username}
				</td>
				<td>
					${gameuserBet.nickname}
				</td>
				<td>
					${gameuserBet.gameuserid}
				</td>
				<td>
					${gameuserBet.userDa}
				</td>
				<td>
					${gameuserBet.userDan}
				</td>
				<td>
					${gameuserBet.userShuang}
				</td>
				<td>
					${gameuserBet.userXiao}
				</td>
				<td>
					${gameuserBet.userDadan}
				</td>
				<td>
					${gameuserBet.userDashuang}
				</td>
				<td>
					${gameuserBet.userXiaodan}
				</td>
				<td>
					${gameuserBet.xiaoshuang}
				</td>
				<td>
					${gameuserBet.userJida}
				</td>
				<td>
					${gameuserBet.userJixiao}
				</td>
				<td>
					${gameuserBet.userHongbo}
				</td>
				<td>
					${gameuserBet.userLanbo}
				</td>
				<td>
					${gameuserBet.userLvbo}
				</td>
				<td>
					${gameuserBet.userBaizi}
				</td>
				<td>
					${gameuserBet.userShunzi}
				</td>
				<td>
					${gameuserBet.userDuizi}
				</td>
				<td>
					${gameuserBet.userTema0}
				</td>
				<td>
					${gameuserBet.userTema1}
				</td>
				<td>
					${gameuserBet.userTema2}
				</td>
				<td>
					${gameuserBet.userTema3}
				</td>
				<td>
					${gameuserBet.userTema4}
				</td>
				<td>
					${gameuserBet.userTema5}
				</td>
				<td>
					${gameuserBet.userTema6}
				</td>
				<td>
					${gameuserBet.userTema7}
				</td>
				<td>
					${gameuserBet.userTema8}
				</td>
				<td>
					${gameuserBet.userTema9}
				</td>
				<td>
					${gameuserBet.userTema10}
				</td>
				<td>
					${gameuserBet.userTema11}
				</td>
				<td>
					${gameuserBet.userTema12}
				</td>
				<td>
					${gameuserBet.userTema13}
				</td>
				<td>
					${gameuserBet.userTema14}
				</td>
				<td>
					${gameuserBet.userTema15}
				</td>
				<td>
					${gameuserBet.userTema16}
				</td>
				<td>
					${gameuserBet.userTema17}
				</td>
				<td>
					${gameuserBet.userTema18}
				</td>
				<td>
					${gameuserBet.userTema19}
				</td>
				<td>
					${gameuserBet.userTema20}
				</td>
				<td>
					${gameuserBet.userTema21}
				</td>
				<td>
					${gameuserBet.userTema22}
				</td>
				<td>
					${gameuserBet.userTema23}
				</td>
				<td>
					${gameuserBet.userTema24}
				</td>
				<td>
					${gameuserBet.userTema25}
				</td>
				<td>
					${gameuserBet.userTema26}
				</td>
				<td>
					${gameuserBet.userTema27}
				</td>
				<shiro:hasPermission name="gameuserbet:gameuserBet:edit"><td>
    				<a href="${ctx}/gameuserbet/gameuserBet/form?id=${gameuserBet.id}">修改</a>
					<a href="${ctx}/gameuserbet/gameuserBet/delete?id=${gameuserBet.id}" onclick="return confirmx('确认要删除该用户投注记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>