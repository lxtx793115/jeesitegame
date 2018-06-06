<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>开奖管理管理</title>
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
	<c:forEach items="${gameRooms}" var="gameRoom" varStatus="status">
		<c:choose>
  	 		<c:when test="${roomhao== gameRoom.roomnumber}">  
         		<li class="active"><a href="${ctx}/awordmanagement/awardManagement/listII?roomnum=${gameRoom.roomnumber}">${gameRoom.name}</a></li> 
   			</c:when>
   			<c:otherwise> 
    			<li ><a href="${ctx}/awordmanagement/awardManagement/listII?roomnum=${gameRoom.roomnumber}">${gameRoom.name}</a></li>
   			</c:otherwise>

		</c:choose>
		
		</c:forEach>
		<%-- <li><a href="${ctx}/awordmanagement/awardManagement/form">开奖管理添加</a></li> --%>
		<%-- <li class="active"><a href="${ctx}/awordmanagement/awardManagement/">开奖管理列表</a></li>
		<shiro:hasPermission name="awordmanagement:awardManagement:edit"><li><a href="${ctx}/awordmanagement/awardManagement/form">开奖管理添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="awardManagement" action="${ctx}/awordmanagement/awardManagement/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>期数：</label>
				<form:input path="termNum" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>开奖号码：</label>
				<form:input path="awardNum" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li><%-- 
			<li><label>投注总额：</label>
				<form:input path="totalAmountOfInvestment" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>投注人数：</label>
				<form:input path="totalPeopleOfInvestment" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>玩家赢亏：</label>
				<form:input path="playerWinLoss" htmlEscape="false" maxlength="155" class="input-medium"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				
				<th>期数</th>
				<th>开奖号码</th>
				<th>封盘时间</th>
				<th>开奖时间</th>
				<th>投注总额</th>
				<th>投注人数</th>
				<th>玩家赢亏</th>
				<shiro:hasPermission name="awordmanagement:awardManagement:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="awardManagement">
			<tr>
				
				<td>
					${awardManagement.termNum}
				</td>
				<td>
					${awardManagement.awardNum}
				</td>
				<td>
					<fmt:formatDate value="${awardManagement.entertainedTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${awardManagement.awardTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${awardManagement.totalAmountOfInvestment}
				</td>
				<td>
					${awardManagement.totalPeopleOfInvestment}
				</td>
				<td>
					${awardManagement.playerWinLoss}
				</td>
				<shiro:hasPermission name="awordmanagement:awardManagement:edit"><td>
    				<a id="detail${awardManagement.awardNum}" class="btn btn-primary" 
    				>详情</a>
    				 	<script type="text/javascript">
			
			$("#detail${awardManagement.awardNum}").click(function(){
				top.$.jBox.open("iframe:${ctx}/awarddetailreport/awardDetailedReport/list", "详细报表",810,$(top.document).height()-240,{
					buttons:{"确定":"ok",  "关闭":true}, bottomText:"封号。", loaded:function(h){
						$(".jbox-content", top.document).css("overflow-y","hidden");
						$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
						$("body", h.find("iframe").contents()).css("margin","10px");
					}
				});
			});
		</script>
    				 <a class="btn btn-primary" 
    				 >撤单</a>
    				 <a class="btn btn-primary" 
    				>手动开奖</a>
					<%-- <a href="${ctx}/awordmanagement/awardManagement/delete?id=${awardManagement.id}" onclick="return confirmx('确认要删除该开奖管理吗？', this.href)">删除</a> --%>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>