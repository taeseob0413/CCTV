<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/board_update.css">
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
<div id="ContentArea">
<div id="InnerArea">
	<div id="title">목격 아동 정보 수정</div>
		<div>
			<form action="/reportBoard/update" method="post" id="registerform">
				<input type="hidden" name="child_id" value="${board.child_id }" /> 
				<input type="hidden" name="child_name" value="${board.child_name }" /> 
				<input type="hidden" name="child_age" value="${board.child_age }" /> 
				<input type="hidden" name="child_gender" value="${board.child_gender }" />
				<input type="hidden" name="report_id" value="${board.report_id }" />
				<input type="hidden" name="user_loginId" value="${board.user_loginId }" /> 
				<input type="hidden" name="password" value="${board.password }" /> 
				<input type="hidden" name="approval" value="${board.approval }" />
					<table>
						<tr>
							<td class="attribute">작성자</td>
							<td>${board.user_loginId }</td>
						</tr>
						<tr>
							<td class="attribute">아동 이름</td>
							<td>${board.child_name }</td>
						</tr>
						<tr>
							<td class="attribute">나이</td>
							<td>${board.child_age }></td>
						</tr>
						<tr>
							<td class="attribute">성별</td>
							<td>${board.child_gender }</td>
						</tr>
						<tr>
							<td class="attribute">목격 시간</td>
							<td><input type="datetime-local" name="report_time"
								value="${board.report_time}"></td>
						</tr>
						<tr>
							<td class="attribute">목격 위치</td>
							<td><textarea name="report_address" rows="1" cols="100">${board.report_address }</textarea></td>
						</tr>
						<tr>
							<td class="attribute">목격 내용</td>
							<td><textarea name="report_content" rows="10" cols="100">${board.report_content }</textarea></td>
						</tr>
					</table>
				</div>
				<div id="buttonContainer">
					<input type="submit" value="수정완료" onclick="return submitForm()">
					<input type="button" value="취소"
						onclick="location.href='get?report_id=${board.report_id}'" />
				</div>
			</form>
		</div>
	</div>
</center>


<script>
	function submitForm() {
		// 입력값이 없는 경우 submit 방지
		if (document.getElementsByName("report_time")[0].value.trim() === ""
				|| document.getElementsByName("report_address")[0].value.trim() === ""
				|| document.getElementsByName("report_content")[0].value.trim() === ""
				|| document.getElementsByName("password")[0].value.trim() === "") {
			alert("모든 항목을 입력해주세요.");
			return false;
		}
		alert('수정완료!')
		return true;
	}
</script>





<%@ include file="../layout/footer.jsp"%>