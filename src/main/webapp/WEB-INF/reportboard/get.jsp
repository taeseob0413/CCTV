<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<head>
<link rel="stylesheet" href="/resources/css/reportboard_get_style.css">
</head>

<center>
    <h1>실종 아동 제보 수정2 </h1>

        <table>
            <tr>
                <td>목격 시간</td>
                <td>${board.report_time }</td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><%= request.getParameter("user_name") %></td>
            </tr>
            <tr>
                <td>목격 위치</td>
                <td>${board.report_address}</td>
            </tr>
            <tr>
                <td>목격 내용</td>
                <td><textarea name="report_content" rows="50" cols="100" readonly="readonly">${board.report_content }</textarea></td>
            </tr>
        </table>
         <input type="button" value="목록" onclick="location.href='list.jsp'"/>
</center>



<%@ include file="../layout/footer.jsp"%>
