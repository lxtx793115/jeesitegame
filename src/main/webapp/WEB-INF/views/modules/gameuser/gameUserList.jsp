<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			
			
			$(".zybz-gb").click(function(){				//处方弹框
				$(".zyy-box").addClass("ng-hide");
				$(".zyy-boxs").addClass("ng-hide");
				$(".md-opaque").css("display","none");
			});
		});
		
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<!-- <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  --> 
		
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/yiliao-yun_files/css/css_112211.css">
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/yiliao-yun_files/css/css_2.css">
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/yiliao-yun_files/css/css_3.css">
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/yiliao-yun_files/css/css_4.css">
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/yiliao-yun_files/css/css_5.css">
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/yiliao-yun_files/css/css6.css">
		<link rel="stylesheet" type="text/css" href="${ctxStatic }/yiliao-yun_files/css/css7.css">
		<link type="text/css" rel="stylesheet" href="${ctxStatic }/yiliao-yun_files/css/laydate.css">
		<link type="text/css" rel="stylesheet" href="${ctxStatic }/yiliao-yun_files/css/laydate(1).css" id="LayDateSkin">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="${ctxStatic }/page/page.css" rel="stylesheet" type="text/css" >
		<script  type="text/javascript" src="${ctxStatic }/jquery/jquery-1.8.3.js" ></script>
		<script  type="text/javascript" src="${ctxStatic }/page/jquery.page.js"></script>
		<script  type="text/javascript" src="${ctxStatic }/yiliao-yun_files/js/checkMain.js" ></script>
		
		<style type="text/css">
						*{ margin:0; padding:0; list-style:none;}
						a{ text-decoration:none;}
						a:hover{ text-decoration:none;}
a:link,a:visited{color:blue;}
a.btn.btn-primary{color:#fff}body{padding-bottom:3px;font-size:14px}
		</style>
		
</head>
<body style= "overflow:auto">
<div class="md-dialog-container zyy-box ng-scope ng-hide"
								tabindex="-1" style="top: 0px; height: 381px; left: 1%;">
								<md-dialog aria-label="添加附加费用"
									class="zdxx_all_bj _md md-transition-in" role="dialog"
									tabindex="-1" style="">
								<form class="ng-pristine ng-valid" id="importFormyue"
									action="${ctx}/gameuser/gameUser/yueset?id=1"
									method="post" onsubmit="loading('正在保存余额，请稍等...');">
									<md-toolbar class="zdxx_title _md _md-toolbar-transitions">
									<div class="md-toolbar-tools zdxx_title_font">
										<h4>余额设置</h4>
										<span class="flex"></span>
										<button class="md-icon-button md-button bz-gb md-ink-ripple"
											type="button">
											<md-icon md-svg-src="images/icons/ic_close_24px.svg"
												style="color: #474747;fill: #474747;" aria-label="关闭"
												class="ng-scope zybz-gb" aria-hidden="true"> <svg
												xmlns="http://www.w3.org/2000/svg" width="100%"
												height="100%" viewBox="0 0 24 24" fit=""
												preserveAspectRatio="xMidYMid meet" focusable="false">
												<path
													d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></md-icon>
										</button>
									</div>
									</md-toolbar>
									<md-dialog-content style="overflow-x: hidden;height: 356px; "
										id="dialogContent_6">
									<div class="md-dialog-content" style="margin: 40px 20px;" style="overflow-x: hidden;height: 56px; ">
										<input type="hidden" id="hiddeninput">
										<label class="control-label">余额操作类型：</label>
											<select name="setyuestyle" id="setyuestyle">
													<option value="上分" selected="selected">上分</option>
													<option value="下分">下分</option>
													<option value="补分">补分</option>
													<option value="扣分">扣分</option>
													<option value="送分">送分</option>
													<option value="回水">回水</option>
													<option value="增加积分">增加积分</option>
													<option value="减少积分">减少积分</option>
												</select><br/>
										
										
										
										<label class="control-label">余&nbsp;&nbsp;&nbsp;&nbsp;额：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										
										<input id="setyue" type="number" name="setyue" htmlEscape="false"
													 />
												
										
									
									</div>
									</md-dialog-content>
									<md-dialog-actions layout="row" layout-align="end"
										class="zdxx_btn_confirm layout-align-end-stretch layout-row">
									<span aria-label="确认修改" id="saveOKimpor" class="mk-green-btn"
										style="font-size: 14px; font-family: '微软雅黑';">确认添加</span> 
										 </md-dialog-actions>
								</form>
								</md-dialog>
							</div>
							<script	type="text/javascript">
											$("#saveOKimpor").click(function() {
												 $("#importFormyue").attr("action", "${ctx}/gameuser/gameUser/yueset?id="+$("#hiddeninput").val()); 
												$('#importFormyue').submit();

											});
										</script>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/gameuser/gameUser/">游戏用户列表</a></li>
		<shiro:hasPermission name="gameuser:gameUser:edit"><li><a href="${ctx}/gameuser/gameUser/form">游戏用户添加</a></li></shiro:hasPermission>
	</ul>
	
	<form:form id="searchForm" modelAttribute="gameUser" action="${ctx}/gameuser/gameUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<ul class="ul-form">
			<li style="float:right"> <input id="assignButtonjinyan" class="btn btn-primary" type="button" value="禁言管理"/>&nbsp;
			<input id="assignButtonfeng" class="btn btn-primary" type="button" value="封号|封IP管理"/>&nbsp;
			<script type="text/javascript">
			$("#assignButtonfeng").click(function(){
				top.$.jBox.open("iframe:${ctx}/gameuser/gameUser/listfenghao", "封号管理",810,$(top.document).height()-240,{
					buttons:{"确定":"ok",  "关闭":true}, bottomText:"封号。",submit:function(v, h, f){

					
						
					}, loaded:function(h){
						$(".jbox-content", top.document).css("overflow-y","hidden");
					}
				});
			});
			
			$("#assignButtonjinyan").click(function(){
				top.$.jBox.open("iframe:${ctx}/gameuser/gameUser/listjinyan", "禁言管理",810,$(top.document).height()-240,{
					buttons:{"确定":"ok",  "关闭":true}, bottomText:"封号。", loaded:function(h){
						$(".jbox-content", top.document).css("overflow-y","hidden");
						$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
						$("body", h.find("iframe").contents()).css("margin","10px");
					}
				});
			});
		</script>
			<input type="button" value="积分管理"/></li>
			<li><label>电话：</label>
				<form:input path="phone" htmlEscape="false" maxlength="11" class="input-medium"/>
				
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<!-- <div style="float:right;"><span style="" class="btn-option bzs-btn mk-green-btn theme-bg" >新增</span></div> -->
	<table id="contentTable" class="table table-striped table-bordered table-condensed" >
		<thead>
			<tr>
				<th>ID</th>
				<th>昵称,头像</th>
				<th>备注</th>
				<!-- <th>头像</th> -->
				<th>帐号</th>
				<th>余额</th>
				<th>积分</th>
				
				<th>qq</th>
				<th>是否代理</th>
				<th>上级</th>
				<th>状态</th>
				
				<shiro:hasPermission name="gameuser:gameUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameUser">
			<tr>
				<td>
					${gameUser.gameusernumber}
				</td>
				<td width="auto"><a href="${ctx}/gameuser/gameUser/form?id=${gameUser.id}">
					${gameUser.nickname}<img src="${gameUser.photourl}" style="float:right" height="20" width="40">
				</a></td>
				<td>
					${gameUser.remarks}
				</td>
				<td>
					${gameUser.phone}
				</td>
				<td>
					${gameUser.balance}
				</td>
				<td>
					${gameUser.point}
				</td>
				<td>
					${gameUser.qq}
				</td>
				<td>
					${gameUser.agent}
				</td>
				<td>
					${gameUser.superiors}
				</td>
				<td>
						<c:choose>
  	 		<c:when test="${gameUser.userOnlineStatus== '0'||gameUser.userOnlineStatus== null||gameUser.userOnlineStatus== ''}">  
         		离线 
   			</c:when>
   				<c:when test="${gameUser.userOnlineStatus== '1'}">  
         		在线 
   			</c:when>
   			<c:otherwise> 
    			未知
   			</c:otherwise>

		</c:choose>
				</td>



					<shiro:hasPermission name="gameuser:gameUser:edit">
						<td>
						<input type="hidden" id="hidden${gameUser.id}" value="${gameUser.id}">
						<input class="btn  bzs-btn  btn-primary"
							id="${gameUser.gameusernumber}" type="button" value="余额管理" />&nbsp;
							<script type="text/javascript">
							$("#${gameUser.gameusernumber}").click(function(pa){
								/* alert("${gameUser.id}"); */
								$("#hiddeninput").val("${gameUser.id}");
								$(".zyy-box").removeClass("ng-hide");
								$(".zyy-box").css("display","flex");
								$(".md-opaque").css("display","block");
							});
							</script>
							 <input type="button" value="报表管理" />&nbsp; <a
							class="btn btn-primary"
							
							href="${ctx}/gameuser/gameUser/changeJinyan?id=${gameUser.id}"
							onclick="return confirmx('确认要执行该操作吗？', this.href)">禁言玩家</a>&nbsp;
							<!--1，登录密码，支付棉麻  --> <a class="btn btn-primary"
							href="${ctx}/gameuser/gameUser/resetPassword?id=${gameUser.id}">重置密码</a>&nbsp;
							<!-- <input type="button" value="私信TA"/>&nbsp; --> <input
							type="button" id="huifu${gameUser.gameusernumber}"
							class="btn btn-primary" value="私信TA">&nbsp; <script
								type="text/javascript">
			$("#huifu${gameUser.gameusernumber}").click(function(){
				top.$.jBox.open("iframe:${ctx}/chatrecord/chatRecordII/formPrivateMessage?id=${gameUser.id}", "回复${chatRecord.sendernickname}",610,$(top.document).height()-140,{
					buttons:{"确定":"ok",  "关闭":true}, bottomText:"客服聊天记录。",submit:function(v, h, f){
							
						
					}, loaded:function(h){
						$(".jbox-content", top.document).css("overflow-y","hidden");
					}
				});
			});
		</script> <a class="btn btn-primary"
							href="${ctx}/gameuser/gameUser/changefenghao?id=${gameUser.id}&feng=1"
							onclick="return confirmx('确认要执行该操作吗？', this.href)">封TA帐号</a>&nbsp;
							<a class="btn btn-primary"
							href="${ctx}/gameuser/gameUser/changefenghao?id=${gameUser.id}&feng=2"
							onclick="return confirmx('确认要执行该操作吗？', this.href)">封用户IP</a>&nbsp;

							<!-- <input type="button" value="删除用户"/> --> <a
							class="btn btn-primary"
							href="${ctx}/gameuser/gameUser/delete?id=${gameUser.id}"
							onclick="return confirmx('确认要删除该用户吗？', this.href)">删除用户</a>&nbsp;
							<a class="btn btn-primary"
							href="${ctx}/gameuser/gameUser/forminfo?id=${gameUser.id}">用户信息</a>&nbsp;
							<!-- <input type="button" value="用户信息"/> --> <%-- <a href="${ctx}/gameuser/gameUser/form?id=${gameUser.id}">修改</a>
					<a href="${ctx}/gameuser/gameUser/delete?id=${gameUser.id}" onclick="return confirmx('确认要删除该游戏用户吗？', this.href)">删除</a>
					<input type="button" value="封号玩家"/>&nbsp; --%></td>
					</shiro:hasPermission>
				</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	
	
</body>
</html>