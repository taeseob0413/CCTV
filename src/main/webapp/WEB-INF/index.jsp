<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="layout/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<head>
<link rel="stylesheet" href="/resources/css/index.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>


<body>
<div id="mainpage">
    <div id="number">
        <div id="icon">
          <div id="num">
              <img src="/resources/image/one.png" alt="1" width="90" height="100">
              <img src="/resources/image/two.png" alt="8" width="90" height="100">
              <img src="/resources/image/three.png" alt="2" width="90" height="100">
          </div>
            <div id="f">
             <p class="find">실종아동 찾기</p>
            </div>
         </div>
         <div id="content">
             <p>「실종아동등의 보호 및 지원에 관한 법률」 <br>제 18조에 근거하여 실종 아동 등의 신상 정보를 실종 아동 등을 찾기 위한 목적 외의 용도로 이용한 자는
2년 이하의 징역 또는 2천만 원 이하의 벌금에 처할 수 있습니다.</p>
       </div>
    </div>
    
    
    <div id="child">
    
       <div class="swiper-container">
         <div class="swiper-wrapper">
            <c:forEach items="${list}" var="child" >
            <div class="swiper-slide">
               <div id="child_image"><img src="${child.child_img}" alt="My Image" width="250" height="300" onclick="location.href='/child/get?child_id=<c:out value="${child.child_id}"/>'"></div>
               <div id="child_info">
                    <div id="child_name"><strong>${child.child_name}</strong></div>
                    <div id="child_age"><span id="cc">성별 : </span> <span>${child.getChild_gender()}<br></span></div>
                    <div id="child_age"><span id="cc">실종 나이 : </span> <span>${child.getChild_occage()}<br></span></div>
                    <div id="child_age"><span id="cc">현재 나이 : </span> <span>${child.getChild_curage()}<br></span></div>
                    <div id="child_lo"><span id="cc">실종 장소 : </span> <span> ${child.getChild_location()}</span></div>
                    
               </div>
            </div>
                
            </c:forEach>
                 
              
          </div>

   <!-- 네비게이션 -->
         <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
         <div class="swiper-button-prev"></div><!-- 이전 버튼 -->

   <!-- 페이징 -->
         <div class="swiper-pagination"></div>
      </div>
          
      
     </div>
    
    <div id="pic">
       <img src="/resources/image/picchild.png" alt="My Image" width="25%" height="35%" onclick="location.href='/child/list'">
       <img src="/resources/image/picmap.png" alt="My Image" width="25%" height="35%" onclick="location.href='/safety/get'">
       <img src="/resources/image/picreport.png" alt="My Image" width="25%" height="35%" onclick="location.href='/protectBoard/list'">
    </div>
    
</div>

<script>

new Swiper('.swiper-container', {

   slidesPerView : 2, // 동시에 보여줄 슬라이드 갯수
   spaceBetween : 0, // 슬라이드간 간격
   slidesPerGroup : 2, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

   // 그룹수가 맞지 않을 경우 빈칸으로 메우기
   // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
   loopFillGroupWithBlank : true,

   loop : true, // 무한 반복

   pagination : { // 페이징
      el : '.swiper-pagination',
      clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
   },
   navigation : { // 네비게이션
      nextEl : '.swiper-button-next', // 다음 버튼 클래스명
      prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
   },
});

</script>

</body>

<%@include file="layout/footer.jsp"%>