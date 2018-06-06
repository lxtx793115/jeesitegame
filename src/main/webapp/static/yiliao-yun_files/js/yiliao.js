$(function(){
	$(".btn-person-selector").click(function(){				//姓名弹框
		$(".md-opaque").css("display","block");
		$(".ry-box").css("display","block");
	});
	$(".xuanzheyaoping_head_x").click(function(){				//姓名弹框
		$(".md-opaque").css("display","none");
		$(".ry-box").css("display","none");
	});
	
	$(".bzxx-btn").click(function(){				//备注弹框
		$(".md-opaque").css("display","block");
		$(".zy-box").css("display","block");
	});
	$(".xuanzheyaoping_head_x").click(function(){				//备注弹框
		$(".md-opaque").css("display","none");
		$(".md-dialog-container").css("display","none");
	});
	
	$(".patient-dialog-head-xx").click(function(){				//姓名弹框消息切换
		$(this).addClass("hover").siblings().removeClass("hover");
		$(".ry-box").css("display","block");
		$(".gh-box").css("display","none");
	});
	$(".patient-dialog-head-gh").click(function(){				//姓名弹框消息切换
		$(this).addClass("hover").siblings().removeClass("hover");
		$(".ry-box").css("display","none");
		$(".gh-box").css("display","block");
	});
	
	/**$(".mk-orange-btn").click(function(){				//收费弹框
		$(".zk-xkjz").removeClass("ng-hide");
		$(".zk-xkjz").css("display","flex");
		$(".md-opaque").css("display","block");
	});
	$(".mk-bounced-cancel").click(function(){				//收费弹框shuyekatie_li1
		$(".zk-xkjz").addClass("ng-hide");
		$(".md-opaque").css("display","none");
	});*/
	
	$(".mk-check").each(function(){				//复选框
		$(this).click(function(){
			$(this).toggleClass("hover");
			if($(".zk-chk").hasClass("hover")){
				$(".zk-box").removeClass("ng-hide");
			}else{
				$(".zk-box").addClass("ng-hide");
			}
		});
	});
	
	$(".shuyekatie_li1").click(function(){				//处方弹框
		$(".cf-box").removeClass("ng-hide");
		$(".cf-box").css("display","flex");
		$(".md-opaque").css("display","block");
	});
	$(".gb-cf").click(function(){				//处方弹框
		$(".cf-box").addClass("ng-hide");
		$(".md-opaque").css("display","none");
	});
	$(".patient-dialog-head-xx").click(function(){				//处方弹框消息切换
		$(this).addClass("hover").siblings().removeClass("hover");
		$(".ry-box").css("display","block");
		$(".gh-box").css("display","none");
	});
	$(".patient-dialog-head-gh").click(function(){				//处方弹框消息切换
		$(this).addClass("hover").siblings().removeClass("hover");
		$(".ry-box").css("display","none");
		$(".gh-box").css("display","block");
	});
	
	
	$(".bzs-btn").click(function(){				//处方弹框
		$(".zyy-box").removeClass("ng-hide");
		$(".zyy-box").css("display","flex");
		$(".md-opaque").css("display","block");
	});
	$(".zybz-gb").click(function(){				//处方弹框
		$(".zyy-box").addClass("ng-hide");
		$(".md-opaque").css("display","none");
	});
	$(".zdxx_center_list").click(function(){			//中药备注勾选
		$(this).find(".slelct_buydrug_check").addClass("checked").parents().siblings().find(".slelct_buydrug_check").removeClass("checked");
	});
	
	$(".prescription_use_head_title ul li").each(function(){		//处方调用切换
		$(this).click(function(){
			$(this).addClass("prescription_use_head_title_hovers").siblings().removeClass("prescription_use_head_title_hovers");
		});
	});
	$(".Prescription_template").click(function(){
		$(".prescription_use_Prescription_Guadan").css("display","none");
		$(".prescription_use_Prescription_thistory").css("display","none");
		$(".prescription_use_Prescription_template").css("display","block");
		$(".prescription_use_Prescription_Order").css("display","none");
	});
	$(".Prescription_history").click(function(){
		$(".prescription_use_Prescription_Guadan").css("display","none");
		$(".prescription_use_Prescription_thistory").css("display","block");
		$(".prescription_use_Prescription_template").css("display","none");
		$(".prescription_use_Prescription_Order").css("display","none");
	});
	$(".Prescription_Guadan").click(function(){
		$(".prescription_use_Prescription_Guadan").css("display","block");
		$(".prescription_use_Prescription_thistory").css("display","none");
		$(".prescription_use_Prescription_template").css("display","none");
		$(".prescription_use_Prescription_Order").css("display","none");
	});
	$(".Prescription_Order").click(function(){
		$(".prescription_use_Prescription_Guadan").css("display","none");
		$(".prescription_use_Prescription_thistory").css("display","none");
		$(".prescription_use_Prescription_template").css("display","none");
		$(".prescription_use_Prescription_Order").css("display","block");
	});
	
	
	$(".zy-dy-btn").click(function(){					//中药处方调用详情弹框
		$(".history_xiangxi__zhong").css("display","block");
	});
	$(".xy-dy-btn").click(function(){					//西药处方调用详情弹框
		$(".history_xiangxi_xi").css("display","block");
	});
	$(".close-btn").click(function(){					//处方调用详情弹框
		$(".cfxiangyealert").css("display","none");
	});
	$(".mb-xx").click(function(){					//处方模版调用详情弹框
		$(".history_xiangxi_jian").css("display","block");
	});
	$(".close-btn").click(function(){
		$(".cfxiangyealert").css("display","none");
	});
	
	$(".ck-btn").click(function(){					//挂单处方调用详情弹框
		$(".history_xiangxi_guadan").css("display","block");
	});
	$(".close-btn").click(function(){
		$(".cfxiangyealert").css("display","none");
	});
	
	$(".btn-adddrug").click(function(){				//添加药品弹框
		$(".md-sidenav-right").removeClass("md-closed");
		$(".md-opaque").css("display","block");
		$(".md-opaque").click(function(){	
			$(".md-sidenav-right").addClass("md-closed");
			$(".md-opaque").css("display","none");
		})
	})
	
	$(".btn-adddrug").click(function(){
		$(".drug-head a").each(function(){
			$(this).click(function(){
				$(this).addClass("drug-type-selected").siblings().removeClass("drug-type-selected");
				if($(".xycf-1").hasClass("drug-type-selected")){
					$(".ycf-1").removeClass("ng-hide");
					$(".xy-ssk").removeClass("ng-hide");
					$(".zy-ssk").addClass("ng-hide");
					$(".jc-ssk").addClass("ng-hide");
					$(".ycf-2").addClass("ng-hide");
					$(".ycf-3").addClass("ng-hide");
					$(".jc-ssks").addClass("ng-hide");
					$(".ycf-4").addClass("ng-hide");
				}else if($(".xycf-2").hasClass("drug-type-selected")){
					$(".ycf-2").removeClass("ng-hide");
					$(".zy-ssk").removeClass("ng-hide");
					$(".xy-ssk").addClass("ng-hide");
					$(".jc-ssk").addClass("ng-hide");
					$(".ycf-1").addClass("ng-hide");
					$(".ycf-3").addClass("ng-hide");
					$(".jc-ssks").addClass("ng-hide");
					$(".ycf-4").addClass("ng-hide");
				}else if($(".xycf-3").hasClass("drug-type-selected")){
					$(".ycf-3").removeClass("ng-hide");
					$(".jc-ssk").removeClass("ng-hide");
					$(".xy-ssk").addClass("ng-hide");
					$(".zy-ssk").addClass("ng-hide");
					$(".ycf-2").addClass("ng-hide");
					$(".ycf-1").addClass("ng-hide");
					$(".jc-ssks").addClass("ng-hide");
					$(".ycf-4").addClass("ng-hide");
				}else if($(".xycf-4").hasClass("drug-type-selected")){
					$(".jc-ssks").removeClass("ng-hide");
					$(".ycf-4").removeClass("ng-hide");
					$(".ycf-3").addClass("ng-hide");
					$(".jc-ssk").addClass("ng-hide");
					$(".xy-ssk").addClass("ng-hide");
					$(".zy-ssk").addClass("ng-hide");
					$(".ycf-2").addClass("ng-hide");
					$(".ycf-1").addClass("ng-hide");
				}
			});
		})
	})
	$(".setInitType").click(function(){				//设置默认
		$(".setInitype").removeClass("ng-hide");
	})
	$(".closeIcon,.cancel").click(function(){
		$(".setInitype").addClass("ng-hide");
	})
	$(".type1").click(function(){				//设置默认切换
		$(this).attr("src","./yiliao-yun_files/images/mubh.png");
		$(".type2").attr("src","./yiliao-yun_files/images/mub.png");
		$(".type3").attr("src","./yiliao-yun_files/images/mub.png");
	});
	$(".type2").click(function(){				//设置默认
		$(this).attr("src","./yiliao-yun_files/images/mubh.png");
		$(".type1").attr("src","./yiliao-yun_files/images/mub.png");
		$(".type3").attr("src","./yiliao-yun_files/images/mub.png");
	});
	$(".type3").click(function(){				//设置默认
		$(this).attr("src","./yiliao-yun_files/images/mubh.png");
		$(".type2").attr("src","./yiliao-yun_files/images/mub.png");
		$(".type1").attr("src","./yiliao-yun_files/images/mub.png");
	});
	
	$(".zd-btn").click(function(){					//右侧诊断弹框
		$(".zd-box").css("display","block");
		$(".md-opaque").css("display","block");
	});
	$(".xx-btn").click(function(){				
		$(".zd-box").css("display","none");
		$(".md-opaque").css("display","none");
	});
	
	$(".yz-btn").click(function(){					//医嘱弹框
		$(".yz-box").css("display","block");
		$(".md-opaque").css("display","block");
	});
	$(".yz-gb").click(function(){				
		$(".yz-box").css("display","none");
		$(".md-opaque").css("display","none");
	});
	
	$(".cmb-btn").click(function(){				//模板弹框
		$(".cmb-box").removeClass("ng-hide");
	});
	$(".closeDiv").click(function(){				//模板弹框
		$(".cmb-box").addClass("ng-hide");
	});
	$(".yu_new_alert_muban_main_chuangjianranmax").click(function(){
		$(this).addClass("yu_new_alert_muban_main_chuangjian_hover").siblings().removeClass("yu_new_alert_muban_main_chuangjian_hover");
	})
	
	$(".btn-add-additional").click(function(){					//附加费用弹框
		$(".fy-box").css("display","block");
		$(".md-opaque").css("display","block");
	});
	$(".fy-close").click(function(){				//附加费用弹框
		$(".fy-box").css("display","none");
		$(".md-opaque").css("display","none");
	});
	
	//历史病例页面
	$("#xyxxshow").click(function(){				//中西药tab跳转
		$(this).addClass("active").siblings().removeClass("active");
		$(".xybl-box").removeClass("ng-hide");
		$(".zybl-box").addClass("ng-hide");
	})
	$("#zyxxshow").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		$(".zybl-box").removeClass("ng-hide");
		$(".xybl-box").addClass("ng-hide");
	})
	
	$(".plxxnodata_name").click(function(){				//姓名弹框
		$(".md-opaque").css("display","block");
		$(".personCover").css("display","block");
	});
	$(".xuanzheyaoping_head_x").click(function(){				//姓名弹框
		$(".md-opaque").css("display","none");
		$(".personCover").css("display","none");
	});
	
	$(".dybl-btn").click(function(){				//调用模版弹框
		$(".md-opaque").css("display","block");
		$(".newMedicalRecord").css("display","block");
	});
	$(".close-btns").click(function(){				//调用模版弹框
		$(".md-opaque").css("display","none");
		$(".newMedicalRecord").css("display","none");
	});
	$(".dropdown-menu-mbxiangxi").each(function(){				//调用模版详细弹框
		$(this).click(function(){
			$(".newMedicalRecordxiangxi").css("display","block");
			$(".close-btnss").click(function(){
				$(".newMedicalRecordxiangxi").css("display","none");
			})
		})
	});
	$(".yu_new_alert_muban_main_chuangjianran4").click(function(){
		$(this).addClass("yu_new_alert_muban_main_chuangjian_hover");
		$(".yu_new_alert_muban_main_chuangjianran5").removeClass("yu_new_alert_muban_main_chuangjian_hover");
	});
	$(".yu_new_alert_muban_main_chuangjianran5").click(function(){
		$(this).addClass("yu_new_alert_muban_main_chuangjian_hover");
		$(".yu_new_alert_muban_main_chuangjianran4").removeClass("yu_new_alert_muban_main_chuangjian_hover");
	});
	
	//统计页面
	$(".month-btn").click(function(){			//月统计
		$(this).addClass("hover").siblings().removeClass("hover");
		$("#statisticalreport_start").removeClass("ng-hide");
		$("#statisticalreport_end").removeClass("ng-hide");
		$("#theYear").addClass("ng-hide");
		$(".month-box").removeClass("ng-hide");
		$(".year-box").addClass("ng-hide");
		$(".month-tongji").removeClass("ng-hide");
		$(".year-tongji").addClass("ng-hide");
	})
	$(".year-btn").click(function(){			//年统计
		$(this).addClass("hover").siblings().removeClass("hover");
		$("#statisticalreport_start").addClass("ng-hide");
		$("#statisticalreport_end").addClass("ng-hide");
		$("#theYear").removeClass("ng-hide");
		$(".month-box").addClass("ng-hide");
		$(".year-box").removeClass("ng-hide");
		$(".month-tongji").addClass("ng-hide");
		$(".year-tongji").removeClass("ng-hide");
	})
	
	
	
	
	
	
});

