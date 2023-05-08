<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage/update.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


<div id="mypage_update">
	<!-- sidebar -->
	<jsp:include page="../mypage/sidebar.jsp"/>

	<form action="/mypage/update" method="post">

		<div id="update_title">회원정보 수정</div>
		<input type="hidden" name="id" value="${user.user_id }" />

		<div id="update_input">
			<div id="update_id" >
				<label class="update_label">아이디</label>
				<input type="text" id="userid" name="user_loginID" value="${user.user_loginID}" readonly="readonly"/>
			</div>

			<div id="update_pw">
				<label class="update_label">비밀번호</label>
				<input type="password" id="userpassword" name="user_password" value="${user.user_password}"
					   onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
			</div>

			<div id="update_name">
				<label class="update_label">이름</label>
				<input type="text" id="username" name="user_name" value="${user.user_name}"  >
			</div>

			<div id="update_email">
				<label class="update_label">이메일</label>
				<input type="text" id="useremail" name="user_email" value="${user.user_email}"  />
			</div>

			<div id="update_age">
				<label class="update_label">나이</label>
				<input type="text" id="userage" name="user_age" value="${user.user_age}" />
			</div>

			<div id="update_gender">
				<label class="update_label">성별</label>
				<input type="text" id="usergender" name="user_gender" value="${user.user_gender}" />
			</div>

			<div id="update_address">
				<label class="update_label">주소</label>
				<input type="text" id="useraddress" name="user_address" value="${user.user_address}"/>
			</div>

			<div id=update_button>
				<button type="submit" id="update_button1" onclick="mypage_get()">수정</button>
				<button type="submit" id="update_button2" onclick="history.back()">취소</button>
			</div>
		</div>

	</form>

</div>

<script>

	function mypage_get() {
		alert('수정이 완료되었습니다');
	}

</script>

<%@ include file="../layout/footer.jsp"%>