<%--
  Created by IntelliJ IDEA.
  User: ehdwn
  Date: 2022-07-03
  Time: 오전 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h3>read</h3>
    ${dtoOne}
    <input type="text" value="${dtoOne.title}" readonly>
    <input type="text" value="${dtoOne.content}" readonly>
    <button type="button">수정하기</button>
    <button onclick="delBtn()" type="button">삭제하기</button>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

  <script>
    const bno = ${dtoOne.bno}
    function delBtn(){
        //경고창을 띄울러면 modal을 써야하는데 일단 alert
        alert(bno + "글이 삭제 됩니다 ")
        axios({
            url: 'http://localhost:8080/board/${bno}',
            method: 'delete',
            data: {
                bno: this.bno
            }
        }).then(function (response){
            console.log(response)
            if(respons.data.result){
                console.log("삭제되었습니다")
            }else {
                console.log("에러가 발생했습니다 ")
            }

        }).catch(function (error){
            console.error(error);
        })

    }
</script>


</body>
</html>
