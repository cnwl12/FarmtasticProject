<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>seller/sellerMain</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
    
   <!-- 선진) 차트를 그리기 위한 스크립트 추가 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                           
   <!-- 사이드바 줄어든거 되돌리기 -->
   <style type="text/css">
    html {font-size: 1rem !important;}
    body {font-size: 1rem !important;}
   </style>
 
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
      <jsp:include page="./inc/sidemenu.jsp"></jsp:include>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- 메인 컨텐츠 시작 -->
            <div id="content">

                <jsp:include page="./inc/top.jsp"></jsp:include>
                
                <!-- 페이지 컨텐츠 시작 -->
                <div class="container-fluid">
                    <div class="row">
                  <div class="col-xl-3 col-md-6 mb-4">
                      <div class="card border-left-primary shadow h-100 py-2">
                          <div class="card-body">
                              <div class="row no-gutters align-items-center">
                                  <div class="col mr-2">
                                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size: 15px;">당월 매출액</div>
                                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                                          <c:forEach items="${MonthlySales}" var="sales" begin="11" end="11">
                                              <fmt:formatNumber value="${Math.floor(sales.order_mm_totalSales)}" type="number" pattern="#,##0"/>원
                                          </c:forEach>
                                      </div>
                                  </div>
                                  <div class="col-auto">
                                      <i class="fa-2x text-gray-300"> 
                                 <% int currentMonth = java.time.LocalDate.now().getMonthValue(); out.print(currentMonth + "월"); %>
                                 </i>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="col-xl-3 col-md-6 mb-4">
                      <div class="card border-left-success shadow h-100 py-2">
                          <div class="card-body">
                              <div class="row no-gutters align-items-center">
                                  <div class="col mr-2">
                                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1" style="font-size: 15px;">당월 수수료</div>
                                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                                          <c:forEach items="${MonthlySales}" var="sales" begin="11" end="11">
                                              <fmt:formatNumber value="${Math.floor(sales.order_mm_totalSales * 0.05)}" type="number" pattern="#,##0"/>원
                                          </c:forEach>
                                      </div>
                                  </div>
                                  <div class="col-auto">
                                      <i class="fa-2x text-gray-300"> 
                                 <% currentMonth = java.time.LocalDate.now().getMonthValue(); out.print(currentMonth + "월"); %>
                                 </i>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                     <div class="col-xl-3 col-md-6 mb-4">
                         <div class="card border-left-info shadow h-100 py-2">
                             <div class="card-body">
                                 <div class="row no-gutters align-items-center">
                                     <div class="col mr-2">
                                         <div class="text-xs font-weight-bold text-info text-uppercase mb-1" style="font-size: 15px;">당월 정산액</div>
                                         <div class="h5 mb-0 font-weight-bold text-gray-800">
                                             <c:forEach items="${MonthlySales}" var="sales" begin="11" end="11">
                                                 <fmt:formatNumber value="${Math.floor(sales.order_mm_totalSales - (sales.order_mm_totalSales * 0.05))}" type="number" pattern="#,##0"/>원
                                             </c:forEach>
                                         </div>
                                     </div>
                                     <div class="col-auto">
                                         <i class="fa-2x text-gray-300"> 
                                    <% currentMonth = java.time.LocalDate.now().getMonthValue(); out.print(currentMonth + "월"); %>
                                    </i>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1" style="font-size: 15px;">당일 주문건</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <c:out value="${todayOrders}" />건
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                      <i class="fa-2x text-gray-300"> 
                                 <%= java.time.LocalDate.now().getMonthValue() + "월 " + java.time.LocalDate.now().getDayOfMonth() + "일" %>
                                 </i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">일별 매출 차트</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                           
		                           <!-- 선진) 매출 그래프를 표시할 캔버스 요소 -->               
		                           <div>
		                             <canvas id="getDailySalesChart" width="1000" height="300"></canvas>
		                           </div>
                           
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">품목별 매출</h6>
                                </div>

                        <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2" style="position: relative; text-align: center;">
                                        <canvas id="getMonthlyItemsChart"></canvas>
                                        <i id="noDataMessage" class="fa-2x text-gray-300" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); display: none; font-size: 20px; white-space: nowrap;">품목별 매출 정보가 없습니다.</i>                                   
                                    </div>
                                    <div class="mt-4 text-center small">
                                       <span class="mr-2"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>   <!-- 차트편집 -->
                    
                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                  <input type="hidden" id="seller_num" value="${sessionScope.seller_num}">

                            <!-- 리뷰관리 시작 -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">오늘의 리뷰</h6>
                                </div>
                                <div class="card-body">
                                <!-- 리뷰관리 가져옴 시작-->
                                   <div class="table-responsive" style="height: 378px;">
                              <div class="_qna_list_container scrl uio_grid" style="width: 100%; height: 377px;">
                                 <div class="_flexible_area flexible_area" style="display: block;">
                                    <div style="height: 35px;">
                                    <!-- 리뷰관리 편집 시작 -->
                                       <table class="table table-bordered" style="text-align: center;">
                                         <colgroup>
                                           <col style="width: 300px;">
                                           <col style="width: 100px;">
                                           <col style="width: 250px;">
                                           <col style="width: 150px;">
                                           <col style="width: 250px;">
                                         </colgroup>
                                         <thead>
                                         <tr>
                                         <th class="custom-th">상품명</th>
                                         <th class="custom-th">별점</th>
                                         <th class="custom-th">작성자</th>
                                         <th class="custom-th">제목</th>
                                         <th class="custom-th">작성일</th>
                                         </tr>
                                         </thead>
                                       <tbody>
                                       
                                        <div class="_resize_handle_container resize_handle_container">
                                       <c:forEach var="row" items="${buyreview}">
                                                 <tr>                                                  
                                                  <td style="max-width: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                   ${row.item_name}
                                                  </td>
                                                   <td id="review-star">${row.review_star}</td>
                                                   <td>${row.member_name}</td>
                                                   <td><a onclick="reviewPop(${row.review_num})" style="display: inline-block; max-width: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${row.review_title}</a></td>
                                                   <td>${row.review_day}</td>
                                                 </tr>
                                               </c:forEach>
                                                </div>
                                             </tbody>
                                          </table>
                                       </div>
                                    <!-- 목록 없으면 -->
                                    <div style="text-align: center; padding-top: 50%; transform: translateY(-50%);">
                                    <c:if test="${empty buyreview}">
                                       <i class="far fa-comment-dots" style="font-size: 70px;"></i><br>
                                       <p style="margin: 0;">오늘 등록된 리뷰가 없습니다.</p>
                                    </c:if>
                                    </div>
                                                                           
                                    </div>
                              </div>
                           </div>
                           <!-- 리뷰관리에서 가져옴 끝 -->
                           <!-- 리뷰 관리로 이동 -->                        
                           <div style="text-align:center;">
                               <a href="${pageContext.request.contextPath}/reviewMng" style="color:#666;border-color:#dbdde2!important;border :1px solid;display:block;padding :10px;text-align:center;text-decoration:none;line-height :1;background:none;">
                                   리뷰 관리
                               </a>
                           </div>                           
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-6 mb-4">
                            <!-- 문의관리 시작 -->
                            <div class="card shadow mb-4">
                        <div class="card-header py-3">
                           <h6 class="m-0 font-weight-bold text-primary" style="display: flex; align-items: center;">
                               <span class="toggle-table on" id="todayQue" style="cursor: pointer; flex: 1; text-align: center; font-weight: bold; padding-right: 10px; border-right: 1px solid #ccc;" data-target="today">오늘의 문의</span>
                               <span class="toggle-table on" id="unrepQue" style="cursor: pointer; flex: 1; text-align: center; font-weight: bold; padding-left: 10px;" data-target="unrep">미답변 문의</span>
                           </h6>
                        </div>
                                <div class="card-body">
                                <!-- 문의관리에서 가져옴1-->
                                   <div class="table-responsive" id="divTable1" style="height: 378px;">
                           <div class="_qna_list_container scrl uio_grid" style="width: 100%; height: 377px;">
                              <div class="_flexible_area flexible_area" style="display: block;">
                                 <div style="height: 35px;">
                                 <div>
                                    <table class="table table-bordered" id="date-table toggle1" style="text-align: center;">
                                      <colgroup>
                                       <col style="width: 250px;">
                                       <col style="width: 250px;">
                                       <col style="width: 150px;">
                                       <col style="width: 300px;">
                                       <col style="width: 300px;">
                                      </colgroup>
                                      <thead>
                                       <tr>
                                       <th class="custom-th">처리상태</th>
                                       <th class="custom-th">문의유형</th>
                                       <th class="custom-th">제목</th>
                                       <th class="custom-th">상품명</th>
                                       <th class="custom-th">질문자</th>
                                       </tr>
                                      </thead>
                                      <tbody>

                                       <div class="_resize_handle_container resize_handle_container">
                                            <c:forEach var="today" items="${todayOneboard}">
                                              <tr>
                                                <td>${today.one_board_repYn}</td>  
                                                <td>${today.one_board_type}</td>
                                                <td><a onclick="boardPop(${today.one_board_num})" style="display: inline-block; max-width: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                ${today.one_board_title}
                                                </a>
                                                </td>
                                               <td style="max-width: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                               ${today.item_name}
                                               </td>
                                                <td>${today.member_name}</td>
                                              </tr>
                                            </c:forEach>                                    
                                       </div>
                                    
                                      </tbody>
                                    </table>                                    
                                 </div>
                                 <!-- 목록 없으면 -->
                                 <div style="text-align: center; padding-top: 50%; transform: translateY(-50%);">
                                 <c:if test="${empty todayOneboard}">
                                    <i class="far fa-comment-dots" style="font-size: 70px;"></i><br>
                                    <p style="margin: 0;">오늘 등록된 문의가 없습니다.</p>
                                 </c:if>
                                 </div>
                                 </div>
                                 <!-- 문의관리 편집1 끝 -->
                                      </div>
                                  </div>
                              </div>
                              
                                <!-- 문의관리에서 가져옴2-->
                                   <div class="table-responsive" id="divTable2" style="height: 378px;">
                           <div class="_qna_list_container scrl uio_grid" style="width: 100%; height: 377px;">
                              <div class="_flexible_area flexible_area" style="display: block;">
                                 <div style="height: 35px;">
                                 <!-- 문의관리 편집2 시작 -->
                                 <div>
                                    <table class="table table-bordered" id="date-table toggle2" style="text-align: center;">
                                      <colgroup>
                                       <col style="width: 250px;">
                                       <col style="width: 250px;">
                                       <col style="width: 150px;">
                                       <col style="width: 300px;">
                                       <col style="width: 300px;">
                                      </colgroup>
                                      <thead>
                                       <tr>
                                       <th class="custom-th">접수일</th>
                                       <th class="custom-th">문의유형</th>
                                       <th class="custom-th">제목</th>
                                       <th class="custom-th">상품명</th>
                                       <th class="custom-th">질문자</th>
                                       </tr>
                                      </thead>
                                      <tbody>

                                       <div class="_resize_handle_container resize_handle_container">
                                            <c:forEach var="unrep" items="${unrepboard}">
                                              <tr>  
                                                <td>${unrep.one_board_day}</td>
                                                <td>${unrep.one_board_type}</td>
                                               <td>
                                               <a onclick="boardPop(${unrep.one_board_num})" style="display: inline-block; max-width: 80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                               ${unrep.one_board_title}
                                               </a>
                                               </td>
                                             <td style="max-width: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                 ${unrep.item_name}
                                             </td>
                                                <td>${unrep.member_name}</td>
                                              </tr>
                                            </c:forEach>                                    
                                       </div>
                                      </tbody>
                                    </table>
                                                                        
                                 </div>
                                 <!-- 목록 없으면 -->
                                 <div style="text-align: center; padding-top: 50%; transform: translateY(-50%);">
                                 <c:if test="${empty unrepboard}">
                                    <i class="far fa-comment-dots" style="font-size: 70px;"></i><br>
                                    <p style="margin: 0;">미답변 문의가 없습니다.</p>
                                 </c:if>
                                 </div>
                                 </div>
                                 <!-- 문의관리 편집2 끝 -->
                                      </div>
                                  </div>
                              </div>                              
                              <!-- 문의 관리로 이동 -->
                        <div style="text-align:center;">
                           <a href="${pageContext.request.contextPath}/questionMng" style="color:#666;border-color:#dbdde2!important;border :1px solid;display:block;padding :10px;text-align:center;text-decoration:none;line-height :1;background:none;">
                           문의 관리
                           </a>
                        </div>
                          </div>
                  </div>
                  <!-- 페이지 컨텐츠 끝 -->
            
         </div>
         <!-- 메인 컨텐츠 끝 -->
      </div>
      </div>
      </div>

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/sb-admin-2.min.js"></script>

   <script>
   // 당월 일자별 매출 차트
   // 차트를 그리기 위한 함수 - 기존 템플릿거로 수정중
   function drawDailySalesChart(data) {
     const labels = data.map(item => item.order_mmdd);
     const sales = data.map(item => item.order_mmdd_totalSales);
   
     const ctx = document.getElementById('getDailySalesChart').getContext('2d');
     const myChart = new Chart(ctx, {
          type: 'line',
          data: {
              labels: labels,
              datasets: [{
                  data: sales,
                  lineTension: 0.3,
                  borderColor: "rgba(78, 115, 223, 1)",
                  backgroundColor: "rgba(78, 115, 223, 0.3)",
                  pointBackgroundColor: "rgba(78, 115, 223, 1)",
                  pointBorderColor: "rgba(78, 115, 223, 1)",
                  pointHoverRadius: 3,
                  pointHoverBackgroundColor:"rgba(78,115 ,223 ,1)",
                  pointHoverBorderColor:"rgba(78 ,115 ,223 ,1)",
                pointHitRadius :10,
                pointBorderWidth :2,
                fill:true   // 라인 아래 색 채움
              }]
          },
          options:{
             scales:{
                 x:{
                     grid:{
                         display:false,
                         drawBorder:false 
                     }
                 },
                 y:{ 
                     display:false
                }
             },
             plugins:{ 
                legend:{ 
                   display:false 
                }, 
                tooltip:{  
                   callbacks:{
                      label:function(context){
                          let salesValue = context.parsed.y;
                          salesValue = salesValue.toLocaleString('en');  
                          return "매출 : "+salesValue+"원";  
                      }
                   }  
                }   
             }   
         }   
      });
   }
   
   // 페이지 로딩 시 매출 데이터 가져와서 차트 그리기
   $(document).ready(function() { 
     ajaxDailySales();
   });
   
   // 매출 데이터를 가져오는 함수
   function ajaxDailySales() {
     $.ajax({
       url: '${pageContext.request.contextPath}/chartDailySales',
       type: 'get',
       dataType: 'json',
       success: function(result) {
         drawDailySalesChart(result);
       },
       error: function() {
         alert('매출 데이터를 가져오는데 실패했습니다.');
       }
     });
   }
   </script>
   
   <script>
   // 품목별 월 매출 차트
   // 차트를 그리기 위한 함수
   function drawMonthlyItemsChart(data) {
   var labels = data.map(item => item.item_name);
   var sales = data.map(item => item.item_totalSales);
   
   if (sales.length === 0) {
       document.getElementById('noDataMessage').style.display = 'block';
   } else {
       document.getElementById('noDataMessage').style.display = 'none';
       
   var ctx = document.getElementById('getMonthlyItemsChart').getContext('2d');
   var myChart = new Chart(ctx, {
       type: 'pie',
       data: {
         labels: labels,
         datasets: [{
           data: sales,
           backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
           hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
           hoverBorderColor: "rgba(234, 236, 244, 1)"
         }],
       },
       options: {
         maintainAspectRatio: false,
         tooltips: {
           backgroundColor: "rgb(255,255,255)",
           bodyFontColor: "#858796",
           borderColor: '#dddfeb',
           borderWidth: 1,
           xPadding: 15,
           yPadding: 15,
           displayColors: false,
           caretPadding: 10,
         },
         legend: {
           display: false
         },
         cutoutPercentage: 80,
       }
     });
   }
   }

    // 페이지 로딩 시 매출 데이터 가져와서 차트 그리기
    $(document).ready(function() { 
      ajaxMonthlyItems();
    });
   
    // 매출 데이터를 가져오는 함수
    function ajaxMonthlyItems() {
      $.ajax({
        url: '${pageContext.request.contextPath}/chartMonthlyItems',
        type: 'get',
        dataType: 'json',
        success: function(result) {
          drawMonthlyItemsChart(result);
        },
        error: function() {
          alert('매출 데이터를 가져오는데 실패했습니다.');
        }
      });
     }   
   </script>     
   
   <script>
   let message = '<%=request.getParameter("message")%>';
   if (message !== 'null' && message !== null && message !== undefined) {
        alert(message);
    }
   
   // 리뷰 제목 누르면 팝업창 띄움
   function reviewPop(reviewNum) {
       let review = '${pageContext.request.contextPath}/reviewDetail?review_num=' + reviewNum;
       // 팝업 창 열기
       window.open(review, 'reviewInfoPopup', 'width=800,height=600');
   }

   // 문의 제목 누르면 팝업창 띄움
   function boardPop(boardNum) {
       let board = '${pageContext.request.contextPath}/questionDetail?one_board_num=' + boardNum;
       // 팝업 창 열기
       window.open(board, 'boardInfoPopup', 'width=800,height=600');
   }

    // 별점을 ★로 변경
    let reviewStars = document.querySelectorAll('#review-star');
    reviewStars.forEach(function (starElement) {
        let starCount = parseInt(starElement.textContent, 10);
        let stars = '';
        for (let i = 1; i <= starCount; i++) {
            stars += '★';
        }
        starElement.textContent = stars;
    });
    
   // 문의 팝업창 답변 등록하기 이동
   function redirectToQuestionMngFromPopup() {
    window.location.href = "${pageContext.request.contextPath}/questionMng";
   }
    
   // 문의관리 토글함수
   $(document).ready(function() {
       $("#divTable2").hide();
   
       function toggleQuestion(target) {
           $("#divTable1").hide();
           $("#todayQue").removeClass("on");
           $("#divTable2").hide();
           $("#unrepQue").removeClass("on");
         
         if (target === "today") {
             $("#divTable1").show();
             $("#todayQue").addClass("on");
         } else if (target === "unrep") {
             $("#divTable2").show();
             $("#unrepQue").addClass("on");
         }
       }
     // 메뉴 클릭 이벤트 핸들러
     $(".toggle-table").on("click", function(e) {
       e.preventDefault();
       let target = $(this).data("target");
       toggleQuestion(target);
     });
    });  
   </script>

</body>
</html>