<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="sub-content">
    <form id="memberForm" enctype="multipart/form-data">
        <div>
            <h3 class="contents-title floatL">${CommonCode.navigation }</h3>
      <div style="clear:both;"></div>
    </div>
    <c:if test="${boardSocialBlogDetail.boardSocialBlogKey ne null}">
    <input type="hidden" name="boardSocialBlogKey" value="${boardSocialBlogDetail.boardSocialBlogKey }"/>
    </c:if> 
    <table class="board-write box-pd">
    <colgroup>
      <col width="200px"/>
      <col width="830px"/>
    </colgroup>
    <tbody>
      <%--<tr>--%>
        <%--<th>소셜 구분별 링크</th>--%>
        <%--<td>--%>
	       	<%--<label><input type="checkbox" name="facebookFlag" value="Y"> Facebook</label>  --%>
	       	<%--<!-- <label><input type="checkbox" name="twitterFlag" value="Y" checked> Twitter</label>--%>
	       	<%--<label><input type="checkbox" name="blogFlag" value="Y" checked> Blog</label> -->--%>
	       	<%--<div style="margin:5px 0">--%>
		       	 <%--<span style="display:hidden" id="facebookLoginBtn">--%>
		        	<%--<fb:login-button scope="public_profile,email" onlogin="SnsUtils.checkLoginState();"></fb:login-button>--%>
		        <%--</span>--%>
	        <%--</div> --%>
        <%--</td>--%>
      <%--</tr>--%>
      <tr>
        <th>제목</th>
        <td>
          <input type="text" class="inp-w810" name="socialBlogTitle" placeholder="40자 이내" value="${boardSocialBlogDetail.socialBlogTitle}"/>
        </td>
      </tr>
      <tr>
        <th>이미지</th>
        <td>
          <img src="${contextPath}/common/imgView?fileType=${boardSocialBlogDetail.fileTarget}&fileName=${boardSocialBlogDetail.fileSavedName}" style="max-width:800px"/>
          <input type="hidden" name="fileName" value="${boardSocialBlogDetail.fileName }" data-flag="off"/>
          <input type="hidden" name="fileSavedName" value="${boardSocialBlogDetail.fileSavedName }" data-flag="off"/>
          <div class="marT-5"><span>등록된 이미지 : </span><a href="">${boardSocialBlogDetail.fileName }</a></div>
          <div class="marT-5"><input type="file" name="file" data-flag="off"/></div>
        </td>
      </tr> 
      <tr>
        <th>썸네일 이미지</th>
        <td>
          <img src="${contextPath}/common/imgView?fileType=${boardSocialBlogDetail.fileTarget}&fileName=thumb_${boardSocialBlogDetail.fileSavedName}" />
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
         <textarea rows="10" cols="200" id="ir1" name="socialBlogContent" >${boardSocialBlogDetail.socialBlogContent}</textarea>
        </td>
      </tr>
      <tr>
          <th>출처 / 링크</th>
          <td>
              <input type="text" name="socialOrigin" placeholder="출처" value="${boardSocialBlogDetail.socialOrigin}"/> / 링크 : http://
              <input type="text" class="inp-w600" name="socialLink" placeholder="40자 이내" value="${boardSocialBlogDetail.socialLink}"/>
          </td>
      </tr>
      <tr>
        <th>작성자</th>
        <td>
         <c:if test="${boardSocialBlogDetail.boardSocialBlogKey eq null }">
           <input type="text" class="inp-w160 " name="socialBlogInsertName" value="${adminLoginSession.adminName}" readonly="readonly" data-flag="off"/>
         </c:if>
         <c:if test="${boardSocialBlogDetail.boardSocialBlogKey > 0 }">
           <input type="text" class="inp-w160 " name="socialBlogInsertName" value="${boardSocialBlogDetail.socialBlogInsertName }" readonly="readonly"  data-flag="off"/>
         </c:if> 
        </td>
       </tr>
    </tbody>
  </table>
  <div class="btn-area">
    <a href="${contextPath}/admin/board/boardSocialBlogList" class="floatL btn-bottom-orenge">목록</a>
    <c:if test="${boardSocialBlogDetail.boardSocialBlogKey  > 0}">
    
      <div class="floatR btn-bottom-orenge submitBtn" data-action="/admin/board/rest/removeBoardSocialBlog" data-type="ajax" data-id='${boardSocialBlogDetail.boardSocialBlogKey}' data-msg='삭제'>삭제</div>
    </c:if> 
    <div class="floatR btn-bottom-orenge onSubmitBtn" onclick="socialOnsubmit()">${CommonCode.submitType }</div>
    <div style="display:none" class="submitBtn" data-action="${contextPath}/${CommonCode.submitAction}" data-msg="${CommonCode.submitType }"></div>
  </div>
	<input type="hidden" name="accessTocken" data-flag="off"/>
  </form>
</div> 
<div id="fb-root"></div>
<script>
 function socialOnsubmit() {
	 if(!$("input[name=facebookFlag]").is(":checked")) {
		 alert("페이스북에 체크해주세요.");
		 return false;
	 }
	 if($("input[name=facebookFlag]").is(":checked")) {
		 if(!$("input[name=accessTocken]").val()) {
			 alert("페이스북에 로그인해주세요.");
			 return false;
		 }
	 }
	 /* if($("input[name=twitterFlag]").is(":checked")) {
		 //if(!$("input[name=accessTocken]").val()) {
			 alert("트위터에 로그인해주세요.");
			 return false;
		// }
	 }  */
	 $(".submitBtn").click();
 }
 
var SnsUtils = (function() {
	  // Load the SDK asynchronously
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=${appId}&version=v2.2";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
 
   	window.fbAsyncInit = function() {
   	    FB.init({
   	      appId      : '${appId}',  
   	      status 		: true,
   	      cookie		: true,
   	      xfbml      : true,
   	      version    : 'v2.2'
   	    });
   	    FB.Event.subscribe('auth.login', function(response) {
   	    	document.location.reload();
   	    });
   	    //로그인
   	    FB.getLoginStatus(function(response) {
   			statusChangeCallback(response);
  		});
   	  };
     
	var statusChangeCallback = function(response) {
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
	      $("input[name=accessTocken]").val(response.authResponse.accessToken);
	      $("input[name=facebookFlag]").attr("checked", true);
	      $("#facebookLoginBtn").hide();
	    } 
	};
	
	 var checkLoginState = function() {
	    FB.getLoginStatus(function(response) {
	      SnsUtils.statusChangeCallback(response);
	    });
	 };
	 return {
		statusChangeCallback : statusChangeCallback,
        checkLoginState : checkLoginState
	 }
})($);
 
   
$(function(){
	//EditorUtils.smartEditor('ir1', 'ajax');
})
</script>
