<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <h1>제보글 리스트</h1>
	<table>
	    <tr>
	        <th>글 번호</th>
	        <th>목격 시간</th>
	        <th>목격 장소</th>
	        <th>내용</th>
	    </tr>
	    <%-- 게시글 리스트를 반복해서 출력 --%>
	    <c:forEach var="list" items="${list}">
	        <tr>
	            <td><c:out value="${list.report_id }"/></td>
	            <td><c:out value="${list.report_time}"/></td>
	            <td><c:out value="${list.report_address}"/></td>
	            <td><a href="get?report_id=${list.report_id}">${list.report_content}</a></td>
	        </tr>
	    </c:forEach>
	</table>
	<input type="button" value="제보" onClick="goToRegisterPage(${child_id})">

</body>

<!-- 자바스크립트 함수 정의 -->
<script>
function goToRegisterPage(child_id) {
    // child_id 값을 register.jsp로 전달하여 페이지 이동
    location.href = "/reportBoard/register?child_id=" + child_id;
}
</script>