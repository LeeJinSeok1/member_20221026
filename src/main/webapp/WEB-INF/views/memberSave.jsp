<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-26
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>회원가입창</h2>
<form action="/save" method="post">
  이메일: <input type="text" name="memberEmail"> <br>
  비밀번호: <input type="text" name="memberPassword"> <br>
  성함: <input type="text" name="memberName"> <br>
  나이: <input type="text" name="memberAge"> <br>
  전화번호: <input type="text" name="memberMobile"> <br>
    <input type="submit" value="완료">
</form>

</body>
</html>