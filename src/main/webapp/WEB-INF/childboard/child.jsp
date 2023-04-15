<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
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
							<th>실종장소</th>
							<th>이름</th>
							<th>성별</th>
							
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="board" >
						<tr>
							
							<td><a href='/child/get?child_id=<c:out value="${board.child_id}"/>'><img src="${board.child_img}" alt="My Image" width="150" height="150"></td>
							
							<td>${board.getChild_location()}</td>
							
							<td>${board.child_name}</td>
							
							<td>${board.child_gender}</td>
							
							
							
						</tr>
						
					</c:forEach>
				</table>
				</div>
				</div>
				</div>
				</div>
				
<%@ include file="../layout/footer.jsp"%>


