var IMP = window.IMP;
IMP.init("imp24125441");

function requestPay() {
  // item_name, item_price, buyer_name, buyer_tel, buyer_addr,
  // buyer_postcode 값을 HTML에서 가져옵니다.
  const itemNameElement = document.getElementById("item_name");
  const itemName = itemNameElement.getAttribute("data-item_name");

  const itemPriceElement = document.getElementById("item_price");
  const itemPrice = parseInt(itemPriceElement.getAttribute("data-item_price"));

  const buyerNameElement = document.getElementById("member_name");
  const buyerName = buyerNameElement.getAttribute("data-member_name");

  const buyerTelElement = document.getElementById("member_phone");
  const buyerTel = buyerTelElement.getAttribute("data-member_phone");

  const buyerAddrElement = document.getElementById("member_addMain");
  const buyerAddr = buyerAddrElement.getAttribute("data-member_addMain");

  const buyerPostcodeElement = document.getElementById("member_addSub");
  const buyerPostcode = buyerPostcodeElement.getAttribute("data-member_addSub");

  const buyerEmailElement = document.getElementById("member_email");
  const buyerEmail = buyerEmailElement.getAttribute("data-member_email");
	
  IMP.request_pay(
    {
      // 이전에 설정한 다른 값들 ...
      name: itemName,
      amount: itemPrice,
      buyer_email: buyerEmail,
      buyer_name: buyerName,
      buyer_tel: buyerTel,
      buyer_addr: buyerAddr,
      buyer_postcode: buyerPostcode,
      // 이전에 설정한 다른 값들 ...
    },
    function (rsp) {
      // 결제 결과 처리 코드입니다.
    }
  );
}