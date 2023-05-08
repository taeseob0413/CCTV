<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="com.firstclass.childrenctv.protectBoard.ProtectBoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../layout/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/board/board_list.css">
</head>
<center>
	<div id="ListArea">
		<div id="InnerArea">
			<div id="title">보호 아동 제보 게시판</div>
			<div id="notice">
				<br> 악의적인 제보 글은 실종 아동을 찾는 데에 심각한 피해를 줄 수 있습니다. <br><br>
				장난으로 혹은 악의적인 목적으로 제보를 남기는 것은 법적으로 처벌받을 수 있습니다.
			</div>
			<div id="reportButtonContainer">
				<button class="blue-btn" onclick="location.href='/protectBoard/register'">
					<img src="/resources/image/write.png" alt="이미지" width="40" height="40"> <span>제보</span>
				</button>
			</div>
			<div>
				<table>
					<tr>
						<th id="th1">No.</th>
						<th id="th2">아동 이름</th>
						<th id="th3">보호 장소</th>
						<th id="th4">작성자</th>
					</tr>
					<%-- 게시글 리스트를 반복해서 출력 --%>
					<c:forEach var="protectboard" items="${list}">
						<tr>
							<td id="no"><a href="get?protect_id=${protectboard.protect_id}"><c:out
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
			<!-- 페이징 처리 -->
			<div class='paging'>
				<table class="pagination">
					<c:if test="${pageMaker.prev}">
						<td class="paginate_button previous"><a
							href="${pageMaker.startPage-1}">Previous</a></td>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<td class="paginate_button  ${pageMaker.cri.pageNum ==  num ? "active":""} ">
							<a href="${num}">${num}</a>
						</td>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<td class="paginate_button next"><a
							href="${pageMaker.endPage+1}">Next</a></td>
					</c:if>
				</table>
			</div>

			<form id='actionForm' action="/protectBoard/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			</form>

		</div>
	</div>
</center>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
      var actionForm = $("#actionForm");

      $(".paginate_button a").on("click", function(e) {
          e.preventDefault();
             
          actionForm.find("input[name='pageNum']").val($(this).attr("href"));
          actionForm.submit();
      });
</script>

<%@ include file="../layout/footer.jsp"%>