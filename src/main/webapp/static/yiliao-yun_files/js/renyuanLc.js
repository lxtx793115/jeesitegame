$(function(){
	show(1,10);
	//第二个div的保存病例按钮	
	$("#saveMedical").click(function(){
		var zhusu=$("#zhusu").val();//主诉
		var xianbingshi=$("#xianbingshi").val(); //现病史
		var wwwq=$("#wwwq").val();//望闻问切
		var menzhenyizhu=$("#menzhenyizhu").val();//医嘱
		var fuzhujiancha=$("#fuzhujiancha").val(); //辅助检查
		var bzfx=$("#bzfx").val();//辩证分析
		var menzhentijian=$("#menzhentijian").val();
		var menzhenzhenduan=$("#menzhenzhenduan").val();
		var pid=$("#pid").val();
		var guomingshi=$("#guomingshi").val();//过敏史
		var zhongyizhiliao=$("#zhongyizhiliao").val();
		//发送添加病例请求
		window.location.href="/medicalRecordController/addMedicalRecord.do?pid="+pid+"&zhusu="+zhusu+
		"&xianbingshi="+xianbingshi+"&wwwq="+wwwq+"&menzhenyizhu="+menzhenyizhu+"&fuzhujiancha="+fuzhujiancha+
		"&bzfx="+bzfx+"&menzhentijian="+menzhentijian+"&menzhenzhenduan="+menzhenzhenduan+"&guomingshi="+guomingshi+"&zhongyizhiliao="+zhongyizhiliao;
	
	
	});
	
	

			$(".close-btn").click(function(){
				$(".kbjlchufangzhong").css("display","none");
				$(".md-opaque").css("display","none");
			})
			$(".jzxx-btn").click(function(){
				$(this).addClass("hover").siblings().removeClass("hover");
				$(".jiuzhenxinxiDiv").css("display","block");
				$(".cf-bh").css("display","none");
				$(".jcxm-cf").addClass("ng-hide");
			})
			$(".xmcf-btn").click(function(){
				$(this).addClass("hover").siblings().removeClass("hover");
				$(".jiuzhenxinxiDiv").css("display","none");
				$(".cf-bh").css("display","block");
				$(".jcxm-cf").removeClass("ng-hide");
			});
	
	
});


function show(index,size){
	$.getJSON("/medicalRecordController/showMedicalRecordByPatientId.do",{"index":index,"size":size,"pid":$("#pid").val()},function(data){
		$("#lishiList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){			
			h+="<div class='kbjlbody_list ng-scope' onclick='showBing("+v.id+")'><div class='kbjlbody_list_main1 fl'>";
			h+="<div class='kbjlbody_list_main1_shijian ng-binding'>"+getMyDate(v.create_date)+"</div>";
			h+="<div class='kbjlbody_list_main1_jiantou'></div>";
//			h+="<div class='kbjlbody_list_main1 fl'>";
//			h+="<div class='kbjlbody_list_main2_num ' style='margin-top:16px'>1</div>";
//			h+="<div class='kbjlbody_list_main2_font'>门诊</div></div><div class='kbjlbody_list_main1 fl'>";
//			h+="<div class='kbjlbody_list_main2_num '></div>";
			h+="</div></div>";
//			h+="<div class='kbjlbody_list_main1 fl'><div class='kbjlbody_list_main2_num '></div>";
//			h+="<div class='kbjlbody_list_main2_font'>查看</div></div><div class='clear'></div></div>";
		});	
		$(h).appendTo("#lishiList");
		pageClick(index);

	});	
}

function showBing(pid){
	$.getJSON("/medicalRecordController/showMedicalRecordById.do",{"id":pid},function(data){
		$("#zdmz").text(data.clinicName);
		$("#zddoctorName").text(data.doctorName);
		$("#zdzdjieguo").text(data.menzhenzhenduan);
		$("#zdzdyizhu").text(data.doctors_advice);
		$("#medical_history").text(data.medical_history);
	});
		$(".kbjlchufangzhong").css("display","block");
		$(".md-opaque").css("display","block");
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
