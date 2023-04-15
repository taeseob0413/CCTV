<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/reportboard_register_style.css">
</head>


<center>
    <h1>실종 아동 제보 글 작성</h1>

    <form action="/reportBoard/update" method="post">
    	<input type="hidden" name="child_id" value="${board.child_id }"/>
    	<input type="hidden" name="user_id" value="${board.user_id }"/>
    	<input type="hidden" name="report_id" value="${board.report_id }"/>
        <table>
            <tr>
                <td>목격 시간</td>
                <td><input type="date" name="report_time" value="${board.report_time}"></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td>${board.user_id}</td>
            </tr>
            <tr>
                <td>목격 위치</td>
                <td><textarea name="report_address" rows="1" cols="100">${board.report_address }</textarea></td>
            </tr>
            <tr>
                <td>목격 내용</td>
                <td><textarea name="report_content" rows="50" cols="100">${board.report_content }</textarea></td>
            </tr>
        </table>
        <input type="submit" value="작성완료"/>
        <input type="button" value="취소" onclick="location.href='get?report_id=${board.report_id}"/>
    </form>
</center>



<%@ include file="../layout/footer.jsp"%>