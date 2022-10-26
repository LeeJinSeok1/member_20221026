<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-26
  Time: 오전 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberLogin.jsp</title>
</head>
<body>
<h2>로그인 창</h2>
<form action="/login" method="post">
    <input type="text" name="memberEmail" placeholder="이메일주소"> <br>
    <input type="text" name="memberPassword" placeholder="비밀번호"> <br>
    <input type="submit" value="로그인하기!">
</form>

</body>
</html>
