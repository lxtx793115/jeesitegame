<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>当期统计管理</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	.am-tab-panel{top:0;float:left;width:100%;padding:10px 10px 15px;}
	/* .am-tabs-bd .am-tab-panel *{-webkit-user-drag:none}.am-tabs-bd .am-tab-panel.am-active{position:relative;z-index:100;visibility:visible;-webkit-transform:translateX(0);-ms-transform:translateX(0);transform:translateX(0)}
	.am-tabs-bd .am-tab-panel.am-active~.am-tab-panel{-webkit-transform:translateX(100%);-ms-transform:translateX(100%);transform:translateX(100%)}.am-tabs-bd .am-tabs-bd{border:none}.am-tabs-bd-ofv{overflow:visible}.am-tabs-bd-ofv>.am-tab-panel{display:block}.am-tabs-bd-ofv>.am-tab-panel
	.am-active{display:block}.am-tabs-fade .am-tab-panel{opacity:0;-webkit-transition:opacity .25s linear;transition:opacity .25s linear}.am-tabs-fade .am-tab-panel.am-in{opacity:1} */
	
	.am-tab-panel {
    padding: 0;
}
	
	.am-table-compact>tbody>tr>td,.am-table-compact>tbody>tr>th,.am-table-compact>tfoot>tr>td,.am-table-compact>tfoot>tr>th,.am-table-compact>thead>tr>td,.am-table-compact>thead>tr>th{padding:.4rem}
	.am-table>tbody>tr>td,.am-table>tbody>tr>th,.am-table>tfoot>tr>td,.am-table>tfoot>tr>th,.am-table>thead>tr>td,.am-table>thead>tr>th{padding:.7rem;line-height:1.6;vertical-align:top;border-top:1px solid #ddd}.am-table>thead>tr>th{vertical-align:bottom;border-bottom:1px solid #ddd}.am-table>caption+thead>tr:first-child>td,.am-table>caption+thead>tr:first-child>th,.am-table>colgroup+thead>tr:first-child>td,.am-table>colgroup+thead>tr:first-child>th,.am-table>thead:first-child>tr:first-child>td,.am-table>thead:first-child>tr:first-child>th{border-top:0}.am-table>tbody+tbody tr:first-child td{border-top:2px solid #ddd}.am-table-bordered{border:1px solid #ddd;border-left:none}.am-table-bordered>tbody>tr>td,.am-table-bordered>tbody>tr>th,.am-table-bordered>tfoot>tr>td,.am-table-bordered>tfoot>tr>th,
	.am-table-bordered>thead>tr>td,.am-table-bordered>thead>tr>th{border-left:1px solid #ddd}.am-table-bordered>tbody>tr:first-child>td,.am-table-bordered>tbody>tr:first-child>th{border-top:none}.am-table-bordered>thead+tbody>tr:first-child>td,.am-table-bordered>thead+tbody>tr:first-child>th{border-top:1px solid #ddd}.am-table-radius{border:1px solid #ddd;border-radius:2px}.am-table-radius>thead>tr:first-child>td:first-child,.am-table-radius>thead>tr:first-child>th:first-child{border-top-left-radius:2px;border-left:none}.am-table-radius>thead>tr:first-child>td:last-child,.am-table-radius>thead>tr:first-child>th:last-child{border-top-right-radius:2px;border-right:none}.am-table-radius>tbody>tr>td:first-child,.am-table-radius>tbody>tr>th:first-child{border-left:none}
	.am-table-radius>tbody>tr>td:last-child,.am-table-radius>tbody>tr>th:last-child{border-right:none}.am-table-radius>tbody>tr:last-child>td,.am-table-radius>tbody>tr:last-child>th{border-bottom:none}.am-table-radius>tbody>tr:last-child>td:first-child,.am-table-radius>tbody>tr:last-child>th:first-child{border-bottom-left-radius:2px}.am-table-radius>tbody>tr:last-child>td:last-child,.am-table-radius>tbody>tr:last-child>th:last-child{border-bottom-right-radius:2px}.am-table-striped>tbody>tr:nth-child(odd)>td,.am-table-striped>tbody>tr:nth-child(odd)>th{background-color:#f9f9f9}.am-table-hover>tbody>tr:hover>td,.am-table-hover>tbody>tr:hover>th{background-color:#e9e9e9}.am-table-compact>tbody>tr>td,.am-table-compact>tbody>tr>th,.am-table-compact>tfoot>tr>td,.am-table-compact>tfoot>tr>th,.am-table-compact>thead>tr>td,.am-table-compact>thead>tr>th{padding:.4rem}.am-table-centered>tbody>tr>td,.am-table-centered>tbody>tr>th,.am-table-centered>tfoot>tr>td,.am-table-centered>tfoot>tr>th,.am-table-centered>thead>tr>td,.am-table-centered>thead>tr>th{text-align:center}.am-table>tbody>tr.am-active>td,.am-table>tbody>tr.am-active>th,.am-table>tbody>tr>td.am-active,.am-table>tbody>tr>th.am-active,.am-table>tfoot>tr.am-active>td,.am-table>tfoot>tr.am-active>th,.am-table>tfoot>tr>td.am-active,.am-table>tfoot>tr>th.am-active,.am-table>thead>tr.am-active>td,.am-table>thead>tr.am-active>th,.am-table>thead>tr>td.am-active,.am-table>thead>tr>th.am-active{background-color:#ffd}.am-table>tbody>tr.am-disabled>td,.am-table>tbody>tr.am-disabled>th,.am-table>tbody>tr>td.am-disabled,.am-table>tbody>tr>th.am-disabled,.am-table>tfoot>tr.am-disabled>td,.am-table>tfoot>tr.am-disabled>th,.am-table>tfoot>tr>td.am-disabled,.am-table>tfoot>tr>th.am-disabled,.am-table>thead>tr.am-disabled>td,.am-table>thead>tr.am-disabled>th,.am-table>thead>tr>td.am-disabled,.am-table>thead>tr>th.am-disabled{color:#999}.am-table>tbody>tr.am-primary>td,.am-table>tbody>tr.am-primary>th,.am-table>tbody>tr>td.am-primary,.am-table>tbody>tr>th.am-primary,.am-table>tfoot>tr.am-primary>td,.am-table>tfoot>tr.am-primary>th,.am-table>tfoot>tr>td.am-primary,.am-table>tfoot>tr>th.am-primary,.am-table>thead>tr.am-primary>td,.am-table>thead>tr.am-primary>th,.am-table>thead>tr>td.am-primary,.am-table>thead>tr>th.am-primary{color:#0b76ac;background-color:rgba(14,144,210,.115)}.am-table>tbody>tr.am-success>td,.am-table>tbody>tr.am-success>th,.am-table>tbody>tr>td.am-success,.am-table>tbody>tr>th.am-success,.am-table>tfoot>tr.am-success>td,.am-table>tfoot>tr.am-success>th,.am-table>tfoot>tr>td.am-success,.am-table>tfoot>tr>th.am-success,.am-table>thead>tr.am-success>td,.am-table>thead>tr.am-success>th,.am-table>thead>tr>td.am-success,.am-table>thead>tr>th.am-success{color:#5eb95e;background-color:rgba(94,185,94,.115)}.am-table>tbody>tr.am-warning>td,.am-table>tbody>tr.am-warning>th,.am-table>tbody>tr>td.am-warning,.am-table>tbody>tr>th.am-warning,.am-table>tfoot>tr.am-warning>td,.am-table>tfoot>tr.am-warning>th,.am-table>tfoot>tr>td.am-warning,.am-table>tfoot>tr>th.am-warning,.am-table>thead>tr.am-warning>td,.am-table>thead>tr.am-warning>th,.am-table>thead>tr>td.am-warning,.am-table>thead>tr>th.am-warning{color:#F37B1D;background-color:rgba(243,123,29,.115)}.am-table>tbody>tr.am-danger>td,.am-table>tbody>tr.am-danger>th,.am-table>tbody>tr>td.am-danger,.am-table>tbody>tr>th.am-danger,.am-table>tfoot>tr.am-danger>td,.am-table>tfoot>tr.am-danger>th,.am-table>tfoot>tr>td.am-danger,.am-table>tfoot>tr>th.am-danger,.am-table>thead>tr.am-danger>td,.am-table>thead>tr.am-danger>th,.am-table>thead>tr>td.am-danger,.am-table>thead>tr>th.am-danger{color:#dd514c;background-color:rgba(221,81,76,.115)}fieldset{border:none}legend{display:block;width:100%;margin-bottom:2rem;font-size:2rem;line-height:inherit;color:#333;border-bottom:1px solid #e5e5e5;padding-bottom:.5rem}label{display:inline-block;margin-bottom:5px;font-weight:700}input[type=search]{-webkit-box-sizing:border-box;box-sizing:border-box}input[type=checkbox],input[type=radio]{margin:4px 0 0;margin-top:1px\9;line-height:normal}input[type=file]{display:block}select[multiple],select[size]{height:auto}select optgroup{font-size:inherit;font-style:inherit;font-family:inherit}input[type=checkbox]:focus,input[type=file]:focus,input[type=radio]:focus{outline:thin dotted;outline:1px auto -webkit-focus-ring-color;outline-offset:-2px}input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-outer-spin-button{
	height:auto}output{display:block;padding-top:1.6rem;font-size:1.6rem;line-height:1.6;color:#555;vertical-align:middle}
	.am-table{margin-bottom:0}.am-panel>.am-table:first-child{border-top-right-radius:0;border-top-left-radius:0}.am-panel>.am-table:first-child>tbody:first-child>tr:first-child td:first-child,.am-panel>.am-table:first-child>tbody:first-child>tr:first-child th:first-child,.am-panel>.am-table:first-child>thead:first-child>tr:first-child td:first-child,.am-panel>.am-table:first-child>thead:first-child>tr:first-child th:first-child{border-top-left-radius:0}.am-panel>.am-table:first-child>tbody:first-child>tr:first-child td:last-child,.am-panel>.am-table:first-child>tbody:first-child>tr:first-child th:last-child,.am-panel>.am-table:first-child>thead:first-child>tr:first-child td:last-child,.am-panel>.am-table:first-child>thead:first-child>tr:first-child th:last-child{border-top-right-radius:0}.am-panel>.am-table:last-child{border-bottom-right-radius:0;border-bottom-left-radius:0}.am-panel>.am-table:last-child>tbody:last-child>tr:last-child td:first-child,.am-panel>.am-table:last-child>tbody:last-child>tr:last-child th:first-child,.am-panel>.am-table:last-child>tfoot:last-child>tr:last-child td:first-child,.am-panel>.am-table:last-child>tfoot:last-child>tr:last-child th:first-child{border-bottom-left-radius:0}.am-panel>.am-table:last-child>tbody:last-child>tr:last-child td:last-child,.am-panel>.am-table:last-child>tbody:last-child>tr:last-child th:last-child,.am-panel>.am-table:last-child>tfoot:last-child>tr:last-child td:last-child,.am-panel>.am-table:last-child>tfoot:last-child>tr:last-child th:last-child{border-bottom-right-radius:0}.am-panel>.am-panel-bd+.am-table{border-top:1px solid #ddd}.am-panel>.am-table>tbody:first-child>tr:first-child td,.am-panel>.am-table>tbody:first-child>tr:first-child th{border-top:0}.am-panel>.am-table-bd{border:0}.am-panel>.am-table-bd>tbody>tr>td:first-child,.am-panel>.am-table-bd>tbody>tr>th:first-child,.am-panel>.am-table-bd>tfoot>tr>td:first-child,.am-panel>.am-table-bd>tfoot>tr>th:first-child,.am-panel>.am-table-bd>thead>tr>td:first-child,.am-panel>.am-table-bd>thead>tr>th:first-child{border-left:0}.am-panel>.am-table-bd>tbody>tr>td:last-child,.am-panel>.am-table-bd>tbody>tr>th:last-child,.am-panel>.am-table-bd>tfoot>tr>td:last-child,.am-panel>.am-table-bd>tfoot>tr>th:last-child,.am-panel>.am-table-bd>thead>tr>td:last-child,.am-panel>.am-table-bd>thead>tr>th:last-child{border-right:0}.am-panel>.am-table-bd>tbody>tr:first-child>td,.am-panel>.am-table-bd>tbody>tr:first-child>th,.am-panel>.am-table-bd>thead>tr:first-child>td,.am-panel>.am-table-bd>thead>tr:first-child>th{border-bottom:0}.am-panel>.am-table-bd>tbody>tr:last-child>td,.am-panel>.am-table-bd>tbody>tr:last-child>th,.am-panel>.am-table-bd>tfoot>tr:last-child>td,.am-panel>.am-table-bd>tfoot>tr:last-child>th{border-bottom:0}.am-panel>.am-list{margin:0}
	.am-table td,.am-table th{background-color:#fff!important}.am-table{border-collapse:collapse!important}
	.am-table-bordered td,.am-table-bordered th{border:1px solid #ddd!important}
	.am-table-bordered{border:1px solid #ddd;border-left:none}.am-table-bordered>tbody>tr>td,.am-table-bordered>tbody>tr>th,.am-table-bordered>tfoot>tr>td,.am-table-bordered>tfoot>tr>th,
	.am-table-bordered>thead>tr>td,.am-table-bordered>thead>tr>th{border-left:1px solid #ddd}.am-table-bordered>tbody>tr:first-child>td,.am-table-bordered>tbody>tr:first-child>th{border-top:none}.am-table-bordered>thead+tbody>tr:first-child>td,.am-table-bordered>thead+tbody>tr:first-child>th{border-top:1px solid #ddd}
	.am-table-hover>tbody>tr:hover>td,.am-table-hover>tbody>tr:hover>th{background-color:#e9e9e9}
	.money_n {font-size: 23px; font-weight: bold; color: #000;}
   .pk_blue {font-size: 20px;font-weight: bold; color: #0072E3;}
  .pk_pink {font-size: 20px;font-weight: bold;color: #F00078;}
  .pcdd { width: 30px; height: 30px;float: left;line-height: 30px;color: #fff;background-color: #0099FF;font-weight: normal;font-size: 20px; text-align: center;
    font-weight: bold; border-radius: 14px; margin: 0 10px 2px 0;text-align: center;
    text-shadow: #000 1px 0 0, #000 0 1px 0, #000 -1px 0 0, #000 0 -1px 0;-webkit-text-shadow: #000 1px 0 0, #000 0 1px 0, #000 -1px 0 0, #000 0 -1px 0;-moz-text-shadow: #000 1px 0 0, #000 0 1px 0, #000 -1px 0 0, #000 0 -1px 0;*filter: Glow(color=#000, strength=1);
  }
   .pk_he {font-size: 20px; font-weight: bold; color: cornflowerblue;}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script><%-- 
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/dan/dandd.css"> --%>
</head>
<body>
	<ul class="nav nav-tabs">
		<c:forEach items="${gameRooms}" var="gameRoom" varStatus="status">
		<c:choose>
  	 		<c:when test="${roomhao== gameRoom.roomnumber}">  
         		<li class="active"><a href="${ctx}/currentstatistics/gameCurrentStatistics/listRoom?roomnum=${gameRoom.roomnumber}">${gameRoom.name}</a></li> 
   			</c:when>
   			<c:otherwise> 
    			<li ><a href="${ctx}/currentstatistics/gameCurrentStatistics/listRoom?roomnum=${gameRoom.roomnumber}">${gameRoom.name}</a></li>
   			</c:otherwise>

		</c:choose>
		
		</c:forEach>
		
		<shiro:hasPermission name="currentstatistics:gameCurrentStatistics:edit"><li><a href="${ctx}/currentstatistics/gameCurrentStatistics/form">当期统计添加</a></li></shiro:hasPermission>
	</ul>
	
	
	<div class="table table-striped  " id="tab4">
	<table style="border: 0"  class="am-table am-table-bordered am-table-hover am-table-compact"> 
	<tr>
	<td>	
	<table class="am-table am-table-bordered am-table-hover am-table-compact" style="">
										<thead>
										  <tr>
											<th style="text-align:center" colspan="4">特码</th>
											<th style="text-align:center" colspan="2">双面</th>
											<th style="text-align:center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;极值&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
											<th style="text-align:center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;组合&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
											<th style="text-align:center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特殊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
											<th style="text-align:center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;波色&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
										  </tr>
										</thead>
										<tbody align="center" id="xy28List">             
										  <tr>
											<td style="width:30px"><span class="pcdd">0</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">1</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_pink">大</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td  class="pk_pink">极大</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_pink">大单</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_he">对子</td>
											<td>
											  <span class="money_n">0</span>                </td>
											  <td class="pk_he">红波</td>
											<td>
											  <span class="money_n">0</span>                </td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">2</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">3</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">小</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">极小</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">小单</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_he">豹子</td>
											<td>
											  <span class="money_n">0</span>                </td>
											  <td class="pk_he">蓝波</td>
											<td>
											  <span class="money_n">0</span>                </td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">4</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">5</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_pink">单</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td class="pk_pink">大双</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_he">顺子</td>
											<td>
											  <span class="money_n">0</span>                </td>
											  <td class="pk_he">绿波</td>
											<td>
											  <span class="money_n">0</span>                </td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">6</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">7</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td class="pk_blue">双</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td class="pk_blue">小双</td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">8</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">9</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="pk_blue">期数:</td>
											<td colspan="3"  style="text-align:right" class="money_n">D20220期</td>
											<!-- <td></td> -->
											
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">10</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">11</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="pk_blue">下注人数:</td>
											<td colspan="3" style="text-align:right" class="money_n">221人</td>
											<!-- <td></td> -->
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">12</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">13</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="pk_blue">下注总额:</td>
											<td colspan="3" style="text-align:right" class="money_n">22111.22￥</td>
											<!-- <td></td> -->
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">14</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">15</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">16</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">17</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">18</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">19</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">20</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">21</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">22</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">23</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">24</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">25</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
										  <tr>
											<td style="width:30px"><span class="pcdd">26</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td style="width:30px"><span class="pcdd">27</span></td>
											<td>
											  <span class="money_n">0</span>                </td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										  </tr>
							</tbody>
									  </table></td>
	<td>  
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				
				
				<th>用户名</th>
				<th>昵称</th>
				<th>大</th>
				<th>单</th>
				<th>双</th>
				<th>小</th>
				<th>大单</th>
				<th>大双</th>
				<th>小单</th>
				<th>小双</th>
				<th>极大</th>
				<th>极小</th>
				<th>红波</th>
				<th>蓝波</th>
				<th>绿波</th>
				<th>豹子</th>
				<th>顺子</th>
				<th>对子</th>
				<th>特码0</th>
				<th>特码1</th>
				<th>特码2</th>
				<th>特码3</th>
				<th>特码4</th>
				<th>特码5</th>
				<th>特码6</th>
				<th>特码7</th>
				<th>特码8</th>
				<th>特码9</th>
				<th>特码10</th>
				<th>特码11</th>
				<th>特码12</th>
				<th>特码13</th>
				<th>特码14</th>
				<th>特码15</th>
				<th>特码16</th>
				<th>特码17</th>
				<th>特码18</th>
				<th>特码19</th>
				<th>特码20</th>
				<th>特码21</th>
				<th>特码22</th>
				<th>特码23</th>
				<th>特码24</th>
				<th>特码25</th>
				<th>特码26</th>
				<th>特码27</th>
				<shiro:hasPermission name="gameuserbet:gameuserBet:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameuserBet">
			<tr>
				
				
				<td>
					${gameuserBet.username}
				</td>
				<td>
					${gameuserBet.nickname}
				</td>
				<td>
					${gameuserBet.userDa}
				</td>
				<td>
					${gameuserBet.userDan}
				</td>
				<td>
					${gameuserBet.userShuang}
				</td>
				<td>
					${gameuserBet.userXiao}
				</td>
				<td>
					${gameuserBet.userDadan}
				</td>
				<td>
					${gameuserBet.userDashuang}
				</td>
				<td>
					${gameuserBet.userXiaodan}
				</td>
				<td>
					${gameuserBet.xiaoshuang}
				</td>
				<td>
					${gameuserBet.userJida}
				</td>
				<td>
					${gameuserBet.userJixiao}
				</td>
				<td>
					${gameuserBet.userHongbo}
				</td>
				<td>
					${gameuserBet.userLanbo}
				</td>
				<td>
					${gameuserBet.userLvbo}
				</td>
				<td>
					${gameuserBet.userBaizi}
				</td>
				<td>
					${gameuserBet.userShunzi}
				</td>
				<td>
					${gameuserBet.userDuizi}
				</td>
				<td>
					${gameuserBet.userTema0}
				</td>
				<td>
					${gameuserBet.userTema1}
				</td>
				<td>
					${gameuserBet.userTema2}
				</td>
				<td>
					${gameuserBet.userTema3}
				</td>
				<td>
					${gameuserBet.userTema4}
				</td>
				<td>
					${gameuserBet.userTema5}
				</td>
				<td>
					${gameuserBet.userTema6}
				</td>
				<td>
					${gameuserBet.userTema7}
				</td>
				<td>
					${gameuserBet.userTema8}
				</td>
				<td>
					${gameuserBet.userTema9}
				</td>
				<td>
					${gameuserBet.userTema10}
				</td>
				<td>
					${gameuserBet.userTema11}
				</td>
				<td>
					${gameuserBet.userTema12}
				</td>
				<td>
					${gameuserBet.userTema13}
				</td>
				<td>
					${gameuserBet.userTema14}
				</td>
				<td>
					${gameuserBet.userTema15}
				</td>
				<td>
					${gameuserBet.userTema16}
				</td>
				<td>
					${gameuserBet.userTema17}
				</td>
				<td>
					${gameuserBet.userTema18}
				</td>
				<td>
					${gameuserBet.userTema19}
				</td>
				<td>
					${gameuserBet.userTema20}
				</td>
				<td>
					${gameuserBet.userTema21}
				</td>
				<td>
					${gameuserBet.userTema22}
				</td>
				<td>
					${gameuserBet.userTema23}
				</td>
				<td>
					${gameuserBet.userTema24}
				</td>
				<td>
					${gameuserBet.userTema25}
				</td>
				<td>
					${gameuserBet.userTema26}
				</td>
				<td>
					${gameuserBet.userTema27}
				</td>
				<shiro:hasPermission name="gameuserbet:gameuserBet:edit"><td>
    				<a href="${ctx}/gameuserbet/gameuserBet/form?id=${gameuserBet.id}">修改</a>
					<a href="${ctx}/gameuserbet/gameuserBet/delete?id=${gameuserBet.id}" onclick="return confirmx('确认要删除该用户投注记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table></td>
	</tr>
	</table>
                          		
									
                           		</div>

				        				
	<sys:message content="${message}"/>
	
	
</body>
</html>