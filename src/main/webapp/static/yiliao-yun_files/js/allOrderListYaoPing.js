var lujing=$("#lujing").val();
$(function(){
	show(1,10);
	
	document.onkeydown = function(e){ 
    var ev = document.all ? window.event : e;
    if(ev.keyCode==13) {
    	$("#no").focus();
		show(1,10);	
     }
}
	
	
	$("#query").click(function(){
		show(1,10);
	});
	
	
});


function show(index,size){
	$.getJSON("/cGoodsOrderLcController/allGoodsOrder.do",
		{"index":index,
		"size":size,
		"no":$("#no").val(),
		"startDate":$("#startDate").val(),
		"endDate":$("#endDate").val(),
		"orderStatus":$("#orderStatus").val(),
		"pId":""
		},function(data){
		$("#shouyaoList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
			h+="<tr class='repeat-tr ng-scope' style='outline: none;'>";
			h+="<td class='ng-binding'>"+(i+1)+"</td>";
			if(v.STATUS=='0'){
				h+="<td class='status-0'>未收费</td>";
			}else if(v.STATUS=='1'){
				h+="<td class='status-0'>已收费</td>";
			}else if(v.STATUS=='2'){
				h+="<td class='status-1'>已发药</td>";
			}else if(v.STATUS=='3'){
				h+="<td class='status-1'>已就诊</td>";
			}else if(v.STATUS=='4'){
				h+="<td class='status-1'>已完成</td>";
			}
			h+="<td class='ng-binding'>"+v.NO+"</td>";
			if(v.pName==""||v.pName==null){
				h+="<td class='xz-lenght97 ng-binding' title=''>售药窗口</td>";
			}else{
				h+="<td class='xz-lenght97 ng-binding' title=''>"+v.pName+"</td>";
			}
			h+="<td class='ng-binding'>"+v.price+"</td>";
			h+="<td class='ng-binding'>"+getMyDate(v.create_date)+"</td>";
			h+="<td class='ng-binding'>"+v.doctorName+"</td>";
			h+="<td class='ng-binding'><img src='"+lujing+"/yiliao-yun_files/images/4_03.png' onclick='lookMain("+v.id+")' /></td>";
//			if(v.STATUS=='0'){
//			h+="<td class='ng-binding'><img src='"+lujing+"/yiliao-yun_files/images/icon-trash-black.png' onclick='delOrder("+v.id+")'/></td></tr>";
//			}else{
//				h+="<td class='ng-binding'></td></tr>";
//			}
		});	
		$(h).appendTo("#shouyaoList");
		pageClick(index);

	});	
}


function lookMain(id){
	window.location.href="/cGoodsOrderLcController/lookMainYaoPing.do?oId="+id;
}



function delOrder(id){
	window.location.href="/cGoodsOrderLcController/delGoodsOrder.do?oId="+id;
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
