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
		var checkRemarks=$("#addCheckRemarks").val();
		window.location.href="/ccheckMainLcController/addCheckMain.do?checkName="+checkName+"&checkPrice="+checkPrice+"&checkRemarks="+checkRemarks;
		
	});
	
	
	//确认修改
	$("#updateOK").click(function(){
		$(".zyy-boxs").addClass("ng-hide");
		$(".md-opaque").css("display","none");
		var id=$("#updateCheckId").val();
		var checkName=$("#updateCheckName").val();
		var checkMoney=$("#updateCheckMoney").val();
		var checkRemarks=$("#updateCheckRemarks").val();
		window.location.href="/ccheckMainLcController/updateCheckMain.do?id="+id+"&checkName="+checkName+"&checkMoney="+checkMoney+"&checkRemarks="+checkRemarks;
	});
	
});





function show(index,size){
	$.getJSON("/ccheckMainLcController/allCCheckMainHou.do",{"index":index,"size":size,"checkName":$("[name=checkName]").val()},function(data){
		$("#checkMainList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
					h+="<tr><td>"+(i+1)+"</td>";
					h+="<td>"+v.checkname+"</td>";
					h+="<td>"+v.remarks+"</td>";
					h+="<td><input type='hidden' value='"+v.id+"'>"+v.checkprice+"</td>";
					h+="<td><a style='color:#2fa4e7;' href='/ccheckMainLcController/delCheckMain.do?id="+v.id+"'>删除</a>&nbsp;" +
							"<a  style='color:#2fa4e7;' onclick='updateMain(this)'>修改</a></td></tr>";
		});	
		$(h).appendTo("#checkMainList");
		pageClick(index);

	});	
}

function updateMain(a){
				var id=$(a).parent().prev().find("input").val();
				$.getJSON("/ccheckMainLcController/findCheckMainById.do",{"id":id},function(data){
					$("#updateCheckId").val(data.id);
					$("#updateCheckName").val(data.checkname);
					$("#updateCheckMoney").val(data.checkprice);
					$("#updateCheckRemarks").val(data.remarks);
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

