<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-28
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jqurey.js"></script>
</head>
<body>
    <button onclick="ajax1()">ajax요청1</button>
    <button onclick="ajax2()">ajax요청2</button>
    <button onclick="ajax3()">ajax요청3</button>
    <button onclick="ajax4()">ajax요청4</button>
    <button onclick="ajax5()">ajax요청5</button>
    <button onclick="ajax6()">ajax요청6</button>


</body>
<script>
    const ajax1 = () => {
        console.log("ajax 호출")
        $.ajax({
            //ajax를 이용하여 /ajax1 이라는 주소로 get 요청함
            type:"get",  //http request method
            url:"/ajax1", //요청하는 주소
            success: function () {  // 요청이 성공하고 서버로 부터 받는 응담
                console.log("성공")
            },
            error: function () {   // 요청이 실패하는 경우 실행됨
                console.log(("실패"))
            }
        });
    }

    const ajax2 = () => {
        console.log("ajax2호출")
        $.ajax({
            // /ajax2 주소로 post 요청을 하고 controller 메서드 덩의
            type:"post", //보낼방식
            url:"/ajax2", // 요청주소
            success: function () {
                console.log("석세스") //요청되면 메서드 실행
            },
            error: function () {
                console.log("뺴윌") //요청실패하면 메서드 실행
            }

        });
    }
    const ajax3 = () => {
        console.log("3호출");
        const param1 = "hi";
        const param2 = "hello";
        $.ajax({
            type:"get",
            url:"/ajax3",
            data:{
                value1:param1,
                value2:param2
            },
           success: function () {
                console.log("성공") //요청되면 메서드 실행
            },
            error: function () {
                console.log("실패") //요청실패하면 메서드 실행
            }
        })
    }
    const ajax4 = () => {
        console.log("4호출");
        const param1 = "hi";
        const param2 = "hello";
        $.ajax({
            type:"post",
            url:"/ajax4",
            data:{
                value1:param1,
                value2:param2
            },
            dateType: "text",
            success: function (result) {
                console.log("성공") //요청되면 메서드 실행
                console.log(result)
            },
            error: function () {
                console.log("실패") //요청실패하면 메서드 실행
            }
        })
    }
    const ajax5 = () => {
        console.log("5호출");
        const param1 = "want";
        const param2 = "home";
        $.ajax({
            type:"post",
            url:"/ajax5",
            data:{
                value1:param1,
                value2:param2
            },
            dateType: "json",
            success: function (result) {
                console.log("성공") //요청되면 메서드 실행
                console.log(result)
            },
            error: function () {
                console.log("실패") //요청실패하면 메서드 실행
            }
        })
    }
    const ajax6 = () => {
        console.log("6호출");
        const param1 = "want";
        const param2 = "home";
        $.ajax({
            type:"post",
            url:"/ajax6",
            data:{
                value1:param1,
                value2:param2
            },
            dateType: "json",
            success: function (result) {
                console.log("성공") //요청되면 메서드 실행
                console.log(result)
            },
            error: function () {
                console.log("실패") //요청실패하면 메서드 실행
            }
        })
    }
</script>
</html>
