$(function(){
	show(1,10);
	tongji();
	$("#queryMain").click(function(){
			show(1,10);
			tongji();
	});
});



//统计页面所有总金额
function tongji(){
	
	$.getJSON("/cTongJiLcController/tongjiPayMoney.do",{"pidType":$("#pidType").val(),
				"status":$("#status").val(),
				"moneystatistics_start":$("#moneystatistics_start").val(),
				"moneystatistics_end":$("#moneystatistics_end").val()},function(data){
					if(data!=null){
						$("#zongjiMoney").text(data.zong);
					$("#sheruMoney").text(data.xj);
					$("#xj").text(data.xj);
					$("#yh").text(data.yh);
					$("#yb").text(data.yb);
					$("#wx").text(data.wx);
					$("#zfb").text(data.zfb);
					}else{
					$("#zongjiMoney").text("0.00");
					$("#sheruMoney").text("0.00");
					$("#xj").text("0.00");
					$("#yh").text("0.00");
					$("#yb").text("0.00");
					$("#wx").text("0.00");
					$("#zfb").text("0.00");
					}
					
	});
}


//显示所有数据
function show(index,size){

$.getJSON("/cTongJiLcController/findPayTongJi.do",{	"index":index,
				"size":size,
				"pidType":$("#pidType").val(),
				"status":$("#status").val(),
				"moneystatistics_start":$("#moneystatistics_start").val(),
				"moneystatistics_end":$("#moneystatistics_end").val()
				},function(data){
		$("#tongjiList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
							h+="<tr>";
							h+="<td>"+(i+1)+"</td>";
							h+="<td>";
							if(v.pid=="0"){
								h+="售药";
							}else{
								h+="处方";
							}
							h+="</td>";
							h+="<td>";
							if(v.zt=="0"){
								h+="未付款";
							}else if(v.zt=="1"){
								h+="已付款";
							}else if(v.zt=="2"){
								h+="已发药"
							}else if(v.zt=="3"){
								h+="已就诊";
							}else if(v.zt=="4"){
								h+="已结束";
							}
							h+="</td>";
							h+="<td>"+v.no+"</td>";
							if(v.name==""||v.name==null||v.name=="undefined"){
							h+="<td>售药</td>";
							h+="<td>售药</td>";
							h+="<td>售药</td>";
							}else{
							h+="<td>"+v.name+"</td>";
							h+="<td>"+v.sex+"</td>";
							h+="<td>"+v.year+"</td>";
							}
							h+="<td>"+v.zong+"</td>";
							h+="<td>0</td>";
							h+="<td>"+v.xj+"</td>";
							h+="<td>"+v.bankmoney+"</td>";
							h+="<td>"+v.ybmoney+"</td>";
							h+="<td>"+v.wxmoney+"</td>";
							h+="<td>"+v.alipaymoney+"</td>";
							h+="<td>"+getMyDate(v.createdate)+"</td>";
							h+="<td>"+v.createname+"</td>";
							h+="</tr>";
		});	
		$(h).appendTo("#tongjiList");
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

//格式化时间
 function getMyDate(str){  
            var oDate = new Date(str),  
            oYear = oDate.getFullYear(),  
            oMonth = oDate.getMonth()+1,  
            oDay = oDate.getDate(),     
            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' ';//最后拼接时间  
            return oTime;  
        }; 
        //补0操作
      function getzf(num){  
          if(parseInt(num) < 10){  
              num = '0'+num;  
          }  
          return num;  
      }

							