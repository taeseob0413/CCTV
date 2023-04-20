<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/reportboard_register_style.css">
</head>

<% 
	HttpSession userSession = request.getSession();
	UserVO userInfo = (UserVO) userSession.getAttribute("user");
	String userLoginId = null;
	Long userId = null;
	if(userInfo != null){
		userLoginId =userInfo.getUser_loginID();
		userId = userInfo.getUser_id();
	}
	else{
		userLoginId = "None";
		userId = 0L;
	}
%>

<center>
    <h1>실종 아동 제보 글 작성</h1>

    <form action="/reportBoard/register" method="post">
    	<input type="hidden" name = "child_id" value="${child_id}">
    	<input type="hidden" name= "user_loginId" value= <%= userLoginId %>>
    	<input type="hidden" name= "user_id" value=<%= userId %>>
        <table>
            <tr>
                <td>목격 시간</td>
                <td><input type="date" name="report_time"></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><%= userLoginId %></td>
            </tr>
            <tr>
                <td>목격 위치</td>
                <td><textarea name="report_address" rows="1" cols="100"></textarea></td>
            </tr>
            <tr>
                <td>목격 내용</td>
                <td><textarea name="report_content" rows="50" cols="100"></textarea></td>
            </tr>
        </table>
        <input type="submit" value="작성완료"/>
        <input type="button" value="취소" onclick="location.href='list?child_id=${child_id}'"/>
    </form>
</center>

<%@ include file="../layout/footer.jsp"%>