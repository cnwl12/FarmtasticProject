$(document).ready(function() {
    $('#viewed-items-icon').click(function(e) { // 최근 본 상품 목록 아이콘 클릭 시
        e.preventDefault();  
        e.stopPropagation();
        var member_num = document.getElementById("member_num").value;
         
        let viewedProducts = localStorage.getItem(member_num);
        
 	    let productListHTML = '';

 	    if (viewedProducts === null){

			productListHTML = '<div style="display: flex; justify-content: center; align-items: center; height: 100%; width: 100%;">'
			                    + '<div style="text-align:center;">'
			                    + '<i class="fa fa-frown-o" style="font-size: 100px; color: grey;"></i><br>'
			                    + '<p style="margin:0; font-size:20px;"><b>최근 본 상품이 없습니다.</b></p>'
			                    + '</div></div>';
                                       
	    } else {
            let parsedViewedProduct = JSON.parse(viewedProducts);

            for(let i = parsedViewedProduct.length - 1; i >= 0; i--){
             var itemNum2 = $('.wishlist-btn').data('itemNum2');

                productListHTML += '<li style="margin-right: 0;"><div><a href="farmStoreDetail?item_num=' + parsedViewedProduct[i].num + '"><img class="product-image" src="' + parsedViewedProduct[i].mainImg + '" /></a></div>' 
                                + '<div>' + parsedViewedProduct[i].name + '&nbsp;&nbsp;'
                                + '<b>' + parsedViewedProduct[i].price + '</b></div>'
                                + '<div><button class="btn btn-primary" style="background-color: #7fad39; border-color: #7fad39;"><a href="#" class="wishlist-btn" id="memberNum" data-member-num="' + member_num + '" data-item-num2="' + parsedViewedProduct[i].num + '"><i class="fa fa-heart-o" style="margin-top: 0; margin-left: 0; font-size: medium;"></i></a></button>&nbsp;&nbsp;'
                                + '<button class="btn btn-primary" style="background-color: #7fad39; border-color: #7fad39;"><a onclick="insertCart(' + parsedViewedProduct[i].num + ');"><i class="fa fa-shopping-cart"></i></a></button></div></li><br>';
            }

            // HTML에 삽입
	        productListHTML = '<ul style="margin-right: 0; display: inline;">' + productListHTML + '</ul>';
	    }

	   $('#recently-viewed-list').html(productListHTML).show();
       $('#recently-viewed-container').animate({ right:'0' }, 'fast');
       
       updateWishlistButtons();
    });


    $('#close-button').click(function() { // X버튼 클릭 시 창 꺼짐
      	location.reload();
    });
});