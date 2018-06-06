$(function() {
			showOne(1,10);
			
			$("#query").click(function(){
				showOne(1,10);
			});
		
});


function showOne(index,size){
	$.getJSON("/cYaoPingTongJiController/showTwoOrder.do",{
		"index":index,
		"size":size,
		"name":$("#oneName").val(),
		"type":$("#oneType").val(),
		"startDate":$("#oneStart").val(),
		"endDate":$("#oneEnd").val(),
		"orderCols":"counts"
		},function(data){
			$("#oneList").html('');
			var count=data.count;
			var pageCount=Math.floor(count%size==0?count/size:count/size+1);
			var h="";
			initPage(pageCount,index);//加载页码
			var xiaoshousum=0;
			var pifasum=0;
			$.each(data.list,function(i,v){	
					h+="<tr onclick='tiaoMain("+v.id+")' class='ng-scope' style=''>";
					h+="<td class='ng-binding'>"+(i+1)+"</td>";
				if(v.type=="1"){
						h+="<td class='ng-binding'>中药饮片</td>";
					}else if(v.type=="2"){
						h+="<td class='ng-binding'>西药</td>";
					}else if(v.type=="5"){
						h+="<td class='ng-binding'>中成药</td>";
					}
					h+="<td class='ng-binding'>"+v.name+"</td>";
					h+="<td class='ng-binding'>"+v.specification+"</td>";
					h+="<td class='ng-binding' aria-hidden='false'>"+v.counts+"</td>";
//					h+="<td class='ng-binding' aria-hidden='false'>"+v.trade_price+"</td>";
//					h+="<td class='ng-binding' aria-hidden='false'>"+v.sale_price+"</td>";
//					h+="<td class='ng-binding' aria-hidden='false'>"+(v.trade_price*v.counts)+"</td>";
//					h+="<td class='ng-binding' aria-hidden='false'>"+(v.sale_price*v.counts)+"</td>";
//					h+="<td class='ng-binding' aria-hidden='false'>"+(v.sale_price*v.counts-v.trade_price*v.counts)+"</td></tr>";
					xiaoshousum+=v.sale_price*v.counts;
					pifasum+=v.trade_price*v.counts;
					
			});	
			$(h).appendTo("#oneList");
//			$("#pifazong").text(pifasum);
//			$("#xiaoshouzong").text(xiaoshousum);
//			$("#lirun").text(xiaoshousum-pifasum);
			pageClick(index);

	});	
}


function tiaoMain(gid){
	window.location.href="/cYaoPingTongJiController/showGoodsOrderMainWindow.do?gid="+gid;
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
	  	showOne(page,10);
	  });
	  	  //下一页
	$("#page .nextPage").click(function(){
		showOne((a-0+1),10);
	});  
	$("#page .prevPage").click(function(){
		showOne((a-0-1),10);
	}); 
		
}