
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>List</title>
</head>

<body>
<%--${dtoList}--%>
<%--    <button onclick="location.href='http://localhost:8080/board/modify';">수정하기 </button>--%>
<button  onclick="delBtn()">삭제하기 </button>
<button onclick="listBoard()">목록 </button>
<div class="jo">

    <table>
        <thead>
            <th><div>title</div></th>
            <th><div>content</div></th>
        </thead>
        <tbody class="tb">

        </tbody>
        <tfoot>

        </tfoot>
    </table>
</div>

<div class="check">

<%--<c:forEach items="" var="list">--%>
<%--    <span>${list.contnet}</span>--%>
<%--    <span>${list.title}</span>--%>
<%--</c:forEach>--%>
</div>
<%--    <script src="/resources/static/js/list.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    window.onload = listBoard

    //  ===========================
    async function listBoard(){

        console.log("FFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        let response ;
        let test;
        await axios({
            url: 'http://localhost:8080/board/getBoardList',
            method: 'get'

        }).then(function (respones){
            console.log("DDDDDDDDD")
            console.log(respones.data)
            console.log(respones.data.length)

                respones.data.forEach( (ele) =>{
                // document.querySelector(".jo").innerHTML = JSON.stringify[idx]
                test += `<tr><th><div>\${ele.title}</div></th>
                         <th><div>\${ele.content}</div></th></tr>`
            })
            console.log(test)
            document.querySelector(".tb").innerHTML = test
        }).catch(function (error){
            console.error(error);
        })
    }
    function delBtn(){
        <%--//경고창을 띄울러면 modal을 써야하는데 일단 alert--%>
        <%--alert(bno + "글이 삭제 됩니다 ")--%>
        <%--axios({--%>
        <%--    url: 'http://localhost:8080/board/${bno}',--%>
        <%--    method: 'delete',--%>
        <%--    data: {--%>
        <%--        bno: this.bno--%>
        <%--    }--%>
        <%--}).then(function (response){--%>
        <%--    console.log(response)--%>
        <%--    if(respons.data.result){--%>
        <%--        console.log("삭제되었습니다")--%>
        <%--    }else {--%>
        <%--        console.log("에러가 발생했습니다 ")--%>
        <%--    }--%>

        <%--}).catch(function (error){--%>
        <%--    console.error(error);--%>
        <%--})--%>

    }

</script>
</body>
</html>
