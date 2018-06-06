<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏用户管理</title>
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
						//容器
						con : null,
						//需要上传的图片数量 
						count : 0,
						//相对路径webRoot/dynamic/
						webPath : "",				
						//隐藏域,name值按照实际需求name值填写
						imgInput : '<input type="hidden" name="" value=""/>',
						//回调函数
						callback : function(data){
							
						}
					};
				$.extend(cfg,_cfg);
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
				var formHtml = '<form enctype="multipart/form-data"><input type="file" accept="image/*" name="file"><input type="hidden" name="webPath" value=""></form>';
				var imgStyle = '<style type="text/css">.[con],.[con] *{margin:0;padding:0;box-sizing:border-box}.[con]{position:relative;overflow:hidden}.f-img{float:left;width:100px;height:100px;position:relative;margin-right:10px;border:1px solid #CCC;}.f-img img{max-width:100%;max-height:100%;}.f-add{height:100%;width:100%;text-align:center;line-height:90px;color:#CCC;font-size:40px;cursor:pointer;}.f-del{height:18px;width:18px;text-align:center;line-height:12px;border-radius:18px;background:red;color:#FFF;font-size:30px;position:absolute;top:0;right:0;cursor:pointer;z-index:1;}</style>';
				var click_add = function(){
					var form = $(formHtml);
					$(form).find("input[name=webPath]").val(cfg.webPath);			
					$(form).find("input[type=file]").on("change",function(){
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
				webPath: "gameuser/",
				imgInput : '<input type="hidden" name="photo" value=""/>',
				callback : function(data){
					
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gameuser/gameUser/">游戏用户列表</a></li>
		<li class="active"><a href="${ctx}/gameuser/gameUser/forminfo?id=${gameUser.id}">用户信息<shiro:hasPermission name="gameuser:gameUser:edit"></shiro:hasPermission><shiro:lacksPermission name="gameuser:gameUser:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gameUser" action="${ctx}/gameuser/gameUser/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<table border="0"  >
		
		<tr style="height:50px;"><td  style="valign:middle;width: 60px"><label class="control-label">昵称：</label></td>
				<td  style="valign:middle"><form:input  style="width: 200px"  path="nickname"  htmlEscape="false" class="input-xlarge "/>
			</td>
		<td ><label class="control-label">账号：</label></td>
			<td style="valign:middle">
				<form:input  style="width: 200px"  path="phone" readonly="true" htmlEscape="false"  class="input-xlarge "/>
			</td>
		<td ><label class="control-label">余额：</label></td>
			<td  style="valign:middle">
				<form:input style="width: 200px" path="balance" htmlEscape="false"  class="input-xlarge "/>
			</td>
		</tr>
		
		<tr style="height:50px;">
		<td ><label class="control-label">积分：</label></td>
		<td  style="valign:middle">
		<form:input style="width: 200px" path="point"  htmlEscape="false"  class="input-xlarge "/>
		</td>
		<td  ><label class="control-label">qq：</label></td>
		<td  style="valign:middle">
		<form:input style="width: 200px" path="qq"  htmlEscape="false"  class="input-xlarge "/>
		</td>
		<td ><label class="control-label">代理：</label></td>
		<td  style="valign:middle">
		<form:input style="width: 200px" path="agent"  htmlEscape="false"  class="input-xlarge "/>
		</td>
		</tr>
		
		<tr style="height:50px;">
		<td ><label class="control-label">上级：</label></td>
		<td  style="valign:middle">
		<form:input style="width: 200px" path="superiors"  htmlEscape="false"  class="input-xlarge "/>
		</td>
		<td  ><label class="control-label">在线状态：</label></td>
		<td  style="valign:middle">
		<form:input style="width: 200px"  readonly="true"  path="userOnlineStatus"  htmlEscape="false"  class="input-xlarge "/>
		</td>
		</tr>	
	
		</table>
		<div class="control-group">
			<label class="control-label">头像：</label>
			<div class="controls">
				<form:hidden id="photourl" path="photourl" htmlEscape="false" maxlength="155" class="input-xlarge"/>
				<sys:ckfinder input="photourl" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</div>
		</div> 
		
		
		<label class="control-label">注册时间|注册IP地区：</label>
		<td  style="valign:middle">
		<input style="width: 300px" readonly="true"  name="zcsjipdq" value="${gameUser.registerTime}|${gameUser.registerIpArea}"  htmlEscape="false"  class="input-xlarge "/>
		</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label >登陆时间|登陆IP地区|登陆环境：</label>
		<td  style="valign:middle">
		<input style="width: 320px" readonly="true"  name="dlsjipdqhj" value="${gameUser.loginTime}|${gameUser.loginIpArea}|${gameUser.loginEnvironment}" readonly="true"   htmlEscape="false"  class="input-xlarge "/>
		</td>
			<div class="control-group">
		</div> 
	
		<td ><label class="control-label">备注信息：</label></td>
		<td  style="valign:middle">
			<form:textarea path="remarks" style="width:830px;" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
		</td><br>
		
		
		
	
		
		
		<div class="form-actions">
			<shiro:hasPermission name="gameuser:gameUser:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>