/**
 * 
 */
 document.addEventListener("DOMContentLoaded", function () {
  // 페이지 로드 완료 시 모든 위시리스트 버튼 참조
  var wishlistBtns = document.querySelectorAll(".wishlist-btn");

  // 각 버튼에 대한 이벤트 리스너 추가
  Array.prototype.forEach.call(wishlistBtns, function (btn) {
    btn.addEventListener("click", function (event) {
      var member_num = event.target.parentElement.getAttribute("data-member-num");
      var item_num = event.target.parentElement.getAttribute("data-item-num");

      add(event, member_num, item_num);
    });
  });
});
 

  function add(event, member_num, item_num) {
  // 함수 본문 작성
 	if (member_num == null || member_num == "") {
    alert("로그인이 필요한 서비스입니다.");
    window.location.href = "login";
  } else {
    $.ajax({
      url: "add?item_num=" + item_num,
      type: "GET",
      dataType: "json",
      data: {
        member_num: member_num,
        item_num: item_num,
      },
      success: function (response) {
        // 요청이 성공적으로 완료된 경우 실행할 코드
        if (response.message == "찜 목록에 상품이 추가되었습니다.") {
          alert(response.message);
        } else {
          alert("찜 목록에서 상품을 삭제했습니다.");
        }
      },
      error: function (request, status, error) {
        // 요청 실패 시 실행할 코드
        alert("위시리스트 추가에 실패하였습니다. 다시 시도해주세요.");
      },
    });
  }
}

  