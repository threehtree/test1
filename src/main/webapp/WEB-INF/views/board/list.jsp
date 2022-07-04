
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>List</title>
</head>

<body>
<%--${dtoList}--%>
<%--    <button onclick="location.href='http://localhost:8080/board/modify';">수정하기 </button>--%>
<%--<button  onclick="delBtn()">삭제하기 </button>--%>
<%--<button onclick="listBoard()">목록 </button>--%>
<div class>

    <table class="readOne">
        <thead>
            <th><div>bno</div></th>
            <th><div>title</div></th>
            <th><div>content</div></th>
        </thead>
        <tbody class="readOneBody">

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
<button type="button" onclick="addBoard()">등록</button>

<%--    <script src="/resources/static/js/list.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    window.onload = listBoard

    //  ===========================
    async function listBoard(){

        let response ;
        let test;
        await axios({
            url: 'http://localhost:8080/board/getBoardList',
            method: 'get'

        }).then(function (respones){
            console.log(respones.data)
            console.log(respones.data.length)

                respones.data.forEach( (ele) =>{
                // document.querySelector(".jo").innerHTML = JSON.stringify[idx]
                test += `<tr><th><div data-bno = \${ele.bno} class="list-content">\${ele.bno}</div></th>
                            <th><div data-bno = \${ele.bno} class="list-content">\${ele.title}</div></th>
                         <th><div data-bno = \${ele.bno} class="list-content">\${ele.content}</div></th></tr>`
            })
            console.log(test)
            document.querySelector(".readOneBody").innerHTML = test
        }).catch(function (error){
            console.error(error);
        })
    }

    const readOne = document.querySelector(".readOne")

    readOne.addEventListener('click', (e) =>{
        if(e.target.getAttribute("class").indexOf('list-content') < 0 ){
            return
        }
        const bno = e.target.getAttribute("data-bno")
        console.log(bno)
        console.log( `/board/read/\${bno}`)
        window.location.href = `/board/read/\${bno}`
    },false)

    function addBoard(){
        window.location.href = "/board/register"
    }



</script>
</body>
</html>
