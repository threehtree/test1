<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>
<%-- TODO 작성 글이 없으면 없다고 알려주기 --%>
<%-- TODO 코드 주석 다 지우기 --%>
<div id="layoutSidenav">

    <div id="layoutSidenav_content" class="vw-100">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Board</h1>
                <ol class="breadcrumb mb-4">
                </ol>

                <div class="card mb-4">
                    <div class="card-body">

                        <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">

                            <div class="dataTable-container">

                                <table id="datatablesSimple" class="dataTable-table">

                                    <thead>

                                    <tr>
                                        <%-- TODO 번호가 왜 필요한지 모르겠음 --%>
                                        <th>
                                            <div class="dataTable-sorter">번호</div>
                                        </th>
                                        <th>
                                            <div class="dataTable-sorter">제목</div>
                                        </th>
                                        <th>
                                            <div class="dataTable-sorter">내용</div>
                                        </th>
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


                        <div class="searchDiv">
                            <select class="type">
                                <option value="">---</option>
                                <option value="t">제목</option>
                                <option value="tc">제목+내용</option>
                                <%-- TODO 존재하지도 않는 작성자 검색 --%>
                                <option value="tcw">제목+내용+작성자</option>
                            </select>
                            <input type="text" name="keyword">
                            <button class="searchBtn">검색하기</button>
                        </div>


                        <ul class="pagination check_pagination">
                            <li class="page-item">
                                <a class="page-link prev" href="${pageMaker.start -1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%--                                jstl안쓰고 그냥 반복문 쓰면 되지 --%>
                            <div class="list-page pagination">

                            </div>

                            <li class="page-item">
                                <a class="page-link next" href="${pageMaker.end+1}" aria-label="Next">
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
        <th>
            <div>bno</div>
        </th>
        <th>
            <div>title</div>
        </th>
        <th>
            <div>content</div>
        </th>
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


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


<%-- TODO jsp 안에 자바스크립트 코드 제거해보기 --%>
<%-- TODO JavaScript에서 세미콜론을 써야하는 이유 https://airbnb.io/javascript/#semicolons --%>
<%-- TODO 함수의 실행이나 함수의 선언이 어디부터 시작해서 언제 끝났는지 보기가 어렵다. 코드를 이해하려면 한참을 왔다갔다 해야 안다. --%>
<script>

  window.onload = listBoard

  // TODO 전역으로 관리 안하고 처리해보기
  let type = ''
  let keyword = ''
  let total = ''
  let page = '1'

  const linkDiv = document.querySelector(".check_pagination")
  //===============================================================

  //  ===========================
  /* TODO 검색을 위한 함수 같지가 읺음
      함수명이 동사로 시작하지 않음 (변수 이름 같음)
      함수 하나에 너무 많은 걸 하고 있어서 역할이 명확하지 않음 */
  function listBoard() {

    let response = '';
    let test = '';
    console.log("page :" + page)
    // TODO 서버통신을 하는 코드는 모듈화 하는게 중복코드가 줄어들게 됨
    axios({
      url: `http://localhost:8080/board/getBoardList`,
      method: 'get',
      params: {page: page, keyword: keyword, type: type}
    }).then(function (respones) {
      console.log(respones.data)
      console.log(respones.data.dtoList)
      total = respones.data.total
      console.log("total :" + total)
      // TODO 들여쓰기만 잘 해도 코드가 잘 보인다.
      respones.data.dtoList.forEach((ele) => {
        // TODO js 코드에서 html 코드를 붙이지 않기
        test += `<tr><th><div data-bno = \${ele.bno} class="list-content">\${ele.bno}</div></th>
                            <th><div data-bno = \${ele.bno} class="list-content">\${ele.title}</div></th>
                         <th><div data-bno = \${ele.bno} class="list-content">\${ele.content}</div></th></tr>`
      })
      console.log(test)
      document.querySelector(".readOneBody").innerHTML = test
      // document.querySelector(".readOneBody").insertAdjacentHTML("afterbegin", test)

      // TODO 왜 pageNation()을 실행하는지 알 수가 없음
      pageNation()
    }).catch(function (error) {
      console.error(error);
    })


  }

  const readOneBody = document.querySelector(".readOneBody")

  readOneBody.addEventListener('click', (e) => {
    if (e.target.getAttribute("class").indexOf('list-content') < 0) {
      return
    }
    const bno = e.target.getAttribute("data-bno")
    console.log(bno)
    console.log(`/board/read/\${bno}`)
    window.location.href = `/board/read/\${bno}`
  }, false)

  function addBoard() {
    window.location.href = "/board/register"
  }

  // TODO 뭐하는 함수인지 모르겠음 이름도 명사임
  function pageNation() {
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
      end = (Math.ceil(total / 10.0));
      next = false;
    } else {
      end = tempEnd;
      next = true;
    }
    console.log(start + "===" + end + "===" + prev + "===" + next + "===" + tempEnd + "===" + total)

    let str = ''
    for (let i = start; i < end; i++) {
      // console.log(i)
      str += `<li class="page-item page-item page-now"><a class="page-link" href="\${i}">\${i}</a></li>`
    }
    document.querySelector(".list-page").innerHTML = str
    if (prev) {
      document.querySelector(".prev").href = start - 1
    }
    if (next) {
      document.querySelector(".next").href = end + 1
    }
    // document.querySelector(".list-page").insertAdjacentHTML("beforebegin", str)
    // }
  }


  linkDiv.addEventListener("click", (e) => {
    e.stopPropagation()
    e.preventDefault()

    const target = e.target
    if (target.getAttribute("class").indexOf('page-link') < 0) {
      return
    }
    const pageNum = target.getAttribute("href")
    page = pageNum
    //window.location.href = `/board/list?page=\${page}`

    // window.history.pushState(null, null, `/board/list?page=\${page}`)

    axios({
      url: `http://localhost:8080/board/getBoardList`,
      //todo 이거 페이지를 넘겨줘볼려고 해도 ... axios에 못 넣는데 어카냐
      method: 'get',
      params: {page: page}
    }).then((response) => {
      console.log(response)
      listBoard()
    })

  }, false)

  document.querySelector(".searchBtn").addEventListener("click", (e) => {
    type = document.querySelector('.searchDiv .type').value
    keyword = document.querySelector(".searchDiv input[name='keyword']").value
    console.log(type, keyword)

    page = 1
    /* TODO 코드 정렬을 해야 가독성이 좋다.
        왜 listBoard() 함수를 실행하는지 알 수가 없다. */

    listBoard()

  }, false)


</script>
</body>
</html>
