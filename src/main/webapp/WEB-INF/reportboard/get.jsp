<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="com.firstclass.childrenctv.reportBoard.ReportBoardVO"%>

<%@include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/board/board_get.css">
</head>

<center>

	<div id="ContentArea">
		<div id="InnerArea">
			<div id="title">실종 아동 목격 정보</div>
			<div>
				<table>
					<tr>
						<td class="attribute">작성자</td>
						<td class="values">${board.user_loginId}</td>
					</tr>
					<tr>
						<td class="attribute">아동 이름</td>
						<td class="values">${board.child_name }</td>
					</tr>
					<tr>
						<td class="attribute">나이</td>
						<td class="values">${board.child_age }세</td>
					</tr>
					<tr>
						<td class="attribute">성별</td>
						<td class="values">${board.child_gender }</td>
					</tr>
					<tr>
						<td class="attribute">목격 시간</td>
						<td class="values">${board.report_time.toString().replace('T', ' ') }</td>
					</tr>
					<tr>
						<td class="attribute">목격 위치</td>
						<td class="values">${board.report_address}</td>
					</tr>
					<tr>
						<td class="attribute">목격 내용</td>
						<td class="values"><textarea name="report_content" rows="20" cols="100"
								readonly="readonly">${board.report_content }</textarea></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<input type="button" value="목록" onclick="location.href='/child/get?child_id=${board.child_id}'" /> 
		<input type="button" value="수정" onclick="updateDialog()" />


  
          <%
			HttpSession userSession = request.getSession();
  			UserVO userInfo = (UserVO) userSession.getAttribute("user");
  			ReportBoardVO reportboard = (ReportBoardVO)request.getAttribute("board");
         	if(userInfo != null){
        		if(userInfo.getUser_grade().equalsIgnoreCase("admin")){
         %>
	<input type="submit" value="삭제" onclick="deletePost(${board.report_id})" />
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
	        location.href = "/child/get?child_id=" +${board.child_id};
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
		var grade = '<%=userInfo != null ? userInfo.getUser_grade() : ""%>';
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
