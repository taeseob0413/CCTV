<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="../layout/header.jsp"%>
 <div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">실종아동 게시판</h1>
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
							
							<td><img src="${board.child_img}" alt="My Image" width="150" height="150" onclick="location.href='/childboard/get?child_id=<c:out value="${board.child_id}"/>'"></td>
							
							<td>${board.child_location}</td>
							
							<td>${board.child_name}</td>
							
							<td>${board.child_gender}</td>
							

							
							
						</tr>
						
					</c:forEach>
				</table>
			
     <!-- pagination -->
        <div class='pull-right'>
       <ul class="pagination">
                     <c:if test="${pageMaker.prev}">
		    
                        <li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
                     </c:if>
                     <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} "><a href="${num}">${num}</a></li>
                     </c:forEach>
                     <c:if test="${pageMaker.next}">
                        <li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
                     </c:if>
               </ul>
             
            </div>
            <!--  end Pagination -->
         </div>
         
          <form id='actionForm' action="/childboard/list" method='get'>
              <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
              <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
           </form>
           
         </div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
          
            <!--  자바스크립트 함수 정의 -->
            
           <script type="text/javascript">
                  $(document).ready(function() ) {
                          
               
              var actionForm = $("#actionForm");

              $(".paginate_button a").on("click", function(e) {

                 e.preventDefault();

                 console.log('click');

                 actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                 actionForm.submit();
              });
           });


         </script>
            
       


     <%@ include file="../layout/footer.jsp"%>