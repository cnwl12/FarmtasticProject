$("#addCate").click(function() {
    // AJAX 요청을 통해 새로운 행에 대한 HTML을 받아옴
    $.ajax({
        url: "addRow", 
        type: "GET",
        success: function(response) {
            // 받아온 HTML을 테이블에 추가
            $("#dataTable tbody").append(response);
        },
        error: function() {
            alert("카테고리 항목 추가 불러오기 실패");
        }
    });
});