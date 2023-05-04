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
<link rel="stylesheet" href="/resources/css/mypage/mypage_register.css" />
</head>
<body>
	<!-- <h1>Hello world!</h1> -->


	<div class="container">

		<div class="tels">

			<h1>실종 아동 관심 리스트</h1>
			<table border="1">
				<tr>
					<th>고유번호</th>
					<!-- <th>id</th>
					<th>userid</th> -->
					<th>이름</th>
					<th>실종 아동 삭제</th>

				</tr>

				<c:forEach var="item" items="${familyList}">
					<tr>
						<td class="text-center" width=10%><a href="/child/get?child_id=${item.childBoard_id}">${item.childBoard_id}</a></td>
						<%-- <td class="text-center" width=10%>${item.id}</td>
						<td class="text-center" width=10%>${item.user_id}</td>	 --%>
						<td class="text-center" width=10%>${item.child_name}</td>	
						<td class="text-center" width=10%><a href="/mypage/register/delete?id=${item.id}">삭제</a></td>																	
						<%-- <td><button type="button" onclick="deletePost(${item.id})">글삭제</button></td> --%>
					</tr>
				</c:forEach>
				
			</table>
			
		</div>
	</div>
	<!-- class=container -->

</body>
</html>
<%@ include file="../layout/footer.jsp"%>