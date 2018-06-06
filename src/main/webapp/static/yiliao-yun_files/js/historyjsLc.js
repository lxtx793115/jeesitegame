	var cid="";
	var cname="";
	var csex="";
	var cyear="";
	var cweight="";
	var cphone="";
$(function(){
	
	$("#save").click(function(){
		//病人信息
		
		
		//病例信息
		var zhusu=$("#zhusu").val();
		var xianbingshi=$("#xianbingshi").val();
		var wwwq=$("#wwwq").val();
		var mzyz=$("#mzyz").val();
		var fuzhujiancha=$("#fuzhujiancha").val();
		var bianchengfenxi=$("#bianchengfenxi").val();
		var zhongyizhiliao=$("#zhongyizhiliao").val();
		var zhongyizhenduan=$("#zhongyizhenduan").val();
	
	});
	
	
		//选择用户
	$("#quedingHuanZhe").click(function(){
		$("#id").text(cid);
		$("#input-1").val(cname);
		$("#sex").val(csex);
		$("#weight").val(cweight);
		$("#year").val(cyear);
		$("#phone").val(cphone);
	
	});
	
	
});

function show(index,size){

$.getJSON("/CPatientLcController/showCptientLc.do",{"index":index,"size":size,"name":$("#huanzhename").val(),"sex":$("#huanzheSex").val()},function(data){
		$("#huanzheList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		var h="";
		initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
			h+="<tr onclick=goMain('"+v.id+"','"+v.name+"','"+v.sex+"','"+v.year+"','"+v.weight+"','"+v.phone+"') class='ng-scope grey' tabindex='0' role='button' style=''>";
			h+="<td class='xz-lenght97 ng-binding' title='1110'>"+v.name+"<input type='hidden' value='"+v.id+"'></td>";
			h+="<td class='ng-binding'>"+v.sex+"</td> <td class='ng-binding'>"+v.year+"</td>";
			h+="<td class='ng-binding'>"+v.phone+"</td>";
			h+="</tr>";
		});	
		$(h).appendTo("#huanzheList");
		pageClick(index);

	});	
}

function goMain(id1,name1,sex1,year1,weight1,phone1){
	cid=id1;
	cname=name1;
	csex=sex1;
	cyear=year1;
	cweight=weight1;
	cphone=phone1;
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