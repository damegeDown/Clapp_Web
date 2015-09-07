<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Strings" uri="/WEB-INF/tlds/Strings.tld" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div>
    <h3 class="contents-title floatL">테스트 대행 신청관리(총 <span class="colorSkyBlue">10</span> 건 )</h3>
    <div style="clear:both;"></div>
    <form id="searchForm" action="">
        <div class="search-box">
            <div class="marT-5">
                <span class="span-w50" style="padding-left: 11px;">신청일</span>
                <input type="text" id="from" class="date" name="startDate"  value=""/> ~ <input type="text" id="to" class="date" name="endDate" value=""/>
                <span class="span-w50" style="padding-left: 25px;">이용상품</span>
                <select class="sel-w107" name="testsearchKey1">
                    <option value="" >전체</option>
                    <option value="1" >무료체험권</option>
                    <option value="2" >시간이용권</option>
                    <option value="2" >클앱멤버십</option>
                </select>
                <span class="span-w80" style="padding-left: 20px; text-align:center;">의뢰테스트</span>
                <select class="sel-w160" name="testsearchKey2">
                    <option value="">전체</option>
                    <option value="1" >앱설치 테스트</option>
                    <option value="2" >모바일웹 해상도 테스트</option>
                </select>
                <span class="span-w30" style="padding-left: 25px;">상태</span>
                <select class="sel-w107" name="testsearchKey3">
                    <option value="">전체</option>
                    <option value="1" >대기</option>
                    <option value="2" >완료</option>
                </select>
            </div>
            <div class="marT-5">
                <span class="span-w50" style="padding-left: 11px;">회원 ID</span>
                <input type="text" class="inp-w200" name="testsearchKeyValue1" placeholder="sample@clapp.co.kr"/>
                <span class="span-w100" style="padding-left: 30px; padding-right: 7px;">이름/기업,단체명</span>
                <input type="text" class="inp-w600" name="testsearchKeyValue2" placeholder="띄어쓰기 없이 입력 / 기업의 경우 (주) 빼고 입력"/>
                <span class="marL-15 span-w300"> </span>
                <input type="submit" class="btn" value="검색"/>
                <input type="reset" class="btn" value="초기화"/>
            </div>
            <div style="clear:both"></div>
        </div>
        <div style="margin:5px; color:red"></div>
        <div style="border-top:2px dotted #999;margin-bottom:30px"></div>
        <div style="clear:both;"></div>
        <div style="width:100%;">
            <h3 class="floatL part-title">> 검색결과 :
                <span class="colorSkyBlue">10</span> 건
            </h3>
            <div class=" floatR">
                <select class="sel-w120 sortListSize" name="sortListSize">
                    <option value="10" selected>10개씩 보기</option>
                    <option value="20" >20개씩 보기</option>
                    <option value="50" >50개씩 보기</option>
                    <option value="100" >100개씩 보기</option>

                </select>
            </div>
        </div>
    </form>
</div>
<table class="board-list">
    <colgroup>
        <col width="7%"/>
        <col width="9%"/>
        <col width="14%"/>
        <col width="12%"/>
        <col width="12%"/>
        <col width="7%"/>
        <col width="12%"/>
        <col width="10%"/>
        <col width="10%"/>
        <col width="7%"/>
    </colgroup>
    <thead>
    <tr>
        <th>No.</th>
        <th>이용상품</th>
        <th>의뢰 테스트</th>
        <th>회원 ID</th>
        <th>메일 주소</th>
        <th>이름</th>
        <th>전화번호</th>
        <th>신청일</th>
        <th>결과 발송일</th>
        <th>상태</th>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td>10</td>
        <td>무료체험권</td>
        <td style="cursor:pointer" class="testTitle">앱설치 테스트</td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>대기</td>
    </tr>

    <tr>
        <td>9</td>
        <td>무료체험권</td>
        <td style="cursor:pointer" class="testTitle">모바일웹 해상도 테스트</td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>대기</td>
    </tr>

    <tr>
        <td>8</td>
        <td>클앱 멤버십</td>
        <td style="cursor:pointer" class="testTitle"><span class="testTitle" style="cursor:pointer">앱설치 테스트</span></td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    <tr>
        <td>7</td>
        <td>클앱 멤버십</td>
        <td style="cursor:pointer" class="testTitle"><span class="testTitle" style="cursor:pointer">모바일웹 해상도 테스트</span></td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    <tr>
        <td>6</td>
        <td>시간 이용권</td>
        <td style="cursor:pointer" class="testTitle"><span class="testTitle" style="cursor:pointer">앱설치 테스트</span></td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    <tr>
        <td>5</td>
        <td>시간 이용권)</td>
        <td style="cursor:pointer" class="testTitle" data-key="16"><span class="testTitle" style="cursor:pointer">모바일웹 해상도 테스트</span></td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    <tr>
        <td>4</td>
        <td>시간 이용권</td>
        <td style="cursor:pointer" class="testTitle"><span class="testTitle" style="cursor:pointer">앱설치 테스트</span></td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    <tr>
        <td>3</td>
        <td>시간 이용권</td>
        <td style="cursor:pointer" class="testTitle"><span class="testTitle" style="cursor:pointer">모바일웹 해상도 테스트</span></td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    <tr>
        <td>2</td>
        <td>시간 이용권</td>
        <td style="cursor:pointer" class="testTitle"><span class="testTitle" style="cursor:pointer">앱설치 테스트</span></td>
        <td>123@gmail.com</td>
        <td><p><a href="mailto:123@gmail.com">123@gmail.com</a></p></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    <tr>
        <td>1</td>
        <td>시간 이용권</td>
        <td style="cursor:pointer" class="testTitle"><span class="testTitle" style="cursor:pointer">모바일웹 해상도 테스트</span></td>
        <td>123@gmail.com</td>
        <td><a href="mailto:123@gmail.com">123@gmail.com</a></td>
        <td>김영희</td>
        <td>010-1234-1234</td>
        <td>2015/09/02</td>
        <td>2015/09/03</td>
        <td>완료</td>
    </tr>

    </tbody>
</table>



</div>
<div class="paging-area">
    <a class='paging-first' href='#'><img src='${contextPath }/resources/img/icon-first.gif'/></a><a class='paging-prev' href='#'><span><img src='${contextPath }/resources/img/icon-prev.gif'/></span></a><a class='on' href='#'><span><b>1</b></span></a><a class='paging-next' href='#'><span><img src='${contextPath }/resources/img/icon-next.gif'/></span></a><a class='paging-last' href='#'><span><img src='${contextPath }/resources/img/icon-last.gif'/></span></a>
</div>
</div>