<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Write</title>
</head>
<body>
	<h1>My Write</h1>
	<table>
		<tr>
			<th>제보 글 고유번호</th>
                <th>작성일자</th>
                <!--<th>수정일자</th>-->
                <th>작성자</th>
                <th>삭제</th>
			<th></th>
		</tr>
		<c:forEach var="mywrite" items="${mywrite}">
			<tr>
				<td>${mywrite.report_id}</td>
                    <td>${mywrite.reg_dt}</td>
                    <!-- <td>${mywrite.mod_dt}</td> -->
                    <td>${mywrite.user_id}</td>
				<td><a href="<c:url value='/mypage/delete' />?report_id=${mywrite.report_id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>