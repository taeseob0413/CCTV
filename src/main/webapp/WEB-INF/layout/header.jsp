<%@ page import="com.firstclass.childrenctv.user.UserVO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>CCTV</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
    <% UserVO user = (UserVO) session.getAttribute("user");%>
<body>

<div id = "headerBox">
    <div id = "logoBox"><img src="/resources/image/logo.png" width="200" height="70"></div>
    <div id = "todayMissing">오늘의 실종자 수 : 0 명</div>
</div>
<ul id = "headerMenu">
    <li>지역별 실종 아동</li>
    <li>안전 지도 서비스</li>
    <li>미등록 실종 아동 제보</li>
    <% if(user == null){%>
    <li class ="userMenu">로그인</li>
    <%} else{ %>
    <li class ="userMenu">로그아웃</li>
    <li class ="userMenu">마이페이지</li>
    <% } %>
</ul>