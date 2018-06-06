<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<form:form id="importForm" action="${ctx}/gameuser/gameUser/yueset?id=${gameUser.id}" method="post" 
			 onsubmit="loading('正在保存余额，请稍等...');"><br/>
			<div class="control-group">
			<label class="control-label">余额操作类型：</label>
				<%-- <form:input path="guessFlag" htmlEscape="false" maxlength="1" class="input-xlarge "/> --%>
				<div class="controls">
				<select name="setyuestyle" id="setyuestyle"   class="input-xlarge ">
					<option value="上分"  selected="selected">上分</option>
					<option value="下分"  selected="selected">下分</option>
					<option value="补分"  selected="selected">补分</option>
					<option value="扣分"  selected="selected">扣分</option>
					<option value="送分"  selected="selected">送分</option>
					<option value="回水"  selected="selected">回水</option>
					<option value="增加积分"  selected="selected">增加积分</option>
					<option value="减少积分"  selected="selected">减少积分</option>
				</select>
				</div>
		</div>
			<div class="control-group">
			<label class="control-label">余额：</label>
			<div class="controls">
				<input id="setyue" name="setyue" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		</form:form>
	
	
</body>
</html>