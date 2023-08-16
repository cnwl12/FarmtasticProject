function openCancelPopup(orderNum) {
    var cancelup = window.open("", "_blank", "width=600,height=400");
    var cancelContent = generateCancelContent(orderNum);
    cancelup.document.write(cancelContent);
    
    // 이벤트 핸들러 등록
    var cancelConfirm = cancelup.document.getElementById("cancelConfirm");
    cancelConfirm.addEventListener("click", function() {
        var selectedType = cancelup.document.getElementById("cancel_type").value;
        var detailedReason = cancelup.document.getElementById("cancel_reason").value;
        $.ajax({
                url: "cancelOrder", // 주문 취소를 처리하는 서버 API URL
                method: "POST",
                data: { 
                     orderNum: orderNum,
                      cancel_reason: detailedReason,
                      cancel_type: selectedType},
                success: function(response) {
                    if (response.success) {
                        alert("주문이 취소되었습니다.");
                        location.reload();
                    } else {
                        alert("주문 취소가 취소되었습니다.");
                    }
                    // 팝업 창 닫기
                     cancelup.close();
                },
                error: function() {
                    alert("서버와의 통신에 문제가 발생했습니다.");
                }
            });
    });
}

// 팝업을 호출하는 버튼 클릭 이벤트에 적용
$(document).ready(function() {
    $(".cancelList").click(function() {
        var orderNum = $(this).data("order");
        openCancelPopup(orderNum);
    });
});

// popup.js

function generateCancelContent(orderNum) {
    return `
    <html>
    <head>
        <title>주문 내역</title>
        <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/popup-style.css'>
    </head>
    <body>
        <h2>주문 취소 - 주문번호: ${orderNum}</h2>
        <p>취소 사유: 
            <select id='cancel_type' name='cancel_type'>
                <option value='reason1'>취소 사유 1</option>
                <option value='reason2'>취소 사유 2</option>
                <!-- 다른 취소 사유 옵션들 추가 -->
            </select>
        </p>
        <p>상세 취소 사유:</p>
        <textarea id='cancel_reason' name='cancel_reason' rows='4' cols='50'></textarea>
        <button id="cancelConfirm">취소철회</button>
        <button onclick="window.close()">닫기</button>
    </body>
    </html>`;
}
