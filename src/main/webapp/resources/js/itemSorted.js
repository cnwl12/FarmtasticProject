$(document).ready(function() {
    var memberNum = ""; // 초기화
    
    // memberNum 값 설정 (JSP에서 설정한 값으로 덮어쓰기)
    memberNum = "${sessionScope.member_num}";
    
    $(".filter__item .list li").on("click", function() {
        var selectedOption = $(this).data("value");
        
        $.ajax({
            url: "farmStore",
            type: "GET",
            data: { sort: selectedOption },
            success: function(data) {
            	console.log(selectedOption);
                updateProductList(data);
            }
        });
    });
    
function updateProductList(data) {

	console.log("upadate");
	var productList  = $("#product-list");
   	productList.empty(); // 기존 내용을 지우고 새로운 내용으로 업데이트
    
     for (var i = 0; i < data.length; i++) {
        var item = data[i];
        var productHTML = `
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                   <div class="product__item__pic set-bg">
				                <a href="farmStoreDetail?item_num=${item.item_num}">
				                    <div class="image-container">
				                        <div class="product-image" style="background-image: url('${item.item_mainImg}');"></div>
				                    <c:choose>
				                          <c:when test="${item.item_left <= 0 || item.item_salesStatus == 'N'}">
				                            <div class="overlay sold-out">판매 종료</div>
				                        </c:when>
				                        <c:when test="${item.item_left < 3}">
				                            <div class="overlay sold-out">마감 임박</div>
				                        </c:when>
				                    </c:choose>
				                    </div>
				                </a>
										<ul class="product__item__pic__hover">
											<li><a href="#" class="wishlist-btn"
												data-member-num="${memberNum}"
												data-item-num="${item.item_num}"> <i
													class="${item.isFavorited ? 'fa fa-heart' : 'fa fa-heart-o'}"></i>
											</a></li>
											<c:choose>
												<c:when
													test="${item.item_left <= 0 || item.item_salesStatus == 'N'}">
												</c:when>
												<c:otherwise>
													<li>
														<a href="#" onclick="insertCart(${item.item_num});">
															<i class="fa fa-shopping-cart"></i>
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
                                   <div class="product__item__text">
                                    <h6><a href="farmStoreDetail?item_num=${item.item_num}">${item.item_name}</a></h6>
                                    <h5> ${item.item_price}</h5>
                                </div>
                            </div> 
                        </div>
                </div>
            </div>
        `;
        productList .append(productHTML);
    }
    
    productList.find(".wishlist-btn").on("click", function() {
        var memberNum = "${memberNum}"; // 이 부분 수정 필요
        var itemNum = $(this).data("item-num");
        // 이제 memberNum과 itemNum 변수를 사용하여 처리할 수 있습니다.
        console.log("memberNum:", memberNum);
        console.log("itemNum:", itemNum);

    });
	}	
 });