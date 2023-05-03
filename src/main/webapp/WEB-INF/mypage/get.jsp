<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="/resources/css/mypage/get.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />	 
	 
	 <!-- sidebar -->
	 <jsp:include page="../mypage/sidebar.jsp"/>
	 
	 <div id="mypage_get">
	 	<div id="get_title">회원정보 수정</div>
	 		 <input type="hidden" name="id" value="${user.user_id }" /> 
	 	
	 	<div id="get_id">
	  		<label>아이디</label>
		 	<input type="text" id="username" name="user_loginID" value="${user.user_loginID}" 
		 	style="border: 1px solid gray;" placeholder="아이디 입력(4~20자)" readonly="readonly"/>
		</div>

 		<div id="get_pw">
	 		<label>비밀번호</label>
     		<input type="password" id="userpassword" name="user_password" value="${user.user_password}" 
     		 style="border: 1px solid gray;" placeholder="비밀번호 입력" readonly="readonly"
     		 onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
     	</div>
     	
      	<div id="get_name">
        	 <label>이름</label>
        	 <input type="text" id="username1" name="user_name" value="${user.user_name}" readonly="readonly"  >
     	</div>
      
      	<div id="get_email">
        	 <label>이메일</label>
        	 <input type="text" id="useremail" name="user_email" value="${user.user_email}" readonly="readonly"  />
     	</div>

	    <div id="get_age">
	          <label>나이</label>
	          <input type="text" id="userage" name="user_age" value="${user.user_age}"  readonly="readonly"/>
	    </div>
      
        <div id="get_gender">
          <label>성별</label>
          <input type="text" id="usergender" name="user_gender" value="${user.user_gender}" readonly="readonly" />
        </div>

        <div id="get_address">
          <label>주소</label>
          <input type="text" id="useraddress" name="user_address" value="${user.user_address}" readonly="readonly"/>
        </div>

        <div>
          <button type="submit" id="get_button" onclick="location.href='/mypage/update?user_id=${user.user_id}'">수정</button>
          <button type="submit" id="get_button1" onclick="history.back()">취소</button>
        </div>
       </div> 

<%@ include file="../layout/footer.jsp"%>
