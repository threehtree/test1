<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script src="/resources/static/js/register.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <title>Title</title>
</head>
<body>
<h1>register</h1>


<span>제목</span>
<input type="text" id="title"/>
<span>내용</span>
<input type="text" id="content"/>

<button onclick="registerBoard()">작성하기</button>
<button onclick="cancelRegister()">취소하기</button>


</body>
</html>
