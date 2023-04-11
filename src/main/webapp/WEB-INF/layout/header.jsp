<%@ page import="com.firstclass.childrenctv.user.UserVO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>

<head>
    <title>CCTV</title>
</head>

<body>
<hr>

<nav>
<span id="topNavHome" class="topNav">
    <a href="/">Home</a>
</span>
<% UserVO user = (UserVO) session.getAttribute("user");%>
<% if(user == null) {%>
    <span id="topNavJoin" class="topNav">
        <a href="/user/join">회원 가입</a>
    </span>
    <span id="topNavLogin" class="topNav">
        <a href="/user/login">로그인</a>
    </span>
<%} else {%>

<span id="topNavBoardWrite" class="topNav">
    <a href="/board/write">글 작성</a>
</span>

<span id="topNavBoardList" class="topNav">
    <a href="/board/list">글 목록</a>
</span>

<span id="topNavMayPage" class="topNav">
    <a href="/user/<%=user.getUser_id()%>">마이 페이지</a>
</span>

<span id="topNavLogout" class="topNav">
    <a href="/user/logout">로그아웃</a>
</span>
<%}%>
</nav>

<hr>

<br>