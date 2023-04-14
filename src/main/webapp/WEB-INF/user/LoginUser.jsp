<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>


<div id="login_logo">CCTV 로그인</div>
<div id = "login_area">
  <div id ="loginBox">

    <form action="" method="POST">

      <div class="input-box">
        <input id="username" type="text" name="username" placeholder="아이디">
        <label for="username">아이디</label>
      </div>

      <div class="input-box">
        <input id="password" type="password" name="password" placeholder="비밀번호">
        <label for="password">비밀번호</label>
      </div>
      <div id="forgot">
        <a href="">비밀번호 찾기</a>
        <a href="">아이디 찾기</a>
      </div>
      <input type="submit" value="로그인">
      <div id = "userJoin">
        <a href="/user/join">회원 가입</a>
      </div>
    </form>
  </div>
</div>

<%@ include file="../layout/footer.jsp"%>