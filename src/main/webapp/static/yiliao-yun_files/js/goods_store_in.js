	var cid="";
	var cname="";
	var csex="";
	var cyear="";
	var cweight="";
	var cphone="";
	
	var type="";
$(function(){
	$("#huanzhename").change(function(){
			show(1,10);
	});
	$("#huanzheSex").change(function(){
			show(1,10);
	});
	show(1,10);
	loadCheckMain();
	loadXiYaoList();
	//直接入库提交待审核订单
	$("#save").click(function(){
		order("0");
	});
	//直接入库
	$("#shoufei").click(function(){
		order("1");
	});
	function order(type){
		var goodlist="";  //订单详情
		$.each($("#chufangList tr"),function(i,v){
			var goodid=$(v).find("td").eq(1).find("input").val(); //goodid，药品id
			var quantity=$(v).find("td").eq(2).find("input").val(); //数量
			var trande_price=$(v).find("td").eq(3).find("input").val(); //批发价
			var sale_price=$(v).find("td").eq(4).find("input").val(); //售价
			var date1=$(v).find("td").eq(5).find("input").val(); //有效期
			var date2=$(v).find("td").eq(6).find("input").val(); //生产日期
			if(!goodid){
				alert("药品不能为空@");
				return;
			}
			if(!quantity){
				alert("数量不能为空！");
				return;
			}
			if(!sale_price){
				alert("售价不能为空！");
				return;
			}
			if(!date1){
				alert("有效期不能为空！");
				return;
			}
			if(!date2){
				alert("生产日期不能为空！");
				return;
			}
            //goodid，药品id   数量                  //价格
			goodlist+=$(v).find("td").eq(1).find("input").val()    //goodid，药品id
			+" "+$(v).find("td").eq(2).find("input").val()           //数量
			+" "+$(v).find("td").eq(3).find("input").val()    //批发价
			+" "+$(v).find("td").eq(4).find("input").val()    //售价
			+" "+$(v).find("td").eq(5).find("input").val()    //有效期
			+" "+$(v).find("td").eq(6).find("input").val()+",";    //生产日期
		});
		var fu=""; //附加费用
		/*$.each($("#chufanglc").nextAll(),function(i,v){	
			fu+=$(v).text()+",";
		});	*/
		var totalprice=$("#zongji").text(); //总金额
		var remark= $("#beizhu").val();//中药备注
		$.ajax({
      		type: "post",
       		url: "/cStoreOrderController/goodStore.do",
			data: {
			"goodlist":goodlist,"fu":fu,"totalprice":totalprice,
			//"remark":beizhu,
			"type":type   //来判断是已直接入库， 还是未审核
			},success : function(data){
              	alert(data);
//              	var aa=JSON.stringify(data);
//              	var a=aa.trim();
//              	if(a=="入库成功"){
//              		location.reload();
//              	}
              	location.reload();
       		},error: function(){
				alert("添加失败");
       		}
		});
	}
	
	
	
	$("#reboot").click(function(){
		$("#id").text('0');
		$("#input-1").val('');
		$("#sex").val('');
		$("#weight").val('');
		$("#year").val('');
		$("#phone").val('');
		
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
	//总剂量的变更
	$("#jiliang").change(function(){
		jisuanAll();
	});
});
//加载添加药品(西药)
function loadXiYaoList(){	
	$.getJSON("/cGoodsLcController/findBaseCGoods.do",function(data){
		$("#xiyaoList").html('');
		$("#zhongyaoList").html('');
		$("#qicaiList").html('');
		var x="";
		var z="";
		var j="";
		var h="";
		var k="";
		$.each(data,function(i,v){
			if(v.type=="2"){//西药
				x+="<tr class='ng-scope' role='button' tabindex='0'  onclick='triggers(this)'>";
				x+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'/></td>";
				x+="<td style='text-align:center;' class='ng-binding'>"+v.name+"</td>";
				x+="<td class='ng-binding'>"+v.specification+"</td>";
				//x+="<td class='ng-binding'>"+v.quantity+"</td>";
				x+="<td class='ng-binding'>"+v.money+"</td></tr>";
			}else if(v.type=="1"){//中药
				z+="<tr class='ng-scope' role='button' tabindex='0'  onclick='triggers(this)'>";
				z+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"' '></td>";
				z+="<td class='ng-binding'>"+v.name+"</td>";
				z+="<td class='ng-binding'>"+v.specification+"</td>";
				//z+="<td class='ng-binding'>"+v.quantity+"</td>";
				z+="<td class='ng-binding'>"+v.money+"</td></tr>";
			}else if(v.type=="4"){//器材
				j+="<tr class='ng-scope' role='button' tabindex='0'  onclick='triggers(this)'>";
				j+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"' '></td>";
				j+="<td class='ng-binding'>"+v.name+"</td>";
				j+="<td class='ng-binding'>"+v.money+"</td>";
				j+="<td class='ng-binding'>"+v.remarks+"</td></tr>";
			}else if(v.type=="6"){//营养滋补品
				h+="<tr class='ng-scope' role='button' tabindex='0'  onclick='triggers(this)'>";
				h+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"' '></td>";
				h+="<td class='ng-binding'>"+v.name+"</td>";
				h+="<td class='ng-binding'>"+v.money+"</td>";
				h+="<td class='ng-binding'>"+v.remarks+"</td></tr>";
			}else if(v.type=="5"){//中成药
				k+="<tr class='ng-scope' role='button' tabindex='0' onclick='triggers(this)'>";
				k+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'></td>";
				k+="<td class='ng-binding'>"+v.name+"</td>";
				k+="<td class='ng-binding'>"+v.money+"</td>";
				k+="<td class='ng-binding'>"+v.remarks+"</td></tr>";
			}
		});
		$(x).appendTo("#xiyaoList");
		$(z).appendTo("#zhongyaoList");
		$(j).appendTo("#qicaiList");
		$(h).appendTo("#yingyangList");
		$(k).appendTo("#zhongchengList");
		$(".xiyaoList tr").each(function(){
			$(this) .each(function(){
				
			})
		});
		

	});
}

//保存药品
function okGoods(){
	var h="";
	$.each($("[name=goodsBox]:checked"),function(i,v){
		var goodsId=$(v).next("input").val(); //选中的每一个药品id
		h+=goodsId+",";
		$(v).attr("checked",false);
	});
	
	$.getJSON("/cGoodsLcController/getCGoodsById.do",{"allId":h},function(data){
		$("#chufangList").html('');
		var c="";
		$.each(data,function(i,v){
			//编号
			c+="<tr class='ng-scope grey'><td class='ng-binding'>"+(i+1)+"</td>";
			//名字
			c+="<td class='ng-binding'>"+v.name+"<input value='"+v.id+"' type='hidden'></td>";
			//数量
			c+="<td><span><input id='quantity' type='text' style='width:50px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onkeyup='sizeChange(this)' value='1'></span></td>";
			//批发价
			c+="<td><span><input id='trade_price' type='text' style='width:50px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onchange='priceChange(this)' value=''required/></span></td>";
			//售价
			c+="<td><span><input  type='text' style='width:50px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onchange='' value='' required/></span></td>";
			//有效期
			c+="<td><span><input type='date' style='width:120px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onchange='' value=''></span></td>";
			//生产日期
			c+="<td><span><input type='date' style='width:120px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onchange='' value=''></span></td>";
			//供应商
			//c+="<td><span><input type='text' style='width:50px' class='ng-pristine ng-untouched ng-valid ng-isolate-scope ng-not-empty' aria-invalid='false' onchange='' value='无'></span></td>";
			//c+="<td class='ng-binding'>"+v.money+"</td>";
			//c+="<td>"+v.usages+"</td>";
			c+="<td style='position: relative;' class='editTd'><i class='drug-list-delete' onclick='delChu(this)'</i>";
			c+="<div style='' class='new_itemhao'></div></td></tr>";
		});
		$(c).appendTo("#chufangList");
		//jisuanAll();
	});
}
//添加药品中--中成药查询
$("#zhongchengname").keyup(function(){
	var name=$(this).val();
	if(!name.trim()){
		//return;
	}
	$.getJSON("/cGoodsLcController/findBaseCGoods.do",{"name":name,"type":"5"},function(data){
		$("#zhongchengList").html('');
		var x="";
		$.each(data,function(i,v){
			x+="<tr class='ng-scope' role='button' tabindex='0' onclick='triggers(this)'>";
			x+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'/></td>";
			x+="<td style='text-align:left;' class='ng-binding'>"+v.name+"</td>";
			x+="<td class='ng-binding'>"+v.specification+"</td>";
			x+="<td class='ng-binding'>"+v.quantity+"</td>";
			x+="<td class='ng-binding'>"+v.money+"</td></tr>";
		});
		$("#zhongchengList").empty();
		$(x).appendTo("#zhongchengList");
	});
});
//删除已经显示的附加费用
function delChu(a){
	$(a).parent().parent().remove();
	//计算总价
	jisuanAll();
}
//计算总价的方法
function jisuanAll(){
	var sum=0;
	$.each($("#chufangList tr"),function(i,v){
		//批发价
		var trade_price=($(v).find("td").find("input[id='trade_price']").val()-0);
		//数量
		var quantity=($(v).find("td").find("input[id='quantity']").val()-0);
		//累加总价
		sum+=(trade_price*quantity); 
		//sum+=($(v).find("td").eq(4).val()-0); //药品的总价
	});
	$("#zongji").text(sum);
}
//数量发生变化
function sizeChange(_this){
	//批发价
	var trade_price=$(_this).parent().parent().next().find("input[id='trade_price']").val()-0;
	console.log(trade_price);
	//重新计算总计
	jisuanAll();
}
//批发价发生变化
function priceChange(_this){
	//批发价
	var trade_price=$(_this).val();
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
			h+="<tr onclick=goMain('"+v.id+"','"+v.name+"','"+v.sex+"','"+v.year+"','"+v.weight+"','"+v.phone+"') class='ng-scope grey' tabindex='0' role='button' style=''>";
			h+="<td class='xz-lenght97 ng-binding' title='1110'>"+v.name+"<input type='hidden' value='"+v.id+"'></td>";
			h+="<td class='ng-binding'>"+v.sex+"</td> <td class='ng-binding'>"+v.year+"</td>";
			h+="<td class='ng-binding'>"+v.phone+"</td><td class='ng-binding'>"+v.create_date+"</td>";
			h+="<td class='ng-binding'>"+v.create_by+"</td></tr>";
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
function loadCheckMain(){	
	$.getJSON("/ccheckMainLcController/cCheckMainList.do",function(data){
		var h="";
		$("#checkMainList").html('');
		$.each(data,function(i,v){
				h+="<tr class='additional-list-row ng-scope grey' style=''>";
				h+="<td role='button' tabindex='0'><input name='checkMainBox' type='checkbox' onclick='dian()'/></td>";
				h+="<td class='ng-binding' role='button' tabindex='0'>"+v.checkname+"</td>";
				h+="<td style='text-align: center'>";
				h+=v.checkprice+"</td></tr>";
		});
		$(h).appendTo("#checkMainList");
	});
}
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
});


$(function(){
	//添加药品中--中药查询
	$("#xyQuery").keyup(function(){
		var name=$(this).val().trim();
		if(!name){
			return;
		}
		console.log(name);
		$.getJSON("/cGoodsLcController/findBaseCGoods.do",{"name":name,"type":"1"},function(data){
				$("#zhongyaoList").html('');
				var z="";
				$.each(data,function(i,v){
					z+="<tr class='ng-scope' role='button' tabindex='0' onclick='radioOk(this)'>";
					z+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'></td>";
					z+="<td class='ng-binding'>"+v.name+"</td>";
					z+="<td class='ng-binding'>"+v.specification+"</td>";
					z+="<td class='ng-binding'>"+v.quantity+"</td>";
					z+="<td class='ng-binding'>"+v.money+"</td></tr>";
				});
				$(z).appendTo("#zhongyaoList");
		});
	});
	//添加药品中--西药查询
	$("#xiyaoname").keyup(function(){
		var name=$(this).val();
		if(!name.trim()){
			//return;
		}
		console.log(name);
		$.getJSON("/cGoodsLcController/findBaseCGoods.do",{"name":name,"type":"2"},function(data){
		$("#xiyaoList").html('');
				var x="";
				$.each(data,function(i,v){
					x+="<tr class='ng-scope' role='button' tabindex='0' onclick='radioOk(this)'>";
					x+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'/></td>";
					x+="<td  class='ng-binding'>"+v.name+"</td>";
					x+="<td class='ng-binding'>"+v.specification+"</td>";
					x+="<td class='ng-binding'>"+v.quantity+"</td>";
					x+="<td class='ng-binding'>"+v.money+"</td></tr>";
				});
				$(x).appendTo("#xiyaoList");
		});
	});
	//添加药品中--器材查询
	$("#qicainame").keyup(function(){
		var name=$(this).val();
		if(!name.trim()){
			//return;
		}
		console.log(name);
		$.getJSON("/cGoodsLcController/findBaseCGoods.do",{"name":name,"type":"4"},function(data){
		$("#qicaiList").html('');
				var x="";
				$.each(data,function(i,v){
					x+="<tr class='ng-scope' role='button' tabindex='0' onclick='radioOk(this)'>";
					x+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'/></td>";
					x+="<td class='ng-binding'>"+v.name+"</td>";
					x+="<td class='ng-binding'>"+v.specification+"</td>";
					x+="<td class='ng-binding'>"+v.quantity+"</td>";
					x+="<td class='ng-binding'>"+v.money+"</td></tr>";
				});
				$("#qicaiList").empty();
				$(x).appendTo("#qicaiList");
		});
	});
	
	//添加药品中--营养品查询
	$("#yingyangname").keyup(function(){
		var name=$(this).val();
		if(!name.trim()){
			//return;
		}
		console.log(name);
		$.getJSON("/cGoodsLcController/findBaseCGoods.do",{"name":name,"type":"6"},function(data){
		$("#yingyangList").html('');
				var x="";
				$.each(data,function(i,v){
					x+="<tr class='ng-scope' role='button' tabindex='0' onclick='radioOk(this)'>";
					x+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'/></td>";
					x+="<td class='ng-binding'>"+v.name+"</td>";
					x+="<td class='ng-binding'>"+v.specification+"</td>";
					x+="<td class='ng-binding'>"+v.quantity+"</td>";
					x+="<td class='ng-binding'>"+v.money+"</td></tr>";
				});
				$("#yingyangList").empty();
				$(x).appendTo("#yingyangList");
		});
	});
	//添加药品中--中成药查询
	$("#zhongchengname").keyup(function(){
		var name=$(this).val();
		if(!name.trim()){
			//return;
		}
		$.getJSON("/cGoodsLcController/findBaseCGoods.do",{"name":name,"type":"5"},function(data){
			$("#zhongchengList").html('');
			var x="";
			$.each(data,function(i,v){
				x+="<tr class='ng-scope' role='button' tabindex='0' onclick='triggers(this)'>";
				x+="<td><input type='checkbox' name='goodsBox' onclick='dian()'/><input type='hidden' value='"+v.id+"'/></td>";
				x+="<td style='text-align:left;' class='ng-binding'>"+v.name+"</td>";
				x+="<td class='ng-binding'>"+v.specification+"</td>";
				x+="<td class='ng-binding'>"+v.quantity+"</td>";
				x+="<td class='ng-binding'>"+v.money+"</td></tr>";
			});
			$("#zhongchengList").empty();
			$(x).appendTo("#zhongchengList");
		});
	});
	
	
	
})
function triggers(_this){
	if($(_this).find("[type=checkbox]").attr("checked")=="checked"){
		$(_this).find("[type=checkbox]").removeAttr("checked");
	}else{
		$(_this).find("[type=checkbox]").attr("checked","checked");
	}
}

function dian(){
	event.cancleBubble = true;
	event.stopPropagation();
}

