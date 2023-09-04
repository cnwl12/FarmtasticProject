$(document).ready(function() {
    $('#viewed-items-icon').click(function(e) {
        e.preventDefault();  
        var member_num = document.getElementById("member_num").value;
         console.log("멤버넘오나요 : " + member_num);
         
        let viewedProducts = localStorage.getItem(member_num);
        
 	    let productListHTML = '';

 	    if (viewedProducts === null){
	        productListHTML = "최근 본 상품이 없습니다";
	    } else {
            let parsedViewedProduct = JSON.parse(viewedProducts);

            // 각 아이템을 개별적으로 <li> 태그로 감싸서 문자열을 생성합니다.
            for(let i = parsedViewedProduct.length - 1; i >= 0; i--){
                productListHTML += '<li><div><a href="farmStoreDetail?item_num=' + parsedViewedProduct[i].num + '"><img class="product-image" src="' + parsedViewedProduct[i].mainImg + '" /></a></div>' 
                                + '<div>' + parsedViewedProduct[i].name + '</div>'
                                + '<div>' + parsedViewedProduct[i].price + '원' + '</div></li><br>';
            }


            // 생성한 문자열을 <ul> 태그로 감싸서 HTML에 삽입합니다.
	        productListHTML = '<ul>' + productListHTML + '</ul>';
	    }

	   $('#recently-viewed-list').html(productListHTML).show();
       $('#recently-viewed-container').animate({ right:'0' }, 'fast');
    });

    $('#close-button').click(function() { // close button click event
        $('#recently-viewed-container').animate({ right:'-15vw' }, 'fast');
    });
});