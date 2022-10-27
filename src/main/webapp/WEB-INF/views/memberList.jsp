<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-26
  Time: 오후 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>회원전체목록</h2>
<div class="container">
<table class="table table-dark table-striped">
    <tr>
        <th>번호</th>
        <th>이메일</th>
        <th></th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>나이</th>
        <th>전화번호</th>
        <th>조회하기</th>
    </tr>
    <c:forEach items="${members}" var="mem">
        <tr>
            <td>${mem.memberId}</td>
            <td>${mem.memberEmail}<td>
            <td>${mem.memberPassword}</td>
            <td>
                <a href="/memberDetail?memberId=${mem.memberId}">${mem.memberName}</a>
            </td>
            <td>${mem.memberAge}</td>
            <td>${mem.memberMobile}</td>
            <td>
                <a href="/memberDetail?memberId=${mem.memberId}">조회</a>
            </td>
        </tr>
    </c:forEach>
</table>
</div>

</body>
</html>
