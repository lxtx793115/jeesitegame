$(function(){
	show(1,10);
	
	
	$("[name=checkName]").keyup(function(){
		show(1,10);
	});
	

	
	//确认添加
	$("#saveOK").click(function(){
		$(".zyy-box").addClass("ng-hide");
		$(".md-opaque").css("display","none");
		var checkName=$("#addCheckName").val();
		var checkPrice=$("#addCheckPrice").val();
		window.location.href="/cGuanHaoLcController/addGuaHao.do?guahaoName="+checkName+"&guahaoPrice="+checkPrice;
		
	});
	
	
	//确认修改
	$("#updateOK").click(function(){
		$(".zyy-boxs").addClass("ng-hide");
		$(".md-opaque").css("display","none");
		var id=$("#updateCheckId").val();
		var checkName=$("#updateCheckName").val();
		var checkMoney=$("#updateCheckMoney").val();
		window.location.href="/cGuanHaoLcController/updateGuaHao.do?id="+id+"&guahaoName="+checkName+"&guahaoMoney="+checkMoney;
	});
	
});





function show(index,size){
	$.getJSON("/cGuanHaoLcController/showGuaHao.do",{"index":index,"size":size,"guahaoName":$("[name=checkName]").val()},function(data){
		$("#checkMainList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
					h+="<tr><td>"+(i+1)+"</td>";
					h+="<td>"+v.guahaoname+"</td>";
					h+="<td><input type='hidden' value='"+v.id+"'>"+v.guahaomoney+"</td>";
					h+="<td><a style='color:#2fa4e7;' href='/cGuanHaoLcController/delGuaHao.do?id="+v.id+"'>删除</a>&nbsp;" +
							"<a  style='color:#2fa4e7;' onclick='updateMain(this)'>修改</a></td></tr>";
		});	
		$(h).appendTo("#checkMainList");
		pageClick(index);

	});	
}

function updateMain(a){
				var id=$(a).parent().prev().find("input").val();
				$.getJSON("/cGuanHaoLcController/findGuaHaoById.do",{"id":id},function(data){
					$("#updateCheckId").val(data.id);
					$("#updateCheckName").val(data.guahaoname);
					$("#updateCheckMoney").val(data.guahaomoney);
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

