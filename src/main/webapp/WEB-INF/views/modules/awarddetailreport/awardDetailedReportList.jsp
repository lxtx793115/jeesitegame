<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>开奖详细报表管理</title>
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
		<li class="active"><a href="${ctx}/awarddetailreport/awardDetailedReport/">开奖详细报表列表</a></li>
		<shiro:hasPermission name="awarddetailreport:awardDetailedReport:edit"><li><a href="${ctx}/awarddetailreport/awardDetailedReport/form">开奖详细报表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="awardDetailedReport" action="${ctx}/awarddetailreport/awardDetailedReport/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			
			<li><label>订单ID：</label>
				<form:input path="reportnumber" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
		
			<li><label>状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="25" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				
				<th>订单ID</th>
				<th>账号</th>
				<th>下注内容</th>
				<th>下注总额</th>
				<th>下注时间</th>
				<th>开奖结果</th>
				<th>玩家盈亏</th>
				<th>状态</th>
				<shiro:hasPermission name="awarddetailreport:awardDetailedReport:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="awardDetailedReport">
			<tr>
			
				<td>
					${awardDetailedReport.reportnumber}
				</td>
				<td>
					${awardDetailedReport.accountNumber}
				</td>
				<td>
					${awardDetailedReport.betsDetail}
				</td>
				<td>
					${awardDetailedReport.totalAmountBets}
				</td>
				<td>
					<fmt:formatDate value="${awardDetailedReport.betsTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${awardDetailedReport.awardResults}
				</td>
				<td>
					${awardDetailedReport.playerWinLoss}
				</td>
				<td>
					${awardDetailedReport.status}
				</td>
				<%-- <shiro:hasPermission name="awarddetailreport:awardDetailedReport:edit"><td>
    				<a href="${ctx}/awarddetailreport/awardDetailedReport/form?id=${awardDetailedReport.id}">修改</a>
					<a href="${ctx}/awarddetailreport/awardDetailedReport/delete?id=${awardDetailedReport.id}" onclick="return confirmx('确认要删除该开奖详细报表吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>