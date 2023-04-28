<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="com.firstclass.childrenctv.protectBoard.ProtectBoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../layout/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/protectBoard_list.css">

</head>
<center>
	<div id="ListArea">
		<div id="InnerArea">
			<div id="title">보호 아동 제보 게시판</div>
			<div id="notice">
					<br>
					악의적인 제보 글은 실종 아동을 찾는 데에 심각한 피해를 줄 수 있습니다. <br>
					또한, 장난으로 혹은 악의적인 목적으로 제보를 남기는 것은 법적으로 처벌받을 수 있습니다.
			</div>
			<div id="reportButtonContainer">
				<input type="button" value="제보" id="submit"
					onclick="location.href='/protectBoard/register'">
			</div>
			<div>
			<table>
				<tr>
					<th>글 번호</th>
					<th>아동 이름</th>
					<th>보호 장소</th>
					<th>작성자</th>
				</tr>
				<%-- 게시글 리스트를 반복해서 출력 --%>
				<c:forEach var="protectboard" items="${list}">
					<tr>
						<td><a href="get?protect_id=${protectboard.protect_id}"><c:out
									value="${protectboard.protect_id}" /></a></td>
						<td><a href="get?protect_id=${protectboard.protect_id}"><c:out
									value="${protectboard.child_name}" /></a></td>
						<td><a href="get?protect_id=${protectboard.protect_id}"><c:out
									value="${protectboard.protect_address}" /></a></td>
						<td><a href="get?protect_id=${protectboard.protect_id}"><c:out
									value="${protectboard.user_loginId}" /></a></td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</div>
	</div>
</center>
<!-- 자바스크립트 함수 정의 -->

<%@ include file="../layout/footer.jsp"%>