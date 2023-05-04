<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../layout/header.jsp"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Kakao Map Example</title>
  <link rel="stylesheet" href="/resources/css/locationReceived.css"> 
 </head>
<body>
      <div style="text-align: center;">
        <div id="map"></div>
   </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf86c429bc5d91bf4a90136e45482fcd"></script>   
    <script>
         var container = document.getElementById('map');
         var options = {
            center: new kakao.maps.LatLng(${latitude}, ${longitude}),
            level: 6
      
         };

         var map = new kakao.maps.Map(container, options);
   
         // 현재 위치 마커 생성
         var currentMarker = new kakao.maps.Marker({
               
               position: new kakao.maps.LatLng(${latitude}, ${longitude})
            
           });
   
         currentMarker.setMap(map);
         
         
         
         var content = '<div style="padding:3px;">현재 위치</div>'; 
         var customOverlay = new kakao.maps.CustomOverlay({
             position: new kakao.maps.LatLng(${latitude}, ${longitude}),
             content: content,
             xAnchor: 0.5,
             yAnchor: 2.0
         });
         customOverlay.setMap(map);
         var markers=[];
         var overlay=[];
         var listAddrs=[];
         <c:forEach var="location" items="${listAddr}">
            var markerPosition = new kakao.maps.LatLng(${location.getSafety_latitude()}, ${location.getSafety_longitude()});
            var marker = new kakao.maps.Marker({
            position: markerPosition,
            title: '${location.getSafety_name()}', //새로 추가
            clickable: true
            });
            marker.setMap(map);
            // 커스텀 오버레이를 생성
            var content = '<div style="color: black; font-weight: bold; padding: 10px; background-color: rgba(255, 255, 255, 0);">${location.getSafety_name()}</div>';
            var customOverlay = new kakao.maps.CustomOverlay({
               position: markerPosition,
               content: content,
               xAnchor: 0.5,
               yAnchor: 1.5
            });
            //customOverlay.setMap(map); 커스텀 오버레이 초기에 생성
            
            //kakao.maps.event.addListener(marker, 'click', function() {
            //	  var url = 'https://map.kakao.com/link/map/' + '${location.getSafety_name()},' + ${location.getSafety_latitude()} + ',' + ${location.getSafety_longitude()};
            //	  window.open(url);
            //	});
            
            //kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, customOverlay));
            //kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(customOverlay));
            
            markers.push(marker);
            overlay.push(customOverlay);
             var safetyObj = {
                  safety_class: '${location.getSafety_class()}',
                  safety_address: '${location.getSafety_address()}',
                  safety_name: '${location.getSafety_name()}',
                  safety_telno: '${location.getSafety_telno()}',
                  safety_latitude : ${location.getSafety_latitude()},
                  safety_longitude : ${location.getSafety_longitude()}
              };
         
             listAddrs.push(safetyObj);
             
             (function(marker, customOverlay) {
            	  kakao.maps.event.addListener(marker, 'click', function() {
            	    if (customOverlay.getMap()) {
            	      customOverlay.setMap(null);
            	    } else {
            	      customOverlay.setMap(map);
            	    }
            	  });
            	})(marker, customOverlay);
             
      </c:forEach>
   
     // function makeOverListener(map, marker, customOverlay) {
     //       return function() {
     //          customOverlay.setMap(map);
     //       };
     // }

         // 커스텀 오버레이를 닫는 클로저를 만드는 함수입니다.
      //function makeOutListener(customOverlay) {
      //      return function() {
      //         customOverlay.setMap(null);
      //      };
      //}
         
      kakao.maps.event.addListener(map, 'center_changed', function() {
          // 현재까지 찍힌 마커 모두 제거
          for (var i=0; i<markers.length; i++) {
              markers[i].setMap(null);
              overlay[i].setMap(null);
          }
         overlay=[];
         markers=[];
         listAddrs=[];
          var latlng = map.getCenter();
          <c:forEach var="location" items="${list}">
             
              var lat = ${location.getSafety_latitude()};
              var lng = ${location.getSafety_longitude()};
              var cen_lat=latlng.getLat();
              var cen_lng=latlng.getLng();
             //반경 5km내에 안전지도 표시!!
             if(lat>cen_lat-0.025&&lat<cen_lat+0.025&&lng>cen_lng-0.025&&lng<cen_lng+0.025){
                 
                 var markerPosition = new kakao.maps.LatLng(${location.getSafety_latitude()}, ${location.getSafety_longitude()});
                  var marker = new kakao.maps.Marker({
                      position: markerPosition,
                      title: '${location.getSafety_name()}', //새로 추가
                      clickable: true
                  });
                  marker.setMap(map);
                  // 커스텀 오버레이를 생성합니다.
                  var content = '<div style="color: black; font-weight:bold; padding: 10px; background-color: rgba(255, 255, 255, 0);">${location.getSafety_name()}</div>';
                  var customOverlay = new kakao.maps.CustomOverlay({
                      position: markerPosition,
                      content: content,
                      xAnchor: 0.5,
                      yAnchor: 1.5
                  });
				  
                  
                  //customOverlay.setMap(map); // 수정된 부분
                  
                  //kakao.maps.event.addListener(marker, 'click', function() {
                  //	  var url = 'https://map.kakao.com/link/map/' + '${location.getSafety_name()},' + ${location.getSafety_latitude()} + ',' + ${location.getSafety_longitude()};
                  //	  window.open(url);
                  //	});
                  
                  //kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, customOverlay));
                  //kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(customOverlay));
                  markers.push(marker);
                  overlay.push(customOverlay);
                  var safetyObj = {
                        safety_class: '${location.getSafety_class()}',
                        safety_address: '${location.getSafety_address()}',
                        safety_name: '${location.getSafety_name()}',
                        safety_telno: '${location.getSafety_telno()}',
                        safety_latitude : ${location.getSafety_latitude()},
                        safety_longitude : ${location.getSafety_longitude()}
                        
                    };
                  
                  listAddrs.push(safetyObj);
                  (function(marker, customOverlay) {
                	  kakao.maps.event.addListener(marker, 'click', function() {
                	    if (customOverlay.getMap()) {
                	      customOverlay.setMap(null);
                	    } else {
                	      customOverlay.setMap(map);
                	    }
                	  });
                	})(marker, customOverlay);
                  
             }
          </c:forEach>
          
      });
   
      function printSafetyInfo() {
          var tableBody = document.getElementById('output-table-body');
          tableBody.innerHTML = ''; // 테이블 초기화
          
          for (var i = 0; i < listAddrs.length; i++) {
              var safety = listAddrs[i];
              var row = tableBody.insertRow(i);
              var nameCell = row.insertCell(0);
              var addressCell = row.insertCell(1);
              var telnoCell = row.insertCell(2);
              var classCell = row.insertCell(3);
              nameCell.innerHTML = safety.safety_name;
              addressCell.innerHTML = safety.safety_address;
              telnoCell.innerHTML = safety.safety_telno;
              classCell.innerHTML = safety.safety_class;
              
              (function(safety) {
                  nameCell.addEventListener('click', function() {
                      var url = 'https://map.kakao.com/link/map/' + safety.safety_name + ',' + safety.safety_latitude + ',' + safety.safety_longitude;
                      window.open(url, '_blank');
                  });
              })(safety);
          }
         
      }
      
     </script>
     <div class="btn-container">
         <button onclick="printSafetyInfo()" class="w-btn-outline w-btn-gray-outline" >테이블 출력</button>
      </div>
      <div id="table">
      
      <table class="table table-striped table-bordered table-hover">
       <thead>
           <tr>
            <th>이름</th>
            <th>주소</th>
            <th>전화번호</th>
            <th>안전지도 유형</th>
           </tr>
       </thead>
          <tbody id="output-table-body">
       </tbody>
   </table>
      
   </div>
   
   
</body>
</html>
<%@ include file="../layout/footer.jsp"%>