
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>

<div id="layoutSidenav">

    <div id="layoutSidenav_content" class="vw-100">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Board</h1>
                <ol class="breadcrumb mb-4">
                    <%--                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>--%>
                    <%--                    <li class="breadcrumb-item active">Tables</li>--%>
                </ol>

                <div class="card mb-4">
                    <div class="card-body">

                        <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">

                            <div class="dataTable-container">

                                <table id="datatablesSimple" class="dataTable-table">

                                    <thead>

                                    <tr>
                                        <th><div class="dataTable-sorter">번호</div></th>
                                        <th><div class="dataTable-sorter">제목</div></th>
                                        <th><div class="dataTable-sorter">내용</div></th>
                                        <%--                    <th><div class="dataTable-sorter">댓글수</div></th>--%>
                                        <%--                    <th><div class="dataTable-sorter">답변유무</div></th>--%>
                                    </tr>
                                    </thead>

                                    <tbody class="readOneBody">

                                    </tbody>

<%--                                    <tbody class="qaBoardList">--%>
<%--                                    <c:forEach items="${qaDTO}" var="qaDTO">--%>
<%--                                        <tr>--%>


<%--                                            <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.qaNo}</td>--%>
<%--                                            <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.qaTitle} <b data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">[${qaDTO.replyCount}]</b></td>--%>
<%--                                            <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.qaWriter}</td>--%>
<%--                                            <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.regDate}</td>--%>
<%--                                                &lt;%&ndash;                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.replyCount}</td>&ndash;%&gt;--%>
<%--                                                &lt;%&ndash;                        <td data-qaNo = "/qa/read/${qaDTO.qaNo}" class="qa-link">${qaDTO.}</td>&ndash;%&gt;--%>

<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
<%--                                    </tbody>--%>

                                </table>
                            </div>
                        </div>

                        <button type="button" onclick="addBoard()"
                                class="btn btn-primary btn-sm">작성하기
                        </button>







                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="${pageMaker.start -1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
<%--                                jstl안쓰고 그냥 반복문 쓰면 되지 --%>
                               <div class ="list-page">

                               </div>

                                <li class="page-item">
                                    <a class="page-link" href="${pageMaker.end+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>


                    </div>
                </div>
            </div>
        </main>




    </div>
</div>



<%--    =========================================--%>
<html>
<head>
    <title>List</title>
</head>

<body>

<div class>

    <table class="readOne">
        <thead>
            <th><div>bno</div></th>
            <th><div>title</div></th>
            <th><div>content</div></th>
        </thead>
<%--        <tbody class="readOneBody">--%>

<%--        </tbody>--%>
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
<%--<button type="button" onclick="addBoard()">등록</button>--%>

<%--<button onclick="pageNation()">페이지</button>--%>
<%@ include file="/WEB-INF/includes/listfooter.jsp" %>


<%--    <script src="/resources/static/js/list.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>



<script>

    window.onload = listBoard


    let total = ''
    let page = '1'

    const linkDiv = document.querySelector(".pagination")
    //===============================================================

    //  ===========================
    async function listBoard(){

        let response ;
        let test = '';
        await axios({
            url: 'http://localhost:8080/board/getBoardList',
            method: 'get'

        }).then(function (respones){
            console.log(respones.data)
            console.log(respones.data.dtoList)
            total =respones.data.total
            console.log("total :"+total)

                respones.data.dtoList.forEach( (ele) =>{
                // document.querySelector(".jo").innerHTML = JSON.stringify[idx]
                test += `<tr><th><div data-bno = \${ele.bno} class="list-content">\${ele.bno}</div></th>
                            <th><div data-bno = \${ele.bno} class="list-content">\${ele.title}</div></th>
                         <th><div data-bno = \${ele.bno} class="list-content">\${ele.content}</div></th></tr>`
            })
            console.log(test)
            // document.querySelector(".readOneBody").innerHTML = test
            document.querySelector(".readOneBody").insertAdjacentHTML("afterbegin", test)
        }).catch(function (error){
            console.error(error);
        })
        pageNation()
    }

    const readOneBody = document.querySelector(".readOneBody")

    readOneBody.addEventListener('click', (e) =>{
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
    // function pageNation(){
    //     let start, end = ''
    //     //
    //     let prev, next = false
    //     //이건 boolean값임
    //
    //         this.page = page <= 0? 1:page;
    //         this.total = total;
    //
    //         let tempEnd =(Math.ceil(this.page/10.0)*10);
    //         //ceil은 0에 가깝게 반올림// 가짜 end
    //
    //         this.start = tempEnd - 9;
    //         //이걸 위한 가짜 end
    //
    //         if(tempEnd *10 >= total){
    //             this.end = (int)(Math.ceil(total/10.0));
    //             this.next = false;
    //         } else {
    //             this.end = tempEnd;
    //             this.next = true;
    //         }
    //
    //         this.prev = start !=1 ;
    //
    //         const kk = `<li class="page-item page-now"><a class="page-link" href="page12313">page</a></li>`
    //
    //
    // }

    function pageNation(){
         //현재 페이지번호 << 전역으로 잡아둠
        let start, end


        //boolean 으로 처리해야함
        let prev, next

        //전체 데이터의 수 <<listdto로 이미 받아서 전역으로 씀

        // public PageMaker(int page, int total) {

            // 조건문 <= False: True
            page = page <= 0 ? 1 : page;
            // this.total = total; 전역으로 잡음

            //가짜 end. 형변환은 딱히 의미 없음
            let tempEnd = Math.ceil(page / 10.0) * 10

            start = tempEnd - 9;


            //이거 boolean 처리를 위한 값일뿐임
            prev = start != 1;

            //진짜 end
            if (tempEnd * 10 >= total) {
                alert("fffffffffffffff")
                end = (Math.ceil(total / 10.0));
                next = false;
            } else {
                end = tempEnd;
                next = true;
            }
        console.log(start+"==="+end+"==="+prev+"==="+next+"==="+tempEnd+"==="+total)

            let str= ''
        for (let i = start; i < end; i++) {
            // console.log(i)
            str += `<li class="page-item page-item page-now"><a class="page-link" href="\${i}">\${i}</a></li>`
        }
        // document.querySelector(".list-page").innerHTML =str
        document.querySelector(".list-page").insertAdjacentHTML("beforebegin", str)
        // }
    }


    linkDiv.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.targetz

        if(target.getAttribute("class") !== 'page-link'){
            return
        }

        const pageNum = target.getAttribute("href")
        page = pageNum
        //window.location.href = `/board/list?page=\${page}`

        window.history.pushState(null, null, `/board/list?page=\${page}`)

        <%--axios({--%>
        <%--    url: `http://localhost:8080/board/list?page=\${page}`,--%>
        <%--    //todo 이거 페이지를 넘겨줘볼려고 해도 ... axios에 못 넣는데 어카냐--%>
        <%--    method: 'get',--%>
        <%--    params:{page:"${page}"}--%>
        <%--}).then((response)=>{--%>
        <%--    console.log(response)--%>
        <%--})--%>

    },false)



</script>
</body>
</html>
