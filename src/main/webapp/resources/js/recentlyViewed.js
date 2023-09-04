$(document).ready(function() {
    $('#viewed-items-icon').click(function(e) { // 최근 본 상품 목록 아이콘 클릭 시
        e.preventDefault();  
        var member_num = document.getElementById("member_num").value;
         
        let viewedProducts = localStorage.getItem(member_num);
        
 	    let productListHTML = '';

 	    if (viewedProducts === null){
	        productListHTML = "최근 본 상품이 없습니다";
	    } else {
            let parsedViewedProduct = JSON.parse(viewedProducts);

            for(let i = parsedViewedProduct.length - 1; i >= 0; i--){
                productListHTML += '<li><div><a href="farmStoreDetail?item_num=' + parsedViewedProduct[i].num + '"><img class="product-image" src="' + parsedViewedProduct[i].mainImg + '" /></a></div>' 
                                + '<div>' + parsedViewedProduct[i].name + '</div>'
                                + '<div>' + parsedViewedProduct[i].price + '원'
                                + '<a class="wishlist-btn" id="memberNum" data-member-num="' + member_num + '" data-item-num="' + parsedViewedProduct[i].num + '"><i class="fa fa-heart-o"></i></a>'
                                + '<a onclick="insertCart(' + parsedViewedProduct[i].num + ');"><i class="fa fa-shopping-cart"></i></a></div></li><br>';
            }

            // HTML에 삽입
	        productListHTML = '<ul>' + productListHTML + '</ul>';
	    }

	   $('#recently-viewed-list').html(productListHTML).show();
       $('#recently-viewed-container').animate({ right:'0' }, 'fast');
       
       updateWishlistButtons();
    });


    $('#close-button').click(function() { // X버튼 클릭 시
        $('#recently-viewed-container').animate({ right:'-15vw' }, 'fast');
    });
});