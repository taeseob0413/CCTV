<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<head>
<style>
h1 {
	color: #667632;
	font-family: serif;
	font-weight: bold;
	font-size: 30px;
}
</style>
</head>
<center>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Finding Missing Children</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">


				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>사진</th>

								<th>실종 장소</th>

								<th>이름</th>

								<th>나이</th>

								<th>성별</th>

								<th>실종 일자</th>

								

							</tr>
						</thead>


						<tr>
							<td><img src="${child.child_img}" alt="My Image" width="150"
								height="150"></td>

							<td>${child.getChild_location()}</td>

							<td>${child.child_name}</td>

							<td>${child.child_curage}</td>

							<td>${child.child_gender}</td>

							<td>${child.child_time}</td>


						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>
	<div>
		<h1>실종 아동 목격 제보 게시판</h1>
	</div>
	<table>
		<tr>
			<th>글 번호</th>
			<th>목격 시간</th>
			<th>목격 장소</th>
			<th>작성자</th>
		</tr>
		<%-- 게시글 리스트를 반복해서 출력 --%>

		<c:forEach var="reportboard" items="${report}">
			<tr>
				<td><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.report_id}" /></a></td>
				<td><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.report_time.toString().replace('T', ' ')}" /></a></td>
				<td><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.report_address}" /></a></td>
				<td><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.user_loginId}" /></a></td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="제보" onClick="goToRegisterPage(${child.child_id})">

</center>

<script>
function goToRegisterPage(child_id) {
    var childIdLong= parseInt(child_id,10);
    location.href = "/reportBoard/register?child_id=" + child_id;
}
</script>
<%@ include file="../layout/footer.jsp"%>