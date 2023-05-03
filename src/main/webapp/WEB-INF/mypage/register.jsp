<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="../layout/header.jsp"%>

<!-- 사이드바 -->
<jsp:include page="../mypage/sidebar.jsp"/>
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> -->

<html>
<head>
<link rel="stylesheet" href="/resources/css/mypage/mywrite.css" />
</head>
<body>
	<!-- <h1>Hello world!</h1> -->

	<form action="/mypage/register" method="post">
	<div class="container">

		<div class="tels">

			<h1>실종자 가족 등록</h1>
			
			<table border="1">
				<tr>
					<th>상세페이지 바로가기(childBoard_id)</th>
					<th>id</th>
					<th>user_id</th>
					<th>아동이름</th>

				</tr>

				<c:forEach var="item" items="${familyList}">
					<tr>
						<td class="text-center" width=10%><a href="/child/get?child_id=${item.childBoard_id}">${item.childBoard_id}</a></td>
						<td class="text-center" width=10%>${item.id}</td>
						<td class="text-center" width=10%>${item.user_id}</td>	
						<td class="text-center" width=10%>${item.child.child_name}</td>		
						<td><a href="/mypage/register?id=${item.id}">삭제</a></td>																		
					</tr>
				</c:forEach>
			</table>
			
				<button type="button" onclick="register_alert()">글삭제</button>
			
		</div>
	</div>
	<!-- class=container -->
</form>
</body>
</html>

<script type="text/javascript">
function register_alert() {
	 alert('삭제가 완료되었습니다.')
	}

</script>