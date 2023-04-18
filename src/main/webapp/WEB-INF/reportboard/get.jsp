<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.firstclass.childrenctv.ReportBoard.ReportBoardVO" %>

<%@include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/reportboard_get_style.css">
</head>

<center>
    <h1>실종 아동 제보</h1>

        <table>
        	<tr>
                <td>아동 이름</td>
                <td>${board.child_name }</td>
            </tr>
            <tr>
                <td>나이</td>
                <td>${board.child_age }세</td>
            </tr>
            <tr>
                <td>키(신장)</td>
                <td>${board.child_height } (cm)</td>
            </tr>
            <tr>
                <td>성별</td>
                <td>${board.child_gender }</td>
            </tr>
            <tr>
                <td>연고지</td>
                <td>${board.child_hometown }</td>
            </tr>
            <tr>
                <td>목격 시간</td>
                <td>${board.report_time.toString().replace('T', ' ') }</td>
            </tr>
            <tr>
                <td>작성자</td>
                <td>${board.user_loginId}</td> 
            </tr>
            <tr>
                <td>목격 위치</td>
                <td>${board.report_address}</td>
            </tr>
            <tr>
                <td>목격 내용</td>
                <td><textarea name="report_content" rows="50" cols="100" readonly="readonly">${board.report_content }</textarea></td>
            </tr>
        </table>
         <input type="button" value="목록" onclick="location.href='list?child_id=${board.child_id}'"/>
		<input type="button" value="수정" onclick="updateDialog()"/>
         
          <%
			HttpSession userSession = request.getSession();
  			UserVO userInfo = (UserVO) userSession.getAttribute("user");
  			ReportBoardVO reportboard = (ReportBoardVO)request.getAttribute("board");
         	if(userInfo != null){
        		if(userInfo.getUser_grade().equalsIgnoreCase("admin")){
         %>
         <input type="submit" value="글삭제" onclick="deletePost(${board.report_id})"/>
         <%
        		}
         	}
         %>
         
         
         
</center>

<script>
function deletePost(reportId) {
	  if (confirm("글을 삭제하시겠습니까?")) {
	    var xhr = new XMLHttpRequest();
	    xhr.open('POST', '/reportBoard/delete', true);
	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
	    var childId = "${board.child_id}";
	    xhr.onload = function () {
	      if (xhr.status === 200) {
	        alert('글이 삭제되었습니다.');
	        location.href = "list?child_id=" +${board.child_id};
	      } else {
	        alert('글 삭제에 실패하였습니다.');
	      }
	    };
	    xhr.send('report_id=' + reportId + '&child_id=' + childId); // report_id와 child_id 값을 key=value 형태로 전달
	  }
	}
  </script>
  

<script>
function updateDialog() {
	var grade = '<%= userInfo.getUser_grade()%>';
	if(grade.toLowerCase() === "admin"){
		alert("관리자 계정입니다.");
		location.href = 'update?report_id=${board.report_id}'; // 화면 이동
		return;
	}
	var password = prompt("비밀번호를 입력하세요.");
    if (password != null && password.length > 0) {
        if (password === "${board.password}") {
            location.href = 'update?report_id=${board.report_id}'; // 화면 이동
        } else {
            alert("비밀번호가 일치하지 않습니다."); 
        }
    }
}
</script>


<%@ include file="../layout/footer.jsp"%>
