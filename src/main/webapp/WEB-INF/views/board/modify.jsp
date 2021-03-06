<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/listheader.jsp" %>

<div id="layoutSidenav">

    <div id="layoutSidenav_content" class="vw-100 vertical-center-row" >
        <main >
            <div class="container-fluid px-4 flex-column ">
                <h1 class="mt-4"></h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a style="text-decoration-line: none " href="/notice/list">공지사항</a></li>

                </ol>


                <style>
                    .pictures img {
                        max-width: 80vw;
                    }
                </style>
                <%--                <button class="moreBtn">더보기</button>--%>
                <div class="card mb-4">
                    <div class="card-body">
                        <%--                            <c:if test="${qaDTO.mainImage != null}">--%>
                        <%--                                <img src="${qaDTO.mainImage}">--%>
                        <%--                            </c:if>--%>
                        <%--    todo check 이것도 대표이미지 이용인데 나에게는 필요없을 것 같다 --%>


                        <%--====================--%>
                        <div class="row mt-3">
                            <div class="col">
                                <div class="card">
                                    <div class="card-header">


                                    </div>
                                    <div class="card-body">

                                        <%--                                        <div class="input-group mb-3">--%>
                                        <%--                                            <span class="input-group-text">번호</span>--%>
                                        <%--                                            <input type="text" class="form-control" name="noNo" value="${noDTO.noNo}"--%>
                                        <%--                                                   readonly>--%>
                                        <%--                                        </div>--%>
                                        <div class="input-group mb-3">
                                            <span class="input-group-text">제목</span>
                                            <input type="text" class="form-control"
                                                   value="${dtoOne.title}">
                                        </div>

                                        <div class="input-group mb-3">
                                            <span class="input-group-text">내용</span>
                                            <textarea class="form-control col-sm-5" rows="5"
                                                      >${dtoOne.content}</textarea>
                                        </div>


                                        <%--    =============================================================================================================--%>

                                        <%--    =============================================================================================================--%>



                                    </div>
                                    <div class="my-4">
                                        <div class="noBoardMoveBtn float-end">

                                            <button  onclick="updateBtn()" type="button"
                                                    class="no-link btn btn-primary">수정완료
                                            </button>

                                        </div>
                                    </div>


                                </div><!--end card body-->
                            </div><!--end card-->

                        </div><!-- end col-->
                    </div><!-- end row-->

                </div>
            </div>
    </div>
    </main>


</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/resources/js/datatables-simple-demo.js"></script>

<script>
    const bno = ${dtoOne.bno}

        function delBtn(){
            //경고창을 띄울러면 modal을 써야하는데 일단 alert
            alert(bno + "글이 삭제 됩니다 ")
            axios({
                url: 'http://localhost:8080/board/delete/${bno}',
                method: 'delete',
                data: {
                    bno: this.bno
                }
            }).then(function (request){
                console.log(request)
                if(request.status){
                    console.log("삭제되었습니다")
                    window.location.href = "/board/list"
                }else {
                    console.log("에러가 발생했습니다 ")
                }

            }).catch(function (error){
                console.error(error);
            })

        }
    function modifyBtn(){
        window.location.href = `/board/modify/${bno}`
    }
</script>

//조회하기 <<< 부트 넣은것 