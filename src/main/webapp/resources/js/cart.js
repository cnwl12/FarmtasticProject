function insertCart(){	
	
	var cart_cnt = $("#cart_cnt").val(); // cart_cnt id값의 value값 
	var item_num = $('.item_wrap').data("item_num");
	
	//console.log(item_num);
	
	/*location.href="insertCart?item_num="+item_num+"&cart_cnt="+cart_cnt;*/
	
	$.ajax({
        url: "insertCart",
        type: "GET",
        data: {
            item_num: item_num,
            cart_cnt: cart_cnt
        },
        success: function(response) {
            // 추가성공 
        },
        error: function() {
            console.log("상품 추가 중 오류 발생");
        }
    });

    var confirmMove = confirm("장바구니로 이동하시겠습니까?");
    if (confirmMove) {
        location.href = "shoppingCart";
    }
}


//  쇼핑카트 내 
function history(){
		confirm("계속 쇼핑하시겠습니까?");
		location.href="farmStore";
	}

// 개별삭제 	
function deleteCart(item_num){ 
	
	if(confirm("삭제하시겠습니까?")){
		location.href="deleteCart?item_num="+item_num;
	}
}

// 전체삭제
function clearCart(){

	const itemNums = [...document.querySelectorAll(".shoping__cart__table tbody tr[data-item_num]")]
    .map(element => element.getAttribute("data-item_num"));

	if (confirm("장바구니를 비우시겠습니까?")) {
	        $.ajax({
	            url: "clearCart",
	            type: "GET",
	            success: function(response) {
	                 location.reload();
	            },
	            error: function() {
	                console.log("오류 발생");
	            }
    	    });
	}
}

// 개별 삭제 (1개의 상품만)
function insertCart(item_num) {
    var cart_cnt = 1; 

    $.ajax({
        url: "insertCart",
        type: "GET",
        data: {
            item_num: item_num,
            cart_cnt: cart_cnt
        },
        success: function(response) {
            // 추가성공
        },
        error: function() {
            console.log("상품 추가 중 오류 발생");
        }
    });

    var confirmMove = confirm("장바구니로 이동하시겠습니까?");
    if (confirmMove) {
        location.href = "shoppingCart";
    }
}



