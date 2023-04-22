<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제보 목록</title>
</head>
<body>
	<h1>제보 목록</h1>
	<table>
		<tr>
			<th>제보 글 고유번호</th>
			    <th>제보 내용</th>
                <th>작성일자</th>
                <!--<th>수정일자</th>-->
                <th>작성자</th>
                <th>수정</th>
                <th>삭제</th>
			<th></th>
		</tr>
		<c:forEach var="mywrite" items="${mywrite}">
			<tr>
				<td>${mywrite.report_id}</td>
				<td><a href="get?report_id=${mywrite.report_id}"><c:out value="${mywrite.report_content}" /></a></td>
				<td>${mywrite.reg_dt}</td>
				<td><a href="get?report_id=${mywrite.report_id}"><c:out value="${mywrite.user_loginId}"/></a></td>
				<td><a href="<c:url  value='/mypage/edit' />?report_id=${mywrite.report_id}">수정</a></td>				
				<td><input type="submit" value="글삭제" onclick="deletePost(${mywrite.report_id})"/></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>