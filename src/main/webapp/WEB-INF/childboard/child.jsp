<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../layout/header.jsp"%>
<head>
<style>
   h1 {color: #667632;
	   font-family: 'RIDIBatang';
	   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
	   font-weight: normal;
	   font-style: normal;
	   font-size: 30px;}
   table#childinfo {
      font-family: 'RIDIBatang';
	  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
	  font-weight: normal;
	  font-style: normal;
      width: 80%;
      border: 2px solid #C1D387;  
      border-collapse: collapse;
      margin-left: auto;
      margin-right: auto;
      }
    table#childinfo th{
      border: 2px solid #C1D387;
      text-align: center;
      padding: 10px;
    }
     table#childinfo td{
      border: 2px solid #C1D387;
      text-align: center;
       padding: 10px;
    }
   .pagination {
      text-align: center;
    }
    .pagination a {
        /*
        display: inline-block 인라인 요소의 특징과 블록 요소의 특징을 모두 갖는다
        크기를 가질 수 있으며 텍스트 정렬도 적용받는다
        */
        display: inline-block;
        
        font-weight: bold;
        text-decoration: none;
        padding: 5px 8px;
        border: 1px solid #ccc;
        color: #000;
        background-color: #F5F5DC;
    }
    /* 현재 페이징에 select 클래스를 적용한다*/
    .pagination a.select {
        color: #fff;
        background-color: #FFA7A7;
    }
     </style>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   $(document).ready( function() {   
      var actionForm = $("#actionForm");

      $(".paginate_button a").on("click", function(e) {
          e.preventDefault();
             
          actionForm.find("input[name='pageNum']").val($(this).attr("href"));
          actionForm.submit();
         });
      var searchForm = $("#searchForm");

      $("#searchForm button").on("click",function(e) {

               if (!searchForm.find("option:selected").val()) {
                  alert("검색종류를 선택하세요");
                  return false;
               }

               if (!searchForm.find("input[name='keyword']").val()) {
                  alert("키워드를 입력하세요");
                  return false;
               }

               searchForm.find("input[name='pageNum']").val("1");
               e.preventDefault();

               searchForm.submit();

            });
        });
</script>
     </head>
<center>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Missing Children INFO</h1>
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
							
						</tr>
					  </thead>				
                     
                       <c:forEach items="${list}" var="board" >
                       
					    <tr>
					     
					        <td><a href='/child/get?child_id=<c:out value="${board.child_id}"/>'><img src="${board.child_img}" alt="My Image" width="150" height="150"></td>						
							<td>${board.child_location}</td>
							<td>${board.child_name}</td>
						    <td>${board.child_curage}</td>
							<td>${board.child_occage}</td>
							<td>${board.child_gender}</td> 
							
						</tr>
					      
					      
					    </c:forEach>
					     
		   
				</table>
				<div class='row'>
               <div class="col-lg-12">

                  <form id='searchForm' action="/child/list" method='get'>
                     <select name='type'>
                        <option value=""
                           <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                        <option value="T"
                           <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>이름</option>
                        <option value="C"
                           <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>실종 장소</option>
                        <option value="W"
                           <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>실종 나이</option>
                        
                     </select> <input type='text' name='keyword'
                        value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
                        type='hidden' name='pageNum'
                        value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
                        type='hidden' name='amount'
                        value='<c:out value="${pageMaker.cri.amount}"/>' />
                     <button class='btn btn-default'>Search</button>
                  </form>
               </div>
            </div>
            <div class='paging'>
                <table class="pagination">
   

                   <c:if test="${pageMaker.prev}">
                      <td class="paginate_button previous"><a href="${pageMaker.startPage-1}">Previous</a>
                      </td>
                   </c:if>
   
                   <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                       <td class="paginate_button  ${pageMaker.cri.pageNum ==  num ? "active":""} ">
                       <a href="${num}">${num}</a></td>
                   </c:forEach>
   
                     <c:if test="${pageMaker.next}">
                       <td class="paginate_button next"><a href="${pageMaker.endPage+1}">Next</a>
                       </td>
                   </c:if>


               </table>
            
         
            <!--  end Pagination -->
            
               
           </div>
				</div>
				<form id='actionForm' action="/child/list" method='get'>
			         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			         <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			         <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
			         <input   type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
                </form>
				</div>
				</div>
				</div>
				</center>
<%@ include file="../layout/footer.jsp"%>