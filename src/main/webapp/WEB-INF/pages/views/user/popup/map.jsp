<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dgPageNav" uri="/WEB-INF/tlds/PageNavigation.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
 <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
 <script>
  function initialize() {
    var mapLocation = new google.maps.LatLng('37.491687', '127.039211'); // 지도에서 가운데로 위치할 위도와 경도
    var markLocation = new google.maps.LatLng('37.491687', '127.039211'); // 마커가 위치할 위도와 경도
     
    var mapOptions = {
      center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
      zoom: 18, // 지도 zoom단계
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
        mapOptions);
     
    var size_x = 60; // 마커로 사용할 이미지의 가로 크기
    var size_y = 60; // 마커로 사용할 이미지의 세로 크기
     
    // 마커로 사용할 이미지 주소
    var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                        new google.maps.Size(size_x, size_y),
                        '',
                        '',
                        new google.maps.Size(size_x, size_y));
     
    var marker;
    marker = new google.maps.Marker({
           position: markLocation, // 마커가 위치할 위도와 경도(변수)
           map: map,
           icon: image, // 마커로 사용할 이미지(변수)
//         info: '말풍선 안에 들어갈 내용',
           title: '' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
    });
     
    var content = ""; // 말풍선 안에 들어갈 내용
     
    // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
    var infowindow = new google.maps.InfoWindow({ content: content});

    google.maps.event.addListener(marker, "click", function() {
        infowindow.open(map,marker);
    });
     

     
  }
  google.maps.event.addDomListener(window, 'load', initialize);  
 </script> 
<body>
<div id="map-canvas" style="width: 100%; height: 100%"></div>
</body>