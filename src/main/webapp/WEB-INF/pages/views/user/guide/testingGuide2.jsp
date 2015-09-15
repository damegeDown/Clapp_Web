<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="mtGuide02ContentOneContainer">
    <div class="mtGuide02COCMainBox">
        <div class="mtGuide02COCMainTitle">
            <span>시작하기</span>
        </div>
        <div class="mtGuide02COContBox">
            <img src="${contextPath }/resources/images/popup_mtg2_cont_01.png" width="414" height="804" alt=""/>
        </div>
    </div><!-- .mtGuide01COCMainBox End -->
    <div class="mtGuide02COCBox01">
        <div class="mtGuide02COCContBox">
            <div class="mtGuide02COCContOneBox">
                <div class="mtGuide02COCContOneNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_01.png" alt="01">
                    <div class="mtGuide02COCContOneTitle">
                        <span>선택한 디바이스 정보</span>
                    </div>
                </div>
                <div class="mtGuide02COCContOneDesc">
                    <p>디바이스 목록에서 테스트하고자 하는 디바이스를 선택하면 제조사, 제품명, 제조사, OS버전, 해상도, 통신사 및 설치된 브라우저<br>종류가 표시됩니다.
                    </p>
                </div>
            </div><!-- .mtGuide02COCContOneBox End -->
            <div class="mtGuide02COCContTwoBox">
                <div class="mtGuide02COCContTwoNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_02.png" alt="02">
                    <div class="mtGuide02COCContTwoTitle">
                        <span>시작 시간 선택</span>
                    </div>
                </div>
                <div class="mtGuide02COCContTwoDesc">
                    <p>
                        테스트 시간은 디바이스당 5분 단위로 사용 가능합니다.<br>
                        테스트할 시간을 분 또는 시간 단위로 선택하실 수 있으며, 내가 보유한 시간만큼 표시됩니다.<br>
                        테스트할 시간을 선택하시면 차감 후 잔여시간을 확인하실 수 있습니다.
                    </p>
                </div>
            </div><!-- .mtGuide02COCContTwoBox End -->
            <div class="mtGuide02COCContThreeBox">
                <div class="mtGuide02COCContThreeNum">
                    <img src="${contextPath }/resources/images/popup_mtg_num_03.png" alt="03">
                    <div class="mtGuide02COCContThreeTitle">
                        <span>테스트 시작 실행 버튼</span>
                    </div>
                </div>
                <div class="mtGuide02COCContThreeDesc">
                    <p>[시작하기] 버튼을 클릭하면 테스트 디바이스 화면이 뜨고 테스트를 실행할 수 있게 됩니다.</p>
                </div>
            </div><!-- .mtGuide02COCContThreeBox End -->
        </div>
    </div>
</div><!-- .mtGuide02ContentOneContainer End -->
