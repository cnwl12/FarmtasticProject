$(function() {
  var wishlistButtons = document.querySelectorAll(".wishlist-btn");
  if (wishlistButtons.length > 0) {
    var member_num = wishlistButtons[0].getAttribute("data-member-num");
    $.ajax({
      url: "selectWishlistget",
      type: "GET",
      dataType: "json",
      data: {
        member_num: member_num,
      },
      success: function (response) {
		  if (response.wishList && response.wishList.length > 0) {
		    var favorite_items = response.wishList; 
		    for (var i = 0; i < favorite_items.length; i++) {
		      var item_num = favorite_items[i].item_num;
		      var wishlistButton = document.querySelector('[data-item-num="' + item_num + '"]');
		      if (wishlistButton) {
		        var icon = wishlistButton.querySelector("i");
		        icon.classList.replace("fa-heart-o", "fa-heart");
		        icon.style.color = "red";
		      }
		    }
		  }
		}, 
      error: function (request, status, error) {
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

function updateWishlistButtons() {
    var wishlistButtons = document.querySelectorAll(".wishlist-btn");
    if (wishlistButtons.length > 0) {
        var member_num = wishlistButtons[0].getAttribute("data-member-num");
        $.ajax({
            url: "selectWishlistget",
            type: "GET",
            dataType: "json",
            data: {
                member_num: member_num,
            },
            success: function (response) {
                if (response.wishList && response.wishList.length > 0) {
                    var favorite_items = response.wishList; 
                    for (var i = 0; i < favorite_items.length; i++) {
                        var item_num = favorite_items[i].item_num;
                        var wishlistButton = document.querySelector('[data-item-num="' + item_num + '"]');
                        if (wishlistButton) {
                            var icon = wishlistButton.querySelector("i");
                            icon.classList.replace("fa-heart-o", "fa-heart");
                            icon.style.color = "red";
                        }
                    }
                }

                var $wishlistButtons = $(wishlistButtons);

                // 기존의 모든 click event listener들을 제거
                $wishlistButtons.off("click");

                // 새로운 click event listener을 추가
                $wishlistButtons.on("click", function(event) {

                  event.preventDefault();
                    
                  // 해당 찜 버튼과 관련된 정보를 가져옵니다.
                  var target = event.target.tagName.toLowerCase() === "i" ? event.target.parentNode : event.target;
                  var member_num = target.dataset.memberNum;
                  var item_num = target.dataset.itemNum;

                  // add 함수를 호출하여 서버에 요청을 보냅니다.
                  add(event, member_num, item_num, target);
               });
		    }, 
		    error: function (request, status, error) {
     		 },
        }); 
    } 
}


