<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../layout/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
  /* a 태그에 대한 스타일 */
  a {
    text-decoration: none; /* 밑줄 제거 */
    color: #333; /* 링크의 기본 색상 설정 */
  }

  /* 방문한 링크에 대한 스타일 */
  a:visited {
    color: #333; /* 방문한 링크의 색상 설정 */
  }

  /* 마우스를 올렸을 때의 링크에 대한 스타일 */
  a:hover {
    color: #666; /* 마우스를 올렸을 때의 링크 색상 설정 */
  }

  /* 클릭한 링크에 대한 스타일 */
  a:active {
    color: #999; /* 클릭한 링크의 색상 설정 */
  }
</style>
</head>
<body>

	<h1>제보글 리스트</h1>
	<table>
		<tr>
			<th>글 번호</th>
			<th>목격 시간</th>
			<th>목격 장소</th>
			<th>작성자</th>
		</tr>
		<%-- 게시글 리스트를 반복해서 출력 --%>
		<c:forEach var="list" items="${list}">
			<tr>
				<td><a href="get?report_id=${list.report_id}"><c:out value="${list.report_id}" /></a></td>
				<td><a href="get?report_id=${list.report_id}"><c:out value="${list.report_time}" /></a></td>
				<td><a href="get?report_id=${list.report_id}"><c:out value="${list.report_address}" /></a></td>
				<td><a href="get?report_id=${list.report_id}"><c:out value="${list.user_loginId}"/></a></td>
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

<%@ include file="../layout/footer.jsp"%>