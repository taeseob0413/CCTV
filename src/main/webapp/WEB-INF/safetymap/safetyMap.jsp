
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>사용자 위치 얻기</title>
  <style>
  .blue-text {
    color: #1dc6fc;
}
  .m-t-20 {
    margin-top: 20px !important;
}
  .center-block {
    display: block;
    margin-right: auto;
    margin-left: auto;
}
   .col{
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
    display: inline-block;
  	margin: 40px; /* 이미지 간격을 조절할 margin 값 */
  	text-align: center;
}
   .row {
    margin-right: -15px;
    margin-left: -15px;
    border: 2px solid #999;
  	border-radius: 10px;
  	padding: 10px;
}
	img {
    overflow-clip-margin: content-box;
    overflow: clip;
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    vertical-align: baseline;
    background: transparent;
    box-sizing: border-box;
}
   .item-title {
    position: relative;
    padding-left: 16px;
    margin-top: 30px;
    margin-bottom: 15px;
    font-size: 1em;
    color: #363b43;
}
   .outer{
     display : flex;
     justify-content: center;
     align-items : center;
     margin-top: 0px;
   }
   .col{
   
    float: left;
    }
    .cnt-right h2 {
    font-size: 1.5em;
    color: #2c53b0;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}
   
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
      } else {
        alert("Geolocation is not supported by this browser.");
      }
    }

    function showPosition(position) {
      var lat = position.coords.latitude;
      var lon = position.coords.longitude;
      //var url = "http://localhost:8082/sendLocation?latitude=" + lat + "&longitude=" + lon;
      //window.location = url;
      var host = window.location.host;
      var url = "http://" + host + "/sendLocation?latitude=" + lat + "&longitude=" + lon;
      window.location = url;
    }
  </script>
</head>
<body>
	<div class="outer">
  <button onclick="getLocation()" class="w-btn-outline w-btn-gray-outline" style="display: inline-block; margin: 10px auto;">내 근처 안전지도 보기!!</button>
  </div>
  <div class="row">
    <div style="background-color: #fff; padding: 20px; float: left ; margin-left: 100px;">
      <h2>아동안전지킴이 집이란?</h2>
      <p><strong class="blue-text">학교주변,통학로,공원 주변의 문구점,편의점, 약국 등을<br> 아동안전지킴이 집으로 지정</strong>하여 위험에 처한 아동을 임시보호하고 <br>경찰에 인계하는 곳입니다.</p>
    </div>
	

    
      <div style="margin-top:15px;">
        
        <img src="/resources/image/child3.jpeg" alt="아동안전지킴이 표지물" width="250" height="200"/>
      </div>
        
  </div>
	
   <div class="new">
 		<div style="text-align:center; padding: 20px; margin-bottom: 0px; margin-top: 20px;">
     		 <h5 class="item-title" >&#8226;아동안전지킴이집 로고</h5>
      		<p>아동안전지킴이집 로고는 경찰과 주민이 손을 잡고 함께 아동을 보호한다는 의미로 유명 만화가인 이현세씨에게 의뢰하여<br> 아동 친화적으로 제작되었습니다.</p>
    	</div>

  <div class="outer" style="margin-top: 0px">
    
    	
      <div class="col">
        <h5 class="item-title">아동안전지킴이 표지물</h5>
        <img class="center-block m-t-20" src="/resources/image/child1.jpeg" alt="아동안전지킴이 표지물" width="200" height="200"/>
      </div>
    

    
      <div class="col">
        <h5 class="item-title">안전지킴이집 벽부착형 표지물</h5>
        <img src="/resources/image/child2.jpg" alt="안전지킴이집 벽부착형 표지물" width="200" height="180"/>
      </div>
    
  </div>
</div>
  
  <br>
  
</body>
</html>
<%@ include file="../layout/footer.jsp"%>
