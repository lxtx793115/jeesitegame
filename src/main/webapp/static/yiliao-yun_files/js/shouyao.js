	var lujing=$("#lujing").val();
$(function(){
	
	
		show();
	$(".btn-adddrug").click(function() { //选择药品弹框
			$(".buydrug_xuanzheyaoping").css("display", "block");
			$(".md-opaque").css("display", "block");
	});
		
	
	$("#yaopinName").keyup(function(){
		show();
	});
	
	$("#yaopinType").change(function(){
		show();
	});
	
	//显示弹窗并且加载金额
	$("#shoufei").click(function(){
		var sum=0;
		$.each($("[money=lc]"),function(i,v){
			sum+=($(v).text()-0);
		});
		
		$("#yingSum").text(($("#jiCount").val()-0)*sum);
	});
	
	
		//计算找零
	$(".zk-chargeContent-two-payway input").keyup(function(){
		var ying=$("#yingSum").text()-0; //应收金额
			var sum=0;
		$.each($(".zk-chargeContent-two-payway input"),function(i,v){
			sum+=($(v).val()-0);
		});
		$("#zhaoling").text(sum-0-ying);
	});
	
	
	
	$("#okShouFei").click(function(){
			var zhi="";
			$.each($("[caozuo=insert]"),function(i,v){
				var main=$(v).find("[type=hidden]").val()+" "+($(v).find("[type=number]").val()-0)*($("#jiCount").val()-0);
					zhi+=main+",";
				});
			
		var xjj=0;
		var xjjj=$("#xj").val()-0;
		var zll=$("#zhaoling").text()-0;	
		if(zll==0||zll=="0"){
			xjj=$("#xj").val();
		}else{
			xjj=xjjj-zll;
		}
			$.getJSON("/shouYaoWindowController/buyYaoPing.do",{"allMain":zhi,"zong":$("#yingSum").text(),"xj":xjj,"wx":$("#wx").val(),"zfb":$("#zfb").val(),"yh":$("#yh").val(),"yb":$("#yb").val()},function(data){
				
				});
				alert("购买成功");
				window.location.href="/../medicalRecordController/tiaoZhuan.do?url=yiliao/shouyao_window";
	}); 
});



function goBooks(){
		var h="";
	if($("[name=yaopingbox]:checked").size()==0){
		alert("请选择添加的商品");	
		return;
	}
	$.each($("[name=yaopingbox]:checked"),function(i,v){
		var goodsId=$(v).val(); //选中的每一个药品id
		h+=goodsId+",";
	});	
	$.getJSON("/cGoodsLcController/findCGoodsById.do",{"allId":h},function(data){
		var c="";
		var rows=$("#buydrug_tbody").find("tr").length-0; 
		$.each(data,function(i,v){
			c+="<tr class='buydrug-tr buydrug_tbody1 ng-scope' style='color: rgb(142, 142, 142); border: 1px solid rgb(225, 225, 225);'>";
			c+="<td class='ng-binding'>"+(rows+i+1)+"</td><td class='ng-binding'>"+v.name+"</td>";
			c+="<td class='ng-binding'>"+v.type+"</td><td caozuo='insert'><input type='hidden' value='"+v.id+"'>";
			c+="<input onkeyup='changeXiaoJi(this)' value='1' type='number' class='drug_count buydrug_warm ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty ng-valid-maxlength'><span style='display:none;color:red;'>库存不足</span></td><td>";
			c+="<div class='mk-select-div' style='width:50px;'>";
			c+="<select class='buydrug_unit ng-pristine ng-untouched ng-valid ng-not-empty'>";
			c+="<option value='0' mkcp='696' cp-hsbl='1' class='ng-binding ng-scope' style=''>g</option>";
			c+="<option value='1' mkcp='696' cp-hsbl='1' class='ng-binding ng-scope' style=''>盒</option>";
			c+="</select></div></td><td class='buydrug_tr'>"+v.money+"</td>";
			c+="<td style='font-size: 14px;' class='ng-binding'  money='lc'>"+v.money+"</td>";
			c+="<td><img src='"+lujing+"/yiliao-yun_files/images/icon-trash-black.png' onclick='delGoods(this)'></td></tr>";
		});
		$(c).appendTo("#buydrug_tbody");
		$("[name=yaopingbox]").removeAttr("checked");
		$(".buydrug_xuanzheyaoping").css("display", "none");
		$(".md-opaque").css("display", "none");
});
}

//删除list中的一行
function delGoods(a){
	$(a).parent().parent().remove();
}

//数量改变时 单行小计
function changeXiaoJi(a){
	var size=$(a).val()-0; //数量
	var gid=$(a).prev().val();
	//需要判断库存
	var sumSize=size*($("#jiCount").val()-0); //该商品数量*总剂量
	$.getJSON("/cGoodsStoreLcController/judgeGoodsStore.do",{"gid":gid,"sumSize":sumSize},function(date){
		if(date==0){
			$(a).next().css("display","none");
		}else{
			$(a).next().css("display","block");
		}
	});
	
	var dan=$(a).parent().next().next().text()-0; //单价
	var dan=$(a).parent().next().next().next().text(size*dan);//总价
}

//总剂量改变后
function changeZongJiLiang(a){
	var zongjl=$(a).val()-0;
	$.each($("[caozuo=insert]"),function(i,v){
		var gid=$(v).find("[type=hidden]").val(); //商品id
		var gCount=$(v).find("[type=number]").val()-0; //商品数量
		var zCount=zongjl*gCount;
	$.getJSON("/cGoodsStoreLcController/judgeGoodsStore.do",{"gid":gid,"sumSize":zCount},function(date){
		if(date==0){
			$(v).find("span").css("display","none");
		}else{
			$(v).find("span").css("display","block");
		}
	});
	});
}


function show(){
	$.getJSON("/cGoodsLcController/findGoodsByName.do",{"name":$("#yaopinName").val(),"types":$("#yaopinType").val()},function(data){
		$("#yaopinList").html('');
		var count=data.count;
		var h="";
	//	initPage(pageCount,index);//加载页码
		$.each(data.list,function(i,v){	
				h+="<div class='buydrug_dataListDiv ng-scope' style=''  onclick='radioOk(this)'>";
				h+="<ul class='select_drug_alert_ul' style='outline: none;' >";
				h+="<li ><input value="+v.id+" style='width:16px;height:16px; vertical-align:middle; margin:auto;padding:0;' type='checkbox' name='yaopingbox' onclick='dian()'></li>";
				h+="<li class='ng-binding'>"+v.name+"</li>";
				h+="<li class='ng-binding'>"+v.specification+"</li>";
				h+="<li class='ng-binding'>"+v.quantity+"</li>";
				h+="<li class='ng-binding'>"+v.money+"元</li>";
				if(v.type=="1"){
				h+="<li class='ng-binding'>中药饮片</li>";
				}else if(v.type=="2"){
					h+="<li class='ng-binding'>西药</li>";
				}else if(v.type=="5"){
					h+="<li class='ng-binding'>中成药</li>";
				}
				h+="<li class='ng-binding'>非处方药</li>";
				h+="</ul></div>";
		});	
		$(h).appendTo("#yaopinList");
			//pageClick(index);
	});	
}
//收费---金额格式
function okMoney(a){
	var s=$(a).val();
	if(s==""||s==null){
		$(a).val("0");
	}else{
		$(a).val(parseFloat($(a).val()));
	}
}
//function  initPage(count,page){
//	$(".tcdPageCode").createPage({
//    pageCount:count,
//    current:page,
//    backFn:function(){
//    }
//});
//}
////页码绑定时间
//function pageClick(a){
//	$("#page .tcdNumber").click(function(){
//	  	page =$(this).text();
//	  	show(page,10);
//	  });
//	//下一页
//	$("#page .nextPage").click(function(){
//		show((a-0+1),10);
//	});  
//	$("#page .prevPage").click(function(){
//		show((a-0-1),10);
//	}); 
//		
//}
function radioOk(a){
	
	if($(a).find("[type=checkbox]").attr("checked")=="checked"){
		$(a).find("[type=checkbox]").removeAttr("checked");
	}else{
		$(a).find("[type=checkbox]").attr("checked","checked");
	}
}
function closeWindow(){
	$(".buydrug_xuanzheyaoping").css("display", "none");
	$(".md-opaque").css("display", "none");
}
function dian(){
	event.cancleBubble = true;
	event.stopPropagation();
}
