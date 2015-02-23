<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Testing Anywhere, CLAPP</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<STYLE type=text/css>
a, td {
	color: #444444;
	font-family: "gulim";
	font-size: 12px;
}

a:link, a:visited, a:active {
	color: #444444;
	text-decoration: none;
}

a:hover {
	color: #fe8500;
	text-decoration: underline;
}
</STYLE>
</HEAD>
<BODY>
	<div style="width: 701px"> 
		<div style="width:701px">
			<span style="float: left">
				<a href="$contextPath/"  style="background: url('$action')">
					<img src="$contextPath/resources/images/ecrm_00_kv_logo.png" border="0" alt="클앱 홈으로 이동" width="425" height="80">
				</a>
			</span> 
			<span style="float: left; height:41px">
				<img src="$contextPath/resources/images/ecrm_00_kv_topimg.png" border="0" width="276" height="41" />
			</span> 
			<span style="float: left">
				<a href="$contextPath/">
					<img src="$contextPath/resources/images/ecrm_00_kv_gohome.png"border="0" width="62" height="39" alt="클앱 홈으로 이동">
				</a>
			</span> 
			<span style="float: left">
				<a href="$contextPath/myClapp/myTicket">
					<img	src="$contextPath/resources/images/ecrm_00_kv_myclapp.png" border="0" width="65" height="39" alt="마이 클앱">
				</a>
			</span> 
			<span style="float: left">
				<a href="$contextPath/product/productList">
					<img src="$contextPath/resources/images/ecrm_00_kv_product.png" border="0" width="62" height="39" alt="상품 안내">
				</a>
			</span> 
			<span style="float: left">
				<a href="$contextPath/introduction/supportCustomerList">
					<img src="$contextPath/resources/images/ecrm_00_kv_support.png" border="0" width="87" height="39" alt="고객 지원">
				</a>
			</span>
		</div>
		<div style="clear: both"></div>
		<div style="width:701px">
			<!-- 메일 내용 -->
			$contents.mailContent
			<!-- //메일 내용 -->
		</div>
		<div style="clear: both"></div>
		<div style="width:701px;padding:20px; height:200px">
			<span style="float: left">
				<a href="$contextPath/mobileTesting/mobileTestingMain/"> 
					<img src="$contextPath/resources/images/ecrm_00_banner_testing.png" width="334" height="189" border="0" alt="클앱 테스팅">
				</a>
			</span> 
			<span style="float: left">
				<a href="$contextPath/clappTesting/autoMain">
					<img src="$contextPath/resources/images/ecrm_00_banner_automation.png" width="330" height="97" border="0" alt="클앱 자동화">
				</a>
			</span> 
			<span style="float: left">
				<a href="$contextPath/clappConsulting/consulting">
					<img src="$contextPath/resources/images/ecrm_00_banner_consulting.png" width="330" height="92" border="0" alt="클앱 컨설팅">
				</a>
			</span>
			<div></div>
		</div>
		<div style="clear: both"></div>
		<div style="width:701px">
			<span style="float: left">
				<a href="$contextPath/">
					<img src="$contextPath/resources/images/ecrm_00_footer_logo.png" width="164" height="174" border="0" alt="클앱 홈으로 이동">
				</a>
			</span> 
			<span style="float: left; height:28px">
				<img src="$contextPath/resources/images/ecrm_00_footer_topimg.png" width="536" height="28" border="0">
			</span> 
			<span style="float: left; height:51px">
				<a href="$contextPath/introduction/supportCustomerList">
					<img src="$contextPath/resources/images/ecrm_00_footer_gosupport.png" width="536" height="51" border="0" alt="클앱 고객지원">
				</a>
			</span> 
			<span style="float: left; height:95px">
				<img src="$contextPath/resources/images/ecrm_00_footer_copyrights.png" width="536" height="95" border="0">
			</span>
		</div>
	</div>
</BODY>
</HTML>
