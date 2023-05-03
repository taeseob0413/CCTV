<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../layout/header.jsp"%>

<head>
<link rel="stylesheet" href="/resources/css/childboard_get.css"/>

</head>

<center>

 <div class="section cnt-zone">
 <!-- 실종 아동 상세 정보 start -->	
  <div class="container">
	
		
		  <fieldset class="clear_b">

	      
		    <div class="col-sm-4 gal-img">
		     <p class="main-thum">
		      <img name="tknImg" src="${child.child_img}" alt="My Image" width="210px"
								height="300px">
			 </p>
			 <p class="childname">
			  ${child.child_name}
			 </p>
			</div>
		    <div class="col-sm-8 info"> 
			 <table class="table-01">
			    <tbody>
			    <tr>
			      <th scope="row">실종 장소</th>
			      <td>${child.child_location}</td>
			    </tr>
			     
			     <tr>
			      <th scope="row">현재 나이</th>
			      <td>${child.child_curage}</td>
			     </tr>
			     <tr>
			      <th scope="row">실종 나이</th>
			      <td>${child.child_occage}</td>
			     </tr>
			     <tr>
			      <th scope="row">성별</th>
			      <td>${child.child_gender}</td>
			     </tr>
			     <tr>
			      <th scope="row">실종 일자</th>
			      <td>${fn:replace(fn:substring(child.child_time, 0, 4), "-", "")}-${fn:replace(fn:substring(child.child_time, 4, 6), "-", "")}-${fn:replace(fn:substring(child.child_time, 6, 8), "-", "")}</td>
			     </tr>
			     
			     <tr style="height: 50px;">
			      <th scope="row">특징</th>
			      <td>
			       <div class="cell-content-wrapper">
							<div class="cell-content">
                            	${child.child_feature}
                            </div>
                            <button class="show-more-button">...</button>
                   </div>
                  </td>
			     </tr>
			     <tr>
			      <th scope="row">옷차림</th>
			      <td>${child.child_outfit}</td>
			     </tr>
			    </tbody>
			   </table>
			  </div>
			</fieldset>
		  
		</div>	

		
		<!-- 실종 아동 상세 정보 end -->
		<!-- 목격 게시판 -->
	<div class="board">
		<div class="title">실종 아동 목격 제보 게시판</div>
		<div id="buttoncontainer">
		<button class="blue-btn" onClick="goToRegisterPage(${child.child_id})">
					<img src="/resources/image/write.png" alt="이미지" width="30" height="30"> <span>제보</span>
				</button>
		</div>
	<table class="boardtable">
		<tr>
			<th class="th1">No.</th>
			<th class="th2">목격 시간</th>
			<th class="th3">목격 장소</th>
			<th class="th4">작성자</th>
		</tr>

		<c:forEach var="reportboard" items="${report}">
			<tr>
				<td class="no"><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.report_id}" /></a></td>
				<td class="time"><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.report_time.toString().replace('T', ' ')}" /></a></td>
				<td class="address"><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.report_address}" /></a></td>
				<td><a
					href="/reportBoard/get?report_id=${reportboard.report_id}"><c:out
							value="${reportboard.user_loginId}" /></a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<%-- 보호 게시판 --%>
	<div class="board">
		<div class="title">보호중인 유사 아동 게시판</div>
	<table class="boardtable">
		<tr>
			<th class="th1">No.</th>
			<th class="th2">목격 시간</th>
			<th class="th3">목격 장소</th>
			<th class="th4">작성자</th>
		</tr>

		<c:forEach var="protectboard" items="${protect}">
			<tr>
				<td class="no"><a
					href="/protectBoard/get?protect_id=${protectboard.protect_id}"><c:out
							value="${protectboard.protect_id}" /></a></td>
				<td class="time"><a
					href="/protectBoard/get?protect_id=${protectboard.protect_id}"><c:out
							value="${protectboard.protect_time.toString().replace('T', ' ')}" /></a></td>
				<td class="address"><a
					href="/protectBoard/get?protect_id=${protectboard.protect_id}"><c:out
							value="${protectboard.protect_address}" /></a></td>
				<td><a
					href="/protectBoard/get?protect_id=${protectboard.protect_id}"><c:out
							value="${protectboard.user_loginId}" /></a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</div>
</center>

<script>
function goToRegisterPage(child_id) {
    var childIdLong= parseInt(child_id,10);
    location.href = "/reportBoard/register?child_id=" + child_id;
}
const cellContentEls = document.querySelectorAll('.cell-content');
const showMoreBtnEls = document.querySelectorAll('.show-more-button');

for (let i = 0; i < cellContentEls.length; i++) {
  const cellContentEl = cellContentEls[i];
  const showMoreBtnEl = showMoreBtnEls[i];
  
  // 더보기 버튼 클릭 시 셀 내용 표시 및 닫기 버튼으로 변경
  showMoreBtnEl.addEventListener('click', () => {
    cellContentEl.style.height = 'auto';
    showMoreBtnEl.textContent = '닫기';
    showMoreBtnEl.removeEventListener('click', onClickShowMoreBtn);
    showMoreBtnEl.addEventListener('click', onClickHideMoreBtn);
  });
  
  // 닫기 버튼 클릭 시 셀 내용 말줄임 표시 및 더보기 버튼으로 변경
  const onClickHideMoreBtn = () => {
    cellContentEl.style.height = '50px';
    showMoreBtnEl.textContent = '...';
    showMoreBtnEl.removeEventListener('click', onClickHideMoreBtn);
    showMoreBtnEl.addEventListener('click', onClickShowMoreBtn);
  }
  
  const onClickShowMoreBtn = () => {
    cellContentEl.style.height = 'auto';
    showMoreBtnEl.textContent = '닫기';
    showMoreBtnEl.removeEventListener('click', onClickShowMoreBtn);
    showMoreBtnEl.addEventListener('click', onClickHideMoreBtn);
  }
}

</script>
<%@ include file="../layout/footer.jsp"%>