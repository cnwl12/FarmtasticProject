/**
 * 
 */
 

  function add(event, member_num, item_num) {

    // 함수 본문 작성
    if (member_num == null || member_num == "") {
      alert("로그인이 필요한 서비스입니다.");
      window.location.href = "login";
    } else {
      $.ajax({
        url: "add?item_num=" + item_num, // 해당 URL로 매개변수를 전달
        type: "GET",
        data: {
          member_num: member_num,
          item_num: item_num,
        },
        success: function (response) {
          // 요청이 성공적으로 완료된 경우 실행할 코드
          if (response.message == "찜 목록에 상품이 추가되었습니다.") {
            alert(response.message);
          } else {
            alert("찜 목록에 상품이 없습니다.");
          }
        },
        error: function (request, status, error) {
          // 요청 실패 시 실행할 코드
          consol.log(error);
          alert("위시리스트 추가에 실패하였습니다. 다시 시도해주세요.");
        },
      });
    }
  }
  