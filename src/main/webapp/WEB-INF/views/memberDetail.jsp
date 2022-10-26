<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-26
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>상세조회</h2>
<h4>번호: ${memberFind.memberId}</h4>
<h4>이메일: ${memberFind.memberEmail}</h4>
<h4>비밀번호: ${memberFind.memberPassword}</h4>
<h4>이름: ${memberFind.memberName}</h4>
<h4>나이: ${memberFind.memberAge}</h4>
<h4>전화번호: ${memberFind.memberMobile}</h4>
<a href="index">돌아가기</a>

</body>
</html>
