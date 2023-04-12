<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>

<center>
    <h1>실종 아동 제보 글 작성</h1>

    <form action="/reportBoard/register" method="post">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td bgcolor="white" width="100" height="40" align="center">목격 시간</td>
                <td><input type="date" name="report_time" size="70"></td>
            </tr>
            <tr>
                <td bgcolor="white" align="center" height="40">작성자</td>
                <td><%= request.getParameter("user_name") %></td>
            </tr>
            <tr>
                <td bgcolor="white" align="center">목격 위치</td>
                <td><textarea name="report_address" rows="2" cols="100"></textarea></td>
            </tr>
            <tr>
                <td bgcolor="white" align="center">목격 내용</td>
                <td><textarea name="report_content" rows="50" cols="100"></textarea></td>
            </tr>
        </table>
        <input type="submit" value="작성완료" style="width: 100; height: 40; font-size:20"/>
        <input type="button" value="취소" style="width: 100; height: 40; font-size:20;" onclick="location.href='list.jsp'"/>
    </form>
</center>

<%@ include file="../layout/footer.jsp"%>