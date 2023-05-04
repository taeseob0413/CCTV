<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/css/user/findPassword.css">
<div id="login_logo">CCTV 비밀번호 찾기</div>
<div id="login_area">
    <div id="loginBox">

        <div id="loginForm">
            <div class="input-box">
                <input id="username" type="text" name="username" placeholder="회원 이름">
                <label for="username">회원 이름</label>
            </div>

            <div class="input-box">
                <input id="email" type="text" name="email" placeholder="이메일">
                <label for="email">이메일</label>
            </div>
            <div class="input-box">
                <input id="userId" type="text" name="userId" placeholder="아이디">
                <label for="userId">아이디</label>
            </div>
            <button id="loginButton"type="button" onclick="checkLogin()">비밀번호 찾기</button>
            <div id="userJoin">
                <a href="">회원 가입</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    checkLogin = function () {
        const userName = document.getElementById('username').value;
        const userEmail = document.getElementById('email').value;
        const userId = document.getElementById('userId').value;
        var parameter = "?userName=" + userName.toString() + "&userEmail=" + userEmail.toString() + "&userLoginId=" + userId.toString();
        fetch('/find/user/password' + parameter, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then(response => {
                return response.json()
            })
            .then(function (json) {
                console.log(json);
                if (json.code == 200) {
                    var message = json.message;
                    alert(message);
                    location.replace("/user/login");
                } else {
                    // 요청이 실패한 경우
                    var message = json.message;
                    alert(message);
                    return false;
                }
            })
            .catch(function (error) {
                alert('요청 처리 중 에러가 발생했습니다.');
                return false;
            });
        return false;
    }
</script>
<%@ include file="../layout/footer.jsp" %>
