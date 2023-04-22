<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Report</title>
</head>
<body>
	<h1>Report 수정</h1>
	<form method="post" action="<c:url value='/mypage/update' />">
		<label for="report_content">내용:</label><br>
		<textarea id="report_content" name="report_content">${mywrite.report_content}</textarea><br>
		<input type="hidden" name="report_id" value="${mywrite.report_id}" />
		<input type="submit" value="수정" />
	</form>
</body>
</html>
