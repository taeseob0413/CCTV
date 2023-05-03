<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage/delete.css"/>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">	
	
	<form action="/mypage/delete" method="post">
	
	 <!-- sidebar -->
	 <jsp:include page="../mypage/sidebar.jsp"/>
     
	 <div id="mypage_delete">
	   <div id="delete_title">회원탈퇴</div>	 
	   <div id="delete_content">
	       <div id="delete_content1"> ${user.user_name}</div>
	       <div id="delete_content2">님의 계정이 삭제됩니다</div>
	       <div id="delete_content3">탈퇴시 개인정보 및 이용정보가 삭제되며 복구할 수 없습니다</div>
       </div>
       <input type="hidden" name="id" value="${user.user_id }" />
            	
      	<div>
          <button id="delete_button" id="delete_submit" type="submit" onclick="delete_alert()">탈퇴하기</button>
       </div>
       
       <div>
          <button id="register_button" id="delete_submit" type="submit" onclick="register_alert()">삭제</button>
       </div>
       
             	
       
      </div>
   </form>

<script type="text/javascript">
function delete_alert() {
 alert('탈퇴가 완료되었습니다.')
}

function register_alert() {
	 alert('삭제가 완료되었습니다.')
	}

</script>
<%@ include file="../layout/footer.jsp"%>