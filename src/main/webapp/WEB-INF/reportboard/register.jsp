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
		userId = userInfo.getUser_id();
	}
	else{
		userLoginId = "익명";
		userId = 0L;
	}
%>

<center>
    <h1>실종 아동 제보 글 작성</h1>

    <form action="/reportBoard/register" method="post" id="registerform">
    	<input type="hidden" name = "child_id" value="${child_id}">
    	<input type="hidden" name= "user_loginId" value= <%= userLoginId %>>
    	<input type="hidden" name= "user_id" value=<%= userId %>>
    	<input type="hidden" name= "child_name" value="데이터">
    	<input type="hidden" name = "child_age" value="11">
    	<input type="hidden" name = "child_gender" value="데이터">
    	
        <table>
        	<tr>
                <td>작성자</td>
                <td><%= userLoginId %></td>
            </tr>
        	<tr>
                <td>아동 이름</td>
                <td><!-- ${child.child_name }--></td>
            </tr>
            <tr>
                <td>목격 시간</td>
                <td><input type="datetime-local" name="report_time" id="report_time"></td>
            </tr>
            <tr>
                <td>목격 위치</td>
                <td><textarea name="report_address" rows="1" cols="100"></textarea></td>
            </tr>
            <tr>
                <td>목격 내용</td>
                <td><textarea name="report_content" rows="50" cols="100"></textarea></td>
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