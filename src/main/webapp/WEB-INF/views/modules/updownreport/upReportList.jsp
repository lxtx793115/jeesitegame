<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>上下分报表管理</title>
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
		<li class="active"><a href="${ctx}/updownreport/upAndDownReport/listup">上分管理</a></li>
		<li ><a href="${ctx}/updownreport/upAndDownReport/listdown">下分管理</a></li>
		<li ><a href="${ctx}/updownreport/upAndDownReport/list">上下分报表</a></li>
		
	</ul>
	<form:form id="searchForm" modelAttribute="upAndDownReport" action="${ctx}/updownreport/upAndDownReport/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			
			<li><label>订单ID：</label>
				<form:input path="reportnumber" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>账号：</label>
				<form:input path="bankAccount" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<%-- <li><label>申请时间：</label>
				<input name="applyTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${upAndDownReport.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			
		<%-- 	<li><label>状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('report_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				
				<th>订单ID</th>
				<th>昵称</th>
				<th>账号</th>
				<th>申请类型</th>
				<th>支付类型</th>
				<th>申请金额</th>
				<th>申请时间</th><!-- 
				<th>操作员</th>
				<th>状态</th> -->
				<shiro:hasPermission name="updownreport:upAndDownReport:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="upAndDownReport">
			<tr>
				
				<td>
					${upAndDownReport.reportnumber}
				</td>
				<td width="auto">
					${upAndDownReport.nickname}<img src="${upAndDownReport.photourl}" style="float:right" height="40" width="40">
				</a></td>
				<td>
					${upAndDownReport.bankAccount}
				</td>
				<td>
					${upAndDownReport.applyTypeContext}
				</td>
				<td>
					${upAndDownReport.payType}
				</td>
				<td>
					${upAndDownReport.applyMoneyAmount}
				</td>
				<td>
					<fmt:formatDate value="${upAndDownReport.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			<%-- 	<td>
					${upAndDownReport.operatorUsername}
				</td>
				<td>
					${upAndDownReport.statusContext}
				</td> --%>
				<shiro:hasPermission name="updownreport:upAndDownReport:edit"><td>
				<a class="btn btn-primary" 
				href="${ctx}/updownreport/upAndDownReport/Auditingsave?id=${upAndDownReport.id}&auditsta=1&shangxia=1" 
				onclick="return confirmx('确认要同意改订单吗？', this.href)">同意请求</a>
    			<a class="btn btn-primary" 
    			href="${ctx}/updownreport/upAndDownReport/Auditingsave?id=${upAndDownReport.id}&auditsta=2&shangxia=1" 
    			onclick="return confirmx('确认要拒绝改订单吗？', this.href)">拒绝请求</a>	
    				<%-- <a class="btn btn-primary" href="${ctx}/updownreport/upAndDownReport/form?id=${upAndDownReport.id}">修改</a>
					<a class="btn btn-primary" href="${ctx}/updownreport/upAndDownReport/delete?id=${upAndDownReport.id}&shangxia=1" onclick="return confirmx('确认要删除该上下分报表吗？', this.href)">删除</a> --%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		<tr>
				
				<td>全部合计：</td>
				<td></td>
				<td>${shangfen.bankAccount}人</td>
				<td></td>
				<td>总金额：</td>
				<td>${shangfen.applyMoneyAmount}</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>