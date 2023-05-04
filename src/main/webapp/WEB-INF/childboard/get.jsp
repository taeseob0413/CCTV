<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../layout/header.jsp"%>

<head>
<style>
	@font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.cell-content-wrapper {
    display: flex;
    align-items: center;
  }
  .show-more-button {
    display: inline-block;
    width: 50px; /* 버튼의 너비를 조절할 수 있습니다. */
    margin-left: 10px; /* 버튼과 셀 내용 사이의 간격을 조절할 수 있습니다. */
  }
  .cell-content {
    height: 40px; /* 적절한 높이로 설정 */
    overflow: hidden;
    text-overflow: ellipsis;
  }
h1{
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    text-align: center;
    color: #2d52ad;
}
.childname{
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    text-align: center;
    font-size: 1.8em;
    font-weight: bold;
    border: 1px solid white;
    width: 60%;
    height: 10%;
    margin-left: auto; 
    margin-right: auto;
    padding: 10px;
    border-radius: 20px;
    background-color: white;
    color: #2d52ad;
}
.clear_b{
 overflow-x: auto;
 width: 80%;
 height: 24%;
 margin-left: auto; 
 margin-right: auto;
 padding: 15px;
 border-radius: 20px;
 background-color: #4a89dc;
}
.gal-img{
 float: left;
}
.info{
 float: right;
 width: 70%;
 height: 20%;
}
table.table-01{
 width: 95%;
 min-width: 500px;
 height: 20px;;
 border-collapse: collapse;
 text-align: left;
 font-family: 'RIDIBatang';
 src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
 font-size: 1.5em;
 margin: 10px 10px 10px 10px;
}
 table.table-01 th{
 border-bottom: 1px solid white;
 border-right: 1px solid white;
 border-top: 1px solid white;
 background-color: #2d52ad;
 text-align: center;
 color: white;
 padding: 10px;
 height: 20px;
 width: 100px;
 }
 table.table-01 td{
 border-bottom: 1px solid #2d52ad;
 border-top: 1px solid #2d52ad;
 background-color: white;
 color: black;
 padding: 10px;
 height: 20px;
 }
</style>

</head>

<div class="section cnt-zone">
 <!-- 실종 아동 상세 정보 start -->	
  <div class="container">
	<div class="row">
		<div class="cnt-right">
			<h1 class="cnt-title">실종 아동 상세 정보</h1>
		</div>
		<div class="cnt-main">
		  <fieldset class="clear_b">

	       <div class="row">
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
			      <th scope="row">실종 나이</th>
			      <td>${child.child_occage}</td>
			     </tr>
			     <tr>
			      <th scope="row">현재 나이</th>
			      <td>${child.child_curage}</td>
			     </tr>
			     <tr>
			      <th scope="row">성별</th>
			      <td>${child.child_gender}</td>
			     </tr>
			     <tr>
			      <th scope="row">실종 일자</th>
			      <td>${fn:replace(fn:substring(child.child_time, 0, 4), "-", "")}-${fn:replace(fn:substring(child.child_time, 4, 6), "-", "")}-${fn:replace(fn:substring(child.child_time, 6, 8), "-", "")}</td>
			     </tr>
			     <tr>
			      <th scope="row">실종 장소</th>
			      <td>${child.child_location}</td>
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
			 </div>
			</fieldset>
		   </div>
		  </div>
		</div>	
		</div>
<script>
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