<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<!DOCTYPE HTML>  
<html>  
<head>  
<base href="<%=basePath%>">  
<title>测试文件上传</title>  
<script type="text/javascript" src="/static/jquery/jquery-1.8.3.min.js"></script>
</head> 
<body>  
<center>  
	<div class="f-upload-con">
	</div>
</center>  
</body>  
<script type="text/javascript">
$(function(){
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
		count : 3, 
		webPath: "temp/yes/",
		imgInput : '<input type="hidden" name="robotPhoto" value=""/>',
		callback : function(data){
			
		}
	});
})
</script>
</html>  