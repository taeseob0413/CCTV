<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../layout/header.jsp"%>

<head>
<style>
	.page-header {
		color: #667632;
		font-family: 'RIDIBatang';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
		font-weight: normal;
		font-style: normal;
		font-size: 30px;
	}
    table#childinfo{
      font-family: 'RIDIBatang';
	  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
	  font-weight: normal;
	  font-style: normal;
      width: 100%;
      border: 2px solid #C1D387;  
      border-collapse: collapse;
      padding: 10px;
      margin-left: auto;
      margin-right: auto;
      }
     table#childinfo th{
      border: 2px solid #C1D387;
      text-align: center;
      }
     table#childinfo td{
      border: 2px solid #C1D387;
      text-align: center;
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
					<table class="table table-striped table-bordered table-hover", id="childinfo">
						<thead>
							<tr>
								<th>사진</th>

								<th>실종 장소</th>

								<th>이름</th>

								<th>현재 나이</th>

                                <th>실종 나이</th>
                                
								<th>성별</th>

								<th>실종 일자</th>
                                
                                <th>특징</th>
								
								<th>외형</th>
							</tr>
						</thead>


						<tr>
							<td><img src="${child.child_img}" alt="My Image" width="150"
								height="150"></td>

							<td>${child.child_location}</td>

							<td>${child.child_name}</td>

							<td>${child.child_curage}</td>

                            <td>${child.child_occage}</td>
                            
							<td>${child.child_gender}</td>

							<td>${fn:replace(fn:substring(child.child_time, 0, 4), "-", "")}-${fn:replace(fn:substring(child.child_time, 4, 6), "-", "")}-${fn:replace(fn:substring(child.child_time, 6, 8), "-", "")}</td>

                            <td>${child.child_feature}</td>
                            
                            <td>${child.child_outfit}</td>
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
	
	<div>
		<h1>실종자 가족 등록</h1>
		<input type="button" value="등록" id="addchild" onclick="addchild_btn(${child.child_id})"> 
	</div>
	
</center>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
function goToRegisterPage(child_id) {
    var childIdLong= parseInt(child_id,10);
    location.href = "/reportBoard/register?child_id=" + child_id;
}

$("#addchild").click(function() {
	$.ajax({
		url : "/mypage/register",
		type : "post",
		success : function (){
			alert("실종 아동이 등록되었습니다 이동하시겠습니까?");
		},
		error : function() {
			alert("등록 실패")ㅣ
		}
	});
});

function addchild_btn(child_id) {	
	
	if(result ==1) {
		alert("실종 아동이 등록되었습니다 이동하시겠습니까?");
		location.href = "/mypage/register?child_id=" + child_id;
	} else {
		alert("회원만 등록 가능합니다.");
	}
});

</script>
<%@ include file="../layout/footer.jsp"%>