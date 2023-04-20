<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.firstclass.childrenctv.ProtectBoard.ProtectBoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<h1>보호 아동 제보 게시판</h1>
	<table>
		<tr>
			<th>글 번호</th>
			<th>목격 시간</th>
			<th>목격 장소</th>
			<th>작성자</th>
		</tr>
		<%-- 게시글 리스트를 반복해서 출력 --%>

<c:forEach var="protectboard" items="${list}">
    <tr>
        <td><a href="get?protect_id=${protectboard.protect_id}"><c:out value="${protectboard.protect_id}" /></a></td>
        <td><a href="get?protect_id=${protectboard.protect_id}"><c:out value="${protectboard.child_name}" /></a></td>
        <td><a href="get?protect_id=${protectboard.protect_id}"><c:out value="${protectboard.protect_time.toString().replace('T', ' ')}" /></a></td>
        <td><a href="get?protect_id=${protectboard.protect_id}"><c:out value="${protectboard.user_loginId}"/></a></td>
    </tr>
</c:forEach>
	</table>
	<input type="button" value="제보" onclick ="location.href='/protectBoard/register'">

</body>

<!-- 자바스크립트 함수 정의 -->

<%@ include file="../layout/footer.jsp"%>