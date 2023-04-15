<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>


<div id="login_logo">CCTV 로그인</div>
<div id="login_area">
    <div id="loginBox">

        <div id="loginForm">
            <div class="input-box">
                <input id="username" type="text" name="username" placeholder="아이디">
                <label for="username">아이디</label>
            </div>

            <div class="input-box">
                <input id="password" type="password" name="password" placeholder="비밀번호">
                <label for="password">비밀번호</label>
            </div>
            <div id="forgot">
                <a href="/find/user/userPassword">비밀번호 찾기</a>
                <a href="/find/user/userLoginId">아이디 찾기</a>
            </div>
            <button id="loginButton"type="button" onclick="checkLogin()">로그인</button>
            <div id="userJoin">
                <a href="">회원 가입</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    checkLogin = function () {
        const userEmail = document.getElementById('username').value;
        const userPassword = document.getElementById('password').value;
        fetch('/user/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                email : userEmail.toString(),
                password : userPassword.toString()
            })
        })
            .then(response => {
                return response.json()
            })
        .then(function (json) {
            console.log(json);
            if (json.code == 200) {
                // 요청이 성공한 경우
                location.replace("/");
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