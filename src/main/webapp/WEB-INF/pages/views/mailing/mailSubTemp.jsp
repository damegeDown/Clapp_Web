<!DOCTYPE HTML>
<HTML><HEAD><TITLE>Testing Anywhere, CLAPP</TITLE>
    <META content="text/html; charset=ks_c_5601-1987" http-equiv=Content-Type>
    <STYLE type=text/css>
        a, td { color: #444444; font-family: "gulim"; font-size: 12px; }
        a:link, a:visited, a:active { color: #444444; text-decoration: none; }
        a:hover { color: #fe8500; text-decoration: underline; }
        img {display: block;}
    </STYLE>
</HEAD>
<BODY>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F5F7">
    <tr>
        <td><img src="$contextPath/resources/images/ecrm_top.png" alt="" width="700" height="80" border="0" usemap="#Map"/></td>
    </tr>
    <tr>
        <td style="padding-top:30px; padding-bottom:30px; text-align:center;">
            <table width="630" align="center" border="0" cellspacing="0" cellpadding="0" style="background:#fff;">
                <tr>
                    <td style="TEXT-ALIGN: left; PADDING-BOTTOM: 20px; LINE-HEIGHT: 21px; PADDING-LEFT: 25px; PADDING-RIGHT: 15px; FONT-FAMILY: gulim,굴림; COLOR: #444; FONT-SIZE: 12px; PADDING-TOP: 20px"><B>
                        <FONT color=#3369d8>
                            <SPAN style="FONT-SIZE: 14px;">$userName </SPAN></FONT>
                        <SPAN style="FONT-SIZE: 14px;">회원님,</SPAN></B><BR><BR>
                        신청하신 유료 서비스의 결제가 정상적으로 완료되어, 서비스 이용이 가능합니다.<BR>
                        상세 내역은 아래와 같습니다.
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="PADDING-BOTTOM: 0px; PADDING-LEFT: 35px; PADDING-RIGHT: 35px; PADDING-TOP: 0px;">
            $contents.mailContent
        </td>
    </tr>
    <tr>
    <tr>
        <td vAlign="bottom" colSpan="3" align="center" style="padding-top:20px;">
            <table width="346" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="173" rowspan="2" scope="col"><a href="http://www.clapp.co.kr/mobileTesting/mobileTestingMain" target="_blank"><img src="$contextPath/resources/images/ecrm_04_pay_card_hp_bt01.png" width="171" height="59" border="0" alt=""/></a></th>
                </tr>

                <tr>
                    <td><a href="http://www.clapp.co.kr/clappTesting/autoMain" target="_blank"><img src="$contextPath/resources/images/ecrm_04_pay_card_hp_bt02.png" width="171" height="59" border="0" alt=""/></a></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="50">
        </td>
    </tr>
    <tr>
        <td><img src="$contextPath/resources/images/ecrm_bottom.png" alt="" width="700" height="312" border="0" usemap="#Map2"/></td>
    </tr>
</table>

<map name="Map">
    <area shape="rect" coords="2,2,196,79" href="http://www.clapp.co.kr" target="_blank">
    <area shape="rect" coords="426,36,488,79" href="http://www.clapp.co.kr" target="_blank">
    <area shape="rect" coords="618,38,698,79" href="http://www.clapp.co.kr/introduction/supportCustomerList" target="_blank">
    <area shape="rect" coords="486,37,554,80" href="http://www.clapp.co.kr/myClapp/myTicket" target="_blank">
    <area shape="rect" coords="553,38,619,79" href="http://www.clapp.co.kr/product/productList" target="_blank">
</map>

<map name="Map2">
    <area shape="rect" coords="19,25,351,119" href="http://www.clapp.co.kr/serviceinfo/infoMain" target="_blank">
    <area shape="rect" coords="350,26,683,119" href="http://www.clapp.co.kr/product/productList" target="_blank">
    <area shape="rect" coords="2,137,156,310" href="http://www.clapp.co.kr" target="_blank">
    <area shape="rect" coords="155,137,698,222" href="http://www.clapp.co.kr/introduction/supportCustomerList" target="_blank">
</map>
</BODY></HTML>

