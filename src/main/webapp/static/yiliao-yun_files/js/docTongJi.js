$(function(){
	show(1,10);
	$("#queryMain").click(function(){
			show(1,10);
	});
});

//显示所有数据
function show(index,size){
	$.getJSON("/cYaoPingTongJiController/tongjiNowDoctorOrder.do",{"index":index,
				"size":size,
				"no":$("#no").val(),
				"status":$("#status").val(),
				"beginTime":$("#beginTime").val(),
				"endTime":$("#endTime").val()
				},function(data){
		$("#tongjiList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		var zong=0;
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
							h+="<tr>";
							h+="<td>"+(i+1)+"</td>";
							h+="<td>";
							if(v.status=="0"){
								h+="未付款";
							}else if(v.status=="1"){
								h+="已付款";
							}else if(v.status=="2"){
								h+="已发药"
							}else if(v.status=="3"){
								h+="已就诊";
							}else if(v.status=="4"){
								h+="已结束";
							}
							h+="</td>";
							h+="<td>"+v.no+"</td>";
							h+="<td>"+v.hname+"</td>";
							h+="<td>"+v.price+"</td>";
							h+="<td>"+getMyDate(v.create_date)+"</td>";
							h+="<td>"+v.fj+"</td>";
							h+="<td>"+v.yname+"</td>";
							h+="<td onclick='lookMain("+v.id+")'>详情</td>";
							h+="</tr>";
							zong+=(v.price-0);
		});	
			$("#cfCount").text(data.ccount);
			$("#hzCount").text(data.hcount);
		$(h).appendTo("#tongjiList");
		pageClick(index);
		$("#zongjiMoney").text(zong);
	});	
}

function lookMain(id){
	window.location.href="/cGoodsOrderLcController/lookMainDoctor.do?oId="+id;
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

							