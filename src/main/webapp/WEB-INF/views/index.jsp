<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-26
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>index.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #lck {
            text-align: center;
        }
    </style>
</head>
<body>

<div id="lck">
<h2>${sessionScope.loginEmail} 님 환영합니다.</h2>
</div>

<h2>회원프로젝트!</h2>
<%--<a href="/save">회원가입</a>--%>
<%--<a href="/login">로그인</a>--%>
<%--<a href="/members">회원목록출력</a>--%>

<button class="btn btn-primary" onclick="saveFn()">회원가입</button>
<button class="btn btn-danger" onclick="loginFn()">로그인</button>
<button class="btn btn-dark" onclick="listFn()">회원목록출력</button>
<btuton class="btn btn-success" onclick="ajaxEx()" >ajax연습</btuton>

</body>
 <script>
     const saveFn = () => {
         location.href = "/save";
     }
     const loginFn = () => {
         location.href = "/login";
     }
     const listFn = () => {
         location.href = "/members";
     }
     const ajaxEx = () => {
         location.href = "/ajax-ex"
     }



 </script>
</html>
