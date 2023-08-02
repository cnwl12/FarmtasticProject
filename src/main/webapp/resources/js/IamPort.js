  var IMP = window.IMP;
  IMP.init("imp24125441");
  
  

function requestPay() {
  
    // item_name, item_price, buyer_name, buyer_tel, buyer_addr,
    // buyer_postcode 값을 HTML에서 가져옵니다.
	const merchantUidElement = document.getElementById("order_num");
    const merchantUid = merchantUidElement.innerText;
    
    const itemNameElement = document.getElementById("item_name");  
    const itemName = itemNameElement.innerText;

    const itemPriceElement = document.getElementById("item_price");
    const itemPrice = parseInt(itemPriceElement.innerText);
    
    const buyerEmailElement = document.getElementById("member_email");
    const buyerEmail = buyerEmailElement.innerText;

    const buyerNameElement = document.getElementById("member_name");
    const buyerName = buyerNameElement.innerText;

    const buyerTelElement = document.getElementById("member_phone");
    const buyerTel = buyerTelElement.innerText;

    const buyerAddrElement = document.getElementById("member_addMain");
    const buyerAddr = buyerAddrElement.innerText;

    const buyerPostcodeElement = document.getElementById("member_addSub");
    const buyerPostcode = buyerPostcodeElement.innerText;
    
    const totalSumElement = document.getElementById("total_sum_value");
	const totalSum = parseInt(totalSumElement.innerText.replace("원",""));

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
        	
        	alert("결제가 완료되었습니다.");
    	} else {
        // 실패할 경우 실행할 코드
	        alert("결제에 실패하였습니다.");
	        console.log("이 오류의 정보: " + rsp.error_msg);
    	}
      }
    );
  }