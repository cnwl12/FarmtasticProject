function openCancelPopup(orderNum) {
    var cancelup = window.open("", "_blank", "width=600,height=400");

    // 팝업 창이 로드될 때 호출되는 함수 설정
    cancelup.onload = function() {
        $.ajax({
            url: "/cancelList", // 취소 내역을 가져오는 서버 API URL
            method: "POST",
            data: { orderNum: orderNum },
            success: function(response) {
                var cancelledOrders = response.cancelledOrders;
                var tableHTML = "<table><thead><tr><th>취소 사유</th><th>상세 취소 사유</th></tr></thead><tbody>";

                for (var i = 0; i < cancelledOrders.length; i++) {
                    tableHTML += `<tr>`;
                    tableHTML += `<td>${cancelledOrders[i].cancel_type}</td>`;
                    tableHTML += `<td>${cancelledOrders[i].cancel_reason}</td>`;
                    tableHTML += `</tr>`;
                }

                tableHTML += "</tbody></table>";

                var cancelContent = generateCancelContent(orderNum, tableHTML);
                cancelup.document.write(cancelContent);
            },
            error: function() {
                alert("서버와의 통신에 문제가 발생했습니다.");
            }
        });
    };
}


// 팝업을 호출하는 버튼 클릭 이벤트에 적용
$(document).ready(function() {
    $(".cancelList").click(function() {
        var orderNum = $(this).data("order");
        openCancelPopup(orderNum);
    });
});


// popup.js

function generateCancelContent(orderNum, tableHTML) {
    return `
    <html>
    <head>
        <title>주문 내역</title>
        <link rel='stylesheet' type='text/css'>
    </head>
    <body>
        <h2>주문 취소 - 주문번호: ${orderNum}</h2>
        <p>취소 사유: 
            <select id='cancel_type' name='cancel_type'>
                <option value='reason1'>취소 사유 1</option>
            </select>
        </p>
        <p>상세 취소 사유:</p>
        <textarea id='cancel_reason' name='cancel_reason' rows='4' cols='50'>취소 사유를 선택하세요.</textarea>
        <button id="cancelConfirm">취소철회</button>
        <button onclick="window.close()">닫기</button>
        
        <div id="cancelledOrders">
            ${tableHTML}
        </div>
    </body>
    </html>`;
}