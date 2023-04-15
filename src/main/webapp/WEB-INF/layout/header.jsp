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
    <li class ="userMenu" onclick="toLoginPage()">로그인</li>
    <%} else{ %>
    <li class ="userMenu" onclick="logout()">로그아웃</li>
    <li class ="userMenu">마이페이지</li>
    <% } %>
</ul>

<script type="text/javascript">
    toLoginPage = function (){
        location.replace("/user/login");
    };

    logout = function (){
        fetch('/user/logout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(json => {
                if(json.code == 200){
                    alert("로그아웃되었습니다.")
                    location.replace("/");
                }
                else{
                    alert("요청이 실패되었습니다.");
                }
            })
    }
</script>
