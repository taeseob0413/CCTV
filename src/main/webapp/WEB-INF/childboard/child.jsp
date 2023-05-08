<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../layout/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>실종 아동 검색</title>
<link rel="stylesheet" href="/resources/css/child/childboard_child.css">
</head>
<body>

<div id="container">

   <div class="search">

                  <form id='searchForm' action="/child/list" method='get'>
                     <select name='type' class='searchtype'>
                        <option value=""
                           <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                        <option value="T"
                           <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>이름</option>
                        <option value="C"
                           <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>실종 장소</option>
                        <option value="W"
                           <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>실종 나이</option>
                        
                     </select> 
                     <input type='text' name='keyword'
                        value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
                        type='hidden' name='pageNum'
                        value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
                        type='hidden' name='amount'
                        value='<c:out value="${pageMaker.cri.amount}"/>' />
                     <button class='btn btn-default'>Search</button>
                  </form>
               </div>
  

  <div class="contents">
		
			<!-- /.panel-heading -->
			
			 <c:forEach items="${list}" var="board" >
		     <div class="gal-img">
		      <p class="main-thum">
		       <img src="${board.child_img}" alt="My Image" width="200" height="240" onclick="location.href='/child/get?child_id=<c:out value="${board.child_id}"/>'">
			  </p>
			  <p class="childname">
			   ${board.child_name}
			  </p>
			 </div>
		     <div class="info"> 
			  <table class="table-01">
			    <tbody>
			    <tr>
			      <th scope="row">실종 장소</th>
			      <td>${board.child_location}</td>
			    </tr>
			     
			     <tr>
			      <th scope="row">현재 나이</th>
			      <td>${board.child_curage}</td>
			     </tr>
			     <tr>
			      <th scope="row">실종 나이</th>
			      <td>${board.child_occage}</td>
			     </tr>
			     </tbody>
			   </table>
			  </div>
			 </c:forEach>
			
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
            
               
           
				
				<form id='actionForm' action="/child/list" method='get'>
			         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			         <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			         <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
			         <input   type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
                </form>
				
		</div>
	</div>	
	
 </body>
</html>
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

<%@ include file="../layout/footer.jsp"%>	
	