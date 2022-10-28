<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-27
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내정보수정</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
    #update-form{
        width: 800px;
    }
    </style>
</head>
<body>

<div class="container" id="update-form">
    <form action="/update" method="post" name="upForm">
        id:<input type="text" name="memberId" value="${model.memberId}" class="form-control" readonly>
        Email:<input type="text" name="memberEmail" value="${model.memberEmail}" class="form-control" readonly>
        pass:<input type="text" name="memberPassword" class="form-control" id="p">
        Name:<input type="text" name="memberName" value="${model.memberName}" class="form-control">
        Age:<input type="text" name="memberAge" value="${model.memberAge}" class="form-control">
        Mobile:<input type="text" name="memberMobile" value="${model.memberMobile}" class="form-control">
        <input type="button" value="변경하기" class="btn btn-warning" onclick="update()">

    </form>
</div>
<script>
    /*
     * 사용가자 input태그에 입력한 비밀번호와 DB에서 가져온 비밀번호가 일치하면 수정 요청을 보내고
     * 일치하지 않으면 alert로 비밀번호가 일치하지 않습니다 출력
      */
 const update  = () => {
     const passwordDB = '${model.memberPassword}'; //DB에서 가져온 비밀번호

     const pass = document.getElementById("p").value ;
     if(pass != passwordDB){
         alert("비밀번호를 확인해주세요.");
     }else{
         document.upForm.submit();

     }
 }
</script>



</body>
</html>
