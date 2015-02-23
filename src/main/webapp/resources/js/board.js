/**
 * 트렌드 게시판 리스트 함수
 */
$.fn.boardTrandList = {
  init : function() {
	this.openDetail();          //상세페이지 이동
	this.sortListSize();        //10개,20개,50개,100개씩 보기
  },
  openDetail : function() {
  $(".trandTitle").click(function() {
      var boardTrandKey = $(this).data("key");
      location.href = "/admin/board/boardTrandDetail?boardTrandKey="+boardTrandKey; 
    });
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  }
};
/**
 * 트렌드 게시판 상세 함수
 */
$.fn.boardTrandDetail = {
  init : function() {
	this.modifyBoardTrand();      //상위 10 노출 디바이스 세팅
  },
  modifyBoardTrand : function() {
	  $(".modify").click(function() {
	      var boardTrandKey = $(this).data("key");
	      location.href = "/admin/board/boardTrandForm?boardTrandKey="+boardTrandKey; 
	    });
	  }
};
/**
 * 소셜 블로그 게시판 리스트 함수
 */
$.fn.boardSocialBlogList = {
  init : function() {
	this.openDetail();         			 //상세페이지 이동
	this.sortListSize();        //디바이스 삭제
  },
  openDetail : function() {
  $(".socialBlogTitle").click(function() {
      var boardSocialBlogKey = $(this).data("key");
      location.href = "/admin/board/boardSocialBlogDetail?boardSocialBlogKey="+boardSocialBlogKey; 
    });
  },
  sortListSize : function() {
  $(".sortListSize").change(function() {
    $("form#searchForm").submit();
   }); 
  }
};
/**
 * 트렌드 게시판 상세 함수
 */
$.fn.boardSocialBlogDetail = {
  init : function() {
	this.modifyBoardSocialBlog();      //상위 10 노출 디바이스 세팅
  },
  modifyBoardSocialBlog : function() {
	  $(".modify").click(function() {
	      var boardSocialBlogKey = $(this).data("key");
	      location.href = "/admin/board/boardSocialBlogForm?boardSocialBlogKey="+boardSocialBlogKey; 
	    });
	  }
};
/**
 * 사용자 트렌드 게시판 리스트 함수
 */
$.fn.trandReviewList = {
  init : function() {
	this.nextPage();          //페이지 더보기
  },
  nextPage : function() {
  $(".nextPage").click(function() {
	var url = $(this).data("url");
	var currentPage = Number($("input[name=currentPage]").val()) + 1;
	var pageTotalCount = Number($("input[name=pageTotalCount]").val());
	if(pageTotalCount < currentPage){
		alert("마지막 페이지 입니다.");
		return false;
	}
	$("input[name=currentPage]").val(currentPage);
	console.log(url);
    $.ajax({
    	url : 'rest/'+url ,
    	type: 'get',
    	dataType : 'json',
    	data : {currentPage : currentPage},
    	success :function(result){
    		var resultList = result.resultDATA.boardTrandList;
    		if(result.resultCode == 'success'){
    			var contents = "";
    			  for(var i = 0; i < resultList.length; i++){
    				  var isEven = i % 2 == 0 ? true : false;
    				  if(isEven) { 
    					  contents += "<div class='subTRIndusrtyContentList'>"+
				                  "<div class='subTRIndusrtyContentListCols'>";
    				  }
    				  contents += "<div class='subTRIndusrtyContentListRow'>"+
		    		                "<div class='subTRIndusrtyContentImgBox'>"+
		    		                  "<div class='subTRIndusrtyContentImg'>"+
		    		                    "<a href=''./industry_review_view.html'>"+
		    		                    "<img src=" + contextPath +"'/common/imgView?fileType="+resultList[i].fileTarget+"&fileName="+resultList[i].fileSavedName+"' style='max-width:160px;'/>"+
		    		                    "</a>"+
	    		                      "</div>"+
		    		                 "</div>"+
		    		                 "<div class='subTRIndusrtyContentTextBox'>"+
		    		                  "<span class='subTRIndusrtyContentTit'>"+
		    		                   "<a href="+ contextPath +"/trandReview/reviewDetail?boardTrandKey="+resultList[i].boardTrandKey+">"+
		    		                    resultList[i].trandTitle+ 
		    		                   "</a>"+
		    		                  "</span>"+
		    		                 "<p class='subTRIndusrtyContentCont'>"+
		    		                   resultList[i].trandContents+ 
		    		                 "</p>"+
	    		                    "</div>"+
		    		              "</div>";
    				  if(!isEven || i == resultList.length - 1)  {
    				  contents += "</div>"+
				    		     "</div>";
				    		  }
    			  }
    			  var addHeight = $(".subTRIndusrtyContentList").height() * (i/2);
    			  var baseHeight = $(".subTRIndusrtyListContentBoxBg").height();
    			  $(".subTRIndusrtyListContentBoxBg").height(addHeight + baseHeight);
    			  $(".subTRIndusrtyContentList:last").after(contents); 
    		}
    	},
    	fail: function(){
    		alert('error');
    	}
    });
  })
  }
};