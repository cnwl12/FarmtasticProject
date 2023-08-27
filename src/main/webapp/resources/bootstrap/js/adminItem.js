$(document).ready(function() {
	$("#addCate").click(function() {
	    // AJAX 요청을 통해 새로운 행에 대한 HTML을 받아옴
	    $.ajax({
	        url: "addRow", 
	        type: "GET",
	        success: function(response) {
	            // 받아온 HTML을 테이블에 추가
	             var newRow = '<tr>' +
                        '<td><input type="text" name="seller_type[]" placeholder="카테고리 타입입력"></td>' +
                        '<td><input type="text" name="type_name[]" placeholder="카테고리 이름입력"></td>' +
                     '</tr>';
	            
	            $("#dataTable_ROW tbody").append(newRow);
	        },
	        error: function() {
	            alert("카테고리 항목 추가 불러오기 실패");
	        }
	    });
	});
});