<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>

<center>
	<link rel="stylesheet" href="/resources/css/signup.css"/>
	<form action="/user/join" method="post"> 
    <div class=signup style="text-align: center;">
    
    <div id="info_id" >
        <p style="font-weight:bold; margin-top: 50px; margin-left: -350px;">아이디</p>
   		<input type="text" id="username" name="user_loginID" style="border: 1px solid gray;" placeholder="아이디 입력(4~20자)"/>
   		<button id="idcheck" type="button">중복확인</button><br>
   		<span id="id_check"></span>
    </div>

    <div id="info_pw" style="text-align: center;">
        <div id="info_pw1">
            <p style="font-weight:bold; margin-top:30px; margin-left: -330px;">비밀번호</p>
            <input type="password" style="border: 1px solid gray;" placeholder="비밀번호 입력"
            onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
            <p class="error-msg" style="margin: 5px 0px 0px 50px; color: red;"></p>
        </div>
      
         <div id="info_pw2">
            <p style="font-weight:bold; margin-top: 30px; margin-left: -280px;">비밀번호 재확인</p>
            <input type="password" id="password" name="user_password" style="border: 1px solid gray;"  placeholder="비밀번호 재입력"
            onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 재입력'"/>
            <p class="error-msg"></p>
        </div>
    </div>

    <div id="info_name">
        <p style="font-weight:bold; margin-top: 30px; margin-left: -360px;">이름</p>
        <input type="text" name="user_name" style="border: 1px solid gray;"  placeholder="이름을 입력하세요"
        onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력하세요'"/>
    </div>

    <div id="info_email">
        <div id="info_email1">
            <p style="font-weight:bold; margin-top: 30px; margin-left: -270px;">본인 확인 이메일</p>
            <input type="text" id="user_email" name="user_email" style="border: 1px solid gray;" placeholder="이메일을 입력하세요"
            onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력하세요'"/> 
            <button id="emailcheck" type="button">인증번호 전송</button>
        </div>

        <div id="info_email2">
            <input type="text" id="mailconfirm" style="border: 1px solid gray;" placeholder="인증번호 입력"
            onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 입력'"/><br>
            <span id="email_check"></span>
        </div>    
    </div>

    <div id="info_age">
        <p style="font-weight:bold; margin-top: 30px; margin-left: -360px;">나이</p>
        <input type="text" name="user_age" style="border: 1px solid gray;" placeholder="나이를 입력하세요(숫자만 입력)"
        onfocus="this.placeholder=''" onblur="this.placeholder='나이를 입력하세요(숫자만 입력)'"/>

    </div>

    <div id="info_gender">
        <p style="font-weight:bold; margin-top: 30px; margin-left: -360px;">성별</p>
        <select id="info_gender1" name="user_gender" style="font-size: 1.05em;">
            <option selected>성별</option>
            <option value="남">남</option>
            <option value="여">여</option>
        </select>
    </div>

    <div id="info_address">
        <p style="font-weight:bold; margin-top: 30px; margin-left: -360px;">주소</p>
        <input type="text" name="user_address" style="border: 1px solid gray;" placeholder="주소를 입력하세요"
        onfocus="this.placeholder=''" onblur="this.placeholder='주소를 입력하세요'"/>
    </div>

    <div id="b">
        <button id="b1" type="submit" >가입하기</button>
        <button id="b2" type="submit" >가입취소</button>
    </div>

    <p id="already">이미 회원이신가요?</p>
    <p id="login">
    <a href="/user/login">로그인 하러가기</a>
    </p>
    
    <!--><script src="/resources/js/signup.js"></script> -->
           
    </form>
</center>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

$("#idcheck").click(function(){
	
	var username = $("#username").val();
	var data = {username: username}

	$.ajax({
		url : '/user/idCheck' ,
		type : 'post',
		data : data,
		success : function(result) {	
			console.log("성공여부:" + result);
			
			if (result != "fail") {
				$("#id_check").text("사용 가능한 아이디입니다.");
				$("#id_check").css("color", "green");
				
			} else {
				$("#id_check").text("이미 사용중인 아이디입니다");
				$("#id_check").css("color", "red");
			}				
		}
	})
});

var code = "";
$("#emailcheck").click(function(){
	
	var user_email = $("#user_email").val();
	var data = {user_email: user_email}

	$.ajax({
		url : '/user/emailcheck' ,
		type : 'get',
		data : data,
		success : function(result) {	
			alert("인증번호가 전송되었습니다.")
			code = result;
			console.log("code:" + code);
		}
	})
});

$("#mailconfirm").blur(function() {
	var inputcode = $("#mailconfirm").val();
	console.log("inputcode: " +inputcode)

	if(inputcode == code) {	
		$("#email_check").text("인증성공");
		$("#email_check").css("color", "green");
		
	} else {
		$("#email_check").text("일치하지 않습니다.");
		$("#email_check").css("color", "red");
		
	}
	
});
	

	
</script>
		
<%@ include file="../layout/footer.jsp"%>