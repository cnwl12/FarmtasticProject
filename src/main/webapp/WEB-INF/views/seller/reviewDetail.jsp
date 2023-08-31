<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>    
    
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
</head>
<body>
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">리뷰상세정보</h6>
	</div>
	
	<div class="card-body">
		<div>
			<input type="hidden" name="review_num" value="${review_num}" />
		    <table class="table table-bordered" id="dataTable" >
		        <tbody>
		            <tr>
		            <th>상품명</th>
		            <td>${reviewDetail.item_name}</td>
					</tr>
					<tr>
					<th>별점</th>
					<td class='review-star'>${reviewDetail.review_star}</td>
		            </tr>
		            <tr>
		            <th>작성자</th>
		            <td>${reviewDetail.member_name}</td>
		            </tr>
		            <tr>
		            <th>작성일</th>
		            <td>${reviewDetail.review_day}</td>
		            </tr>
		            <tr>
		            <th>제목</th>
		            <td>${reviewDetail.review_title}</td>
		            </tr>
		            <tr>
		            <th>내용</th>
		            <td>${reviewDetail.review_content}</td>
		            </tr>
		            <tr>
		            <th>이미지</th>
		            <td><img src="${reviewDetail.review_img}" alt="이미지 없음" style="width:200px; height:200px;"></td>
		            </tr>
		            <tr>
		        </tbody>
		    </table>
		</div>
	</div>
                            
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/datatables-demo.js"></script>
    
    <script type="text/javascript">
 	// 별점을 ★로 변경
    let reviewStars = document.querySelectorAll('.review-star');
    reviewStars.forEach(function (starElement) {
        let starCount = parseInt(starElement.textContent, 10);
        let stars = '';
        for (let i = 1; i <= starCount; i++) {
            stars += '★';
        }
        starElement.textContent = stars;
    });
    </script>
    
</body>
</html>