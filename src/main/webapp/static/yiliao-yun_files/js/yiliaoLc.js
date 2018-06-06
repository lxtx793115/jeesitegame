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

	showPrescriptionList(1,5);
	
	
	$("#PrePtype").change(function(){
		showPrescriptionList(1,5);
	});
	
	$("#chufangName").keyup(function(){
	showPrescriptionList(1,5);
	});
	
	
	
	
	//添加药品中--中药查询
	$("#zyQuery").keyup(function(){
		$.getJSON("/cGoodsLcController/findCGoodsByNameForAdds.do",{"name":$(this).val(),"type":"1"},function(data){
				$("#zhongyaoList").html('');
				var z="";
				$.each(data,function(i,v){
					z+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
					z+="<td><input type='checkbox' onclick='dian()' name='goodsBox'/><input type='hidden' value='"+v.id+"'></td>";
					z+="<td class='ng-binding'>"+v.name+"</td>";
					z+="<td class='ng-binding'>"+v.specification+"</td>";
					z+="<td class='ng-binding'>"+v.quantity+"</td>";
					z+="<td class='ng-binding'>"+v.money+"</td></tr>";
				});
				$(z).appendTo("#zhongyaoList");
		});
	});
	
	//添加药品中--中成药查询
	$("#zcyQuery").keyup(function(){
		$.getJSON("/cGoodsLcController/findCGoodsByNameForAdds.do",{"name":$(this).val(),"type":"5"},function(data){
				$("#zhongchengyaoList").html('');
				var z="";
				$.each(data,function(i,v){
					z+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
					z+="<td><input type='checkbox' onclick='dian()' name='goodsBox'/><input type='hidden' value='"+v.id+"'></td>";
					z+="<td class='ng-binding'>"+v.name+"</td>";
					z+="<td class='ng-binding'>"+v.specification+"</td>";
					z+="<td class='ng-binding'>"+v.quantity+"</td>";
					z+="<td class='ng-binding'>"+v.money+"</td></tr>";
				});
				$(z).appendTo("#zhongchengyaoList");
		});
	});
	
	
	//添加药品中--西药查询
	$("#xyQuery").keyup(function(){
		$.getJSON("/cGoodsLcController/findCGoodsByNameForAdds.do",{"name":$(this).val(),"type":"2"},function(data){
		$("#xiyaoList").html('');
				var x="";
				$.each(data,function(i,v){
					x+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
					x+="<td><input type='checkbox' onclick='dian()' name='goodsBox'/><input type='hidden' value='"+v.id+"'/></td>";
					x+="<td style='text-align:left;' class='ng-binding'>"+v.name+"</td>";
					x+="<td class='ng-binding'>"+v.specification+"</td>";
					x+="<td class='ng-binding'>"+v.quantity+"</td>";
					x+="<td class='ng-binding'>"+v.money+"</td></tr>";
				});
				$(x).appendTo("#xiyaoList");
			
		});
	});
	
	
	//添加药品中--检查查询
	$("#jcQuery").keyup(function(){
		$.getJSON("/cGoodsLcController/findCGoodsByNameForAdds.do",{"name":$(this).val(),"type":"3"},function(data){
			$("#jianchaList").html('');
				var j="";
				$.each(data,function(i,v){
					j+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
					j+="<td><input type='checkbox' onclick='dian()' name='goodsBox'/><input type='hidden' value='"+v.id+"'></td>";
					j+="<td style='text-align:left' class='ng-binding'>"+v.name+"</td>";
					j+="<td class='ng-binding'>"+v.money+"</td>";
					j+="<td class='ng-binding'>"+v.remarks+"</td></tr>";
				});
				$(j).appendTo("#jianchaList");
			
		});
	});
	
//	$.getJSON("/cGoodsLcController/findJianCha.do",{"name":$("#jcQuery").val(),"type":"3"},function(data){
//				$("#jianchaList").html('');
//				var j="";
//				$.each(data,function(i,v){
//					j+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
//					j+="<td><input type='checkbox' name='goodsBox'/><input type='hidden' value='"+v.id+"'></td>";
//					j+="<td style='text-align:left' class='ng-binding'>"+v.name+"</td>";
//					j+="<td class='ng-binding'>"+v.money+"</td>";
//					j+="<td class='ng-binding'>"+v.remarks+"</td></tr>";
//				});
//				$(j).appendTo("#jianchaList");
//	});
	
	
	
	$("#huanzhename").keyup(function(){
			show(1,5);
	});
	
	$("#huanzheSex").change(function(){
			show(1,5);
	});
	
	
	show(1,5);
	loadzhenduanxinxiList();
	loadCheckMain();
	loadXiYaoList();
	
	//保存门诊信息 不收费
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
		//诊断信息
		var zhenduan=$("#zhenduan").val();
		var yizhu=$("#yizhu").val();
		var zhusu=$("#zhusu").val();
		var xjj=0;
		var xjjj=$("#xj").val()-0;
		var zll=$("#zhaoling").text()-0;
		var wxx=$("#wx").val()-0;
		var zfbb=$("#zfb").val()-0;
		var yhh=$("#yh").val()-0;
		var ybb=$("#yb").val()-0;
		if(zll=="0"||zll==0){
			xjj=$("#xj").val();
		}else{
			xjj=xjjj-zll;
		}
		//左侧处方数据
		var chufang="";  //订单详情
		var chuSize=$("#jiliang").val()-0; //总剂量
		$.each($("#chufangList tr"),function(i,v){
			chufang+=$(v).find("td").eq(1).find("input").val()+" "+($(v).find("td").eq(2).find("input").val()-0)*chuSize+",";
		});
		var fu=""; //附加费用
		$.each($("#chufanglc").nextAll(),function(i,v){	
			fu+=$(v).text()+",";
		});	
		
		var zong=$("#zongji").text(); //总金额	
		var beizhu= $("#beizhu").val();//中药备注
		if(zhenduan!=""&&zhenduan!=null&&yizhu!=""&&yizhu!=null){
			$.ajax({
      		type: "post",
       		url: "/CPatientLcController/addMenZhen.do",
			data: {
			"id":id,
			"name":name,
			"sex":sex,
			"weight":weight,
			"year":year,
			"date":date,
			"phone":phone,
			"address":address,
			"sfzCode":sfzCodes,
			"allergyHistory":allergyHistory,
			"zhenduan":zhenduan,
			"yizhu":yizhu,
			"zhusu":zhusu,
			"chufang":chufang,
			"fu":fu,
			"zong":zong,
			"beizhu":beizhu,
			"type":1,
			"xj":xjj,
			"wx":$("#wx").val(),
			"zfb":$("#zfb").val(),
			"yh":$("#yh").val(),
			"yb":$("#yb").val()   //来判断是已付款 还是付款
			},success : function(data){
              	window.location.href="/../medicalRecordController/tiaoNew.do";
       		},error: function(){
				alert("添加失败");
       		}
		});
		}else{
			alert("诊断信息不能为空!");
		}
	});
	
	$(".mk-orange-btn").click(function(){				//收费弹框
		$(".zk-xkjz").removeClass("ng-hide");
		$(".zk-xkjz").css("display","flex");
		$(".md-opaque").css("display","block");
		$("#yingSum").text($("#zongji").text());
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
	
	
	
	
	$(".mk-bounced-cancel").click(function(){				//收费弹框shuyekatie_li1
		$(".zk-xkjz").addClass("ng-hide");
		$(".md-opaque").css("display","none");
	});
	
	//直接收费
	$("#okShouFei").click(function(){
		//基本信息
		var id=$("#id").text();
		var name=$("#input-1").val(); 
		var sex=$("#sex").val();
		var weight=$("#weight").val();
		var year=$("#year").val();
		var date=$("#inputDate").val();		
		var phone=$("#phone").val();
		var address=$("#address").val();
		var allergyHistory=$("#allergy_history").val();
		//诊断信息
		var zhenduan=$("#zhenduan").val();
		var yizhu=$("#yizhu").val();
		var xjj=0;
		var xjjj=$("#xj").val()-0;
		var zll=$("#zhaoling").text()-0;
		var wxx=$("#wx").val()-0;
		var zfbb=$("#zfb").val()-0;
		var yhh=$("#yh").val()-0;
		var ybb=$("#yb").val()-0;
		if(zll=="0"||zll==0){
			xjj=$("#xj").val();
		}else{
			xjj=xjjj-zll;
		}
		
		//左侧处方数据
		var chufang="";  //订单详情
		var chuSize=$("#jiliang").val()-0; //总剂量
		$.each($("#chufangList tr"),function(i,v){
			chufang+=$(v).find("td").eq(1).find("input").val()+" "+($(v).find("td").eq(2).find("input").val()-0)*chuSize+",";
		});
		var fu=""; //附加费用
		$.each($("#chufanglc").nextAll(),function(i,v){	
			fu+=$(v).text()+",";
		});		
		var zong=$("#zongji").text(); //总金额
		var beizhu= $("#beizhu").val();//中药备注
		if(zhenduan!=""&&zhenduan!=null&&yizhu!=""&&yizhu!=null){
			$.ajax({
      		type: "post",
       		url: "/CPatientLcController/addMenZhen.do",
			data: {
			"id":id,
			"name":name,
			"sex":sex,
			"weight":weight,
			"year":year,
			"date":date,
			"phone":phone,
			"address":address,
			"allergyHistory":allergyHistory,
			"zhenduan":zhenduan,
			"yizhu":yizhu,
			"chufang":chufang,
			"fu":fu,
			"zong":zong,
			"beizhu":beizhu,
			"type":2,   //来判断是已付款 还是付款
			"xj":xjj,
			"wx":$("#wx").val(),
			"zfb":$("#zfb").val(),
			"yh":$("#yh").val(),
			"yb":$("#yb").val()   //来判断是已付款 还是付款
			},success : function(data){
              	window.location.href="/../medicalRecordController/tiaoNew.do";
       		},error: function(){
				alert("添加失败");
       		}
		});
			
		}else{
			alert("诊断信息不能为空!");
		}
		
	});
	
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
	
	//总剂量的变更
	$("#jiliang").keyup(function(){
		var zongjl=$(this).val()-0; //总剂量
	$.each($("#chufangList tr"),function(i,v){
		var gid=$(v).find("td").eq(1).find("input").val(); //商品id
		var gCount=$(v).find("td").eq(2).find("input").val()-0; //商品数量
		var zCount=zongjl*gCount;
	$.getJSON("/cGoodsStoreLcController/judgeGoodsStore.do",{"gid":gid,"sumSize":zCount},function(date){
		if(date==0){
			$(v).find("td").eq(2).find("span").find("span").css("display","none");
		}else{
			$(v).find("td").eq(2).find("span").find("span").css("display","block");
		}
	});
	});
		
		
		jisuanAll();
	});
	
	
	//保存处方附加费用
	$("#saveCheck").click(function(){
		var h="";
		$("#chufanglc").nextAll().remove();
		$.each($("[name=checkMainBox]:checked"),function(i,v){
			h+="<section class='additional-item ng-scope layout-row' style='width: inherit;' layout='row' ng-if='!additional.isDeleted' ng-repeat='additional in item.additionals| filter:deleteFilter'>";
			h+="<span style='white-space: nowrap;overflow: hidden;text-overflow: ellipsis;' title='"+$(v).parent().next().text()+"' class='ng-binding'>"+$(v).parent().next().text();+"</span>";
			h+=$(v).parent().next().next().text()+"元";
			h+="<button class='additional-delete' onclick='delChu(this)'></button></section>";
		});
		
		$("#chufanglc").after(h);  
	
			jisuanAll();
			
		$(".fy-box").css("display","none");
		$(".md-opaque").css("display","none");
	});
	
	//电子病例 功能:跳转新建病例
	$("#bingli").click(function(){
		
		
	});
	
});


//删除已经显示的附加费用
function delChu(a){
	$(a).parent().parent().remove();
	jisuanAll();
}

//加载添加药品(西药)
function loadXiYaoList(){	
	$.getJSON("/cGoodsLcController/findCGoods.do",function(data){
		$("#xiyaoList").html('');
		$("#zhongyaoList").html('');
		//$("#jianchaList").html('');
		$("#zhongchengyaoList").html('');
		var x="";
		var z="";
		var j="";
		var c="";
		$.each(data,function(i,v){
			if(v.type=="2"){
				x+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
				x+="<td><input type='checkbox' onclick='dian()' name='goodsBox'/><input type='hidden' value='"+v.id+"'/></td>";
				x+="<td style='text-align:left;' class='ng-binding'>"+v.name+"</td>";
				x+="<td class='ng-binding'>"+v.specification+"</td>";
				x+="<td class='ng-binding'>"+v.quantity+"</td>";
				x+="<td class='ng-binding'>"+v.money+"</td></tr>";
			}else if(v.type=="1"){
				z+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
				z+="<td><input type='checkbox'onclick='dian()'  name='goodsBox'/><input type='hidden' value='"+v.id+"'></td>";
				z+="<td class='ng-binding'>"+v.name+"</td>";
				z+="<td class='ng-binding'>"+v.specification+"</td>";
				z+="<td class='ng-binding'>"+v.quantity+"</td>";
				z+="<td class='ng-binding'>"+v.money+"</td></tr>";
			}else if(v.type=="3"){
				j+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
				j+="<td><input type='checkbox'onclick='dian()' name='goodsBox'/><input type='hidden' value='"+v.id+"'></td>";
				j+="<td style='text-align:left' class='ng-binding'>"+v.name+"</td>";
				j+="<td class='ng-binding'>"+v.money+"</td>";
				j+="<td class='ng-binding'>"+v.remarks+"</td></tr>";
			}else if(v.type=="5"){
				c+="<tr class='ng-scope' role='button' tabindex='0' onclick=radioOk(this)>";
				c+="<td><input type='checkbox' onclick='dian()' name='goodsBox'/><input type='hidden' value='"+v.id+"'></td>";
				c+="<td style='text-align:left' class='ng-binding'>"+v.name+"</td>";
				c+="<td class='ng-binding'>"+v.money+"</td>";
				c+="<td class='ng-binding'>"+v.remarks+"</td></tr>";
			}
		});
		$(x).appendTo("#xiyaoList");
		$(z).appendTo("#zhongyaoList");
		$(j).appendTo("#jianchaList");
		$(c).appendTo("#zhongchengyaoList");

	});
}

//保存药品
function okGoods(){
	var h="";
	if($("[name=goodsBox]:checked").size()==0){
		alert("请选择添加的商品");	
		return;
	}
	$.each($("[name=goodsBox]:checked"),function(i,v){
		var goodsId=$(v).next("input").val(); //选中的每一个药品id
		h+=goodsId+",";
	});
	
	$.getJSON("/cGoodsLcController/findCGoodsById.do",{"allId":h},function(data){
		var c="";
		var rows=$("#chufangList").find("tr").length-0; 
		$.each(data,function(i,v){
			c+="<tr class='ng-scope grey'><td class='ng-binding'>"+(rows+i+1)+"</td>";
			c+="<td class='ng-binding'>"+v.name+"<input value='"+v.id+"' type='hidden'></td>";
			c+="<td><span><input type='number' style='width:50px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onkeyup='sizeChange(this)' value='1'><span style='display:none;color:red;'>库存不足</span></span></td>";
			c+="<td>"+v.money+"</td>";
			c+="<td class='ng-binding'>"+v.money+"</td>";
			c+="<td>"+v.usages+"</td>";
			c+="<td style='position: relative;' class='editTd'><i class='drug-list-delete' onclick='delChu(this)'</i>";
			c+="<div style='' class='new_itemhao'></div></td></tr>";
		});
		$(c).appendTo("#chufangList");
		$("[name=goodsBox]").removeAttr("checked");
		jisuanAll();
			$(".md-sidenav-right").addClass("md-closed");
			$(".md-opaque").css("display","none");
	});
}


//计算总价的方法
function jisuanAll(){
		var sum=0;
	$.each($("#chufangList tr"),function(i,v){
		sum+=($(v).find("td").eq(4).text()-0); //药品的总价
	});
	var chuSize=$("#jiliang").val()-0;
		var fu=0;
	$.each($("#chufanglc").nextAll(),function(i,v){
		var value = ($(v).text().replace(/[^0-9]/ig,""))-0; 
		fu+=value;
	});
	
	$("#zongji").text(chuSize*sum+fu);
}



//加载所有处方模板
function showPrescriptionList(index,size){
	$.getJSON("/cPrescriptionLcController/indexAllPrescriptionList.do",{"index":index,"size":size,"prePtype":$("#PrePtype").val(),"chufangName":$("#chufangName").val()},function(data){
		$("#PrescriptionList").html('');
		var count=data.count;
		var pageCount=Math.floor(count%size==0?count/size:count/size+1);
		initPages(pageCount,index);//加载页码
		var h="";
		$.each(data.list,function(i,v){
			h+="<tr class='usertd  ng-scope' style=''>";
			h+="<th class='ng-binding' tabindex='0'>"+(i+1)+"</th>";
			h+="<td class='ng-binding' tabindex='0'><span class='status-0'>Prescription</span>"+v.id+"</td>";
			if(v.ptype=="1"){
			h+="<td class='ng-binding' tabindex='0'>中药饮片处方</td>";
			}else if(v.ptype=="2"){
			h+="<td class='ng-binding' tabindex='0'>西药处方</td>";
			}else if(v.ptype=="3"){
			h+="<td class='ng-binding' tabindex='0'>检查处方</td>";
			}else if(v.ptype=="5"){
			h+="<td class='ng-binding' tabindex='0'>中成药处方</td>";
			}
			h+="<td class='myElise cfdyslh ng-binding' title='1111' tabindex='0'>"+v.pname+"</td>";
			h+="<td class='ng-binding' tabindex='0'>"+getMyDate(v.create_date)+"</td>";
			h+="<td><a style='color: #e9a00d ;' onclick='addPreDetailForGoods("+v.id+")'>调用</a>&nbsp;&nbsp;";
			h+="<a style='color: #e9a00d ;' class='mb-xx' onclick='showPreDetail("+v.id+")'>详细</a>";
			h+="</td></tr>";
		});
		$(h).appendTo("#PrescriptionList");
		pageClicks(index);
	});
}
function  initPages(count,page){
	$(".tcdPageCodes").createPage({
    pageCount:count,
    current:page,
    backFn:function(){
    }
});
}
//页码绑定时间
function pageClicks(a){
	$("#pages .tcdNumber").click(function(){
	  	page =$(this).text();
	  	showPrescriptionList(page,5);
	  });
	  	  //下一页
	$("#pages .nextPage").click(function(){
		showPrescriptionList((a-0+1),5);
	});  
	$("#pages .prevPage").click(function(){
		showPrescriptionList((a-0-1),5);
	}); 
		
}




//调用处方 ? 
function addPreDetailForGoods(id){
		$.getJSON("/cPrescriptionLcController/addGoodsForDetail.do",{"id":id},function(data){
			var c="";
			var rows=$("#chufangList").find("tr").length-0; 
			$.each(data,function(i,v){
				c+="<tr class='ng-scope grey'><td class='ng-binding'>"+(rows+i+1)+"</td>";
				c+="<td class='ng-binding'>"+v.name+"<input value='"+v.id+"' type='hidden'></td>";
				c+="<td><span><input type='number' style='width:50px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onkeyup='sizeChange(this)' value='"+v.c_prescription_quantity+"'><span style='display:none;color:red;'>库存不足</span></span></td>";
				c+="<td>"+v.sale_price+"</td>";
				c+="<td class='ng-binding'>"+(v.sale_price*v.c_prescription_quantity)+"</td>";
				c+="<td>"+v.usages+"</td>";
				c+="<td style='position: relative;' class='editTd'><i class='drug-list-delete' onclick='delChu(this)'</i>";
				c+="<div style='' class='new_itemhao'></div></td></tr>";
			});
			$(c).appendTo("#chufangList");
			jisuanAll();
			$(".cf-box").addClass("ng-hide");
			$(".md-opaque").css("display","none");
		});
}


//显示模板详细
function showPreDetail(id){
	$.getJSON("/cPrescriptionLcController/findPreDetail.do",{"id":id},function(data){
		$("#preDateilList").html('');
		var h="";
		$.each(data,function(i,v){
			h+="<tr><td>"+(i+1)+"</td>";
			h+="<td>"+v.name+"</td>";
			h+="<td>"+v.specification+"</td>";
			h+="<td>"+v.c_prescription_quantity+"</td>";
			h+="</tr>";
		});
		$(h).appendTo("#preDateilList");
	});
	
	$(".history_xiangxi_jian").css("display","block");
	
}

//数量发生变化
function sizeChange(a){
	//单价
	var dan=$(a).parent().parent().next().text()-0;
	var size=$(a).val()-0;//当前数量
	
	var gid=$(a).parent().parent().prev().find("[type=hidden]").val();
	//需要判断库存
	var sumSize=size*($("#jiliang").val()-0); //该商品数量*总剂量
	$.getJSON("/cGoodsStoreLcController/judgeGoodsStore.do",{"gid":gid,"sumSize":sumSize},function(date){
		if(date==0){
			$(a).next().css("display","none");
		}else{
			$(a).next().css("display","block");
		}
	});
	//先改变tr的的小计
	$(a).parent().parent().next().next().text(dan*($(a).val()-0));
	
	//重新计算总计
	jisuanAll();
}




//已存在的患者信息弹窗
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

function loadCheckMain(){	
	$.getJSON("/ccheckMainLcController/cCheckMainList.do",function(data){
		var h="";
		$("#checkMainList").html('');
		$.each(data,function(i,v){
				h+="<tr class='additional-list-row ng-scope grey' style=''  onclick=radioOk(this)>";
				h+="<td role='button' tabindex='0'><input name='checkMainBox' onclick='dian()' type='checkbox'></td>";
				h+="<td class='ng-binding' role='button' tabindex='0'>"+v.checkname+"</td>";
				h+="<td style='text-align: center'>";
				h+=v.checkprice+"</td></tr>";
		});
		$(h).appendTo("#checkMainList");
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

//添加所有快速弹窗的信息
function loadzhenduanxinxiList(){
	$.getJSON("/cQuickMainController/showCQuickMainAll.do",function(data){
		var h="";
		var c="";
		var k="";
		$("#zhongyaobeizhuSelect").html('');
		$("#yizhuxinxiList").html('');
		$("#zhenduanxinxiList").html('');
		$.each(data,function(i,v){
			if(v.type=="3"){
				h+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
				h+="<div class='md-button md-no-style'>";
				h+="<div class='md-list-item-inner'><input type='checkbox' onclick='dian()' name='yizhuxinxiBox' value='"+v.note+"' ><span class='ng-binding'>"+v.note+"</span>";
				h+="</div><div class='md-secondary-container'></div>";
				h+="</div></md-list-item>";
			}else if(v.type=="1"){
				c+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
				c+="<div class='md-button md-no-style'>";
				c+="<div class='md-list-item-inner'><input type='checkbox' onclick='dian()' name='zhongyaobeizhuBox' value='"+v.note+"' ><span class='ng-binding'>"+v.note+"</span>";
				c+="</div><div class='md-secondary-container'></div>";
				c+="</div></md-list-item>";	
			}else if(v.type=="2"){
				k+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1'  onclick=radioOk(this)>";
				k+="<div class='md-button md-no-style'>";
				k+="<div class='md-list-item-inner'><input type='checkbox' onclick='dian()' name='zhenduanxinxiBox' value='"+v.note+"' ><span class='ng-binding'>"+v.note+"</span>";
				k+="</div><div class='md-secondary-container'></div>";
				k+="</div></md-list-item>";
			}
		});
				
//				h+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1'  onclick=radioOk(this)>";
//				h+="<div class='md-button md-no-style'>";
//				h+="<div class='md-list-item-inner'><input type='checkbox' name='zhenduanxinxiBox' value='感冒' ><span class='ng-binding'>感冒</span>";
//				h+="</div><div class='md-secondary-container'></div>";
//				h+="</div></md-list-item>";
//				h+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1'  onclick=radioOk(this)>";
//				h+="<div class='md-button md-no-style'>";
//				h+="<div class='md-list-item-inner'><input type='checkbox' name='zhenduanxinxiBox' value='低烧' ><span class='ng-binding'>低烧</span>";
//				h+="</div><div class='md-secondary-container'></div>";
//				h+="</div></md-list-item>";
//				h+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1'  onclick=radioOk(this)>";
//				h+="<div class='md-button md-no-style'>";
//				h+="<div class='md-list-item-inner'><input type='checkbox' name='zhenduanxinxiBox'  value='高烧'><span class='ng-binding'>高烧</span>";
//				h+="</div><div class='md-secondary-container'></div>";
//				h+="</div></md-list-item>";
//				
//				
//				
//				c+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
//				c+="<div class='md-button md-no-style'>";
//				c+="<div class='md-list-item-inner'><input type='checkbox' name='zhongyaobeizhuBox' value='小火半小时'><span class='ng-binding'>小火半小时</span>";
//				c+="</div><div class='md-secondary-container'></div>";
//				c+="</div></md-list-item>";
//				c+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
//				c+="<div class='md-button md-no-style'>";
//				c+="<div class='md-list-item-inner'><input type='checkbox' name='zhongyaobeizhuBox' value='中火半小时'><span class='ng-binding'>中火半小时</span>";
//				c+="</div><div class='md-secondary-container'></div>";
//				c+="</div></md-list-item>";
//				c+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
//				c+="<div class='md-button md-no-style'>";
//				c+="<div class='md-list-item-inner'><input type='checkbox' name='zhongyaobeizhuBox' value='大火半小时'><span class='ng-binding'>大火半小时</span>";
//				c+="</div><div class='md-secondary-container'></div>";
//				c+="</div></md-list-item>";
//		
//				k+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
//				k+="<div class='md-button md-no-style'>";
//				k+="<div class='md-list-item-inner'><input type='checkbox' name='yizhuxinxiBox' value='禁烟'><span class='ng-binding'>禁烟</span>";
//				k+="</div><div class='md-secondary-container'></div>";
//				k+="</div></md-list-item>";
//				k+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
//				k+="<div class='md-button md-no-style'>";
//				k+="<div class='md-list-item-inner'><input type='checkbox' name='yizhuxinxiBox' value='禁酒'><span class='ng-binding'>禁酒</span>";
//				k+="</div><div class='md-secondary-container'></div>";
//				k+="</div></md-list-item>";
//				k+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
//				k+="<div class='md-button md-no-style'>";
//				k+="<div class='md-list-item-inner'><input type='checkbox' name='yizhuxinxiBox' value='不要剧烈运动'><span class='ng-binding'>不要剧烈运动</span>";
//				k+="</div><div class='md-secondary-container'></div>";
//				k+="</div></md-list-item>";
//		
		$(h).appendTo("#yizhuxinxiList");
		$(k).appendTo("#zhenduanxinxiList");
		$(c).appendTo("#zhongyaobeizhuSelect");
	})
}
//关闭中药备注弹窗
function savezhongyaobeizhu(){
	var h="";
	$.each($("[name=zhongyaobeizhuBox]:checked"),function(i,v){
		h+=$(v).val()+",";
	});
	var newBeizhu=$("#beizhu").val()+","+h;
	$("#beizhu").val(newBeizhu);
	
	$(".zyy-box").addClass("ng-hide");
	$(".md-opaque").css("display","none");
}

//关闭医嘱弹窗
function saveyizhu(){
	var h="";
	$.each($("[name=yizhuxinxiBox]:checked"),function(i,v){
		h+=$(v).val()+",";
	});
	var newBeizhu=$("#yizhu").val()+","+h;
	$("#yizhu").val(newBeizhu);
	
	$(".yz-box").css("display","none");
	$(".md-opaque").css("display","none");
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

//关闭诊断信息弹窗
function savezhenduan(){
	var h="";
	$.each($("[name=zhenduanxinxiBox]:checked"),function(i,v){
		h+=$(v).val()+",";
	});
	var newBeizhu=$("#zhenduan").val()+","+h;
	$("#zhenduan").val(newBeizhu);

	$(".zd-box").css("display","none");
	$(".md-opaque").css("display","none");
}


//li和复选框的联动
function radioOk(a){
	if($(a).find("[type=checkbox]").attr("checked")=="checked"){
		$(a).find("[type=checkbox]").removeAttr("checked");
	}else{
		$(a).find("[type=checkbox]").attr("checked","checked");
	}
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

function dian(){
	event.cancleBubble = true;
	event.stopPropagation();
}
