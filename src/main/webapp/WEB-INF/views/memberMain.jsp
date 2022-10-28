<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-26
  Time: 오후 1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberMain.jsp</title>
</head>
<body>
<h2>로그인 성공..</h2>
     <div class="container">

         <h2>${sessionScope.loginEmail} 님 환영합니다.</h2>
         <h2>모델값: ${mEmail} 님 환영합니다.</h2>
         <a href="/update">내정보수정하기</a>
         <button class="btn btn-warning" onclick="updateForm()">내정보수정</button>
         <a href="/">index.jsp</a>

     </div>

</body>
<script>
    const updateForm = () => {
        location.href= "/update";
    }
</script>
</html>
