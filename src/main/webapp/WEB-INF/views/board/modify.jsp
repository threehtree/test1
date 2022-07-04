
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>modify</h2>
    <span>제목</span>
    <input type="text" class="title" value="${dtoOne.title}" >
    <span>내용</span>
    <input type="text" class="content" value="${dtoOne.content}" >

    <button type="button" onclick="updateBtn()">수정완료</button>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    const bno = ${dtoOne.bno}
    async function updateBtn(){
        let response;
        const title = document.querySelector(".title").value
        const content = document.querySelector(".content").value
        console.log(title,"====",content)
        console.log(`http://localhost:8080/board/putBoard/\${bno}`)
            await axios({
                headers: {'contentType':'application/json'},
            url: `http://localhost:8080/board/putBoard/\${bno}`,
            method: 'put',
            data: {
                title: title,
                content: content
            }
        }).then((response)=>{
                console.log(response)
            })
    }
</script>


</body>
</html>
