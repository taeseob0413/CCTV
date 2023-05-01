<<<<<<< HEAD
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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/mywrite.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../layout/header.jsp"%>

<!-- 사이드바 -->
<jsp:include page="../mypage/sidebar.jsp"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<html>
<head>
<link rel="stylesheet" href="/resources/css/mywrite.css" />
</head>
<body>
	<!-- <h1>Hello world!</h1> -->


	<div class="container">

		<div class="tels">

			<h1>제보 목록</h1>
			<table border="1">
				<tr>
					<th>-해당 페이지로 이동-(고유번호)</th>
					<th>실종 아동</th>
					<th>제보 내용</th>
					<th>작성자</th>
					<!-- <th>삭제</th> -->
				</tr>

				<c:forEach var="item" items="${reportList}">
					<tr>
						<td class="text-center" width=10%><a href="/reportBoard/get?report_id=${item.report_id}">${item.report_id}</a></td>
						<td class="text-center" width=10%>${item.child_name}</td>
						<td class="text-center" width=10%>${item.report_content}</td>
						<td class="text-center" width=10%>${item.user_loginId}</td>
						
							<%-- <button type="button" onclick="deletePost(${item.report_id})">글삭제</button> --%>
							<%--삭제할때 이 코드 사용 --%> <%--  <a href="/mypage/mywrite/delete?report_id=${item.report_id}">삭제</a> --%>
							<%-- <input type="submit" value="글삭제" onclick="deleteReportPost(${item.report_id})"/> --%>

						
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- class=container -->

</body>




</html>
>>>>>>> branch 'main' of https://github.com/ChangDaeJun/CCTV.git
