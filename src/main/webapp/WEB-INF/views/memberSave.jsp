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
   <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <script src="/resources/js/jqurey.js"></script>
  <style>
    #save-form{
      width: 1000px;
    }
  </style>
</head>
<body>
<h2>회원가입창</h2>
<div class="container" id="save-form">
<form action="/save" method="post"  name="saveForm">
  이메일: <input type="text" name="memberEmail" class="form-control"
             onblur="emailDuplicateCheck()"  id="e"> <br>
  <span id="email-input-check"></span> <br>
  비밀번호: <input type="text" name="memberPassword" class="form-control"> <br>
  성함: <input type="text" name="memberName" class="form-control"> <br>
  나이: <input type="text" name="memberAge" class="form-control"> <br>
  전화번호: <input type="text" name="memberMobile" class="form-control"> <br>
    <input type="button" value="완료" onclick="save()" class="btn btn-primary">

</form>
</div>


</body>
<script>
  const save = () => {
    console.log("save 함수호출")
    if(document.saveForm.memberEmail.value==""){
      // alert("이메일을 입력해주세요");
      //이메일을 입력하지 않았을 떄 span에 빨간색으로 출력
      const ck = document.getElementById("email-input-check");
      ck.innerHTML = "이메일을입력해주세요"
      ck.style.color="red";
      return false;
    }else if(document.saveForm.memberPassword.value==""){
      alert("비밀번호를 입력해주세요");
      return false;
    }else if(document.saveForm.memberName.value==""){
      alert("성함을 입력해주세요");
      return  false;
    }else if(document.saveForm.memberAge.value=="") {
      alert("나이를 입력해주세요");
      return  false;
    }else if(document.saveForm.memberMobile.value=="") {
      alert("전화번호를 입력해주세요");
      return  false;
    }
    document.saveForm.submit();
  }
  const emailDuplicateCheck = () => {
    const CheckEmail = document.getElementById("e").value;
    const ck = document.getElementById("email-input-check");
    $.ajax({
        type:"get",
        url:"/duplicate-check",
        data:{
          CheckEmail:CheckEmail
        },
        dateType: "text",
        success: function (result) {
          if(result=="no"){

            ck.innerHTML = "이메일 중복"
            ck.style.color="red";
          }else{

            ck.innerHTML = "멋짅 이메일이네요!"
            ck.style.color="green";
          }
        },
        error: function () {

        }

    })
  }

</script>
</html>
