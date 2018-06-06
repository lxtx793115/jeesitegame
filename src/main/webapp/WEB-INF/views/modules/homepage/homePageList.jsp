<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<style type="text/css">
	.row {
    margin-left: -18px;
    margin-right: -18px;
    overflow: hidden;
}

.row-mb {
    margin-bottom: 25px;
}
.am-u-lg-3{width:25%}.am-u-lg-4{width:33.33333333%}
.am-u-md-6{width:50%}
.am-u-sm-12{width:100%}

.dashboard-stat .visual {width: 80px; height: 80px;display: block; 
float: left;padding-top: 10px;padding-left: 15px;margin-bottom: 15px;font-size: 35px;line-height: 35px;
}

.dashboard-stat.blue .visual>i { color: #FFF;opacity: .1;filter: alpha(opacity=10);
}

.dashboard-stat .visual>i {margin-left: -35px;font-size: 110px;line-height: 110px;
}

.dashboard-stat .details {position: absolute;right: 15px;padding-right: 15px;
}

.dashboard-stat.blue .details .number {color: #FFF;}
.dashboard-stat .details .number {padding-top: 25px; text-align: right;font-size: 34px;
    line-height: 36px;letter-spacing: -1px;margin-bottom: 0;font-weight: 300;}

.dashboard-stat.blue .details .desc {color: #FFF;opacity: 1;filter: alpha(opacity=100);
}

.dashboard-stat .details .desc {text-align: right;font-size: 16px;letter-spacing: 0;font-weight: 300;}

.dashboard-stat.blue .more {color: #FFF;background-color: #258fd7;}

.dashboard-stat {width:33.33333333%;
 display: block;margin-bottom: 25px;overflow: hidden;border-radius: 4px;}

.dashboard-stat .more {clear: both;display: block;padding: 6px 10px;position: relative;text-transform: uppercase;
    font-weight: 300;font-size: 11px;opacity: .7;filter: alpha(opacity=70);}
    
    .dashboard-stat.blue {
    background-color: #3598dc;
}

.dashboard-stat.red {
    background-color: #e7505a;
}

.dashboard-stat.green {
    background-color: #32c5d2;
}

.dashboard-stat.purple {
    background-color: #8E44AD;
}

.dashboard-stat .more>i {
    display: inline-block;
    margin-top: 1px;
    float: right;
}

.m-icon-swapright {
    background-position: -27px -10px;
}

.m-icon-white {
    background-image: url(../img/syncfusion-icons-white.png);
}

.dashboard-stat.red .more {
    color: #fff;
    background-color: #e53e49;
}

.dashboard-stat.red .visual>i {
    color: #fff;
    opacity: .1;
    filter: alpha(opacity=10);
}

.dashboard-stat.red .details .number {
    color: #fff;
}
.dashboard-stat .details .number {padding-top: 25px; text-align: right;font-size: 34px;
    line-height: 36px;letter-spacing: -1px;margin-bottom: 0;font-weight: 300;}
.dashboard-stat.red .details .desc {
    color: #fff;
    opacity: 1;
    filter: alpha(opacity=100);
}
.dashboard-stat { display: block;margin-bottom: 25px;overflow: hidden;border-radius: 4px;}
.dashboard-stat.red {
    background-color: #e7505a;
}
.numberdan {
    color: #FFF;
}

 .descdan {
    color: #FFF;
    opacity: 1;
    filter: alpha(opacity=100);
}

.dashboard-stat.green .details .number {
    color: #FFF;
}

.dashboard-stat.green .details .desc {
    color: #FFF;
    opacity: 1;
    filter: alpha(opacity=100);
}

.dashboard-stat.green .more {
    color: #FFF;
    background-color: #2bb8c4;
}

.dashboard-stat.green .visual>i {
    color: #FFF;
    opacity: .1;
    filter: alpha(opacity=10);
}

.dashboard-stat.purple .visual>i {
    color: #fff;
    opacity: .1;
    filter: alpha(opacity=10);
}

.dashboard-stat.purple .details .number {
    color: #fff;
}

.dashboard-stat.purple .details .desc {
    color: #fff;
    opacity: 1;
    filter: alpha(opacity=100);
}
.am-icon-bar-chart-o:before,.am-icon-bar-chart:before{content:"\f080"}.am-icon-twitter-square:before{content:"\f081"}
.am-icon-facebook-square:before{content:"\f082"}.am-icon-camera-retro:before{content:"\f083"}
.am-icon-key:before{content:"\f084"}.am-icon-cogs:before,.am-icon-gears:before{content:"\f085"}
.am-icon-comments:before{content:"\f086"}.am-icon-thumbs-o-up:before{content:"\f087"}
.dashboard-stat.purple .more {
    color: #fff;
    background-color: #823e9e;
}
.am-icon-shopping-bag:before{content:"\f290"}

.m-icon-swapright {
    background-position: -27px -10px;
}
 .tpl-content-wrapper {
        padding-left: 0;
    }
   
   
    
  .numberxu {
    color: #fff;
}
.numberxu {padding-top: 25px; text-align: right;font-size: 34px;
    line-height: 36px;letter-spacing: -1px;margin-bottom: 0;font-weight: 300;}
.descxu {
   color: #FFF;
    opacity: 1;
    filter: alpha(opacity=100);
   
}
.descxu { text-align: right;font-size: 16px;letter-spacing: 0;font-weight: 300;
}
.visualxu {width: 80px; height: 80px;display: block; 
float: left;padding-top: 10px;padding-left: 15px;margin-bottom: 15px;font-size: 35px;line-height: 35px;
}
.dashboard-statxu { display: block;margin-bottom: 25px;border-radius: 4px;width:100%;}
.redxu {
    background-color: #32c5d2;
}   
   table.gridtable {
      font-family: verdana,arial,sans-serif;
     font-size:11px;
 }
 table.gridtable th {
    border-width: 1px;
    padding: 8px;
    border-style: solid;
 }
 table.gridtable td {
     border-width: 1px;
     padding: 8px;
    border-style: solid;
 } 
    
    
 .detailsxu {position: relative;right: 15px;padding-right: 15px;
}    
 .pagelinks{float:right;}
 .morexu {clear: both;display: block;padding: 6px 10px;position: relative;text-transform: uppercase;
    font-weight: 300;font-size: 11px;opacity: .7;filter: alpha(opacity=70);}   
	</style>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/font-awesome.css">
	<!-- <link href='https://fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'> -->
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/homepage/homePage/">总统计</a></li>
		<%-- <shiro:hasPermission name="homepage:homePage:edit"><li><a href="${ctx}/homepage/homePage/form">首页添加</a></li></shiro:hasPermission> --%>
	</ul>
	<br>
	 <div class="market-updates">
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-8 market-update-left">
						<h3>${homePage.userTotalNumber}人 </h3>
					<h4>会员总数</h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
				 <div class="col-md-8 market-update-left">
					<h3> ${homePage.todayNewlyAddedUser}人 </h3>
					<h4>今日新增会员</h4>
				  </div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-8 market-update-left">
						<h3> ${homePage.todayActiveUser}人</h3>
						<h4>今日活跃会员</h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-8 market-update-left">
						<h3>${homePage.currentOnlineUser}人 </h3>
					<h4>当前在线会员</h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
		   <div class="clearfix"> </div>
		</div>
		<br>
		
		
		 <div class="market-updates">
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
				 <div class="col-md-8 market-update-left">
					<h3>  ${homePage.weekNewlyAddedUser}人</h3>
					<h4>周新增会员</h4>
				  </div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-8 market-update-left">
						<h3> ${homePage.monthNewlyAddedUser}人</h3>
						<h4>月新增会员 </h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-8 market-update-left">
						<h3>${homePage.intradiscalTotalFraction} </h3>
					<h4>盘内总分数</h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
				 <div class="col-md-8 market-update-left">
					<h3>  ${homePage.todayRecharge}￥</h3>
					<h4>今日充值</h4>
				  </div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
		   <div class="clearfix"> </div>
		</div>
	
	<br>
		
		
		 <div class="market-updates">
			
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-8 market-update-left">
						<h3>  ${homePage.todayWithdrawCash}￥</h3>
						<h4>今日提现</h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-8 market-update-left">
					<h3>  ${homePage.todayWithdrawCash}￥</h3>
						<h4>今日总盈亏 </h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
				 <div class="col-md-8 market-update-left">
					<h3>  ${homePage.todayWithdrawCash}￥</h3>
						<h4>今日投注流水 </h4>
				  </div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-8 market-update-left">
						<h3>  ${homePage.todayGivePresent}￥</h3>
						<h4>今日赠送 </h4>
						
					</div>
					
				  <div class="clearfix"> </div>
				</div>
			</div>
		   <div class="clearfix"> </div>
		</div>
	
	
	<br><br>
		
		
		 <div class="market-updates">
			
		   <div class="clearfix"> </div>
		</div>
	
	
	
</body>
</html>