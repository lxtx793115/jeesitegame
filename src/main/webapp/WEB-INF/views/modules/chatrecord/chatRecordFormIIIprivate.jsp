<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>聊天记录管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
	
<style>
.am-u-md-8{width:66.66666667%}

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
</head>
<body>
	
	
	 <span class="am-u-md-8 am-u-sm-12 row-mb" style="width:50%">
                    <div class="tpl-portlet">
                        <%-- <div class="tpl-portlet-title">
                            <div class="tpl-caption font-green ">
                                <span>回复${(fn:length(chatRecords))>0?chatRecords[0].sendernickname:''}</span>
                            </div>
                        </div> --%>

                        <div class="am-tabs tpl-index-tabs" >
 
                                    <div  class="am-scrollable-vertical" style="height: 400px;" >
                                    
                                            <ul  class="am-comments-list am-comments-list-flip" style="padding-bottom: 20px">
                                            <c:forEach items="${chatRecords}" var="chatRecord" varStatus="status">
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
                        	<form:form id="dan2"  modelAttribute="gameUser" action="${ctx}/chatrecord/chatRecordII/saveprivateMess" method="post" >
                        <form:hidden path="id"/>
                         <div class="am-g am-form" style="margin-top:10px">	
							<div class="am-input-group am-input-group">
							  <span  class="am-form-field">
							  <input style="width: 85%" id="passzhongjiepayment" name="passzhongjiepayment" type="text"   placeholder="输入发送的内容...."/>
							 <!--  <input type="text" style="width: 80%" placeholder="输入发送的内容...."> -->
							  <input class="btn btn-primary" type="submit" value="发送"/>
							  </span>	
							</div>
						  </div>
						  </form:form>
                    </div>
                    
                </span>
	
</body>
</html>