<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/resources/css/error.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error Page</title>
</head>
<body>
	<center>
		<div id="ContentArea">
			<div id="InnerArea">
				<img id="logo" src="/resources/image/logo.png" alt="logo"
					width="500" height="200">
				<div id="title1">서비스 이용에 불편을 드려 죄송합니다.</div>
				<div class="image-text-container">
					<img src="/resources/image/EXIT.png" alt="error">
					<div class="text">
						입력하신 페이지가 삭제되었거나 <br> 이름이 변경되어<br> 일시적으로 사용할 수 없습니다.<br>
						<br> 아래 버튼을 클릭하여 메인 화면으로 <br>이동 부탁드립니다.
					</div>
				</div>
				<div id="btn_container">
				<button id="btn" onclick="location.href='/'">메인 화면 이동</button>
				</div>
			</div>
		</div>
	</center>
</body>
</html>