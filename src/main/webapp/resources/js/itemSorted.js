$(document).ready(function() {
    var memberNum = ""; // 초기화
    
    // memberNum 값 설정 (JSP에서 설정한 값으로 덮어쓰기)
    memberNum = "${sessionScope.member_num}";
    
    $(".filter__item .list li").on("click", function() {
        var selectedOption = $(this).data("value");
        console.log(selectedOption);
        
        $.ajax({
            url: "loadItems",
            type: "GET",
            data: { sort: selectedOption },
            success: function(data) {
            	console.log(data);
            	console.log("성공" + selectedOption);
                updateProductList(data);
            },
            error: function(xhr, status, error) {
				console.log("뭐가문제니? ㅇㅅㅇ");
				console.log("xhr:", xhr);
				console.log("status:", status);
				console.log("error:", error);
            }
        });
    });
    
function updateProductList(data) {

	console.log("upadate");
	var productListContainer  = $(".ajaxSuccess");
   	productListContainer.empty(); // 기존 내용을 지우고 새로운 내용으로 업데이트
    
    for (var i = 0; i < data.length; i++) {
        var item = data[i];
        var productHTML = `
           <div class="row">  
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
                    </div>
        `;

        productListContainer.append(productHTML);
    }
    
    productListContainer.find(".wishlist-btn").on("click", function() {
        var memberNum = "${memberNum}"; // 이 부분 수정 필요
        var itemNum = $(this).data("item-num");
        // 이제 memberNum과 itemNum 변수를 사용하여 처리할 수 있습니다.
        console.log("memberNum:", memberNum);
        console.log("itemNum:", itemNum);

    });
	}	
 });