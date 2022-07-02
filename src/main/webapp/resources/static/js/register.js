function registerBoard() {
    console.log("register");

    let title = document.getElementById("title").value;
    let content = document.getElementById("content").value;

    axios({
        url: 'http://localhost:8080/board/register',
        method: 'post',
        data: {
            title: title,
            content: content
        }
    }).then(function (response) {
        console.log(response);
        if (response.data.result) {
            // window.location.href = "/board/list"
            console.log("success")
        } else {
            window.location.href = "/error"
        }

    }).catch(function (error) {
        console.error(error);
    });
}

function cancelRegister() {
    console.log("cancelRegister");
}