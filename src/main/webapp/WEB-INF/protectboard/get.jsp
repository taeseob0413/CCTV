<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.firstclass.childrenctv.ProtectBoard.ProtectBoardVO" %>

<%@include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/reportboard_get_style.css">
</head>

<center>
    <h1>보호 아동 제보</h1>

        <table>
        	<tr>
                <td>작성자</td>
                <td>${board.user_loginId}</td> 
            </tr>
        	<tr>
                <td>아동 이름</td>
                <td>${board.child_name }</td>
            </tr>
            <tr>
                <td>나이</td>
                <td>${board.child_age }세</td>
            </tr>
            <tr>
                <td>성별</td>
                <td>${board.child_gender }</td>
            </tr>
            <tr>
                <td>아동 연고지</td>
                <td>${board.child_hometown }</td>
            </tr>
            <tr>
                <td>목격 시간</td>
                <td>${board.protect_time.toString().replace('T', ' ') }</td>
            </tr>
            <tr>
                <td>목격 위치</td>
                <td>${board.protect_address}</td>
            </tr>
            <tr>
                <td>목격 내용</td>
                <td><textarea name="protect_content" rows="50" cols="100" readonly="readonly">${board.protect_content }</textarea></td>
            </tr>
        </table>
         <input type="button" value="목록" onclick="location.href='/protectBoard/list'"/>
		<input type="button" value="수정" onclick="updateDialog()"/>
         
          <%
			HttpSession userSession = request.getSession();
  			UserVO userInfo = (UserVO) userSession.getAttribute("user");
  			ProtectBoardVO protectboard = (ProtectBoardVO)request.getAttribute("board");
         	if(userInfo != null){
        		if(userInfo.getUser_grade().equalsIgnoreCase("admin")){
         %>
         <input type="submit" value="글삭제" onclick="deleteBoard()"/>
         <%
        		}
         	}
         %>
         
         
         
</center>
  
<script>
function deleteBoard() {
    if (confirm("글을 삭제하시겠습니까?")) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/protectBoard/delete", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    alert("글이 삭제되었습니다.");
                    location.href = "/protectBoard/list";
                } else {
                    alert("글 삭제에 실패하였습니다.");
                }
            }
        };
        xhr.send("protect_id=${board.protect_id}");
    }
}
</script>

<script>
function updateDialog() {
		var grade = '<%=userInfo != null ? userInfo.getUser_grade() : ""%>';
		if(grade.toLowerCase() === "admin"){
			alert("관리자 계정입니다.");
			location.href = 'update?protect_id=${board.protect_id}'; // 화면 이동
			return;
		}
	
	var password = prompt("비밀번호를 입력하세요.");
    if (password != null && password.length > 0) {
        if (password === "${board.password}") {
            location.href = 'update?protect_id=${board.protect_id}'; // 화면 이동
        } else {
            alert("비밀번호가 일치하지 않습니다."); 
        }
    }
}
</script>


<%@ include file="../layout/footer.jsp"%>
