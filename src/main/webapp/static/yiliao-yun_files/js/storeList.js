$(function(){
	//show(1,5)
});
function show(index,size){
	$.getJSON("/cQuickMainController/showCQuickMain.do",{"index":index,"size":size},function(data){
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
				}else{
					h+="<td>医嘱信息</td>";
				}
					h+="<td>"+v.note+"</td>";
					h+="<td><a href='/cQuickMainController/delCQuickMain.do?id="+v.id+"'>删除</a></td></tr>";
		});	
		("#quickMainList").empty();
		$(h).appendTo("#quickMainList");
		pageClick(index);

	});	
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
	  	//show(page,5);
	  });
	  	  //下一页
	$("#page .nextPage").click(function(){
		//show((a-0+1),5);
	});  
	$("#page .prevPage").click(function(){
		//show((a-0-1),5);
	}); 
		
}
//alert(Window.totalCount);
var totalcount= Window.totalCount;
var page=Window.page;

initPage(totalcount,page);//加载页码
pageClick(Window.totalCount);