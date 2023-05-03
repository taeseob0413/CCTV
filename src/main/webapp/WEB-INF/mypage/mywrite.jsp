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