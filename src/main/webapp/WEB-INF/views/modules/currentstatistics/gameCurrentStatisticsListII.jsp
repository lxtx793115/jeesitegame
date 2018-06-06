<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>当期统计管理</title>
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
	</script><%-- 
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/dan/dandd.css"> --%>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/currentstatistics/gameCurrentStatistics/">当期统计列表</a></li>
		<shiro:hasPermission name="currentstatistics:gameCurrentStatistics:edit"><li><a href="${ctx}/currentstatistics/gameCurrentStatistics/form">当期统计添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gameCurrentStatistics" action="${ctx}/currentstatistics/gameCurrentStatistics/" method="post" class="breadcrumb form-search">
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
			<li><label>大：</label>
				<form:input path="da" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>单：</label>
				<form:input path="dan" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>双：</label>
				<form:input path="shuang" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>小：</label>
				<form:input path="xiao" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>大单：</label>
				<form:input path="dadan" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>大双：</label>
				<form:input path="dashuang" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>小单：</label>
				<form:input path="xiaodan" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>小双：</label>
				<form:input path="xiaoshuang" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>极大：</label>
				<form:input path="jida" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>极小：</label>
				<form:input path="jixiao" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>红波：</label>
				<form:input path="hongbo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>蓝波：</label>
				<form:input path="lanbo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>绿波：</label>
				<form:input path="lvbo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>豹子：</label>
				<form:input path="baizi" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>顺子：</label>
				<form:input path="shunzi" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>对子：</label>
				<form:input path="duizi" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码0：</label>
				<form:input path="tema0" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码1：</label>
				<form:input path="tema1" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码2：</label>
				<form:input path="tema2" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码3：</label>
				<form:input path="tema3" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码4：</label>
				<form:input path="tema4" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码5：</label>
				<form:input path="tema5" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码6：</label>
				<form:input path="tema6" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码7：</label>
				<form:input path="tema7" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码8：</label>
				<form:input path="tema8" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码9：</label>
				<form:input path="tema9" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码10：</label>
				<form:input path="tema10" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码11：</label>
				<form:input path="tema11" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码12：</label>
				<form:input path="tema12" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码13：</label>
				<form:input path="tema13" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码14：</label>
				<form:input path="tema14" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码15：</label>
				<form:input path="tema15" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码16：</label>
				<form:input path="tema16" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码17：</label>
				<form:input path="tema17" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码18：</label>
				<form:input path="tema18" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码19：</label>
				<form:input path="tema19" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码20：</label>
				<form:input path="tema20" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码21：</label>
				<form:input path="tema21" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码22：</label>
				<form:input path="tema22" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码23：</label>
				<form:input path="tema23" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码24：</label>
				<form:input path="tema24" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码25：</label>
				<form:input path="tema25" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码26：</label>
				<form:input path="tema26" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>特码27：</label>
				<form:input path="tema27" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	
	<div class="am-tab-panel am-fade" id="tab4">
                          			<table class="am-table am-table-bordered am-table-hover am-table-compact">
										<thead>
										  <tr>
											<th style="text-align:center" colspan="4">特码</th>
											<th style="text-align:center" colspan="2">双面</th>
											<th style="text-align:center" colspan="2">极值</th>
											<th style="text-align:center" colspan="2">组合</th>
											<th style="text-align:center" colspan="2">特殊</th>
										  </tr>
										</thead>
										<tbody align="center" id="xy28List">             
										  <tr>
											<td style="width:30px"><span class="pcdd">0</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">1</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_pink">大</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_pink">极大</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_pink">大单</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_he">对子</td>
											<td>
											  <span class="money_n">0</span>                </td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">2</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">3</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">小</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">极小</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">小单</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_he">豹子</td>
											<td>
											  <span class="money_n">0</span>                </td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">4</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">5</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_pink">单</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td class="pk_pink">大双</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_he">顺子</td>
											<td>
											  <span class="money_n">0</span>                </td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">6</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">7</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">双</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td class="pk_blue">小双</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">8</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">9</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>

											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">10</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">11</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">12</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">13</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">14</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">15</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">16</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">17</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">18</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">19</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">20</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">21</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">22</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">23</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">24</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">25</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">26</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">27</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
							</tbody>
									  </table>
                           		</div>

				        				
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>ID</th>
				<th>游戏房间ID</th>
				<th>房间编号</th>
				<th>房间名称</th>
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
				<shiro:hasPermission name="currentstatistics:gameCurrentStatistics:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameCurrentStatistics">
			<tr>
				<td><a href="${ctx}/currentstatistics/gameCurrentStatistics/form?id=${gameCurrentStatistics.id}">
					${gameCurrentStatistics.id}
				</a></td>
				<td>
					${gameCurrentStatistics.gameroomId}
				</td>
				<td>
					${gameCurrentStatistics.roomnumber}
				</td>
				<td>
					${gameCurrentStatistics.roomname}
				</td>
				<td>
					${gameCurrentStatistics.da}
				</td>
				<td>
					${gameCurrentStatistics.dan}
				</td>
				<td>
					${gameCurrentStatistics.shuang}
				</td>
				<td>
					${gameCurrentStatistics.xiao}
				</td>
				<td>
					${gameCurrentStatistics.dadan}
				</td>
				<td>
					${gameCurrentStatistics.dashuang}
				</td>
				<td>
					${gameCurrentStatistics.xiaodan}
				</td>
				<td>
					${gameCurrentStatistics.xiaoshuang}
				</td>
				<td>
					${gameCurrentStatistics.jida}
				</td>
				<td>
					${gameCurrentStatistics.jixiao}
				</td>
				<td>
					${gameCurrentStatistics.hongbo}
				</td>
				<td>
					${gameCurrentStatistics.lanbo}
				</td>
				<td>
					${gameCurrentStatistics.lvbo}
				</td>
				<td>
					${gameCurrentStatistics.baizi}
				</td>
				<td>
					${gameCurrentStatistics.shunzi}
				</td>
				<td>
					${gameCurrentStatistics.duizi}
				</td>
				<td>
					${gameCurrentStatistics.tema0}
				</td>
				<td>
					${gameCurrentStatistics.tema1}
				</td>
				<td>
					${gameCurrentStatistics.tema2}
				</td>
				<td>
					${gameCurrentStatistics.tema3}
				</td>
				<td>
					${gameCurrentStatistics.tema4}
				</td>
				<td>
					${gameCurrentStatistics.tema5}
				</td>
				<td>
					${gameCurrentStatistics.tema6}
				</td>
				<td>
					${gameCurrentStatistics.tema7}
				</td>
				<td>
					${gameCurrentStatistics.tema8}
				</td>
				<td>
					${gameCurrentStatistics.tema9}
				</td>
				<td>
					${gameCurrentStatistics.tema10}
				</td>
				<td>
					${gameCurrentStatistics.tema11}
				</td>
				<td>
					${gameCurrentStatistics.tema12}
				</td>
				<td>
					${gameCurrentStatistics.tema13}
				</td>
				<td>
					${gameCurrentStatistics.tema14}
				</td>
				<td>
					${gameCurrentStatistics.tema15}
				</td>
				<td>
					${gameCurrentStatistics.tema16}
				</td>
				<td>
					${gameCurrentStatistics.tema17}
				</td>
				<td>
					${gameCurrentStatistics.tema18}
				</td>
				<td>
					${gameCurrentStatistics.tema19}
				</td>
				<td>
					${gameCurrentStatistics.tema20}
				</td>
				<td>
					${gameCurrentStatistics.tema21}
				</td>
				<td>
					${gameCurrentStatistics.tema22}
				</td>
				<td>
					${gameCurrentStatistics.tema23}
				</td>
				<td>
					${gameCurrentStatistics.tema24}
				</td>
				<td>
					${gameCurrentStatistics.tema25}
				</td>
				<td>
					${gameCurrentStatistics.tema26}
				</td>
				<td>
					${gameCurrentStatistics.tema27}
				</td>
				<shiro:hasPermission name="currentstatistics:gameCurrentStatistics:edit"><td>
    				<a href="${ctx}/currentstatistics/gameCurrentStatistics/form?id=${gameCurrentStatistics.id}">修改</a>
					<a href="${ctx}/currentstatistics/gameCurrentStatistics/delete?id=${gameCurrentStatistics.id}" onclick="return confirmx('确认要删除该当期统计吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>