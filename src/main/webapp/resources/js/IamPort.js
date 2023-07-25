window.onload = function() {

  var IMP = window.IMP;
  IMP.init("imp24125441");

  function requestPay() {
    // item_name, item_price, buyer_name, buyer_tel, buyer_addr,
    // buyer_postcode 값을 HTML에서 가져옵니다.
    const itemNameElement = document.getElementById("item_name");
    const itemName = itemNameElement.innerText;

    const itemPriceElement = document.getElementById("item_price");
    const itemPrice = parseInt(itemPriceElement.innerText);

    const buyerNameElement = document.getElementById("member_name");
    const buyerName = buyerNameElement.innerText;

    const buyerTelElement = document.getElementById("member_phone");
    const buyerTel = buyerTelElement.innerText;

    const buyerAddrElement = document.getElementById("member_addMain");
    const buyerAddr = buyerAddrElement.innerText;

    const buyerPostcodeElement = document.getElementById("member_addSub");
    const buyerPostcode = buyerPostcodeElement.innerText;

    const buyerEmailElement = document.getElementById("member_email");
    const buyerEmail = buyerEmailElement.innerText;

    IMP.request_pay(
      {
        // 이전에 설정한 다른 값들 ...
        name: itemName,
        amount: itemPrice,
        buyer_name: buyerName,
        buyer_tel: buyerTel,
        buyer_addr: buyerAddr,
        buyer_postcode: buyerPostcode,
        buyer_email: buyerEmail
        // 이전에 설정한 다른 값들 ...
      },
      function (rsp) {
        // 결제 결과 처리 코드입니다.
      }
    );
  }

  // 해당 window.onload 함수를 통해 앞서 선언된 requestPay 함수에 접근이 가능해집니다.
}