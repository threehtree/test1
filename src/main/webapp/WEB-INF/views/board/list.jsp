
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <title>List</title>
</head>
<body>
    <table>
        <tbody>
<%--            <c:forEach ></c:forEach>--%>
        </tbody>
    </table>
<%--    <script src="/resources/static/js/list.js"></script>--%>
<script>
    window.onload = listBoard()

//  ===========================
    function listBoard(){

        console.log("FFFFFFFFFFFFFFFFFFFFFFFFFFFFF")

        axios({
            url: 'http://localhost:8080/board/list',
            method: 'get'
        }).then(function (respones){
            console.log(response.data)
            console.log(respones.data.length)
        }).catch(function (error){
            console.error(error);
        })
    }

</script>
</body>
</html>
