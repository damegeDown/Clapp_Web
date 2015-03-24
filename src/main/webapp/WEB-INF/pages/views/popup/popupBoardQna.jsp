<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/popup.css"/> 
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/clapp.style_psy.css"/>
  <div id="popupBoardQna" class="layerPopup dn" style="display:none; overflow:auto; width:1100px; height: 600px;">
   <br>
    <div class="subCISupportContentThreeContainer2">
      <div class="subCISupportContentTitlebox">
        <div class="subCISupportContentTitle">
          <span>자주묻는 질문</span>
        </div>
      </div>
    </div>
    <div class="subCISupportFOCListSubjectOpen">
      <div class="subCISupportFOCLSO">
        <div class="subCISupportFOCLSONo">
          <span>02</span>
        </div><!-- .subCISupportFOCLSONo End-->
        <div class="subCISupportFOCLSOTitle">
          <span>
            <div class="qnaCategory"></div>
          </span>
        </div><!-- .subCISupportFOCLSOTitle End-->
        <div class="subCISupportFOCLSOLink">  
          <a href="#">
            <div class="subCISupportFOCLSOText">
              <span>
                <div class="qnaQuestion" wrap="physical"></div>
              </span>
            </div>
          </a><!-- .subCISupportFOCLSCText End-->
        </div>
      </div><!-- .subCISupportFOCLSO End -->
    </div><!-- .subCISupportFOCListSubjectOpen -->
    <div class="subCISupportFOCListContentOpen" style="overflow:auto;">
      <div class="subCISupportQOCLCO">
        <div class="subCISupportQOCLCOCont">
         <span class="qnaAnswer" ><p></p></span>
            <p><br/><br/><br/>※ 더 자세한 답변이 필요하실 때에는 서비스별 문의를 이용해 주세요.</p>
        </div><!-- .subCISupportFOCLCOCont End-->
      </div><!-- .subCISupportFOCLCO End -->
    </div><!-- .subCISupportFOCListContentOpen End -->
    <br>
    <div style="text-align: center;">
      <button type="button" class="btn-bottom-gray" onclick="enableScreen();">닫기</button>
    </div> 
    <br>
	</div>
