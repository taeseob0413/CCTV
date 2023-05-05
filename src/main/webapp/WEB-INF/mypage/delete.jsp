<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage/delete.css"/>
<link rel="stylesheet" href="/resources/css/mypage/sidebar.css"/>	

<div id="mypage_delete">
<!-- sidebar -->
<jsp:include page="../mypage/sidebar.jsp"/>
  
	<form action="/mypage/delete" method="post" id="delete_form">
	    
	   <div id="delete_title">회원탈퇴</div>	
	    
	   <div id="delete_content">
	       <div id="delete_content1"> ${user.user_name} <span style="color:black">님의 계정이 삭제됩니다</span></div>
	        <!--<div id="delete_content2">님의 계정이 삭제됩니다</div>-->
	       <div id="delete_content3">탈퇴시 개인정보 및 이용정보가 삭제되며 복구할 수 없습니다</div>
	       <div id="delete_content4">탈퇴를 원하시면 본인의 비밀번호를 입력한 후 탈퇴 버튼을 눌러주세요</div>
       </div>
       
       <input type="hidden" name="user_id" value="${user.user_id }" />
      
 	   <div id="delete_pw">
	 		<label>사용중인 비밀번호</label>
     		<input type="password" id="user_password" name="user_password" placeholder="비밀번호 입력"
     		 onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
       </div>

       <div id="password_content">
          <span id="password_title">비밀번호를 잊으셨나요?</span>
          <span id="password_window"><a href="/find/user/userPassword">비밀번호 찾기</a></span>
       </div> 
        	
       <div id=delete_button>
          <button id="delete_button1" type="button">탈퇴</button>
          <button id="delete_button2" type="button">취소</button>
       </div>
         
   </form>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">


$("#delete_button1").on("click",function() {
	if($("#user_password").val()=="") {
		alert("비밀번호를 입력해주세요.");
		$("#user_password").focus();
	}	
	$.ajax({
		url : '/mypage/delete_pw',
		type : 'post',
		data : $("#delete_form").serializeArray(),
		success : function(data) {			
			if(data == 0) {
				alert("패스워드가 틀렸습니다.");
				
			}else {
				if(confirm("회원탈퇴를 하시겠습니까?")) {
					$("#delete_form").submit();
				}
			}
		}
	})
});
	



</script>
<%@ include file="../layout/footer.jsp"%>