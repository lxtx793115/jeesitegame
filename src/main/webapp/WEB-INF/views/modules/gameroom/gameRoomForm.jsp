<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏房间管理</title>
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
			var file = function(_cfg){
				var cfg = {
						con : null,
						count : 0, 
						imgInput : '<input type="hidden" name="name" value=""/>',
						callback : function(data){
							
						}
					};
				$.extend(cfg, _cfg);
				var submitFn = function(form){
					if( !!!window.FormData ){
						alert("您的浏览器版本过低，不支持文件上传！");
						return false;
					}
					var formData = new FormData(form);
					$.ajax({
						 url: '/file/upload',  
				          type: 'POST',  
				          data: formData,  
				          async: false,  
				          cache: false,  
				          contentType: false,  
				          processData: false,  
				          success: function (data) { 
				        	  $(form).remove();
				        	  cfg.callback(data);
				        	  afterPost(data);
				          },  
				          error: function (data) {  
				        	  $(form).remove();
				        	  console.log("error：",data);
				          }  
					})
				}
				var afterPost = function(data){
					 if(data.status == "success"){
						var con = f_img();
						con.append($("<img src='"+data.data.url+"'/>"));
						con.append($(cfg.imgInput).val(data.data.url));
						con.append(f_del());
						$(f_add).before(con);
						cfg.img_count ++;
						isAdd();
			      	 }
				}
				var delImg = function(_this){
					var img_path = $(_this).siblings("img").attr("src");
					$.post("/file/del",{name:img_path},function(data){
						if( data.status == "success" ){
							$(_this).closest(".f-img").remove();
							cfg.img_count --;
							isAdd();
						}else{
							alert(data.message);
						}
					})
				}
				var isAdd = function(){
					if(cfg.img_count>=cfg.count){
						$(f_add).hide();
					}else{
						$(f_add).show();
					}
				}
				var formHtml = '<form enctype="multipart/form-data"><input type="file" accept="image/*" name="file"></form>';
				var imgStyle = '<style type="text/css">.[con],.[con] *{margin:0;padding:0;box-sizing:border-box}.[con]{position:relative;overflow:hidden}.f-img{float:left;width:100px;height:100px;position:relative;margin-right:10px;border:1px solid #CCC;}.f-img img{max-width:100%;max-height:100%;}.f-add{height:100%;width:100%;text-align:center;line-height:90px;color:#CCC;font-size:40px;cursor:pointer;}.f-del{height:18px;width:18px;text-align:center;line-height:12px;border-radius:18px;background:red;color:#FFF;font-size:30px;position:absolute;top:0;right:0;cursor:pointer;z-index:1;}</style>';
				var click_add = function(){
					var form = $(formHtml);
					$(form).find("input").on("change",function(){
						submitFn(form[0]);
					});
					$(form).find("input").click();
				}	
				var f_img = function(){
					return $('<div class="f-img"></div>');
				}
				var f_del = function(){
					var f_del = $('<div class="f-del">-</div>');
					f_del.on("click",function(){
						delImg(this);
					});
					return f_del;
				}
				var f_style = function(){
					$("head").append($(imgStyle.replace(/\[con\]/g,cfg.con.className)));
				}();
				var f_add = function(){
					var f_add = f_img();
					f_add.append( $('<div class="f-add">+</div>') );
					f_add.on("click",function(){
						click_add();
					});
					$(cfg.con).append(f_add);
					cfg.img_count = 0;
					return f_add;
				}();
				$(cfg.submit).click(function(e){
					e.preventDefault();
					e.stopPropagation();
					submitFn();
				});
			}
			new file({
				con : $(".f-upload-con")[0],
				count : 1, 
				imgInput : '<input type="hidden" name="robotPhoto" value=""/>',
				callback : function(data){
					
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gameroom/gameRoom/">游戏房间列表</a></li>
		<li class="active"><a href="${ctx}/gameroom/gameRoom/form?id=${gameRoom.id}">游戏房间<shiro:hasPermission name="gameroom:gameRoom:edit">${not empty gameRoom.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gameroom:gameRoom:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gameRoom" action="${ctx}/gameroom/gameRoom/save" method="post" class="form-horizontal" onsubmit="return false;">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<%-- <div class="control-group">
			<label class="control-label">编号：</label>
			<div class="controls">
				<form:input path="no" htmlEscape="false" maxlength="32" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">房间名字：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">房间图标：</label>
			<div class="controls">
				<%-- <form:input path="robotPhoto" htmlEscape="false" maxlength="255" class="input-xlarge "/> --%>
				<form:hidden id="nameImageII" path="roomIcon" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="nameImageII" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
				<!-- <div class="f-upload-con">
				</div> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机器人名字：</label>
			<div class="controls">
				<form:input path="robotName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">机器人头像：</label>
			<div class="controls">
				<%-- <form:input path="robotPhoto" htmlEscape="false" maxlength="255" class="input-xlarge "/> --%>
				<form:hidden id="nameImage" path="robotPhoto" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
				<!-- <div class="f-upload-con">
				</div> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">采种类型：</label>
			<div class="controls">
				<form:select path="roomLotteryTicketType" name="roomLotteryTicketType" id="roomLotteryTicketType" class="input-xlarge ">
					<form:options items="${fns:getDictList('room_lottery_ticket_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设置竞猜状态：</label>
			<div class="controls">
				<%-- <form:input path="guessFlag" htmlEscape="false" maxlength="1" class="input-xlarge "/> --%>
				<select name="guessFlag">
					<option value="1">开启</option>
					<option value="0">关闭</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设置房间状态：</label>
			<div class="controls">
				<%-- <form:input path="openFlag" htmlEscape="false" maxlength="1" class="input-xlarge "/> --%>
				<select name="openFlag">
					<option value="1">开启</option>
					<option value="0">关闭</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设置聊天状态：</label>
			<div class="controls">
				<%-- <form:input path="openFlag" htmlEscape="false" maxlength="1" class="input-xlarge "/> --%>
				<select name="openChat">
					<option value="1">开启</option>
					<option value="0">关闭</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">在线人数：</label>
			<div class="controls">
				<form:input path="count" htmlEscape="false" maxlength="11" class="input-xlarge " value="0"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="gameroom:gameRoom:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>