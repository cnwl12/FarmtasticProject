      var IMP = window.IMP;
      IMP.init("imp24125441");
 
      function requestPay() {
        IMP.request_pay(
          {
            pg: "kcp.{store-2ff01f8f-c184-4ee8-8f10-deed85d4ac53}",
            pay_method: "card",
            merchant_uid: "57008833-33003",
            name: "당근 20kg",
            amount: 2000,
            buyer_email: "Iamport2@chai.finance",
            buyer_name: "이인호",
            buyer_tel: "010-1234-5679",
            buyer_addr: "서울특별시 강남구 성삼동",
            buyer_postcode: "123-457",
          },
          function (rsp) {
            callback
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
          }
        );
      }
