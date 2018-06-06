<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>会员注册</title>
		<meta name="Keywords" content="关键字">
		<meta name="Description" content="描述文字">
		<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/webpage/jsp/denglu/css/standard-head.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/webpage/jsp/denglu/css/simple-header-footer.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/webpage/jsp/denglu/css/member_register.css">
		<link rel="stylesheet" type="text/css" media="all" href="<%=path %>/webpage/jsp/denglu/css/protocol.css">
		<link rel="stylesheet" type="text/css" href="<%=path %>/webpage/jsp/denglu/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=path %>/webpage/jsp/denglu/css/loginHead.css"/>
		<script type="text/javascript" src="<%=path %>/webpage/jsp/common/js/jquery-1.8.3.min.js"></script>
  	 	<script type="text/javascript" src="<%=path %>/webpage/jsp/denglu/js/zhuceLc.js"></script>
   	
   	<script type="text/javascript">  
    // 刷新图片  
    function changeImg() {  
        var imgSrc = $("#imgObj");  
        var src = imgSrc.attr("src");  
        imgSrc.attr("src", changeUrl(src));  
    }  
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳  
    function changeUrl(url) {  
        var timestamp = (new Date()).valueOf();  
        var index = url.indexOf("?",url);  
        if (index > 0) {  
            url = url.substring(index, url.indexOf(url, "?"));    
        }  
        if ((url.indexOf("&") >= 0)) {  
            url = url + "×tamp=" + timestamp;  
        } else {  
            url = url + "?timestamp=" + timestamp;  
        }  
        return url;  
    }  
</script>  
   	</head>
	<body>
		<div style="width: 100%;height: 66px;margin-bottom: 100px;box-shadow: 0px 0px 14px 0px #ddd;">
			<div class="css_home_link clearfix">
				<a href="<%=path %>/webpage/jsp/wanjia.jsp" class="wanjia-link"><img src="/webpage/jsp/common/images/mm-logo.png"/></a>
				<h1>会员注册</h1>
				<span style="display: inline-block;float: right;" onclick="window.location.href=<%=path%>/webpage/jsp/denglu/dl.jsp">已有账号？<a style="color: #F94E46;" href="<%=path%>/webpage/jsp/denglu/dl.jsp">请登陆&nbsp;></a></span>
			</div>
		</div>
		
		<!-- 头部：登录／注册通用 -->
		<div class="mainbody">
			<div class="register">
				
					<input type="hidden" name="uuid" value="">
					<input type="hidden" name="fb" value="">
					<input type="hidden" name="invateId" value="">
					<div class="css_register_main">
						<div id="validationSuccess" class="validation_summary success" style="display:none">
							<em></em><span>验证码已发送到您手机，1分钟内输入有效。</span>
						</div>
						<div id="validationError" class="validation_summary error" style="display:none">
							<em></em><span id="errorMsg">账户名或密码输入错误。</span>
						</div>
						<ul>
							<li>
								<span class="input_icon"></span>
								<input type="text" id="mobileNum" name="mobileNum" maxlength="11" placeholder="手机号">
								<em id="validateMobileEm" class="valid fail" style="display: none"></em>
							</li>
							<li>
								<span class="input_icon captcha_icon"></span>
								<input type="text" id="picCheck" name="picCheck" maxlength="6" placeholder="请输入右侧验证码">
								<div class="captcha"><img id="imgObj" alt="验证码" onclick="changeImg()" src="<%=path %>/api/article/validateCode.do" /></div>
							</li>
							<li class="dynamic_code">
								<span class="input_icon yzm_icon"></span>
								<input type="text" maxlength="6" placeholder="短信验证码" id="mobileCheckNum" name="mobileCheckNum" style="color: rgb(133, 133, 133);">
								<span class="send-code" id="send-code">点击获取</span>
							</li>
							<li>
								<span class="input_icon pwd_icon"></span>
								<!--  解决验证码自动填充的问题 -->
								<input type="password" style="display:none">
								<input type="password" maxlength="16" placeholder="设置密码" id="password" name="password">
								<em id="validatePasswordEm" class="valid fail" style="display: none"></em>
							</li>
						</ul>

						<div class="read clearfix">
							<input id="submitRegisterInfo" name="submitRegisterInfo" type="submit" value="接受协议并注册" class="btn_sub">
							<label class="left"><input id="agreementCheckbox" type="checkbox" class="agree" checked="">我已阅读并同意</label>
							<a class="left" href="###" id="user_registered">《医疗超市用户注册协议》</a>
						</div>

						<div class="switch_clinic clearfix">
							<!--<a class="left" href="###">切换成医疗机构注册&nbsp;&gt;</a>-->
						</div>
					</div>

			</div>

			<!-- 用户协议弹窗 -->
			<div id="protocol">
				<div class="title clearfix">
					<p><b class="sc_list">医疗超市平台注册、使用服务协议（用户版）</b></p>
					<a href="javascript:" class="close" id="ou_dtgb">X</a>
				</div>
				<!-- 普通会员 -->
				<div class="pop_bd normal" style="overflow: hidden;">
					<div class="clause_wrap">
						<div class="clause_box" id="regprotocolContent">
							<p class="sc_con"><b class="sc_list">本协议是您（以下或称用户）</b>与<b class="sc_list">医疗超市（以下简称：“医疗”）</b>就您注册、使用医疗服务平台所订立的协议。请您在申请成为医疗服务平台注册用户之前，仔细阅读<b class="sc_list">本协议及附件</b>的全部内容（特别是以<b class="sc_list">粗体标注的内容</b>以及<b class="sc_list">免责条款），如您对本协议的任何条款有异议，请不要继续注册操作。</b></p>
							<p class="sc_con">您在注册过程中，根据声音、文字或图形提示<b class="sc_list">点选“同意”按钮的，即视为您已仔细阅读本协议的全部内容，并同意接受本协议项下的所有条款之约束。</b></p>
							<p class="sc_con">在您申请成为医疗服务平台注册用户后，医疗仍有权修改本协议相关服务条款并在平台予以公示。<b class="sc_list">如果用户不同意修改后的服务条款，应当立即停止使用医疗提供的服务，并注销账号。如果用户继续使用医疗提供的服务，则表示用户对修改后相关服务条款予以接受。</b></p>
							<p class="sc_con"><b class="sc_list">特别提醒：</b></p>
							<p class="sc_con"><b class="sc_list">用户因接受医疗机构发布信息或提供的服务而引起的纠纷或发生医疗事故，由医疗机构负责解决并承担相应的法律责任，医疗对此不承担任何形式的法律责任，用户应直接向医疗机构要求赔偿或对其提起诉讼，不得向医疗主张任何权益。</b></p>
							<p class="sc_con"><b class="sc_list">在任何情况下，医疗对于用户因本协议引起的任何间接的、惩罚性的、特殊的及派生的损失（包括业务损失、收益损失、利润损失、商誉损失、使用数据或其他经济利益的损失），均不负有任何责任，即使事先已被告知此等损失的可能性。</b></p>
							<p class="sc_con"><b class="sc_list">医疗服务平台</b>：包括但不限于医疗网站平台、移动客户端（APP）及其他现在或将来推出的基于医疗提供相关服务的平台，以下统称“平台”。</p>
							<p class="sc_list" style="text-align: center">（一）平台注册规范</p>
							<p class="sc_con"><b class="sc_list">1.1 申请注册条件</b></p>
							<p class="sc_con">1.1.1用户申请成医疗服务平台注册用户，须满足以下条件：</p>
							<p class="sc_con">1) 若用户为自然人用户。则用户应年满18周岁，且必须得具有完全民事权利能力和完全民事行为能力</p>
							<p class="sc_con">2) 若用户为企业用户，包括但不限于企业法人、事业单位、社团机构等非自然人用户，则用户为根据中国法律合法组建并有效存续、合法经营的机构，且具有行使民事权利和承担民事义务的能力和资格。 </p>
							<p class="sc_con"><b class="sc_list">1.2 用户资料提交</b> </p>
							<p class="sc_con">1.2.1 自然人用户应根据本协议向医疗提交用户名、密码、身份证号码、手机号码、邮箱等用户资料或其他相关信息。企业用户应根据本协议提供用户名、密码、统一信用证或其他机构证明、联系方式等用户资料或其他相关信息。</p>
							<p class="sc_con">1.2.2 用户保证向医疗提供的上述资料或其他相关信息<b class="sc_list">真实、合法、准确、详尽</b>，并保证上述资料或其他相关信息发生任何变更时，将及时进行更新。</p>
							<p class="sc_con">1.3用户申请注册，应遵守法律法规、社会主义制度、国家利益、公民合法权益、公共秩序、社会道德风尚和信息真实性等“七条底线”。</p>
							<p class="sc_con">1.4用户申请注册的用户名和昵称中不能含有威胁、淫秽、侮辱及谩骂等其他侵害他人正当权益的内容。</p>
							<p class="sc_list" style="text-align: center">（二）平台使用规范</p>
							<p class="sc_con"><b class="sc_list">2.1用户在使用注册账号时，不得有下列行为：</b></p>
							<p class="sc_con">2.1.1违反宪法或法律规定；</p>
							<p class="sc_con">2.1.2危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一；</p>
							<p class="sc_con">2.1.3损害国家荣誉和利益，损害公共利益；</p>
							<p class="sc_con">2.1.4煽动民族仇恨、民族歧视，破坏民族团结；</p>
							<p class="sc_con">2.1.5破坏国家宗教政策，宣扬邪教和封建迷信；</p>
							<p class="sc_con">2.1.6散布谣言，扰乱社会秩序，破坏社会稳定；</p>
							<p class="sc_con">2.1.7散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪；</p>
							<p class="sc_con">2.1.8侮辱或者诽谤他人，侵害他人合法权益；</p>
							<p class="sc_con">2.1.9含有法律、行政法规禁止的其他内容。</p>
							<p class="sc_con"><b class="sc_list">2.2用户应保证在平台上发布信息的真实性、合法性和有效性。</b>不得发布任何侵犯他人著作权、商标权等知识产权或合法权利的内容；不得发布任何违反《广告法》或构成不正当竞争行为的内容；<b class="sc_list">用户须对发布在平台上的任何言论和行为承担全部法律责任。</b></p>
							<p class="sc_con">2.3用户不得利用医疗用户身份进行任何违反诚信的行为，包括但不限于：炒作医疗机构，并向医疗机构收取费用或获取利益；为获得利益或好处，参与或组织撰写及发布虚假信息；以给予负面评价为手段威胁医疗机构，要求医疗机构提供额外的利益或好处；进行其他其它影响信息真实性、客观性、扰乱平台正常秩序的违规行为。</p>
							<p class="sc_con">2.4用户应对在使用医疗提供的服务过程中所获知的各项保密信息，承担严格的保密义务，直至保密信息进入公共领域时止。</p>
							<p class="sc_con">2.5用户不得将涉及医疗纠纷的问题或其它有责任争议的问题在平台上进行发布。关于医疗纠纷的问题，应另行咨询律师或有关部门寻求援助，医疗有权将此类信息删除。</p>
							<p class="sc_con">2.6用户应及时关注并遵守平台上不时公布或修改的各类合法规则规定。</p>
							<p class="sc_con">2.7<b class="sc_list">用户应严格规范账号使用人的行为，企业用户账号管理者使用账号的行为视为企业用户行为，对于企业账号的一切行为，由企业用户承担一切法律责任和后果。</b></p>
							<p class="sc_list" style="text-align: center">（三）用户授权</p>
							<p class="sc_con"><b class="sc_list">用户完全理解并不可撤消的授予医疗如下权利：</b></p>
							<p class="sc_con"><b class="sc_list">3.1医疗有权在对外宣传中免费、合理地使用用户肖像权，以展示医疗为用户提供的服务。</b></p>
							<p class="sc_con">3.2医疗有权通过短信、邮件、电话或其他形式向与用户传送平台提供的服务信息及其他相关商业信息。</p>
							<p class="sc_con"><b class="sc_list">3.3用户信息授权</b></p>
							<p class="sc_con"><b class="sc_list">3.3.1为向用户提供慢病管理等服务，用户委托授权平安集团为其建立健康档案并储存其个人信息、电子病历等信息，方便用户查阅及管理。</b></p>
							<p class="sc_con"><b class="sc_list">3.3.2用户授权平安集团，除法律另有规定之外，将用户提供给医疗的信息、享受平安集团服务产生的信息以及平安集团根据本条约定查询、收集的信息，用于以下用途：</b></p>
							<p class="sc_con"><b class="sc_list">3.3.2.1按照国家卫生管理要求，对各级卫生管理系统，向各级卫生主管部门提供、查询、收集用户的信息；</b></p>
							<p class="sc_con"><b class="sc_list">3.3.2.2平安集团及其因服务必要委托的合作伙伴为用户提供服务、推荐产品、开展市场调查与信息数据分析；</b></p>
							<p class="sc_con"><b class="sc_list">3.3.2.3除法律另有规定之外，基于为用户提供更优质服务和产品的目的，向平安集团因服务必要开展合作的伙伴提供、查询、收集用户的信息；</b></p>
							<p class="sc_con"><b class="sc_list">3.3.2.4其他法律法规允许的情形。</b></p>
							<p class="sc_con"><b class="sc_list">3.3.3本条所称“信息”，包括但不限于用户及其家属的姓名、身份证件号码、通信通讯联系方式、地址、健康生理信息、体检信息、咨询信息、就诊记录、病历等能够识别特定个人身份或反映个人活动情况的信息。但经过处理无法识别特定个人且不能复原的信息除外。</b></p>
							<p class="sc_con"><b class="sc_list">3.3.4为确保用户信息的安全，医疗及其合作伙伴对上述信息负有保密义务，通过内部安全管理规范、技术手段、加密处理等各种措施保证信息安全，且承诺不对用户信息进行出售、交换、篡改、毁损等非法处理。</b></p>
							<p class="sc_con"><b class="sc_list">3.3.5本条款自本协议签署时生效，具有独立法律效力，不受本协议成立与否及效力状态变化的影响。</b></p>
							<p class="sc_con"><b class="sc_list">3.3.6本条所称“平安集团”是指中国平安保险（集团）股份有限公司及其直接或间接控股公司，以及中国平安保险（集团）股份有限公司直接或间接作为其单一最大股东的公司。</b></p>
							<p class="sc_con"><b class="sc_list">3.3.7如用户不同意上述授权条款的部分或全部内容，可〔致电客服热线027-83922113〕取消或变更授权。</b></p>
							<p class="sc_con"><b class="sc_list">3.4就用户向医疗机构咨询的内容，医疗有权在隐去个人信息后进行使用、复制、公开、编辑、出版、发行等。</b></p>
							<p class="sc_con"><b class="sc_list">3.5 医疗有权保留并使用用户在平台上的历史服务数据。即使医疗已经暂停、终止向用户继续提供服务。</b></p>
							<p class="sc_con"><b class="sc_list">3.6 医疗有权在自营或实际控制的任何网站上公示用户的违约情况（即违反本协议或与医疗达成的其他协议约定）。</b></p>
							<p class="sc_list" style="text-align: center">（四）免责条款</p>
							<p class="sc_con">4.1鉴于网络服务的特殊性，医疗不对用户所发布信息的删除或储存失败负责。同时，医疗不承诺网络服务一定能满足用户的要求，也不承诺网络服务不会中断，<b class="sc_list">对网络服务的及时性、稳定性不作任何承诺。</b></p>
							<p class="sc_con"><b class="sc_list">4.2医疗需要定期或不定期地对提供网络服务的平台或相关的设备进行检修和维护，</b>如因此类情况而造成网络服务中断的，则医疗无需为此向用户承担任何责任，但会尽可能事先进行通告。</p>
							<p class="sc_con">4.3医疗积极采用数据备份加密等措施保障用户数据的安全，但不对因意外因素（包括但不限于黑客攻击等）导致的数据损失和泄漏负责。同时，对于因台风、地震、海啸、洪水、停电、战争、恐怖袭击等不可抗力因素或医疗不能控制的原因（包括但不限于电信部门技术调整或故障等甲方无法预见的原因等）造成的网络服务中断或其它缺陷，医疗不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</p>
							<p class="sc_con"><b class="sc_list">4.4医疗工作人员，只在经医疗盖章的合同或文件中，享有代表医疗的有限代理权。未经医疗盖章认可的行为均属个人行为，医疗不予承认并不承担由此产生的任何法律责任。</b></p>
							<p class="sc_con"><b class="sc_list">4.5本平台所有医疗保健及药品信息等仅供参考，不作为诊疗、用药依据，具体诊疗及用药事宜，请遵医嘱或在药师指导下进行。</b></p>
							<p class="sc_list" style="text-align: center">（五）知识产权保护</p>
							<p class="sc_con"><b class="sc_list">5.1 用户接受本协议，即表明用户主动将其在任何时间段在平台发表的任何形式的信息的著作财产权，</b>包括并不限于：复制权、发行权、出租权、展览权、表演权、放映权、广播权、信息网络传播权、摄制权、改编权、翻译权、汇编权等，以及应当由著作权人享有的其他可转让权利无偿独家转让给医疗，同时表明用户许可医疗有权利就任何主体侵权而单独提起诉讼，并获得全部赔偿。</p>
							<p class="sc_con">5.2除平台内转载的属于第三方所发布的信息之外，平台内的所有内容、资源及其他信息（包括但不限于文字、图像、图片、照片、音频、视频、图表、色彩、版面设计、电子文档）的所有知识产权（包括但不限于版权、商标权、专利权、商业秘密等）及相关权利，均归医疗（或医疗关联公司）所有。未经医疗许可，用户不得擅自使用（包括但不限于复制、传播、展示、镜像、上载、下载）。</p>
							<p class="sc_con"><b class="sc_list">5.3医疗的企业名称、字号、商标、平台的Logo（包括文字、图形及其组合等）、互联网域名以及平台的其他标识、产品和服务名称均为医疗（或医疗关联公司）所有。未经医疗书面授权，医疗机构不得以任何方式展示、使用、许可他人使用或作其他处理。</b></p>
							<p class="sc_list" style="text-align: center">（六）法律责任及管辖</p>
							<p class="sc_con"><b class="sc_list">6.1用户违反本协议约定的，则医疗有权采取一切必要的措施，包括但不限于：暂停、终止向用户提供服务等。如因此给医疗、合作方及医疗机构造成损失的，用户应予以全额赔偿（包括但不限于：案件受理费、案件处理费、保全费、鉴定费、评估费、执行费、律师费、差旅费等）。</b></p>
							<p class="sc_con">6.2本协议之效力、解释、执行和争议的解决均适用中华人民共和国之法律。如本协议之任何一部分与中华人民共和国法律相抵触，则该部分条款应按有关法律规定重新解释，部分条款之无效或重新解释不影响其它条款之法律效力。</p>
							<p class="sc_con">6.3因履行本协议所产生的纠纷，双方应协商解决。<b class="sc_list">协商不成，任何一方应将争议提交上海国际仲裁中心裁决。</b></p>
							<p class="sc_list" style="text-align: center">（七）其他规定</p>
							<p class="sc_con">7.1本协议构成双方对约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。</p>
							<p class="sc_con"><b class="sc_list">7.2本协议项下医疗对于用户所有的通知均可通过网页公告、电子邮件、手机短信或常规的信件传送等方式进行；该等通知于发送时即视为已送达给用户。</b></p>
							<p class="sc_con">7.3本协议中的标题仅为方便而设，不作为对标题下条款的解释</p>
							<p>
								<br>
							</p>
							<p>
								<br>
							</p>
							<p class="sc_list">附： 医疗服务平台简介</p>
							<p class="sc_con">1. 医疗将向用户提供平台技术服务，尽力维护平台的正常稳定运行，并努力提升和改进技术，对功能及服务进行更新、升级，不断提升平台性能和合作效率。
							</p>
							<p class="sc_con">2. 医疗将对平台医疗机构的团队、品牌、诊疗项目、设备环境、诊疗优势、各项医疗特色等向用户进行进行多方位的展示服务，以便用户能够便捷的进行网上查询和浏览。
							</p>
							<p class="sc_con">3. 医疗将提供一个开放的、透明的、可信赖的相互交流的医疗平台，便于用户和医疗机构之间、用户相互之间进行多方面的沟通。
							</p>
							<p>
								<br>
							</p>
						</div>
					</div>
					<div class="pop_btn">
						<a href="###" class="agree" id="checkTos">已阅读并同意协议</a>
					</div>
				</div>
			</div>
			<div class="transparent_bg"></div>
			<!-- end 用户协议弹窗 -->
		</div>
		<!-- 底部：登录／注册通用 -->
		<div class="footer">
			<div class="mainbody">
				<ul class="css_footer_wjinfo clearfix" id="aboutUl">
					<li class="css_nav_first">
						<a href="###">关于我们</a>
					</li>
					<li>
						<a href="###">联系我们</a>
					</li>
					<li>
						<a href="###">入驻平台</a>
					</li>
					<li>
						<a href="###">加入我们</a>
					</li>
					<li>
						<a href="###">版权声明</a>
					</li>
					<li>
						<a href="###">帮助中心</a>
					</li>
				</ul>
				<p class="css_footer_copyright">增值电信业务经营许可证：鄂B2-20100040 | 出版物经营许可证 | 鄂ICP备11014057号<br />Copyright(C) xx医疗 2000-2017 版权所有 |  客服热线：400-8876678</p>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$("#user_registered").click(function(){
					$("#protocol").css("display","block");
					$(".transparent_bg").css("display","block")
				})
				$(".close").click(function(){
					$("#protocol").css("display","none");
					$(".transparent_bg").css("display","none");
				})
				$("#checkTos").click(function(){
					$("#protocol").css("display","none");
					$(".transparent_bg").css("display","none");
				})
			})
			
		</script>
	</body>
</html>