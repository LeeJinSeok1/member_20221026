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
    <title>List</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jqurey.js"></script>

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
        <th>삭제하기</th>
        <th>조회(ajax)</th>
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
            <td><button class="btn btn-danger" onclick="dBtn(${mem.memberId})">삭제</button></td>
            <td><button class="btn btn-primary" onclick="find1(${mem.memberId})">조회</button> </td>
        </tr>
    </c:forEach>
</table>
    <div id="member"></div>
</div>
<script>
    const dBtn = (clickId) => {
        console.log('${members}');
        console.log(clickId);
        location.href= "/delete?memberId="+clickId;
    }
    const find1 = (findId) => {
        console.log(findId);
        const div1 = document.getElementById("member")
        $.ajax({
            type:"get",
            url:"/detail-ajax",
            data:{
               fId : findId
            },
            dateType: "json",
            success: function (member) {
                console.log(member)
                console.log(member.id)


                let result1 =
                    "        <table class=\"table table-striped\">\n" +
                    "            <tr>\n" +
                    "                <th>id</th>\n" +
                    "                <td>"+ member.id +"</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>email</th>\n" +
                    "                <td>" + member.memberEmail + "</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>password</th>\n" +
                    "                <td>" + member.memberPassword + "</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>name</th>\n" +
                    "                <td> " + member.memberName + "</td>\n" +
                    "            </tr>\n" +
                    "            <tr>\n" +
                    "                <th>age</th>\n" +
                    "                <td>" + member.memberAge + "</td>\n" +
                    "            </tr>\n" +
                    "        </table>";



            },
            error: function () {

            }

        })

    }

</script>

</body>
</html>
