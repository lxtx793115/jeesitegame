var lujing=$("#lujing").val();
$(function(){

	$("#query").click(function(){
		show(1,10);	
	});
		show(1,10);

	$("#addPre").click(function(){
		window.location.href="/medicalRecordController/tiaoZhuan.do?url=yiliao/addPrescription";
	});
	
});


	//已存在的患者信息弹窗
function show(index,size){
	$.getJSON("/cPrescriptionLcController/allPrescription.do",{"index":index,"size":size,"pname":$("#pname").val(),"ptype":$("#ptype").val()},function(data){
		$("#prescriptionList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
			h+="<tr class='repeat-tr ng-scope' style='outline: none;'>";
			h+="<td class='ng-binding'>"+(i+1)+"</td>";
			h+="<td class='status-1'>"+v.pname+"</td>";
			if(v.ptype=="1"){
				h+="<td class='ng-binding'>中药饮片处方模板</td>";
			}else if(v.ptype=="2"){
				h+="<td class='ng-binding'>西药处方模板</td>";
			}else if(v.ptype=="3"){
				h+="<td class='ng-binding'>检查处方模板</td>";
			}else if(v.ptype=="5"){
				h+="<td class='ng-binding'>中成药模板</td>";
			}
			h+="<td class='ng-binding'>"+getMyDate(v.create_date)+"</td>";
			h+="<td class='ng-binding'><img src='"+lujing+"/yiliao-yun_files/images/4_03.png' onclick='lookMain("+v.id+")' /></td>";
			h+="<td class='ng-binding'><img src='"+lujing+"/yiliao-yun_files/images/icon-trash-black.png' onclick='delOrder("+v.id+")'/></td></tr>";
		});	
		$(h).appendTo("#prescriptionList");
		pageClick(index);
	});	
}



//查看详情
function lookMain(id){
	window.location.href="/cPrescriptionLcController/showPrescriptionDetail.do?id="+id;
}



function delOrder(id){
	window.location.href="/cPrescriptionLcController/delPrescription.do?id="+id;
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
