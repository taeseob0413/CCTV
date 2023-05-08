<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage/sidebar.css"/>
<link rel="stylesheet" href="/resources/css/mypage/get.css"/>

<div id="mypage_get">
	<!-- sidebar -->
	<jsp:include page="../mypage/sidebar.jsp"/>

	<div id="get_title">회원정보 수정</div>
	<input type="hidden" name="id" value="${user.user_id }" />

	<div id="get_input">
		<div id="get_id">
			<label class="get_label">아이디</label>
			<input type="text" id="username" name="user_loginID" value="${user.user_loginID}"
				   style="border: 1px solid gray;" placeholder="아이디 입력(4~20자)" readonly="readonly"/>
		</div>

		<div id="get_pw">
			<label class="get_label">비밀번호</label>
			<input type="password" id="userpassword" name="user_password" value="${user.user_password}"
				   style="border: 1px solid gray;" placeholder="비밀번호 입력" readonly="readonly"
				   onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 입력'"/>
		</div>

		<div id="get_name">
			<label class="get_label">이름</label>
			<input type="text" id="username1" name="user_name" value="${user.user_name}" readonly="readonly"  >
		</div>

		<div id="get_email">
			<label class="get_label">이메일</label>
			<input type="text" id="useremail" name="user_email" value="${user.user_email}" readonly="readonly"  />
		</div>

		<div id="get_age">
			<label class="get_label">나이</label>
			<input type="text" id="userage" name="user_age" value="${user.user_age}"  readonly="readonly"/>
		</div>

		<div id="get_gender">
			<label class="get_label">성별</label>
			<input type="text" id="usergender" name="user_gender" value="${user.user_gender}" readonly="readonly" />
		</div>

		<div id="get_address">
			<label class="get_label">주소</label>
			<input type="text" id="useraddress" name="user_address" value="${user.user_address}" readonly="readonly"/>
		</div>

	</div>

	<div id="get_button">
		<button type="submit" id="get_button1" onclick="location.href='/mypage/update?user_id=${user.user_id}'">수정</button>
		<button type="button" id="get_button2" onclick="history.back()">취소</button>
	</div>

</div>

<%@ include file="../layout/footer.jsp"%>
