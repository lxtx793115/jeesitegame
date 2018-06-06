var lujing=$("#lujing").val();
$(function(){
	show();
	$("#gname").keyup(function(){
		show();
	});
});

function show(){
	$.getJSON("/cPrescriptionLcController/findGoods.do",{"gName":$("#gname").val()},function(data){
		$("#goodsList").html('');
		var c="";
		$.each(data,function(i,v){
				c+="<md-list-item class='zdxx_center_list doctor_tell_btn _md-button-wrap ng-scope _md md-clickable' style='line-height: normal;max-height: none;' role='listitem' tabindex='-1' onclick=radioOk(this)>";
				c+="<div class='md-button md-no-style'>";
				c+="<div class='md-list-item-inner'><input type='checkbox' onclick='dian()' name='chufanggoods' value='"+v.id+"' ><span class='ng-binding'> "+v.name+"</span>";
				c+="</div><div class='md-secondary-container'></div>";
				c+="</div></md-list-item>";
		});
		$(c).appendTo("#goodsList");
	});
	
	$("#savePre").click(function(){
		var chuName=$("#pname").val();
		var chuType=$("#ptype").val();
		var all="";
		if($("[lc=lc]").size()=="0"){
			alert("请选择处方具体的商品!");	
			return;
		}
		$.each($("[lc=lc]"),function(i,v){
			var id=$(v).find("[type=hidden]").val(); //id
			var count=$(v).find("[type=number]").val(); //id
			all+=(id+","+count+" ");
		});
		window.location.href="/cPrescriptionLcController/addPrescription.do?chuName="+chuName+"&chuType="+chuType+"&all="+all;
	});
	
}


function savechufang(){
	var allGoodsId="";
	$.each($("[name=chufanggoods]:checked"),function(i,v){
		allGoodsId+=$(v).val()+",";
	});
	$.getJSON("/cPrescriptionLcController/findAllGoodsById.do",{"allGoodsId":allGoodsId},function(data){
			var rows=$("#prescriptionList").find("tr").length-0; 
			var h="";
			$.each(data,function(i,v){
			h+="<tr class='repeat-tr ng-scope' style='outline: none;'>";
			h+="<td class='ng-binding'>"+(rows+1+i)+"</td>";
			h+="<td class='status-1'>"+v.name+"</td>";
			h+="<td class='ng-binding'>"+v.specification+"</td>";
			if(v.type=="1"){
				h+="<td class='ng-binding'>中药</td>";
			}else if (v.type=="2"){
				h+="<td class='ng-binding'>西药</td>";
			}else{
				h+="<td class='ng-binding'>检查</td>";
			}
			h+="<td class='ng-binding' lc='lc'><input type='hidden' value='"+v.id+"'><input type='number' value='1' ></td>";
			h+="<td class='ng-binding'><img src='"+lujing+"/yiliao-yun_files/images/icon-trash-black.png' onclick='del(this)'/></td></tr>"
			
			});
			$(h).appendTo("#prescriptionList");		
	});
		$("[name=chufanggoods]").removeAttr("checked");
		$(".zyy-box").addClass("ng-hide");
		$(".md-opaque").css("display","none");
}

function del(a){
	$(a).parent().parent().remove();
}

function radioOk(a){
	if($(a).find("[type=checkbox]").attr("checked")=="checked"){
		$(a).find("[type=checkbox]").removeAttr("checked");
	}else{
		$(a).find("[type=checkbox]").attr("checked","checked");
	}
}

function dian(){
	event.cancleBubble = true;
	event.stopPropagation();
}