$(function() {
			showOne(1,10);
			
			$("#query").click(function(){
				showOne(1,10);
			});
		
});


function showOne(index,size){
	$.getJSON("/medicalRecordController/showAllMedicalRecordLc.do",{
		"index":index,
		"size":size,
		"hzName":$("#hzName").val(),
		"docName":$("#docName").val(),
		"startDate":$("#oneStart").val(),
		"endDate":$("#oneEnd").val()},function(data){
			$("#medicalList").html('');
			var count=data.count;
			var pageCount=Math.floor(count%size==0?count/size:count/size+1);
			var h="";
			initPage(pageCount,index);//加载页码
			$.each(data.list,function(i,v){	
				h+="<tr onclick='tiao("+v.c_patient_id+")'><td>"+(i+1)+"</td>";
				h+="<td>"+v.bl+"</td>";
				h+="<td>"+v.yz+"</td>";
				h+="<td>"+v.hz+"</td>";
				h+="<td>"+v.doc+"</td>";
				h+="<td>"+getMyDate(v.create_date)+"</td>";
			});	
			$(h).appendTo("#medicalList");
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
function tiao(id){
	window.location.href="/medicalRecordController/goId.do?id="+id;
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