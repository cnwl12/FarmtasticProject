$(function() {
  var wishlistButtons = document.querySelectorAll(".wishlist-btn");
  if (wishlistButtons.length > 0) {
    var member_num = wishlistButtons[0].getAttribute("data-member-num");
    $.ajax({
      url: "selectWishlistget", // 백엔드에서 구현한 찜 목록 가져오는 함수의 URL
      type: "GET",
      dataType: "json",
      data: {
        member_num: member_num,
      },
      success: function (response) {
		  console.log("안녕");
		  if (response.wishList && response.wishList.length > 0) {
		    console.log("안녕");
		    var favorite_items = response.wishList; // JSON 형식의 찜 목록
		    for (var i = 0; i < favorite_items.length; i++) {
		      var item_num = favorite_items[i].item_num;
		      var wishlistButton = document.querySelector('[data-item-num="' + item_num + '"]');
		      if (wishlistButton) {
		        console.log("안녕");
		        var icon = wishlistButton.querySelector("i");
		        icon.classList.replace("fa-heart-o", "fa-heart");
		        icon.style.color = "red"; // 하트 색상을 빨간색으로 변경
		      }
		    }
		  }
		}, 
      error: function (request, status, error) {
        console.log("Error: ", error);
        console.log("Status: ", status);
        console.log("Request: ", request);
        console.log("찜 목록 가져오기에 실패했습니다.");
      },
    }); 
  }
});

document.addEventListener("DOMContentLoaded", function () {

  var wishlistButtons = document.querySelectorAll(".wishlist-btn");
  wishlistButtons.forEach(function (button) {
    button.addEventListener("click", function (event) {
      event.preventDefault();
      var target = event.target.tagName.toLowerCase() === "i" ? event.target.parentNode : event.target;
      var member_num = target.dataset.memberNum;
      var item_num = target.dataset.itemNum;
      add(event, member_num, item_num, target);
    });
  });
});

function add(event, member_num, item_num, target) {
  console.log("member_num:", member_num); // Debugging: Check the value of member_num
  console.log("item_num:", item_num); // Debugging: Check the value of item_num

  if (member_num == null || member_num.length == 0) {
    alert("로그인이 필요한 서비스입니다.");
    window.location.href = "login";
  } else {
    $.ajax({
      url: "toggle_favorite?_num=" + item_num,
      type: "GET",
      dataType: "json",
      data: {
        member_num: member_num,
        item_num: item_num,
      },
      success: function (response) {
        // 요청이 성공적으로 완료된 경우 실행할 코드
        var icon = target.querySelector("i");
        if (response.message == "찜 목록에 상품이 추가되었습니다.") {
          icon.classList.replace("fa-heart-o", "fa-heart");
          icon.classList.add("red"); 
          alert(response.message);
        } else {
          icon.classList.replace("fa-heart", "fa-heart-o");
          icon.style.color = "red";
          alert("찜 목록에서 상품이 삭제되었습니다.");
        }
      },
      error: function (request, status, error) {
        // 요청 실패 시 실행할 코드
        alert("찜하기 처리에 실패하였습니다. 다시 시도해주세요.");
      },
    });
  }
}
