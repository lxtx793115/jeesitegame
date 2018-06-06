$(function(){
	show(1,10);
	
	
	$("[name=note]").keyup(function(){
		show(1,10);
	});
	
	$("#saveOK").click(function(){
		
		$(".zyy-box").addClass("ng-hide");
		$(".md-opaque").css("display","none");
		var note=$("[name=savenote]").val();
		var type=$("[name=savetype]").val();
		if(note!=''&&note!=null){
			window.location.href="/cQuickMainController/addCQuickMain.do?note="+note+"&type="+type;
			}else{
			alert("备注信息不能为空!");
		}
	});
	$("#updateOK").click(function(){
		$(".zyy-boxs").addClass("ng-hide");
		$(".md-opaque").css("display","none");
		var id=$("#updateId").val();
		var note=$("#updateNote").val();
		var type=$("#updateType").val();
		if(note!=''&&note!=null){
		window.location.href="/cQuickMainController/updateCQuickMain.do?note="+note+"&type="+type+"&id="+id;
		}else{
			alert("备注信息不能为空!");
		}
		
	});
	
});





function show(index,size){
	$.getJSON("/cQuickMainController/showCQuickMain.do",{"index":index,"size":size,"note":$("[name=note]").val(),"type":$("[name=type]").val()},function(data){
		$("#quickMainList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
					h+="<tr><td>"+(i+1)+"</td>";
				if(v.type=="1"){
					h+="<td>中医备注</td>";
				}else if(v.type=="2"){
					h+="<td>诊断信息</td>";
				}else if(v.type=="3"){
					h+="<td>医嘱信息</td>";
				}
					h+="<td><input type='hidden' value='"+v.id+"'>"+v.note+"</td>";
					h+="<td><a style='color:#2fa4e7;' href='/cQuickMainController/delCQuickMain.do?id="+v.id+"'>删除</a>   " +
							"&nbsp;<a  style='color:#2fa4e7;' onclick='updateMain(this)'>修改</a></td></tr>";
		});					//<input type='button' onclick='updateMain(this)' value='修改'>
		$(h).appendTo("#quickMainList");
		pageClick(index);

	});	
}

function updateMain(a){
				var id=$(a).parent().prev().find("input").val();
				$.getJSON("/cQuickMainController/findCQuickMainById.do",{"id":id},function(data){
					$("#updateId").val(data.id);
					$("#updateNote").val(data.note);
					$("#updateType").val(data.type);
				});
				$(".zyy-boxs").removeClass("ng-hide");
				$(".zyy-boxs").css("display","flex");
				$(".md-opaques").css("display","block");
}


function  initPage(count,page){
	$(".tcdPageCode").createPage({
    pageCount:count,
    current:page,
    backFn:function(){
    }
});
}
//页码绑定时间
function pageClick(a){
	$("#page .tcdNumber").click(function(){
	  	page =$(this).text();
	  	show(page,10);
	  });
	  	  //下一页
	$("#page .nextPage").click(function(){
		show((a-0+1),10);
	});  
	$("#page .prevPage").click(function(){
		show((a-0-1),10);
	}); 
		
}

