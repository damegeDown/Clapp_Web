<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="maGuide02ContentOneContainer">
    <div class="maGuide02COCMainBox">
        <div class="maGuide02COCMainTitle">
            <span>프로그램 시작하기</span>
        </div>
        <div class="maGuide02COCMainDesc">
            <p>
                Clapp Automation 툴의 다양한 기능을 이용하려면 Clapp 홈페이지(http://www.clapp.co.kr)에 회원가입이 필요 합니다.<br>
                회원가입 시 원격 디바이스를 통한 테스트를 진행할 수 있으며, 서버를 통해 Script 및 테스트 관리가 가능합니다.<br>
            </p>
        </div>
    </div><!-- .maGuide02COCMainBox End -->
</div><!-- .maGuide02ContentOneContainer End -->

<div class="maGuide02ContentTwoContainer">
    <div class="maGuide02CTCBox01">
        <div class="maGuide02CTCContBox">
            <div class="maGuide02CTCContOneBox">
                <div class="maGuide02CTCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_01.png" alt="01">
                    <div class="maGuide02CTCContOneTitle">사용 환경
                    </div>
                </div>
                <div class="maGuide02CTCContOneDesc">
                    <p>
                        Clapp Automation 툴을 사용하기 위해서는 Java 1.7 버전 이상이 설치되어 있어야 합니다.<br>
                        Java가 설치되어 있지 은 경우 다운로드 이이지(http://java.com/ko/download/)를 통해 설치할 있습니다.
                    </p>
                </div>
            </div><!-- .maGuide02CTCContOneBox End -->
            <div class="maGuide02CTCContTwo">
                <div class="maGuide02CTCContTwoBox">
                    <div class="maGuide02CTCContTwoNum">
                        <img src="${contextPath }/resources/images/popup_mag_num_02.png" alt="02">
                        <div class="maGuide02COCContTwoTitle">
                            <span>회원 가입하기</span>
                        </div>
                    </div>
                    <div class="maGuide02CTCContTwoDesc">
                        <p>
                            1. Clapp 홈페이지(http://www.clapp.co.kr)에 접속 합니다.<br>
                            2. ‘클앱 가입’을 선택 합니다.
                        </p>
                    </div>
                    <div class="maGuide02CTCContTwoDesc2">
                        <p>
                            3. 가입 양식을 작성한 후 오른쪽 하단의 ‘클앱 가입’ 버튼을 <br>
                            　선택합니다.
                        </p>
                    </div>
                    <div class="maGuide02CTCContTwoDesc3">
                        <p>
                            4. 가입승인 요청 접수 메시지를 확인하면 회원 가입 신청이 <br>
                            　완료 됩니다.
                        </p>
                    </div>
                    <div class="maGuide02CTCContTwoDesc4">
                        <p>
                            5. 가입 시 입력한 이메일을 통해 가입승인 접수 완료 메일을<br>
                            　확인 합니다.</p>
                    </div>
                    <div class="maGuide02CTCContTwoDesc5">
                        <p>
                            6. 가입 승인 메일을 확인하면 회원 가입이 완료됩니다.<br>
                            　가입이 완료되면 Clapp 서비스 및 자동화 테스트 <br>
                            　프로그램의 다양한 기능을 이용할 수 있습니다.
                        </p>
                    </div>
                </div><!-- .maGuide02CTCContTwoBox End -->
                <div class="maGuide02CTCContTwoBox2">
                    <div class="maGuide02CTCContTwoimg">
                        <img src="images/popup_tag_cont_01.png"></div>
                    <div class="maGuide02CTCContTwoimg2">
                        <img src="images/popup_tag_cont_02.png"></div>
                    <div class="maGuide02CTCContTwoimg3">
                        <img src="images/popup_tag_cont_03.png"></div>
                    <div class="maGuide02CTCContTwoimg4">
                        <img src="images/popup_tag_cont_04.png"></div>
                </div>
            </div><!-- .maGuide02CTCContTwo End -->

            <div class="maGuide02CTCContThreeBox">
                <div class="maGuide02CTCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_03.png" alt="03">
                    <div class="maGuide02CTCContThreeTitle">
                        <span>로그인하기</span>
                    </div>
                </div>
                <div class="maGuide02CTCContThreeDesc">
                    <p>Clapp 홈페이지의 회원이면 Clapp Automation 툴에서 <br>
                        로그인을 할 수 있습니다.<br>
                        Clapp Automation 툴을 실행하면 로그인 창이 나타납니다.
                    </p>
                </div>
                <div class="maGuide02CTCContThreeCont">
                    <ul>
                        <li><span>&middot;</span>회원 가입 시 작성한 이메일 주소와 비밀번호를 입력한 다음<br>
                            　OK’ 버튼을 눌러 로그인 합니다. 로그인을 하지 않으려면<br>
                            　Cancel’ 버튼을 눌러 로그인을 취소 합니다.</li>
                        <li><span>&middot;</span>로그인은 추후 [File] – [Log In] 메뉴를 통해서도 가능 합니다.</li>
                        <li>※ ‘이메일 주소 기억’ 을 체크하면 다음 로그인 시 이메일<br>
                            　주소를 입력하지 않아도 됩니다.</li>
                    </ul>
                </div>
            </div><!-- .maGuide02CTCContThreeBox End -->
            <div class="maGuide02CTCContThreeBox2">
                <div class="maGuide02CTCContThreeimg">
                    <img src="images/popup_tag_cont_05.png"></div>
            </div>
            <div class="maGuide02CTCContFourBox">
                <div class="maGuide02CTCContFourNum">
                    <img src="${contextPath }/resources/images/popup_mag_num_04.png" alt="04">
                    <div class="maGuide02CTCContFourTitle">
                        <span>종료하기</span>
                    </div>
                </div>
                <div class="maGuide02CTCContFourDesc">
                    <p>Clapp Automation 툴의 사용을 마치려면 [File] – [Exit] <br>
                        메뉴를 통하거나, 오른쪽 상단의 ‘X’ 아이콘을 선택하여 <br>
                        프로그램을 종료할 수 있습니다. 또한 종료 확인 창을 통해 <br>
                        작업 중인 파일의 삭제 여부를 선택할 수 있습니다.</p>
                </div>
                <div class="maGuide02CTCContFourCont">
                    <ul>
                        <li><span>&middot;</span>종료를 시도하면 확인 창이 나타나며, 확인 창에서 <br>
                            　‘OK’ 버튼을 선택하여 프로그램을 종료하거나,  ‘Cancel’  <br>
                            　버튼을 선택하여 프로그램 종료를 취소할 수 있습니다.</li>
                        <li><span>&middot;</span>‘로컬 파일 삭제’ 를 선택하면 기존에 로컬에서 작업 중인 <br>
                            　Workspace 내 모든 파일이 삭제가 됩니다. 삭제된 파일은<br>
                            　이후 복원을 할 수 없으니 종료 시 신중히 판단 후 삭제 <br>
                            　여부를 선택해야 합니다. 특히 필요한 파일은 미리 다른 <br>
                            　위치에 백업을 해 두거나, 업로드 기능을 통해 서버에 <br>
                            　백업을 한 후 삭제를 선택할 수 있도록 해야 합니다.</li>
                        <li><span>&middot;</span>‘로컬 파일 삭제’ 의 기본 설정 값은 선택이 안되어 있는 <br>
                            　상태이며, 종료 시 선택한 삭제 여부는 종료 후에도 설정 <br>
                            　값이 저장 되어, 프로그램을 다시 실행해도 초기화 되지 <br>
                            　않습니다.</li>
                        <li>※ ‘로컬 파일 삭제’ 가 체크 되어 있는 경우 종료 전 편집 <br>
                            　중이던 스크립트는 저장 여부를 묻지 않고 삭제 됩니다. </li>
                    </ul>
                </div>
            </div><!-- .maGuide02CTCContFourBox End -->
            <div class="maGuide02CTCContFourBox2">
                <div class="maGuide02CTCContFourimg">
                    <img src="images/popup_tag_cont_06.png"></div>
            </div>
        </div>
    </div>
</div><!-- .maGuide02ContentTwoContainer End -->
