function generateOrderNum() {
  const currentDate = new Date();
  const year = currentDate.getFullYear();
  const month = String(currentDate.getMonth() + 1).padStart(2, '0');
  const day = String(currentDate.getDate()).padStart(2, '0');

  const randomNum = String(Math.floor(Math.random() * 10000)).padStart(4, '0');

  return year + month + day + randomNum;
}

function requestPay() {

	var IMP = window.IMP;
	IMP.init("imp24125441");
	
    // item_name, item_price, buyer_name, buyer_tel, buyer_addr,
    // buyer_postcode 값을 HTML에서 가져옵니다.
    const merchantUid = generateOrderNum();
    
    const itemNumElement = document.getElementById("item_num");
 	const itemNum = itemNumElement.innerText;
	
    const itemNameElement = document.getElementById("item_name");  
    const itemName = itemNameElement.innerText;

    const buyerEmailElement = document.getElementById("member_email");
    const buyerEmail = buyerEmailElement.innerText;

    const buyerNameElement = document.getElementById("member_name");
    const buyerName = buyerNameElement.value;

    const buyerTelElement = document.getElementById("member_phone");
    const buyerTel = buyerTelElement.value;

    const buyerAddrElement = document.getElementById("sample6_address_member_addMain");
    const buyerAddr = buyerAddrElement.value;
    
    const buyerAddrsubElement = document.getElementById("sample6_detailAddress_member_addSub");
    const buyerAddrsub = buyerAddrsubElement.value;

    const buyerPostcodeElement = document.getElementById("sample6_postcode_member_post");
    const buyerPostcode = buyerPostcodeElement.value;
    
    const totalSumElement = document.getElementById("total_sum_value");
	const totalSum = parseInt(totalSumElement.innerText.replace("원",""));
	
	const orderMsgElement = document.getElementById("order_msg");
	const orderMsg = orderMsgElement.value;
	
    IMP.request_pay(  
      {
        pg: "kcp.{T0000}",
        pay_method: "card",
        merchant_uid: merchantUid,
        name: itemName + " 등",
        amount: totalSum,
        buyer_email: buyerEmail,
        buyer_name: buyerName,
        buyer_tel: buyerTel,
        buyer_addr: buyerAddr,
        buyer_postcode: buyerPostcode,
      },
      function (rsp) {
        if (rsp.success) {
        	// 결제 성공 시 실행할 코드
        	var param = sessionStorage.getItem('pageContext') + '/paySuccess';
        	param += "?order_num=" + merchantUid;
        	param += "&order_pay=" + totalSum;
        	param += "&order_name=" + buyerName;
        	param += "&order_addMain=" + buyerAddr;
        	param += "&order_addSub=" + buyerAddrsub;
        	param += "&order_post=" + buyerPostcode;
        	param += "&order_phone=" + buyerTel;
        	param += "&order_msg=" + orderMsg;
        	// param += "&item_num=" + itemNum;
        	location.href = param;
        	alert("결제가 완료되었습니다.");
    	} else {
        // 실패할 경우 실행할 코드
	        alert("결제에 실패하였습니다.");
    	}
      }
    );
  }
  