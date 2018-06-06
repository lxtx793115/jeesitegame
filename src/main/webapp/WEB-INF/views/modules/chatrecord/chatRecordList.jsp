<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>聊天记录管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#test2').on('click', function(){
			    layer.open({
			        type: 1,
			        area: ['600px', '360px'],
			        shadeClose: true, //点击遮罩关闭
			        content:  $("#info").html()
			    });
			});
			
			/* $("input[id^='huifu']").on('click', function(val){

				alert(val);
			    layer.open({
			        type: 1,
			        area: ['600px', '360px'],
			        shadeClose: true, //点击遮罩关闭
			        content:  $("#info").html()
			    });
			}); */
		});
		function huifu(va){
			alert(va);
			 $.post('${ctx}/chatrecord/chatRecordII/formIIResponseBody/'+va,function(result){
            	
				 
            },'json'); 
			layer.open({
		        type: 1,
		        area: ['600px', '360px'],
		        shadeClose: true, //点击遮罩关闭
		        content: '${ctx}/chatrecord/chatRecordII/formIIResponseBody/'+va
		    });
			form.render();
			
		};
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/layer-v3.1.1/layer/layer.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/layer-v3.1.1/layer/theme/default/layer.css">
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/chatrecord/chatRecordII/">客服聊天</a></li>
		
	</ul>
	<form:form id="searchForm" modelAttribute="chatRecord" action="${ctx}/chatrecord/chatRecordII/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>发送者账号：</label>
				<form:input path="senderPhone" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<%-- <li><label>消息类型：</label>
				<form:input path="msgType" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li><label>消息发送时间：</label>
				<input name="timestamp" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${chatRecord.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<!-- <div style="float:right;"><span id="test2"  class="btn btn-primary">新增</span></div> -->
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>消息序号</th>
				<th>发送者账号</th>
				<th>发送者头像</th>
				<th>昵称</th>
				<th>消息内容</th>
				<th>消息状态</th>
				<th>消息发送时间</th>
				<shiro:hasPermission name="chatrecord:chatRecordII:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="chatRecord" varStatus="status">
			<tr>
				<td><a href="${ctx}/chatrecord/chatRecordII/form?id=${chatRecord.id}">
					${chatRecord.chatnumber}
				</a></td>
				<td>
					${chatRecord.senderPhone}
				</td>
				<td>
					<img src="${chatRecord.senderphoto}">
				</td>
				<td>
					${chatRecord.sendernickname}
				</td>
				<td>
					${chatRecord.msgContent}
				</td>
				<td>
				<c:choose>
  	 		<c:when test="${chatRecord.messageStatus== '1'}">  
         		已读  
   			</c:when>
   			<c:otherwise> 
    			未读
   			</c:otherwise>
		</c:choose>
					
				</td>
				<td>
					<fmt:formatDate value="${chatRecord.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="chatrecord:chatRecordII:edit"><td>
    				<input type="button" id="huifu${chatRecord.chatnumber}" onclick="huifuma()" class="btn btn-primary"  value="回复">
    				<script type="text/javascript">
			$("#huifu${chatRecord.chatnumber}").click(function(){
				top.$.jBox.open("iframe:${ctx}/chatrecord/chatRecordII/formIIxu?id=${chatRecord.id}", "回复${chatRecord.sendernickname}",610,$(top.document).height()-140,{
					buttons:{"确定":"ok",  "关闭":true}, bottomText:"客服聊天记录。",submit:function(v, h, f){
							
						
					}, loaded:function(h){
						$(".jbox-content", top.document).css("overflow-y","hidden");
					}
				});
			});
		</script>
					<a  class="btn btn-primary" href="${ctx}/chatrecord/chatRecordII/delete?id=${chatRecord.id}" onclick="return confirmx('确认要删除该聊天记录管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	 <span  id="danpan" class="am-u-md-8 am-u-sm-12 row-mb"  style="display:none;width:50%" >
	 <form:form modelAttribute="chatRecords" id="khhtglForm">
                    <div class="tpl-portlet">
                        <div class="tpl-portlet-title">
                            <div class="tpl-caption font-green ">
                                <span>回复</span>
                            </div>
                        </div>

                        <div class="am-tabs tpl-index-tabs" >
 
                                    <div  class="am-scrollable-vertical" style="height: 400px;" >
                                    
                                            <ul  class="am-comments-list am-comments-list-flip" style="padding-bottom: 20px">
                                            <c:forEach items="${chatRecords}" var="chatRecord">
												<li class="am-comment ">
													<a href="#link-to-user-home"><img src="${chatRecord.senderphoto}" alt="" class="am-comment-avatar" width="48" height="48"></a>
													<div class="am-comment-main">
													<header class="am-comment-hd"><div class="am-comment-meta"><a href="#link-to-user" class="am-comment-author">${chatRecord.sendernickname}</a>  <time><fmt:formatDate value="${chatRecord.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/></time></div></header>
													<div class="am-comment-bd"><p>${chatRecord.msgContent}</p></div>
													</div>
												</li>
												</c:forEach>
                                            </ul>
 
                                    </div>
									
                           
                        </div>
                    </div>
                    </form:form>
                </span>
	
	<div class="pagination">${page}</div>
</body>
</html>