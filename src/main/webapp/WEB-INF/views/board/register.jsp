<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <script src="/resources/static/js/register.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <title>Title</title>
</head>
<body>
<%-- TODO 작성화면 꾸미기 --%>
<h1>register</h1>


<span>제목</span>
<input type="text" id="title"/>
<%-- TODO 게시판이면 내용을 길게 쓸 수 있도록 고치기 --%>
<span>내용</span>
<input type="text" id="content"/>

<button onclick="registerBoard()">작성하기</button>
<%-- TODO 취소하기를 누르면 이전 화면으로 되돌아가기 --%>
<button onclick="cancelRegister()">취소하기</button>


</body>
</html>
