<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/user/signup.css"/>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<div id=signup>
	<div id="info_title">회원가입</div>
	
	<form action="/user/join" method="post"> 
	
		<div id="info_id" >
       		<label id="id_label">아이디</label>
	       	<input type="text" id="username" name="user_loginID""
                   placeholder="아이디 입력(4~20자)"
	       	onfocus="this.placeholder=''" onblur="this.placeholder='아이디 입력(4~20자)'"/>
	      	<button id="idcheck" type="button">중복확인</button><br>
	       	<span id="id_check"></span>
    	</div>
    	
    	<div id="info_pw">
         <div id="info_pw1">
           <label>비밀번호</label>
           <input type="password" placeholder="비밀번호 입력"
           onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
           <p class="error-msg"></p>
         </div>
          
         <div id="info_pw2">
           <label>비밀번호 확인</label>
           <input type="password" id="password" name="user_password" placeholder="비밀번호 확인"
           onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 확인'"/>
           <p class="error-msg"></p>
         </div>
       </div>
       
       <div id="info_name">
       	<label>이름</label>
        <input type="text" name="user_name" placeholder="이름을 입력해주세요"
        onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력해주세요'"/>
      </div>
      
      
      <div id="info_email">
        <div id="info_email1">
          <label>이메일</label>
          <input type="text" id="user_email" onkeyup="dropEmail('user_email', this.value)" autocomplete="off" 
          name="user_email" placeholder="이메일을 입력해주세요"
          onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력해주세요'"/> 
          <button id="emailcheck" type="button">인증번호 전송</button>
        </div>
    
        <div id="info_email2">
          <label>인증번호</label>
          <input type="text" id="mailconfirm"  placeholder="인증번호 입력"
          onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 입력'"/><br>
          <span id="email_check"></span>
        </div>    
      </div>
      
      <div id="info_age">
        <label>나이</label>
        <input type="text" name="user_age" placeholder="나이를 입력해주세요(숫자만 입력)"
               onfocus="this.placeholder=''" onblur="this.placeholder='나이를 입력해주세요(숫자만 입력)'"/>
      </div>

       <div id="info_gender">
        <label>성별</label>
        <span>남</span>
        <input type="radio" name="user_gender" value="남" class="box">
        <span>여</span>
        <input type="radio" name="user_gender" value="여" class="box">
      </div>
      
      <div id="info_address">
        <label>주소</label>
        <input type="text" name="user_address" placeholder="주소를 입력해주세요"
        onfocus="this.placeholder=''" onblur="this.placeholder='주소를 입력해주세요'"/>
      </div>

      <div id="b">
        <button id="b1" type="submit">가입</button>
        <button id="b2" type="button" onclick="location.href='/'">취소</button>
        
      </div>
      
	  <div id="signup_content">
      	<span id="already">이미 회원이신가요?</span>
      	<span id="login"><a href="/user/login">로그인 하러가기</a></span>
      </div>
 </form>  
 </div>  
    

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

function dropEmail(a,b) {
	var mailId = b.split('@');
	var mailList = ['naver.com', 'gmail.com', 'daum.net', 'hamail.net'];
	var autokeyword = new Array;
	for(var i=0; i<mailList.length; i++) {
		autokeyword.push(mailId[0] + '@' + mailList[i]);
	}
	
	$("#"+a).autocomplete({
		source : autokeyword,
		focus : function(event, ui) {
			
		}
	});
}

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

const errMsg = {
	    id: { 
	      invalid: "4~20자의 영문 소문자와 숫자만 사용 가능합니다",
	      success: "사용 가능한 아이디입니다",
	      fail: "사용할 수 없는 아이디입니다"
	    },
	    pw: "4~20자의 영문, 숫자를 모두 포함한 비밀번호를 입력해주세요",
	    pwRe: {
	      success: "비밀번호가 일치합니다",
	      fail: "비밀번호가 일치하지 않습니다"
	    },
	  }
	var account = {pw:""};

	  // pwVal: 패스워드, pwReVal: 패스워드 재입력, isPwValid: 패스워드 유효 여부
	let pwVal = "", pwReVal = "", isPwValid = false
	const pwInputEl = document.querySelector('#info_pw1 input')
	const pwErrorMsgEl = document.querySelector('#info_pw1 .error-msg')

	pwInputEl.addEventListener('change', () => {
	  const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])[a-zA-Z0-9]{4,20}$/
	  pwVal = pwInputEl.value
	  if(pwRegExp.test(pwVal)) { // 정규식 조건 만족 O
	    isPwValid = true
	    pwErrorMsgEl.textContent = ""
	  } 
	  else { // 정규식 조건 만족 X
	    isPwValid = false
	    pwErrorMsgEl.textContent = errMsg.pw
	  }
	  checkPwValid()
	  console.log(pwVal, pwReVal, isPwValid, account)
	});

	/*** SECTION - PASSWORD RECHECK ***/
	const pwReInputEl = document.querySelector('#info_pw2 input')
	const pwReErrorMsgEl = document.querySelector('#info_pw2 .error-msg')
	pwReInputEl.addEventListener('change', () => {
	  pwReVal = pwReInputEl.value
	  checkPwValid()
	  console.log(pwVal, pwReVal, isPwValid, account)
	});

	// 비밀번호와 재입력 값 일치 여부
	function checkPwValid() {
	  account.pw = null // default null 처리
	  if(pwReVal === "") { // 미입력
	    pwReErrorMsgEl.textContent = ""
	  }
	  else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
	    if(isPwValid)
	      account.pw = pwVal
	    pwReErrorMsgEl.style.color = "green"
	    pwReErrorMsgEl.textContent = errMsg.pwRe.success
	    pwReErrorMsgEl.style.margin = "5px 0px 0px -230px"
	  }
	  else { // 비밀번호 재입력 불일치
	    pwReErrorMsgEl.style.color = "red"
	    pwReErrorMsgEl.textContent = errMsg.pwRe.fail
	    pwReErrorMsgEl.style.margin = "5px 0px 0px -190px"
	  }
	}
	
</script>		
<%@ include file="../layout/footer.jsp"%>