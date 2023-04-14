<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>


<div id="login_logo">CCTV 로그인</div>
<div id="login_area">
    <div id="loginBox">

        <form id="loginForm" action="/user/login" method="POST" onsubmit="return checkLogin()">

            <div class="input-box">
                <input id="username" type="text" name="email" placeholder="아이디">
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
            <div id="userJoin">
                <a href="">회원 가입</a>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    checkLogin = function () {
        var form = document.getElementById('loginForm');
        var data = new FormData(form);
        fetch('/user/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                email: 's',
                password: 's'
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