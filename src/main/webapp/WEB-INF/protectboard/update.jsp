<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/reportboard_register_style.css">
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
    <h1>실종 아동 보호 글 수정</h1>

    <form action="/protectBoard/update" method="post">
    	<input type="hidden" name="protect_id" value="${board.protect_id }">
        <table>
        	<tr>
                <td>작성자</td>
                <td>${board.user_loginId }</td>
            </tr>
        	<tr>
                <td>작성자 연락처</td>
                <td><input type="text" name="user_phone" value="${board.user_phone }"></td>
            </tr>
        	<tr>
                <td>보호 아동 이름</td>
                <td><input type="text" name="child_name" value="${board.child_name }" id="child_name"></td>
            </tr>
            <tr>
                <td>보호 아동 나이</td>
                <td><input type="number" name="child_age" oninput="checkNumberLength(this)" value="${board.child_age }"></td>
            </tr>
            <tr>
                <td>아동 성별</td>
                <td>
                	<input type="radio" name="child_gender" value="male" ${board.child_gender == '남성' ? 'checked' : ''}>남성
                	<input type="radio" name="child_gender" value="female" ${board.child_gender == '여성' ? 'checked' : ''}>여성
                </td>
            </tr>
            <tr>
                <td>아동 연고지</td>
                <td><textarea name="child_hometown" rows="1" cols="100">${board.child_hometown }</textarea></td>
            </tr>
            <tr>
                <td>보호 시작 시간</td>
                <td><input type="datetime-local" name="protect_time" id="protect_time" value="${board.protect_time }"></td>
            </tr>
            <tr>
                <td>보호 위치</td>
                <td><textarea name="protect_address" rows="1" cols="100">${board.protect_address }</textarea></td>
            </tr>
            <tr>
                <td>특이사항</td>
                <td><textarea name="protect_content" rows="50" cols="100">${board.protect_content }</textarea></td>
            </tr>
        </table>
                <input type="submit" value="수정완료" onclick="return validateForm()">
        <input type="button" value="취소" onclick="location.href='get?protect_id=${board.protect_id}'"/>
    </form>
</center>



<script>
    function validateForm() {
        // 입력값이 없는 경우 submit 방지
        if (document.getElementsByName("user_phone")[0].value.trim() === "" || 
            document.getElementsByName("child_name")[0].value.trim() === "" ||
            document.getElementsByName("child_age")[0].value.trim() === "" ||
            document.getElementsByName("child_gender")[0].checked === false &&
            document.getElementsByName("child_gender")[1].checked === false ||
            document.getElementsByName("child_hometown")[0].value.trim() === "" ||
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
