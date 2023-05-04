<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/board_register.css">
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
<div id="ContentArea">
		<div id="InnerArea">
    <div id="title">실종 아동 목격 제보</div>
<div>
    <form action="/reportBoard/register" method="post" id="registerform">
    	<input type="hidden" name = "child_id" value="${child.child_id}">
    	<input type="hidden" name= "user_loginId" value= <%= userLoginId %>>
    	<input type="hidden" name= "child_name" value="${child.child_name }">
    	<input type="hidden" name = "child_age" value="${child.child_curage }">
    	<input type="hidden" name = "child_gender" value="${child.child_gender }">
    	
        <table>
        	<tr>
                <td class="attribute">작성자</td>
                <td><%= userLoginId %></td>
            </tr>
        	<tr>
                <td class="attribute">아동 이름</td>
                <td>${child.child_name }</td>
            </tr>
            <tr>
                <td class="attribute">목격 시간</td>
                <td><input type="datetime-local" name="report_time" id="report_time"></td>
            </tr>
            <tr>
                <td class="attribute">목격 위치</td>
                <td><textarea name="report_address" rows="1" cols="100" style="font-size:13px;"></textarea></td>
            </tr>
            <tr>
                <td class="attribute">목격 내용</td>
                <td><textarea name="report_content" rows="13" cols="100"></textarea></td>
            </tr>
            <tr>
                <td class="attribute">비밀번호</td>
                <td><input type="text" id="pw" name="password" oninput="checkPwLength(this)"></td>
            </tr>
        </table>
        </div>
        <div id="buttonContainer">
        <input type="submit" id="mysubmit" value="작성완료" onclick="return submitForm()"/>
        <input type="button" value="취소" onclick="location.href='/child/get?child_id=${child.child_id}'"/>
        </div>
    </form>
    </div>
    </div>
</center>


<script>
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
    // 입력값이 없는 경우 submit 방지
    if (document.getElementsByName("report_time")[0].value.trim() === "" ||
        document.getElementsByName("report_address")[0].value.trim() === "" ||
        document.getElementsByName("report_content")[0].value.trim() === "" ||
        document.getElementsByName("password")[0].value.trim() === "") {
        alert("모든 항목을 입력해주세요.");
        return false;
    }
    alert('관리자 승인 후 게시됩니다.')
    return true;
}
</script>




<%@ include file="../layout/footer.jsp"%>