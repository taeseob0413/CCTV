<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>

<center>
	 <form action="/user/update" method="post">
	 <input type="hidden" name="id" value="${user.user_id }" /> 
	 
	 <div>
	 <p style="font-weight:bold; margin-top: 50px; margin-left: -350px;">아이디</p>
	 <input type="text" id="username" name="user_loginID" value="${user.user_loginID}" 
	 style="border: 1px solid gray;" placeholder="아이디 입력(4~20자)" readonly="readonly"/>
	 </div>

	  <div>
	  <p style="font-weight:bold; margin-top:30px; margin-left: -330px;">비밀번호</p>
      <input type="password" id="password" name="user_password" value="${user.user_password}" 
      style="border: 1px solid gray;" placeholder="비밀번호 입력"
      onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
      
      <div>
         <label>이름</label>
         <input type="text" name="user_name" value="${user.user_name}"  >
      </div>
      
      <div>
         <label>이메일</label>
         <input type="text" name="user_email" value="${user.user_email}"  />
      </div>

      <div>
          <label>나이</label>
          <input type="text" name="user_age" value="${user.user_age}" />
      </div>
      
      <div>
          <label>성별</label>
          <input type="text" name="user_gender" value="${user.user_gender}" />
      </div>

      <div>
          <label>주소</label>
          <input type="text" name="user_address" value="${user.user_address}"/>
      </div>

      <div>
          <button type="submit">수정</button>
      </div>
      

</center>