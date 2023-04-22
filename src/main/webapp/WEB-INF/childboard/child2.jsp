<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<section class="py-5">
    <h3 align="center">실종 아동</h3>
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach var="board" items="${list}" varStatus="i" begin="0" end="3">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="${board.child_img}"  alt="..." onclick="location.href='/child/get?child_id=<c:out value="${board.child_id}"/>'"/>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">"${board.child_name}"</h5>
                                <!-- Product price-->
                                <h5 class="fw-bolder">"${board.child_location}"</h5>
                                <a style="font-size: 12px; color: gray;">${board.child_outfit}</a>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <!-- 이 부분부터 Modal창 코드 -->
                         <!-- 여기까지 -->
                         </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>				
<%@ include file="../layout/footer.jsp"%>

