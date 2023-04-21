<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/protectBoard_update.css">
</head>

<% 
	HttpSession userSession = request.getSession();
	UserVO userInfo = (UserVO) userSession.getAttribute("user");
	String userLoginId = null;
	if(userInfo != null){
		userLoginId =userInfo.getUser_loginID();
	}
	else{
		userLoginId = "익명";
	}
%>
	
<center>
	<div id="title">보호 아동 정보 수정</div>
	<div id="ContentArea">
	<div>
    <form action="/protectBoard/update" method="post" id="registerform">
    	<input type="hidden" name="protect_id" value="${board.protect_id }">
    	<input type="hidden" name="password" value="${board.password }">
    	<div id="InnerArea">
        <table>
        	<tr>
                <td id="attribute">작성자</td>
                <td>${board.user_loginId }</td>
            </tr>
        	<tr>
                <td id="attribute">작성자 연락처</td>
                <td><input type="text" name="user_phone" value="${board.user_phone }"></td>
            </tr>
        	<tr>
                <td id="attribute">보호 아동 이름</td>
                <td><input type="text" name="child_name" value="${board.child_name }" id="child_name"></td>
            </tr>
            <tr>
                <td id="attribute">보호 아동 나이</td>
                <td><input type="number" name="child_age" oninput="checkNumberLength(this)" value="${board.child_age }"></td>
            </tr>
            <tr>
                <td id="attribute">아동 성별</td>
                <td>
                	<input type="radio" name="child_gender" value="남성" ${board.child_gender == '남자' ? 'checked' : ''}>남자
                	<input type="radio" name="child_gender" value="여성" ${board.child_gender == '여자' ? 'checked' : ''}>여자
                </td>
            </tr>
            <tr>
                <td id="attribute">아동 연고지</td>
                <td><textarea name="child_hometown" rows="1" cols="100">${board.child_hometown }</textarea></td>
            </tr>
            <tr>
                <td id="attribute">아동 목격장소</td>
                <td><textarea name="child_findlocation" rows="1" cols="100">${board.child_findlocation }</textarea></td>
            </tr>
            <tr>
                <td id="attribute">목격 시간</td>
                <td><input type="datetime-local" name="protect_time" id="protect_time" value="${board.protect_time }"></td>
            </tr>
            <tr>
                <td id="attribute">보호 위치</td>
                <td><textarea name="protect_address" rows="1" cols="100">${board.protect_address }</textarea></td>
            </tr>
            <tr>
                <td id="attribute">특이사항</td>
                <td><textarea name="protect_content" rows="10" cols="100">${board.protect_content }</textarea></td>
            </tr>
        </table>
        </div>
        <div id="buttonContainer">
		<input type="submit" value="수정완료" onclick="return validateForm()">
        <input type="button" value="취소" onclick="location.href='get?protect_id=${board.protect_id}'"/>
        </div>
    </form>
    </div>
    </div>
</center>


<script>
//예외값 처리하는 script
function checkNumberLength(input) {
  if (input.value.length > 2) {
    alert("나이는 최대 2자리까지 입력 가능합니다.");
    input.value = input.value.slice(0, 2);
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

<%@ include file="../layout/footer.jsp"%>

<script>
    function validateForm() {
        // 입력값이 없는 경우 submit 방지
        if (document.getElementsByName("user_phone")[0].value.trim() === "" || 
            document.getElementsByName("child_name")[0].value.trim() === "" ||
            document.getElementsByName("child_age")[0].value.trim() === "" ||
            document.getElementsByName("child_gender")[0].checked === false &&
            document.getElementsByName("child_gender")[1].checked === false ||
            document.getElementsByName("child_hometown")[0].value.trim() === "" ||
            document.getElementsByName("child_findlocation")[0].value.trim() === "" ||
            document.getElementsByName("protect_time")[0].value.trim() === "" ||
            document.getElementsByName("protect_address")[0].value.trim() === "" ||
            document.getElementsByName("protect_content")[0].value.trim() === "") {
            alert("모든 항목을 입력해주세요.");
            return false;
        }
        alert('수정 완료!')
        return true;
    }
</script>
