<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyPage</title>
    <li class ="userMenu"><a href="/mypage/update">마이페이지</a></li>
</head>

   <center>
	<link rel="stylesheet" href="/resources/css/mypage.css"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<form action="/user/mypage" method="post">
	<!-- 왼쪽 사이드바  -->
	<div class="menu">
    <ul id="mypagemenu">
        <li><label for="main_menu"><div>
        	<span class="material-symbols-outlined">person</span>
       		 마이페이지</div></label>
        </li>
    
        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">edit</span>
            회원정보수정</div>
        </a></li>

        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">list_alt</span>
            제보목록</div>
        </a></li>

        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">notifications</span>
            실종알림</div>
        </a></li>

        <li><a href="#" class="item"><div>
            <span class="material-symbols-outlined">person_remove</span>
            회원탈퇴</div>
        </a></li>
    </ul>
  </div>

	 <input type="hidden" name="id" value="${user.user_id }" /> 
	 
	 <div id="myinfo">
	 	<h1>회원 정보 수정</h1>
	 	<div>
	  		<label>아이디</label>
		 	<input type="text" id="username" name="user_loginID" value="${user.user_loginID}" 
		 	style="border: 1px solid gray;" placeholder="아이디 입력(4~20자)" readonly="readonly"/>
		</div>

 		<div>
	 		<label>비밀번호</label>
     		<input type="password" id="userpassword" name="user_password" value="${user.user_password}" 
     		 style="border: 1px solid gray;" placeholder="비밀번호 입력"
     		 onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
     	</div>
     	
      	<div>
        	 <label>이름</label>
        	 <input type="text" id="username1" name="user_name" value="${user.user_name}"  >
     	 </div>
      
      <div>
         <label>이메일</label>
         <input type="text" id="useremail" name="user_email" value="${user.user_email}"  />
      </div>

      <div>
          <label>나이</label>
          <input type="text" id="userage" name="user_age" value="${user.user_age}" />
      </div>
      
      <div>
          <label>성별</label>
          <input type="text" id="usergender" name="user_gender" value="${user.user_gender}" />
      </div>

      <div>
          <label>주소</label>
          <input type="text" id="useraddress" name="user_address" value="${user.user_address}"/>
      </div>

      <div>
          <button type="submit" id="update">수정</button>
      </div>
      </div>
   
</center>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$("#update").click(function() {
	
	let data = {
			id:,
			username:$("#username").val(),
			password:$("#userpassword").val(),
			username1:$("#username1").val(),
			email:$("#useremail").val(),
			age:$("#userage").val(),
			gender:$("#usergender").val(),
			address:$("#useraddress").val()
	};
	
	$.ajax({
		url : '/user/idCheck' ,
		type : 'post',
		data : data,
		success : function(result) {	
	})
	
})


</script>

<%@ include file="../layout/footer.jsp"%>
   

</html>
