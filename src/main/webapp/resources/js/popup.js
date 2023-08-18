function cancelClick(button) {
    var orderNum = $(button).data("order");
    var content = generateCancelContent(orderNum);
    openCancelPopup(content);
}

function openCancelPopup(orderNum) {
    var popupWindow = window.open("", "_blank", "width=600,height=250");

    $.ajax({
        url: "cancelList", // 취소 내역을 가져오는 서버 API URL
        method: "POST",
        data: { orderNum: orderNum },
        success: function(response) {
            var cancelList = response.cancelledOrders;
            var content = generateCancelContent(orderNum, cancelList);
            popupWindow.document.write(content);
            popupWindow.document.close();

            // JavaScript로 cancelList 내용을 처리
            for (var i = 0; i < cancelList.length; i++) {
                var cancelReason = cancelList[i].cancel_reason;
                var cancelType = cancelList[i].cancel_type;
                var cancelRequest = cancelList[i].cancel_request;
            }
        },
        error: function() {
            alert("서버와의 통신에 문제가 발생했습니다.");
        }
    });
}

function generateCancelContent(orderNum, cancelList) {
    var content = `
    <html>
    <head>
        <title>주문 내역</title>
      <link rel='stylesheet' type='text/css' href='/farmtastic/resources/css/popup-style.css'>
    </head>
    <body>
        <h2>주문 취소 - 주문번호: ${orderNum}</h2>
        <table>
            <thead>
                <tr>
                    <th>취소 사유</th>
                    <th>상세 취소 사유</th>
                    <th>취소 요청일</th>
                </tr>
            </thead>
            <tbody>
    `;

    for (var i = 0; i < cancelList.length; i++) {
    
        var cancelDate = new Date(cancelList[i].cancel_request);
    	var formattedDate = cancelDate.toLocaleDateString();
    	
        content += `
            <tr>
                <td>${cancelList[i].cancel_type}</td>
                <td>${cancelList[i].cancel_reason}</td>
                <td>${formattedDate}</td>
            </tr>
        `;
    }

    content += `
            </tbody>
        </table>
        <button onclick="window.close()">닫기</button>
    </body>
    </html>
    `;

    return content;
}
