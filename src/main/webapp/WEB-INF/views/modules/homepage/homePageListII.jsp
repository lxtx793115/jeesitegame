<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页管理</title>
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
		<li class="active"><a href="${ctx}/homepage/homePage/">首页列表</a></li>
		<shiro:hasPermission name="homepage:homePage:edit"><li><a href="${ctx}/homepage/homePage/form">首页添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="homePage" action="${ctx}/homepage/homePage/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>主键：</label>
				<form:input path="id" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>会员总数：</label>
				<form:input path="userTotalNumber" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>今日新增会员：</label>
				<form:input path="todayNewlyAddedUser" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>今日活跃会员：</label>
				<form:input path="todayActiveUser" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>当前在线会员：</label>
				<form:input path="currentOnlineUser" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>周新增会员：</label>
				<form:input path="weekNewlyAddedUser" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>月新增会员：</label>
				<form:input path="monthNewlyAddedUser" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>盘内总分数：</label>
				<form:input path="intradiscalTotalFraction" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>今日充值：</label>
				<form:input path="todayRecharge" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>今日提现：</label>
				<form:input path="todayWithdrawCash" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>今日总盈亏：</label>
				<form:input path="todayTotalWinLoss" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>今日投注流水：</label>
				<form:input path="todayBetslStatement" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>今日赠送：</label>
				<form:input path="todayGivePresent" htmlEscape="false" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>主键</th>
				<th>会员总数</th>
				<th>今日新增会员</th>
				<th>今日活跃会员</th>
				<th>当前在线会员</th>
				<th>周新增会员</th>
				<th>月新增会员</th>
				<th>盘内总分数</th>
				<th>今日充值</th>
				<th>今日提现</th>
				<th>今日总盈亏</th>
				<th>今日投注流水</th>
				<th>今日赠送</th>
				<shiro:hasPermission name="homepage:homePage:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="homePage">
			<tr>
				<td><a href="${ctx}/homepage/homePage/form?id=${homePage.id}">
					${homePage.id}
				</a></td>
				<td>
					${homePage.userTotalNumber}
				</td>
				<td>
					${homePage.todayNewlyAddedUser}
				</td>
				<td>
					${homePage.todayActiveUser}
				</td>
				<td>
					${homePage.currentOnlineUser}
				</td>
				<td>
					${homePage.weekNewlyAddedUser}
				</td>
				<td>
					${homePage.monthNewlyAddedUser}
				</td>
				<td>
					${homePage.intradiscalTotalFraction}
				</td>
				<td>
					${homePage.todayRecharge}
				</td>
				<td>
					${homePage.todayWithdrawCash}
				</td>
				<td>
					${homePage.todayTotalWinLoss}
				</td>
				<td>
					${homePage.todayBetslStatement}
				</td>
				<td>
					${homePage.todayGivePresent}
				</td>
				<shiro:hasPermission name="homepage:homePage:edit"><td>
    				<a href="${ctx}/homepage/homePage/form?id=${homePage.id}">修改</a>
					<a href="${ctx}/homepage/homePage/delete?id=${homePage.id}" onclick="return confirmx('确认要删除该首页吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>