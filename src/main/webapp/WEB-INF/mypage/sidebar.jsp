<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/resources/css/mypage/sidebar.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">	

<div class="menu">
    <ul id="mypagemenu">
    
        <li>
   		<a href="/mypage/get?user_id=${user.user_id }" class="item">
            <span class="material-symbols-outlined">edit</span>
            회원정보수정
        </a></li>

        <li><a href="/mypage/mywrite" class="item">
            <span class="material-symbols-outlined">list_alt</span>
            제보목록
        </a></li>

        <li><a href="/mypage/register?child_id=${child_id}" class="item">
            <span class="material-symbols-outlined">notifications</span>
            실종알림
        </a></li>
        
        <li><a href="#" class="item">
        	<span class="material-symbols-outlined">military_tech</span>
        	등급확인
        </a></li>

        <li><a href="/mypage/delete" class="item">
            <span class="material-symbols-outlined">person_remove</span>
            회원탈퇴
        </a></li>
    </ul>
 </div>