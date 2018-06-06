var lujing=$("#lujing").val();
$(function(){
	show(1,10);
	
	$("#query").click(function(){
		show(1,10);
	});
});


function show(index,size){
	$.getJSON("/cGuaHaoListController/allGuaHaoList.do",
		{"index":index,
		"size":size,
		"startDate":$("#startDate").val(),
		"endDate":$("#endDate").val()
		},function(data){
		$("#shouyaoList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
			h+="<tr class='repeat-tr ng-scope' style='outline: none;'>";
			h+="<td class='ng-binding'>"+(i+1)+"</td>";
			h+="<td class='ng-binding'>"+v.guahaokeshi+"</td>";
			h+="<td class='ng-binding'>"+v.guahaoName+"</td>";
			h+="<td class='ng-binding'>"+v.guahaoMoney+"元</td>";
			h+="<td class='ng-binding'>"+v.pname+"</td>";
			h+="<td class='ng-binding'>"+v.phone+"</td>";
			h+="<td class='ng-binding'>"+getMyDate(v.create_date)+"</td>";
			h+="<td class='ng-binding'>"+v.name+"</td>";
			h+="</tr>";
		});	
		$(h).appendTo("#shouyaoList");
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
