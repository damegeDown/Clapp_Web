<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath }/resources/js/board.js"></script>
<div class="sub-content">
	<div>
		<h3 class="contents-title floatL"> ${CommonCode.navigation } </h3> 
		<div style="clear:both;"></div>
		<form id="searchForm" action="">
		<div class="search-box">
			<div class="marT-5">
				<span class="span-w60" style="padding-right: 26px">등록일</span>
				<input type="text" id="from" class="date" name="startDate"  value="${boardEntity.startDate}"/> ~ <input type="text" id="to" class="date" name="endDate" value="${boardEntity.endDate }"/>
			</div>
			<div class="marT-5">
				<span class="span-w20">게시물 검색</span>
				<select class="sel-w100" name="searchKey">
		            <option value="">전체</option>
		            <option value="1" <c:if test="${boardEntity.searchKey eq 1}"> selected</c:if>>제목</option>
		            <option value="2" <c:if test="${boardEntity.searchKey eq 2}"> selected</c:if>>내용</option>
		            <option value="3"<c:if test="${boardEntity.searchKey eq 3}"> selected</c:if>>제목+내용</option> 
		        </select>
				<input type="text" class="inp-w140" name="searchValue" value="" placeholder="띄어쓰기 없이 입력"/>
				<span class="marL-15 span-w50"></span> 
				<input type="submit" class="btn" value="검색"/>
				<input type="reset" class="btn" value="초기화"/>
			</div>
			<div style="clear:both"></div>
			</div>
			<div style="margin:5px; color:red">※ CLAPP의 Facebook, Twitter 및 네이버 블로그에 동시 노출되는 게시글 입니다. ( 업계동향, 리뷰전망, 케이스스터디는 별도 메뉴로 관리 )</div>
			<div style="border-top:2px dotted #999;margin-bottom:30px"></div>
			<div style="clear:both;"></div>
			<div style="width:100%;">
   				<h3 class="floatL part-title">> 검색결과 <span class="colorSkyBlue">${boardEntity.dataSize }</span> 건</h3>
		        <div class=" floatR">
		          <select class="sel-w100 sortListSize" name="sortListSize">
		            <c:forEach items="${sortListSizeCode }" var="code">
		            <option value="${code.commonCode }" <c:if test="${boardEntity.sortListSize eq code.commonCode }">selected</c:if>>${code.commonName }</option>
		            </c:forEach>
		          </select>
		        </div>
		    </div>
		</form>
	</div>
	<table class="board-list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="5%"/>
		</colgroup> 
		<thead>
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>소셜 구분별</th>
				<th>등록일시</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach items="${boardEntity.boardSocialBlogList }" var="boardSocialBlogList" varStatus="i"> 
			<tr style="font-weight:bold;colof:">
				<td>${boardEntity.dataSize-(boardEntity.pageListSize*(boardEntity.currentPage-1))-i.index}</td> 
				<td style="cursor:pointer" class="socialBlogTitle" data-key="${boardSocialBlogList.boardSocialBlogKey }">${boardSocialBlogList.socialBlogTitle}</td>
				<td>
					<c:if test="${boardSocialBlogList.facebookFlag eq 'Y' }">
						<a href="${boardSocialBlogList.facebookLink }" target="_blank">
							<img src="${contextPath}/resources/images/iconFacebook.png" style="width:30px">
						</a>
					</c:if> 
					<c:if test="${boardSocialBlogList.twitterFlag eq 'Y' }">
						<a href="${boardSocialBlogList.twitterLink }" target="_blank">
							<img src="${contextPath}/resources/images/iconTwitter.png" style="width:30px">
						</a>
					</c:if>
					<c:if test="${boardSocialBlogList.blogFlag eq 'Y' }">
						<a href="${boardSocialBlogList.blogLink }" target="_blank">
							<img src="${contextPath}/resources/images/iconBlog.png" style="width:30px">
						</a>
					</c:if>	
				</td>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${boardSocialBlogList.socialBlogInsertDate }" /></td>
				<td style="text-align:center">
				<form id="deleteSocialForm">
					<div class="floatR btn-bottom-gray submitBtn" 
						data-id="${boardSocialBlogList.boardSocialBlogKey }"
						data-type="ajax"
						data-message="블로그 게시글을 삭제 하시겠습니까?"
						data-action="${contextPath }/admin/board/rest/removeBoardSocialBlog">
						
					삭제</div>
				</form>
				</td>
			</tr>
		</c:forEach>  
 		<c:if test="${boardEntity.boardSocialBlogList.size() < 1 }">
			<tr>
				<td colspan="4">+++조회된 내용이 없습니다.+++</td>
			</tr> 
		</c:if>
		</tbody>
	</table>
	<div class="btn-area">
    <a href="${contextPath }/admin/board/boardSocialBlogForm" class="floatR btn-bottom-orenge">등록</a>
  </div>
	<div class="paging-area">
	  <dgPageNav:PageNavigation pageParamName="currentPage" linkUrl="${contextPath}/admin/board/boardSocialBlogList" pageNavigationEntity="${boardEntity}" />
	</div>
</div>
 