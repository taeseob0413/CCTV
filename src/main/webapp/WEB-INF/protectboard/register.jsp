<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/reportboard_register_style.css">
</head>

<% 
	HttpSession userSession = request.getSession();
	UserVO userInfo = (UserVO) userSession.getAttribute("user");
	String userLoginId = null;
	Long userId = null;
	if(userInfo != null){
		userLoginId =userInfo.getUser_loginID();
	}
	else{
		userLoginId = "익명";
	}
%>

<center>
    <h1>실종 아동 제보 글 작성</h1>

    <form action="/protectBoard/register" method="post" id="registerform">
    	<input type="hidden" name = "child_id" value="0">
    	<input type="hidden" name= "user_loginId" value= <%= userLoginId %>>
    	
    	
        <table>
        	<tr>
                <td>작성자</td>
                <td><%= userLoginId %></td>
            </tr>
            <tr>
                <td>작성자 연락처</td>
                <td><input type=text name="user_phone"></td>
            </tr>
        	<tr>
                <td>보호 아동 이름</td>
                <td><input type=text name="child_name"></td>
            </tr>
            <tr>
                <td>보호 아동 나이</td>
                <td><input type=number name="child_age" oninput="checkNumberLength(this)"></td>
            </tr>
            <tr>
                <td>아동 성별</td>
                <td>
                	<input type="radio" name="child_gender" value="남성">남성
                	<input type="radio" name="child_gender" value="여성">여성
                </td>
            </tr>
            <tr>
                <td>아동 연고지</td>
                <td><textarea name="child_hometown" rows="1" cols="100"></textarea></td>
            </tr>
            <tr>
                <td>보호 시작 시간</td>
                <td><input type="datetime-local" name="protect_time" id="protect_time"></td>
            </tr>
            <tr>
                <td>보호 위치</td>
                <td><textarea name="protect_address" rows="1" cols="100"></textarea></td>
            </tr>
            <tr>
                <td>특이사항</td>
                <td><textarea name="protect_content" rows="50" cols="100"></textarea></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="password" oninput="checkPwLength(this)"></td>
            </tr>
        </table>
        <input type="submit" id="mysubmit" value="작성완료" onclick="return submitForm()"/>
        <input type="button" value="취소" onclick="location.href='list?child_id=${child_id}'"/>
    </form>
</center>


<script>
//예외값 처리하는 script
function checkNumberLength(input) {
  if (input.value.length > 2) {
    alert("나이는 최대 2자리까지 입력 가능합니다.");
    input.value = input.value.slice(0, 2);
  }
}

function checkPwLength(input) {
	  if (input.value.length > 10) {
	    alert("비밀번호는 10자리 이하로 입력해주세요.");
	  }
	}
</script>

<script>
//엔터 키(키 코드 13)를 눌렀을 때 폼의 서브밋 동작을 막음
document.getElementById("registerform").addEventListener("keydown", function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  }
});
</script>

<script>

function submitForm() {
	  // 폼 서브밋 전에 비밀번호 값이 있는지 확인
	  var passwordInput = document.getElementsByName("password")[0];
	  if (passwordInput.value.length === 0) {
	    alert("비밀번호를 입력해주세요.");
	    return false; // 서브밋 중지
	  }
	  return true; // 서브밋 실행
	}
</script>




<%@ include file="../layout/footer.jsp"%>