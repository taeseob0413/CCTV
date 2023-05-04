<%@ page import="com.firstclass.childrenctv.user.UserVO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>CCTV</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/layout/header.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/layout/reset.css">
</head>

    <% UserVO user = (UserVO) session.getAttribute("user");%>
<body>

<div id = "headerBox">
    <div id = "logoBox"><a href="/"><img src="/resources/image/ChildCTV.png" width="250" height="70"></a></div>
</div>
<div id = "headerMenu">
<ul id = "headerMenuList">
    <li><a href="/protectBoard/list" >보호신고</a></li>
    <li><a href="/child/list" >실종 검색</a></li>
    <li><a href="/safety/get" >안전 지도</a></li>
    <% if(user == null){%>
    <li class ="userMenu" onclick="toLoginPage()">로그인</li>
    <%} else{ %>
    <li class ="userMenu" onclick="logout()">로그아웃</li>
    <li class ="userMenu"><a href="/mypage/get?user_id=${user.user_id}">마이페이지</a></li>
    <% } %>
</ul>
</div>
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