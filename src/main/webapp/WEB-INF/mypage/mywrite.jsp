<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<% 
	HttpSession userSession = request.getSession();
	UserVO userInfo = (UserVO) userSession.getAttribute("user");
	String userLoginId = null;
	Long userId = null;
	userLoginId =userInfo.getUser_loginID();
%>

<link rel="stylesheet" href="/resources/css/mywrite.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   
	<!-- 왼쪽 사이드바  -->
	<div class="menu">
    <ul id="mypagemenu">
        <li><label for="main_menu"><div>
        	<span class="material-symbols-outlined">person</span>
       		 마이페이지</div></label>
        </li>
    
        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">edit</span>
            회원정보수정</div>
        </a></li>

        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">list_alt</span>
            제보목록</div>
        </a></li>

        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">notifications</span>
            실종알림</div>
        </a></li>

        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">person_remove</span>
            회원탈퇴</div>
        </a></li>
    </ul>
  </div>

<form action="/mypage/mywrite" method="post">
    	<input type="hidden" name="child_name" value="${board.child_name }"/>
    	<input type="hidden" name="child_age" value="${board.child_age }"/>
    	<input type="hidden" name="child_gender" value="${board.child_gender }"/>
    	<input type="hidden" name="password" value="${board.time }"/>
    	<input type="hidden" name="password" value="${board.address }"/>
    	<input type="hidden" name="user_loginId" value="${board.user_Id }"/>
    	<input type="hidden" name="child_age" value="${board.child_Id }"/>
    	<input type="hidden" name="password" value="${board.password }"/>
    	<input type="hidden" name="approval" value="${board.approval }"/>
	<h1>제보 목록</h1>
	<table>
		<tr>
			<td>제보 글 고유번호</td>
			<td>제보 내용</td>
			<td>작성자</td>
		</tr>
		
		<c:forEach items="${userList}" var="user">
		<tr>
			<td>${user.report_id }</td>
			<td>${user.report_content }</td>
			<td><%= userLoginId %></td>
		</tr>
		</c:forEach>
	</table>
  </form>
</html>

<script>
	function deletePost(report_id) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			$.ajax({
				type: "POST",
				url: "<c:url value='/mypage/mywrite'/>",
				data: {report_id: report_id},
				success: function(data) {
					location.reload();
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert("글 삭제에 실패했습니다.");
				}
			});
		}
	}
</script>


<%@ include file="../layout/footer.jsp"%>