<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>사용자 위치 얻기</title>
  <style>
  @import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);

.nanummyeongjo * {
 font-family: 'Nanum Myeongjo', serif;
}
   .cnt-opt {
   border: 2px solid gray;
   border-radius: 10px;
   width: 80%;
   height: 45%;
   margin: 30px auto;
   padding: 30px;
   }
   .main-copy{
   font-family: 'Nanum Myeongjo', serif;
   font-size: 3em;
   font-weight: bolder;
   text-align: center;
   color: #245d9e;
   }
   .col-sm-4{
   text-align: center;
   }
   .img-responsive{
   width: 50%;
   height: 50%;
   }
   .main{
   font-size: 2.3em;
   line-height: 1.5em;
   text-align: justify;
   font-family: 'Nanum Myeongjo', serif;
   color: #485054;
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
      var url = "http://localhost:8080/sendLocation?latitude=" + lat + "&longitude=" + lon;
      window.location = url;
    }
  </script>
</head>
<body>
  <div class="cnt-opt">
   <div class="row">
    <div class="col-sm-4">
      <img class="img-responsive" src="https://www.safe182.go.kr/static/home/new_images/kids/kids_05.jpg" alt="아동안전지킴이 표지물"/>
    </div>
    <div class="col-sm-8">
     <p class="main-copy">
      <span class="main-color">아동 안전 지킴이집이란?</span>
     </p>
     <p class="main">
      <strong class="blue-text">학교 주변, 통학로, 공원 주변의 문구점, 편의점, 약국 등을 아동 안전 지킴이집으로 지정</strong>하여 위험에 처한 아동을 임시 보호하고 경찰에 인계하는 곳입니다.
     </p>
    </div>
   </div>     
  </div>
  <div class="cnt-main"> 
            <h5 class="item-title">아동 안전 지킴이집 로고</h5>
            <p>아동 안전 지킴이집 로고는 경찰과 주민이 손을 잡고 함께 아동을 보호한다는 의미로 유명 만화가인 이현세 씨에게 의뢰하여 아동 친화적으로 제작되었습니다.</p>
       
  <div class="row">
          
      <div class="col-sm-6 m-t-20">
        <strong class="center-block text-center main-color">아동 안전 지킴이 표지물</strong>
        <img class="center-block" src="/resources/image/child1.jpg" alt="아동안전지킴이 표지물"/>
      </div>
    

    
  </div>
  </div>
  
  <br>
  <div class="outer">
  <button onclick="getLocation()" style="display: inline-block; margin: 10px auto;">내 근처 안전지도 보기!!</button>
  </div>
</body>
</html>
<%@ include file="../layout/footer.jsp"%>