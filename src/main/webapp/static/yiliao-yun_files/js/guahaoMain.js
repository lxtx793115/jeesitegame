	var cid="";
	var cname="";
	var csex="";
	var cyear="";
	var cweight="";
	var cphone="";
	var adress="";
	var his="";
	var sfzCode="";

$(function(){
		var now = new Date();

				//格式化日，如果小于9，前面补0
				var day = ("0" + now.getDate()).slice(-2);

				//格式化月，如果小于9，前面补0

				var month = ("0" + (now.getMonth() + 1)).slice(-2);

				//拼装完整日期格式
				var today = now.getFullYear()+"-"+(month)+"-"+(day) ;

				$("#inputDate").val(today);
	
	
	
	
		show(1,5);
		$("#selectGuaHaoName").change(function(){
			var vals=$(this).val(); //id,price
			var s=vals.split(",");
			$("#zongji").text(s[1]);
		});
		
			
	$("#huanzhename").keyup(function(){
			show(1,5);
	});
	
	$("#huanzheSex").change(function(){
			show(1,5);
	});
		
	
	$("#save").click(function(){
		//基本信息
		var id=$("#id").text();
		var name=$("#input-1").val(); 
		var sex=$("#sex").val();
		var weight=$("#weight").val();
		var year=$("#year").val();
		var date=$("#inputDate").val();		
		var phone=$("#phone").val();
		var address=$("#address").val();
		var sfzCodes=$("#sfzCode").val();
		var allergyHistory=$("#allergy_history").val();
		
		var vals=$("#selectGuaHaoName").val();
		var s=vals.split(",");
		var guahaoId=s[0]; //挂号id
		var guahaoMoney=$("#zongji").text();//挂号金额
		var guahaoKeShi=$("#guahaoKeShi").val();
		window.location.href="/cGuaHaoListController/addGuaHaoList.do?id="+id+"&name="+name+"&sex="+sex+"&weight="+weight+"" +
				"&year="+year+"&date="+date+"&phone="+phone+"&address="+address+"&sfzCode="+sfzCodes+"&allergyHistory="+allergyHistory+"&" +
						"guahaoId="+guahaoId+"&guahaoMoney="+guahaoMoney+"&guahaoKeShi="+guahaoKeShi;
			
			
		
	});
	//选择用户
	$("#quedingHuanZhe").click(function(){
		$("#id").text(cid);
		$("#input-1").val(cname);
		$("#sex").val(csex);
		$("#weight").val(cweight);
		$("#year").val(cyear);
		$("#phone").val(cphone);
		$("#address").val(adress);
		$("#allergy_history").val(his);
		$("#sfzCode").val(sfzCode);
		$(".md-opaque").css("display","none");
		$(".ry-box").css("display","none");
	});
});

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
	  	show(page,5);
	  });
	  	  //下一页
	$("#page .nextPage").click(function(){
		show((a-0+1),5);
	});  
	$("#page .prevPage").click(function(){
		show((a-0-1),5);
	}); 
		
}

	$("#reboot").click(function(){
		$("#id").text('0');
		$("#input-1").val('');
		$("#sex").val('');
		$("#weight").val('');
		$("#year").val('');
		$("#phone").val('');
		$("#address").val('');
		$("#allergy_history").val('');
		$("#zhenduan").val('');
		$("#yizhu").val('');
		$("#monthNum").val('');
		$("#sfzCode").val('');
	});

function show(index,size){

$.getJSON("/CPatientLcController/showCptientLc.do",{"index":index,"size":size,"name":$("#huanzhename").val(),"sex":$("#huanzheSex").val()},function(data){
		$("#huanzheList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
			h+="<tr onclick=goMain('"+v.id+"','"+v.name+"','"+v.sex+"','"+v.year+"','"+v.weight+"','"+v.phone+"','"+v.adress+"','"+v.allergy_history+"','"+v.id_number+"') class='ng-scope grey' tabindex='0' role='button' style=''>";
			h+="<td class='xz-lenght97 ng-binding' title='1110'>"+v.name+"<input type='hidden' value='"+v.id+"'></td>";
			h+="<td class='ng-binding'>"+v.sex+"</td> <td class='ng-binding'>"+v.year+"</td>";
			h+="<td class='ng-binding'>"+v.phone+"</td>";
			h+="</tr>";
		});	
		$(h).appendTo("#huanzheList");
		pageClick(index);

	});	
}

function goMain(id1,name1,sex1,year1,weight1,phone1,adress1,his1,sfzCode1){
	
	cid=id1;
	cname=name1;
	csex=sex1;
	cyear=year1;
	cweight=weight1;
	cphone=phone1;
	adress=adress1;
	his=his1;
	sfzCode=sfzCode1;
}