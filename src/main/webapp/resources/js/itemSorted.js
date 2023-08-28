$(document).ready(function() {
   
   var memberNum = document.getElementById("memberNum").getAttribute("data-member-num");
    var productListContainer = $(".ajaxSuccess .row");
   console.log(memberNum);
   
    $(".filter__item .list li").on("click", function() {
        var selectedOption = $(this).data("value");
        
        $.ajax({
            url: "loadItems",
            type: "GET",
            data: { sort: selectedOption },
            success: function(data) {
                updateProductList(data);
               // $.getScript("/FarmProject/resources/js/heart.js", function() {
               // console.log("get되는지?");
            	// heart.js가 로드된 후에 실행할 코드
             //addClickEventToWishlistButtons();
            
        	//});
                
          },
            error: function(xhr, status, error) {
              console.log("ajax 에러:", error);
            }
        });
    });
    
 function updateProductList(data) {
       console.log(memberNum);

       var productListContainer = $(".ajaxSuccess .row");
       productListContainer.empty(); // 기존 내용을 지우고 새로운 내용으로 업데이트

       for (var i = 0; i < data.length; i++) {
           var item = data[i];
           var productHTML = `
               <div class="col-lg-4 col-md-6 col-sm-6">
                   <div class="product__item">
                       <div class="product__item__pic set-bg">
                           <a href="farmStoreDetail?item_num=${item.item_num}">
                               <div class="image-container">
                                   <div class="product-image" style="background-image: url('${item.item_mainImg}');"></div>
                                   `;

           if (item.item_left <= 0 || item.item_salesStatus === 'N') {
               productHTML += `<div class="overlay sold-out">판매 종료</div>`;
           } else if (item.item_left < 3) {
               productHTML += `<div class="overlay sold-out">마감 임박</div>`;
           }

           productHTML += ` 
                               </div>
                           </a>
                           <ul class="product__item__pic__hover">
                               <li><a href="#" class="wishlist-btn"
                                   data-member-num="${memberNum}"
                                   data-item-num="${item.item_num}">
                                   <i class="${item.isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
                               </a></li>
                               `;

           if (item.item_left > 0 && item.item_salesStatus !== 'N') {
               productHTML += `
                               <li>
                                   <a href="#" onclick="insertCart(${item.item_num});">
                                       <i class="fa fa-shopping-cart"></i>
                                   </a>
                               </li>
                               `;
           }

           productHTML += `
                           </ul>
                       </div>
                       <div class="product__item__text">
                           <h6><a href="farmStoreDetail?item_num=${item.item_num}">${item.item_name}</a></h6>
                           <h5>${item.item_price}</h5>
                       </div>
                   </div>
               </div>
               `;

           productListContainer.append(productHTML);
           }
           //   addClickEventToWishlistButtons();
    }
           
         //  function addClickEventToWishlistButtons() {
        //	console.log("addClickEventToWishlistButtons 함수 실행");
        //	productListContainer.find(".wishlist-btn").on("click", function() {
         //   console.log("클릭 이벤트 처리2");
       // });
   // }
});