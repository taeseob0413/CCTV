<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../layout/header.jsp"%>
<head>
<style>
h1 {color: #667632;
   font-family: serif;
   font-weight: bold;
   font-size: 30px;}
   table{
      width: 60%;
      border: 2px solid #C1D387;  
      border-collapse: collapse;
      }
   td{
     border: 2px solid #C1D387;
     padding: 10px;
     text-align: center;
   }
     </style>
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
				<table class="table table-striped table-bordered table-hover">
					
					
					<c:set var="i" value="0" />
                     <c:set var="j" value="3" />
                     <c:choose>
                       <c:when test="${list != null && fn:length(list) > 0 }">
                       <c:forEach items="${list}" var="board" >
                       <c:if test="{i%j == 0}">
					    <tr>
					     
					      </c:if>
					        <td class="im"><a href='/child/get?child_id=<c:out value="${board.child_id}"/>'><img src="${board.child_img}" alt="My Image" width="150" height="150"></td>
							
							<td class="lo">${board.getChild_location()}</td>
							<td class="name">${board.child_name}</td>
						
							
							<td class="ge">${board.child_gender}</td> 
							<c:if test="${i%j == j-1}">
							</tr>
					      </c:if> 
					      <c:set var="i" value="${i+1}" />
					      </c:forEach>
					      </c:when>
					      <c:otherwise>
					      <tr>
                            <td>존재하지 않습니다.</td>
                          </tr>
                          </c:otherwise>
					
					</c:choose>
		   
				</table>
				</div>
				</div>
				</div>
				</div>
				</center>
<%@ include file="../layout/footer.jsp"%>