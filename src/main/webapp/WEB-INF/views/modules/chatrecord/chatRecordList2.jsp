<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<style>
.am-u-md-8{width:66.66666667%}
.am-form-field{border-color:#5eb95e!important;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.am-field-valid:focus,.am-form-success .am-form-field:focus{background-color:#fefffe;border-color:#459f45;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 5px #a5d8a5!important;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 5px #a5d8a5!important}.am-form-horizontal .am-checkbox,.am-form-horizontal .am-checkbox-inline,.am-form-horizontal .am-form-label,.am-form-horizontal .am-radio,.am-form-horizontal .am-radio-inline{margin-top:0;margin-bottom:0;padding-top:.6em}.am-form-horizontal .am-form-group:after,.am-form-horizontal .am-form-group:before{content:" ";display:table}.am-form-horizontal .am-form-group:after{clear:both}@media only screen and (min-width:641px){.am-form-horizontal .am-form-label{text-align:right}}@media only screen and (min-width:641px){.am-form-inline .am-form-group{display:inline-block;margin-bottom:0;vertical-align:middle}.am-form-inline .am-form-field{display:inline-block;width:auto;vertical-align:middle}.am-form-inline .am-input-group{display:inline-table;vertical-align:middle}.am-form-inline .am-input-group .am-form-label,.am-form-inline .am-input-group .am-input-group-btn,.am-form-inline .am-input-group .am-input-group-label{width:auto}.am-form-inline .am-input-group>.am-form-field{width:100%}.am-form-inline .am-form-label{margin-bottom:0;vertical-align:middle}.am-form-inline .am-checkbox,.am-form-inline .am-radio{display:inline-block;margin-top:0;margin-bottom:0;padding-left:0;vertical-align:middle}.am-form-inline .am-checkbox input[type=checkbox],.am-form-inline .am-radio input[type=radio]{float:none;margin-left:0}}.am-input-sm{font-size:1.4rem!important}.am-input-lg{font-size:1.8rem!important}.am-form-group-sm .am-checkbox,.am-form-group-sm .am-form-field,.am-form-group-sm .am-form-label,.am-form-group-sm .am-radio{font-size:1.4rem!important}.am-form-group-lg .am-checkbox,.am-form-group-lg .am-form-field,.am-form-group-lg .am-form-label,.am-form-group-lg .am-radio{font-size:1.8rem!important}.am-form-group-lg input[type=checkbox],.am-form-group-lg input[type=radio]{margin-top:7px}.am-form-icon{position:relative}.am-form-icon .am-form-field{padding-left:1.75em!important}.am-form-icon [class*=am-icon-]{position:absolute;left:.5em;top:50%;display:block;margin-top:-.5em;line-height:1;z-index:2}.am-form-icon label~[class*=am-icon-]{top:70%}.am-form-feedback{position:relative}.am-form-feedback .am-form-field{padding-left:.5em!important;padding-right:1.75em!important}
.am-u-sm-12{width:100%}

.row-mb {
    margin-bottom: 25px;
}

.tpl-portlet {
    padding: 12px 20px 15px;
    background-color: #fff;
    border-radius: 4px;
}
.tpl-index-tabs { position: relative;}                                                   
.tpl-portlet-title {
    padding: 0;
    min-height: 48px;
    border-bottom: 1px solid #eef1f5;
    margin-bottom: 10px;
    overflow: hidden;
}
.am-scrollable-vertical{height:240px;overflow-y:scroll;-webkit-overflow-scrolling:touch;resize:vertical}

.am-comments-list{padding:0;list-style:none}.am-comments-list .am-comment{margin:1.6rem 0 0 0;list-style:none}

@media only screen and (min-width:641px){.am-comments-list-flip .am-comment-main{margin-right:64px}
.am-comments-list-flip .am-comment-flip .am-comment-main{margin-left:64px}}

.am-comment-main{position:relative;margin-left:42px;border:1px solid #dedede;border-radius:0}

.am-comment-hd{background:#f8f8f8;border-bottom:1px solid #eee;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}
.am-comment-hd {padding-right:.5rem}

.am-comment-meta{-webkit-box-flex:1;-webkit-flex:1;
-ms-flex:1;flex:1;padding:10px 15px;font-size:13px;color:#999;
line-height:1.2;white-space:nowrap;text-overflow:ellipsis;overflow:hidden}
.am-comment-meta a{color:#999}.am-comment-author{font-weight:700;color:#999}

.am-comment-hd{background:#f8f8f8;border-bottom:1px solid #eee;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}
.am-comment-author{font-weight:700;color:#999}
.am-comment{margin:1.6rem 0 0 0;list-style:none}
.am-comment-hd .am-comment-actions{padding-right:.5rem}

.am-comment-bd{padding:10px;font-size:13px;overflow:hidden}.am-comment-bd>:last-child{margin-bottom:0}
.tpl-caption {
    color: #666;
    padding: 10px 0;
    float: left;
    display: inline-block;
    font-size: 16px;
    line-height: 18px;
}

.font-green {
    color: #32c5d2!important;
}

.am-comment:after,.am-comment:before{content:" ";display:table}.am-comment:after{clear:both}
.am-comment-avatar{float:left;width:32px;height:32px;border-radius:50%;border:1px solid transparent}@media only screen and (min-width:641px){.am-comment-avatar{width:48px;height:48px}}
.am-comment-main{position:relative;margin-left:42px;border:1px solid #dedede;border-radius:0}
.am-comment-main:after,.am-comment-main:before{position:absolute;top:10px;left:-8px;right:100%;width:0;height:0;display:block;content:" ";border-color:transparent;border-style:solid solid outset;border-width:8px 8px 8px 0;pointer-events:none}.am-comment-main:before{border-right-color:#dedede;z-index:1}.am-comment-main:after{border-right-color:#f8f8f8;margin-left:1px;z-index:2}@media only screen and (min-width:641px){
.am-comment-main{margin-left:63px}}.am-comment-hd{background:#f8f8f8;border-bottom:1px solid #eee;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.am-comment-title{margin:0 0 8px 0;font-size:1.6rem;line-height:1.2}
.am-comment-meta{-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;padding:10px 15px;font-size:13px;color:#999;line-height:1.2;white-space:nowrap;text-overflow:ellipsis;overflow:hidden}.am-comment-meta a{color:#999}.am-comment-author{font-weight:700;color:#999}.am-comment-bd{padding:10px;font-size:13px;overflow:hidden}
.am-comment-bd>:last-child{margin-bottom:0}.am-comment-footer{padding:0 15px 5px}
.am-comment-footer .am-comment-actions a+a{margin-left:5px}.am-comment-actions{font-size:13px;color:#999}
.am-comment-actions a{display:inline-block;padding:10px 5px;line-height:1;color:#999;opacity:.7}
.am-comment-actions a:hover{color:#0e90d2;opacity:1}.am-comment-hd .am-comment-actions{padding-right:.5rem}
.am-comment-flip .am-comment-avatar{float:right}.am-comment-flip 
.am-comment-main{margin-left:auto;margin-right:42px}@media only screen and (min-width:641px){
.am-comment-flip .am-comment-main{margin-right:63px}}.am-comment-flip .am-comment-main:after,.am-comment-flip 
.am-comment-main:before{left:auto;right:-8px;border-width:8px 0 8px 8px}.am-comment-flip 
.am-comment-main:before{border-left-color:#dedede}.am-comment-flip 
.am-comment-main:after{border-left-color:#f8f8f8;margin-right:1px;margin-left:auto}.am-comment-primary 
.am-comment-avatar{border-color:#0e90d2}.am-comment-primary .am-comment-main{border-color:#0e90d2}
.am-comment-primary .am-comment-main:before{border-right-color:#0e90d2}.am-comment-primary.am-comment-flip 
.am-comment-main:before{border-left-color:#0e90d2;border-right-color:transparent}.am-comment-primary.am-comment-flip 
.am-comment-main:after{border-left-color:#f8f8f8}.am-comment-highlight .am-comment-avatar,.am-comment-secondary 
.am-comment-avatar{border-color:#3bb4f2}.am-comment-highlight .am-comment-main,.am-comment-secondary 
.am-comment-main{border-color:#3bb4f2}.am-comment-highlight .am-comment-main:before,.am-comment-secondary 
.am-comment-main:before{border-right-color:#3bb4f2}.am-comment-highlight.am-comment-flip 
.am-comment-main:before,.am-comment-secondary.am-comment-flip .am-comment-main:before{border-left-color:#3bb4f2;border-right-color:transparent}
.am-comment-highlight.am-comment-flip .am-comment-main:after,.am-comment-secondary.am-comment-flip 
.am-comment-main:after{border-left-color:#f8f8f8}.am-comment-success .am-comment-avatar{border-color:#5eb95e}
.am-comment-success .am-comment-main{border-color:#5eb95e}.am-comment-success .am-comment-main:before{border-right-color:#5eb95e}
.am-comment-success.am-comment-flip .am-comment-main:before{border-left-color:#5eb95e;border-right-color:transparent}
.am-comment-success.am-comment-flip .am-comment-main:after{border-left-color:#f8f8f8}.am-comment-warning 
.am-comment-avatar{border-color:#F37B1D}.am-comment-warning .am-comment-main{border-color:#F37B1D}
.am-comment-warning .am-comment-main:before{border-right-color:#F37B1D}.am-comment-warning.am-comment-flip 
.am-comment-main:before{border-left-color:#F37B1D;border-right-color:transparent}.am-comment-warning.am-comment-flip 
.am-comment-main:after{border-left-color:#f8f8f8}.am-comment-danger .am-comment-avatar{border-color:#dd514c}
.am-comment-danger .am-comment-main{border-color:#dd514c}.am-comment-danger .am-comment-main:before{border-right-color:#dd514c}
.am-comment-danger.am-comment-flip .am-comment-main:before{border-left-color:#dd514c;border-right-color:transparent}
.am-comment-danger.am-comment-flip .am-comment-main:after{border-left-color:#f8f8f8}.am-comments-list{padding:0;list-style:none}
.am-comments-list .am-comment{margin:1.6rem 0 0 0;list-style:none}@media only screen and (min-width:641px){.am-comments-list-flip 
.am-comment-main{margin-right:64px}
.am-comments-list-flip .am-comment-flip .am-comment-main{margin-left:64px}}

.am-comment-main{position:relative;margin-left:42px;border:1px solid #dedede;border-radius:0}
.am-comment-main:after,.am-comment-main:before{position:absolute;top:10px;left:-8px;right:100%;width:0;height:0;display:block;content:" ";border-color:transparent;border-style:solid solid outset;border-width:8px 8px 8px 0;pointer-events:none}.am-comment-main:before{border-right-color:#dedede;z-index:1}.am-comment-main:after{border-right-color:#f8f8f8;margin-left:1px;z-index:2}@media only screen and (min-width:641px){.am-comment-main{margin-left:63px}}.am-comment-hd{background:#f8f8f8;border-bottom:1px solid #eee;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex}.am-comment-title{margin:0 0 8px 0;font-size:1.6rem;line-height:1.2}.am-comment-meta{-webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;padding:10px 15px;font-size:13px;color:#999;line-height:1.2;white-space:nowrap;text-overflow:ellipsis;overflow:hidden}.am-comment-meta a{color:#999}.am-comment-author{font-weight:700;color:#999}.am-comment-bd{padding:10px;font-size:13px;overflow:hidden}.am-comment-bd>:last-child{margin-bottom:0}.am-comment-footer{padding:0 15px 5px}.am-comment-footer .am-comment-actions a+a{margin-left:5px}.am-comment-actions{font-size:13px;color:#999}.am-comment-actions a{display:inline-block;padding:10px 5px;line-height:1;color:#999;opacity:.7}.am-comment-actions a:hover{color:#0e90d2;opacity:1}.am-comment-hd .am-comment-actions{padding-right:.5rem}
.am-comment-flip .am-comment-avatar{float:right}
.am-comment-flip .am-comment-main{margin-left:auto;margin-right:42px}@media only screen and (min-width:641px){.am-comment-flip .am-comment-main{margin-right:63px}}.am-comment-flip .am-comment-main:after,.am-comment-flip .am-comment-main:before{left:auto;right:-8px;border-width:8px 0 8px 8px}.am-comment-flip .am-comment-main:before{border-left-color:#dedede}.am-comment-flip .am-comment-main:after{border-left-color:#f8f8f8;margin-right:1px;margin-left:auto}.am-comment-primary .am-comment-avatar{border-color:#0e90d2}.am-comment-primary .am-comment-main{border-color:#0e90d2}.am-comment-primary .am-comment-main:before{border-right-color:#0e90d2}.am-comment-primary.am-comment-flip .am-comment-main:before{border-left-color:#0e90d2;border-right-color:transparent}
.am-comment-primary.am-comment-flip .am-comment-main:after{border-left-color:#f8f8f8}
.am-comment-highlight .am-comment-avatar,.am-comment-secondary .am-comment-avatar{border-color:#3bb4f2}
.am-comment-highlight .am-comment-main,.am-comment-secondary .am-comment-main{border-color:#3bb4f2}
.am-comment-highlight .am-comment-main:before,.am-comment-secondary .am-comment-main:before{border-right-color:#3bb4f2}
.am-comment-highlight.am-comment-flip .am-comment-main:before,.am-comment-secondary.am-comment-flip 
.am-comment-main:before{border-left-color:#3bb4f2;border-right-color:transparent}.am-comment-highlight.am-comment-flip 
.am-comment-main:after,.am-comment-secondary.am-comment-flip .am-comment-main:after{border-left-color:#f8f8f8}
.am-comment-success .am-comment-avatar{border-color:#5eb95e}.am-comment-success .am-comment-main{border-color:#5eb95e}
.am-comment-success .am-comment-main:before{border-right-color:#5eb95e}.am-comment-success.am-comment-flip 
.am-comment-main:before{border-left-color:#5eb95e;border-right-color:transparent}.am-comment-success.am-comment-flip 
.am-comment-main:after{border-left-color:#f8f8f8}.am-comment-warning .am-comment-avatar{border-color:#F37B1D}
.am-comment-warning .am-comment-main{border-color:#F37B1D}.am-comment-warning .am-comment-main:before{border-right-color:#F37B1D}
.am-comment-warning.am-comment-flip .am-comment-main:before{border-left-color:#F37B1D;border-right-color:transparent}
.am-comment-warning.am-comment-flip .am-comment-main:after{border-left-color:#f8f8f8}.am-comment-danger 
.am-comment-avatar{border-color:#dd514c}.am-comment-danger .am-comment-main{border-color:#dd514c}
.am-comment-danger .am-comment-main:before{border-right-color:#dd514c}.am-comment-danger.am-comment-flip 
.am-comment-main:before{border-left-color:#dd514c;border-right-color:transparent}.am-comment-danger.am-comment-flip 
.am-comment-main:after{border-left-color:#f8f8f8}.am-comments-list{padding:0;list-style:none}.am-comments-list 
.am-comment{margin:1.6rem 0 0 0;list-style:none}@media only screen and (min-width:641px){.am-comments-list-flip 
.am-comment-main{margin-right:64px}.am-comments-list-flip .am-comment-flip .am-comment-main{margin-left:64px}}

 .am-tabs-bd {
    border: none;
}
 }
 
 
 
 
 .tpl-caption {
    color: #666;
    padding: 10px 0;
    float: left;
    display: inline-block;
    font-size: 16px;
    line-height: 18px;
}
.font-red {
    color: #e7505a!important;
}

.tpl-portlet-title {
    padding: 0;
    min-height: 48px;
    border-bottom: 1px solid #eef1f5;
    margin-bottom: 10px;
    overflow: hidden;
}

.actions {
    float: right;
    display: inline-block;
    padding: 6px 0 14px;
}

.actions-btn {
    width: 100%;
}

.actions-btn li {
    display: inline-block;
    padding: 4px 14px;
    font-size: 12px;
    line-height: 1.5;
    color: #e7505a;
    border: 1px solid #e7505a;
    border-radius: 60px;
    cursor: pointer;
}
.am-g{width:auto;margin-left:-1rem;margin-right:-1rem}@media only screen and (min-width:641px){
.am-container>.am-g{margin-left:-1.5rem;margin-right:-1.5rem}}.am-g{margin:0 auto;width:100%}.am-g:after,.am-g:before{
content:" ";display:table}.am-g:after{clear:both}.am-g .am-g{margin-left:-1rem;margin-right:-1rem;width:auto}
.am-g .am-g.am-g-collapse{margin-left:0;margin-right:0;width:auto}@media only screen and (min-width:641px){
.am-g .am-g{margin-left:-1.5rem;margin-right:-1.5rem}}.am-g.am-g-collapse .am-g{margin-left:0;margin-right:0}
.am-g-collapse [class*=am-u-]{padding-left:0;padding-right:0}
.actions-btn li:hover {
    transition: all .3s;
}

.actions-btn li.red {
    border-color: #e7505a;
    color: #e7505a;
    background: 0 0;
}

.actions-btn li.red:hover,
.actions-btn li.red-on {
    border-color: #e7505a;
    color: #fff;
    background-color: #e7505a;
}

.actions-btn li.green {
    border-color: #32c5d2;
    color: #32c5d2;
    background: 0 0;
}
.am-input-group-btn,.am-form-inline .am-input-group .am-input-group-label{width:auto}
.actions-btn li.green:hover,
.actions-btn li.green-on {
    border-color: #32c5d2;
    color: #FFF;
    background-color: #32c5d2;
}

.actions-btn li.purple {
    border-color: #8E44AD;
    color: #8E44AD;
    background: 0 0;
}

.actions-btn li.purple:hover,
.actions-btn li.purple-on {
    border-color: #8E44AD;
    color: #FFF;
    background-color: #8E44AD;
}

.actions-btn li.dark {
    border-color: #2f353b;
    color: #2f353b;
    background: 0 0;
}

.actions-btn li.dark:hover,
.actions-btn li.dark-on {
    border-color: #2f353b;
    color: #FFF;
    background-color: #2f353b;
}

.actions-btn li.blue {
    border-color: #3598dc;
    color: #3598dc;
    background: 0 0;
}

.actions-btn li.blue:hover,
.actions-btn li.blue-on {
    border-color: #3598dc;
    color: #FFF;
    background-color: #3598dc;
}
</style>
	<title>聊天记录管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
		$(document).ready(function(e) {
			$('.but').on('click', function(){
			    layer.open({
			        type: 1,
			        area: ['600px', '360px'],
			        shadeClose: true, //点击遮罩关闭
			        content:  $("#dan1").html()
			    });
			});
			
			$('.but2').on('click', function(){
			    layer.open({
			        type: 1,
			        area: ['600px', '360px'],
			        shadeClose: true, //点击遮罩关闭
			        content:  $("#dan2").html()
			    });
			});

			/* $("#dan1").attr("style","display:block"); */
		/* 	$(".but").click(
					function(e) {
						
						$("#dan1").toggle();
						$("#dan3").toggle();
						}
					); */
			$(".but2").click(function(e) {
				$("#dan2").toggle();
				});
			});
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
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/dan/dan.css">
</head>
<body>

	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/chatrecord/chatRecord/listIII">聊天管理</a></li>
		<shiro:hasPermission name="chatrecord:chatRecord:edit"><li><a href="${ctx}/chatrecord/chatRecord/form">聊天管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="chatRecord" action="${ctx}/chatrecord/chatRecord/listIII" method="post" class="breadcrumb form-search">
		<%-- <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/> --%>
		<ul class="ul-form">
			<li><label>房间采种：</label>
				<form:checkboxes path="calxids" items="${fns:getDictList('room_lottery_ticket_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li><label>聊天条数：</label>
				<form:input path="selectnum" htmlEscape="false" maxlength="55" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<table style="border: 0" class="table table-striped table-bordered table-condensed">
	 <tr>
	<c:forEach items="${gameRooms}" var="gameRoom" varStatus="status">
	
	
     
      <td><span class="am-u-md-8 am-u-sm-12 row-mb" style="width:50%">
                    <div class="tpl-portlet">
                        <div class="tpl-portlet-title">
                            <div class="tpl-caption font-green ">
                                <span>${gameRoom.roomnumber}号房间聊天</span>
                            </div>
            <div style="float:right;">                
			<input type="button" class="but" value="开奖管理" />
			<input type="button" class="but2" value="在线人员"  />
			</div>
                        </div>

                        <div class="am-tabs tpl-index-tabs" >
 
                                    <div  class="am-scrollable-vertical" style="height: 400px;" >
                                    
                                            <ul  class="am-comments-list am-comments-list-flip" style="padding-bottom: 20px">
                                            <c:forEach items="${gameRoom.chatRecordList}" var="chatRecord" varStatus="status">
                                            <c:choose>
											<c:when
											test="${chatRecord.fenbain== '1' }">
												
												<li class="am-comment-flip am-comment am-comment-highlight">
													<a href="#link-to-user-home"><img src="${chatRecord.senderphoto}" alt="" class="am-comment-avatar" width="48" height="48"></a>
													<div class="am-comment-main">
													<header class="am-comment-hd"><div class="am-comment-meta"><a href="#link-to-user" class="am-comment-author">${chatRecord.sendernickname}</a>  <time><fmt:formatDate value="${chatRecord.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/></time></div></header>
													<div class="am-comment-bd"><p>${chatRecord.msgContent}</p></div>
													</div>
												</li>
										</c:when>
										<c:otherwise>
										<li class="am-comment ">
													<a href="#link-to-user-home"><img src="${chatRecord.senderphoto}" alt="" class="am-comment-avatar" width="48" height="48"></a>
													<div class="am-comment-main">
													<header class="am-comment-hd"><div class="am-comment-meta"><a href="#link-to-user" class="am-comment-author">${chatRecord.sendernickname}</a>  <time><fmt:formatDate value="${chatRecord.timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/></time></div></header>
													<div class="am-comment-bd"><p>${chatRecord.msgContent}</p></div>
													</div>
												</li>
										</c:otherwise>
										</c:choose>
												
												</c:forEach>
                                            </ul>
 
                                    </div>
									
                           
                        </div>
                        <div class="am-g am-form" style="margin-top:10px">	
							<div class="am-input-group am-input-group">
							  <span><input type="text" style="width: 80%" class="am-form-field" placeholder="输入发送的内容...."><button class="btn btn-primary"  type="button">发送</button></span>	
							</div>
						  </div>
                        
                    </div>
                    
                </span><td>
  
	</c:forEach>
	<tr>
</table>

<table class="table table-striped table-bordered table-condensed" style="display:none"  id="dan3">
<tr>
<td><div class="am-u-md-4 am-u-sm-12 row-mb" style="display:none" id="dan1">
                    <div class="tpl-portlet">
                        <div class="tpl-portlet-title">
                            <div class="tpl-caption font-red ">
                                <span>开奖管理</span>
                            </div>
                            <div class="actions">
                                <ul class="actions-btn">
                                    <button type="button" onclick="" class="am-btn am-btn-xs am-btn-success am-radius">开始游戏</button>
                                    <button type="button" onclick="setroom()" class="am-btn am-btn-xs am-btn-primary am-radius">房间设置</button>
                                </ul>
                            </div>
                        </div>
                        <div class="am-g">
                           <form class="am-form">
                           	<div class="am-input-group am-input-group-sm am-form-group">
							  <label>当前彩种:</label>
							  <span>北京赛车</span>
							  <br>
							  <label>当前期号:</label>
							  <span>672155期</span>
							  <br>
							  <label>开奖号码:</label>
							  <span>04,01,05,03,10,07,06,08,02,09</span>
							  <br>
							  <label>距离下期开奖:</label>
							  <span id="time" style="font-size:20px;font-weight:bold;color:cornflowerblue;">30秒</span>
							  <br>
							  <label>本期总投:</label>
							  <span  style="padding: 0 10px;">0</span>
							  <label>上期盈亏:</label>
							  <span style="padding: 0 10px;">0</span>
							  <label>总盈亏:</label>
							  <span style="padding: 0 10px;">0</span>
							</div>
                           </form>
                            
                        </div>
                    </div>
                </div></td>
<td><div class="am-u-md-4 am-u-sm-12 row-mb" style="display:none"  id="dan2">
                    <div class="tpl-portlet">
                        <div class="tpl-portlet-title">
                            <div class="tpl-caption font-red ">
                                <span>在线人员</span>
                            </div>
                        </div>
                        <div class="am-g">
                           <div class="am-scrollable-horizontal" style="overflow: auto; width: 100%;">
                              <table class="am-table am-table-bordered am-table-striped am-table-compact am-text-nowrap" id="tableList"><thead>
                                <tr role="row" style="height: 0px;">
                                	<th>昵称</th>
                                	<th>余额</th>
                                	<th>操作</th>
                                </tr>
                            </thead>
                            
                            <tbody>

                            <tr role="row" class="odd">
                            	<td class="blod">郭</td>
                            	<td>4983.74</td>
                            	<td>
                            		<a href='' class="am-btn am-btn-danger am-btn-xs">禁言玩家</a>
                            	</td>
                            </tr>
                            	<tr role="row" class="even">
                            	<td class="sorting_1">释怀</td>
                            	<td>893.00</td>
                            	<td>
                            		<a href='' class="am-btn am-btn-danger am-btn-xs">禁言玩家</a>
                            	</td>
                            </tr>
                           </tbody>
                        </table>
                        </div>
                        </div>
                    </div>
                   </div>
	</td>
</tr>
</table>
	

                
	<%-- <table>
	<c:forEach items="${gameRooms}" var="gameRoom">
		
		
		
		<c:forEach items="${gameRoom.chatRecordList}" var="chatRecord">
			<tr>
				
			</tr>
		</c:forEach>
	</c:forEach>
	
	</table> --%>
	
	
		<sys:message content="${message}"/>
</body>
</html>