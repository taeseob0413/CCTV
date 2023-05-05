<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/resources/css/mypage/sidebar.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" media="screen" href="/resources/css/mypage/sidebar.css"/>	
  
  <div class="menu">
	<label for="side_menu"><div>메뉴</div></label>
	<input type="checkbox" id="side_menu" name="side_menu" checked>
    <ul id="mypagemenu">  
        <li><a href="/mypage/get?user_id=${user.user_id }" class="item"><div>회원정보수정</div></a></li>      
        <li><a href="/mypage/mywrite" class="item"><div>제보목록</div></a></li>     
        <li><a href="/mypage/register" class="item"><div>실종자등록리스트</div></a></li>   
       
        <li><a href="/mypage/delete?user_id=${user.user_id }" class="item"><div>회원탈퇴</div></a></li>
    </ul>
 </div>