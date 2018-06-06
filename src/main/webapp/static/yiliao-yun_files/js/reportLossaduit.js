var lujing=$("#lujing").val();
var size=10;//每页几条
$(function(){
	$("#querybtn").click(function(){
		show(1,size);
	});
	$(".querybtn").click(function(){
	  	show(1,size);
	});
})
$(function(){
	show(1,size);
	$("#no").keyup(function(){
		show(1,size);
	});
});
//已存在的患者信息弹窗
function show(index,size){
	var startdate=$("#drugexamine_start").val();
	var enddate=$("#drugexamine_end").val();
	var no=$("#no").val();
	var status=$("#status option:selected").val();
	$.getJSON("/cStoreOrderController/LossListData.do",{"page":index,"size":size,"no":no,"startdate":startdate,"enddate":enddate,"status":status},function(data){
		$("#shouyaoList").html('');
		var count=data.count;
		console.log(count);
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
			h+='<tr style="height: 38px;" class="ng-scope" onclick="detail(\''+v.id+'\',\''+v.no+'\',\''+v.create_name+'\',\''+v.create_date+'\',\''+v.price+'\')">'	
			h+='<th scope="row" style="padding:0px;line-height:38px " class="ng-binding">'+(i+1)+'</th>'
			h+='<td class="ng-binding">'+v.no+'</td>'
			h+='<td class="ng-binding">'+v.create_name+'</td>'
			h+='<td class="ng-binding">'+v.price+'</td>'
			h+='<td class="ng-binding">'+v.create_date+'</td>'
			h+='<td class="bluecolor ng-binding shbj">'+v.label+'</td>'
			h+='<td><span class="ng-binding" aria-hidden="false">'+v.update_name+'</span></td>'
			h+='<td><span class="ng-binding" aria-hidden="false">'+v.update_date+'</span></td>'
			h+='<td class="ng-binding"></td>'
			h+='<td class="ng-binding"><a href="###">查看</a></td>'
			h+='</tr>'
		});	
		$("#dataList").empty();
		$(h).appendTo("#dataList");
		pageClick(index);
	});	
}
function lookMain(id){
	window.location.href="/cGoodsOrderLcController/lookMain.do?oId="+id;
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
	  	show(page,size);
	  });
	  	  //下一页
	$("#page .nextPage").click(function(){
		show((a-0+1),size);
	});  
	$("#page .prevPage").click(function(){
		show((a-0-1),size);
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

function detail(id,no,create_name,create_date,price){
	  console.log(Window.ctx);
	  location.href=Window.ctx+"/../cStoreOrderController/reportLossListDetail.do?orderId="+id+"&no="+no+"&create_name="+create_name+"&create_date="+create_date+"&price="+price;
}
