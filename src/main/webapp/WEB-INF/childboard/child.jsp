<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
							<th>#번호</th>
							<th>이름</th>
							<th>나이</th>
							<th>주소</th>
							<th>성별</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="board">
						<tr>
							
							
							<td><c:out value="${board.child_id}" /></td>
							
							<td><c:out value="${board.child_name}" /></td>
							
							<td><c:out value="${board.child_age}" /></td>
							
							<td><c:out value="${board.child_gender}" /></td>
							
						</tr>
					</c:forEach>
				</table>
				</div>
				</div>
				</div>
				</div>
				



