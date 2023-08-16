<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                    <!-- 페이지 상단 시작 -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">판매자 메인</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i>Generate Report
                        </a>
                    </div>
                    <!-- 페이지 상단 끝 -->
                    
                    <!-- 매출통계그래프 시작 -->
                    
					<!-- 선진) 차트를 그리기 위한 스크립트 추가 -->
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
					
					<!-- 선진) 매출 그래프를 표시할 캔버스 요소 -->					
					<div>
					  <canvas id="getDailySalesChart" width="1000" height="200"></canvas>
					</div>
					
					<!-- 선진) 해당 월의 일자별 매출 차트 -->
					<div>
					<script>
					  // 차트를 그리기 위한 함수
					  function drawDailySalesChart(data) {
					    const labels = data.map(item => item.order_mmdd);
					    const sales = data.map(item => item.order_mmdd_totalSales);
					
					    const ctx = document.getElementById('getDailySalesChart').getContext('2d');
					    const myChart = new Chart(ctx, {
					      type: 'line',
					      data: {
					        labels: labels,
					        datasets: [{
					          label: '매출',
					          data: sales,
					          borderColor: 'rgba(75, 192, 192, 1)',
					          backgroundColor: 'rgba(75, 192, 192, 0.2)',
					          borderWidth: 1
					        }]
					      },
					      options: {
					        scales: {
					          x: {
					            title: {
					              display: true,
					              text: '날짜'
					            }
					          },
					          y: { beginAtZero: true, title: { display: true, text: '매출' },
					            gridLines:{
									color: 'rgba(166, 201, 226, 1)',
									lineWidth:3
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
					        console.log(result);
					        drawDailySalesChart(result);
					      },
					      error: function() {
					        alert('매출 데이터를 가져오는데 실패했습니다.');
					      }
					    });
					  }
					</script>
					</div>
					<!-- 매출통계그래프 끝 -->
					
					<!-- 주문내역 / 배송내역 시작 -->
					<div class="panel panel-dashboard"><div class="panel-heading"><div class="pull-left"><h3 class="panel-title">주문/배송</h3></div><div class="pull-right"><ncp-dashboard-refresh component-name="vm.componentName" refresh-interval="vm.refreshIntervalMinutes" on-block="vm.blockRefresh()" on-refresh="vm.refresh()" nclicks-code="orddel.ref"><span class="text-muted sub-text">최근 04:16</span> <a href="" role="button" class="btn-refresh font-icon-button" ng-click="vm.refresh()" data-nclicks-code="orddel.ref"><i class="fn fn-refresh" aria-hidden="true"></i> <span class="sr-only">새로고침</span></a></ncp-dashboard-refresh></div></div><div class="panel-body flex flex-wrap"><div class="list-wrap deposit-list flex-col-6 flex-col-md-12"><!----><div ng-if="vm.saleStats &amp;&amp; vm.saleStats.$resolved" class="" style=""><div class="panel-icon-area"><span class="square-ico-area"><i class="seller-icon icon-order" aria-hidden="true"></i></span></div><ul class="panel-list"><li><span class="info-title">결제대기</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_unpayment" class="text-number" ng-bind="::vm.saleStats.paymentWaitCases" data-nclicks-code="orddel.paymentwait" href="#/naverpay/sale/unpayment">0</a><!----> <!----><span>건</span></span></li><li><div class="clearfix"><span class="info-title"><em class="pull-left">신규주문</em> <a href="javascript:void(0)" role="button" class="font-icon-button" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li><strong>&amp;apos;선물 수락대기&amp;apos; 상태의 주문 건은 포함되지 않습니다.</strong></li><li><a href=&quot;https://help.sell.smartstore.naver.com/faq/content.help?faqId=3355&quot; target=&quot;_blank&quot; role=&quot;button&quot; class=&quot;btn-link text-primary&quot;><span>그럼 선물 주문은 어디서 확인하나요?<i class=&quot;fn-shopping fn-shopping-forward2&quot; aria-hidden=&quot;true&quot;></i><span></span></li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" data-nclicks-code="orddel.newtip"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span> </a></span><span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery" class="text-number" ng-bind="::vm.saleStats.newOrderCases" data-nclicks-code="orddel.new" href="#/naverpay/sale/delivery">0</a><!----> <!----><span>건</span></span></div><div class="clearfix panel-sub-info"><span class="info-title"><em class="sub-icon">⌞</em> 오늘출발<a href="javascript:void(0)" role="button" class="font-icon-button" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>&amp;apos;정기구독&amp;apos; 주문건은 &amp;apos;오늘출발&amp;apos;에 포함되지 않습니다.</li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" data-nclicks-code="orddel.departtodaytip"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span> </a></span><span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery({summaryInfoType : 'NEW_ORDERS_DELIVERY_OPERATED_BEFORE', sellerOrderSearchTypes: 'TODAY_DISPATCH'})" class="text-number" ng-bind="::vm.saleStats.todayDispatchCases" data-nclicks-code="orddel.departtoday" href="#/naverpay/sale/delivery?summaryInfoType=NEW_ORDERS_DELIVERY_OPERATED_BEFORE&amp;sellerOrderSearchTypes=TODAY_DISPATCH">0</a><!----> <!----><span>건</span></span></div><div class="clearfix panel-sub-info"><span class="info-title"><em class="sub-icon">⌞</em> 예약구매</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery({summaryInfoType : 'NEW_ORDERS_DELIVERY_OPERATED_BEFORE', sellerOrderSearchTypes: 'PRE_ORDER'})" class="text-number" ng-bind="::vm.saleStats.preOrderCases" data-nclicks-code="orddel.preord" href="#/naverpay/sale/delivery?summaryInfoType=NEW_ORDERS_DELIVERY_OPERATED_BEFORE&amp;sellerOrderSearchTypes=PRE_ORDER">0</a><!----> <!----><span>건</span></span></div><div class="clearfix panel-sub-info"><span class="info-title"><em class="sub-icon">⌞</em> 정기구독</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery({summaryInfoType : 'NEW_ORDERS_DELIVERY_OPERATED_BEFORE', sellerOrderSearchTypes: 'SUBSCRIPTION'})" class="text-number" ng-bind="::vm.saleStats.subscriptionCases" data-nclicks-code="orddel.subscription" href="#/naverpay/sale/delivery?summaryInfoType=NEW_ORDERS_DELIVERY_OPERATED_BEFORE&amp;sellerOrderSearchTypes=SUBSCRIPTION">0</a><!----> <!----><span>건</span></span></div><div class="clearfix panel-sub-info"><span class="info-title"><em class="sub-icon">⌞</em> 네이버도착보장<a href="javascript:void(0)" role="button" class="font-icon-button" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>&amp;apos;정기구독&amp;apos; 주문건은 &amp;apos;네이버도착보장&amp;apos;에 포함되지 않습니다.</li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" data-nclicks-code="orddel.avgttip"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span> </a></span><span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery" class="text-number" ng-bind="::vm.saleStats.arrivalGuaranteeCases" data-nclicks-code="orddel.avgt" href="#/naverpay/sale/delivery">0</a><!----> <!----><span>건</span></span></div></li></ul></div><!----><!----></div><div class="list-wrap delivery-list flex-col-6 flex-col-md-12"><!----><div ng-if="vm.saleStats &amp;&amp; vm.saleStats.$resolved" class="" style=""><div class="panel-icon-area"><span class="square-ico-area"><i class="seller-icon icon-delivery" aria-hidden="true"></i></span></div><ul class="panel-list"><li><span class="info-title">배송준비</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery({summaryInfoType : 'DELIVERY_READY'})" class="text-number" ng-bind="::vm.saleStats.deliveryPreparingCases" data-nclicks-code="orddel.wait" href="#/naverpay/sale/delivery?summaryInfoType=DELIVERY_READY">0</a><!----> <!----><span>건</span></span></li><li><span class="info-title">배송중</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery_situation({summaryInfoType : 'DELIVERING'})" class="text-number" ng-bind="::vm.saleStats.deliveringCases" data-nclicks-code="orddel.ing" href="#/naverpay/sale/delivery/situation?summaryInfoType=DELIVERING">0</a><!----> <!----><span>건</span></span></li><li><span class="info-title">배송완료</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_delivery_situation({summaryInfoType : 'DELIVERED'})" class="text-number" ng-bind="::vm.saleStats.deliveredCases" data-nclicks-code="orddel.completed" href="#/naverpay/sale/delivery/situation?summaryInfoType=DELIVERED">0</a><!----> <!----><span>건</span></span></li></ul></div><!----></div></div><!----><!----></div>
					<!-- 주문내역 / 배송내역 끝 -->
					
					<!-- 취소,반품내역 / 정산내역 시작 -->
					<div class="panel panel-dashboard"><div class="panel-heading"><div class="pull-left"><h3 class="panel-title">클레임/정산 <!----></h3></div><div class="pull-right"><ncp-dashboard-refresh component-name="vm.componentName" refresh-interval="vm.refreshIntervalMinutes" on-block="vm.blockRefresh()" on-refresh="vm.refresh()" nclicks-code="claimset.ref"><span class="text-muted sub-text">최근 04:16</span> <a href="" role="button" class="btn-refresh font-icon-button" ng-click="vm.refresh()" data-nclicks-code="claimset.ref"><i class="fn fn-refresh" aria-hidden="true"></i> <span class="sr-only">새로고침</span></a></ncp-dashboard-refresh></div></div><div class="panel-body flex flex-wrap"><div class="list-wrap return-list flex-col-6 flex-col-md-12"><!----><div ng-if="vm.claim &amp;&amp; vm.claim.$resolved" class="" style=""><div class="panel-icon-area"><span class="square-ico-area"><i class="seller-icon icon-return" aria-hidden="true"></i></span></div><ul class="panel-list"><li><span class="info-title">취소요청</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_claim_cancel({summaryInfoType : 'CANCEL_REQUEST'})" class="text-number" ng-bind="::vm.claim.cancelClaimCases" data-nclicks-code="claimset.cancel" href="#/naverpay/claim/cancel?summaryInfoType=CANCEL_REQUEST">0</a><!----> <!----><span>건</span></span></li><li><span class="info-title">반품요청</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_claim_return({summaryInfoType : 'RETURN_REQUEST'})" class="text-number" ng-bind="::vm.claim.returnClaimCases" data-nclicks-code="claimset.return" href="#/naverpay/claim/return?summaryInfoType=RETURN_REQUEST">0</a><!----> <!----><span>건</span></span></li><!----><li ng-if="::vm.isDesktop"><span class="info-title">반품수거완료</span> <span class="number-area"><a ui-sref="main.naverpay_claim_return({summaryInfoType : 'RETURN_COLLECT_DONE'})" class="text-number" ng-bind="::vm.claim.returnCollectDoneCases" data-nclicks-code="claimset.returncollectdone" href="#/naverpay/claim/return?summaryInfoType=RETURN_COLLECT_DONE">0</a> <span>건</span></span></li><!----><li><span class="info-title">교환요청</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_claim_exchange({summaryInfoType : 'EXCHANGE_REQUEST'})" class="text-number" ng-bind="::vm.claim.exchangeClaimCases" data-nclicks-code="claimset.exchange" href="#/naverpay/claim/exchange?summaryInfoType=EXCHANGE_REQUEST">0</a><!----> <!----><span>건</span></span></li><!----><li ng-if="::vm.isDesktop"><span class="info-title">교환수거완료</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_claim_exchange({summaryInfoType : 'EXCHANGE_COLLECT_DONE'})" class="text-number" ng-bind="::vm.claim.exchangeCollectDoneCases" data-nclicks-code="claimset.exchangecollectdone" href="#/naverpay/claim/exchange?summaryInfoType=EXCHANGE_COLLECT_DONE">0</a><!----> <span>건</span></span></li><!----></ul></div><!----><!----></div><div class="list-wrap settlement-list flex-col-6 flex-col-md-12"><!----><div ng-if="vm.settlement &amp;&amp; vm.settlement.$resolved" class="" style=""><div class="panel-icon-area"><span class="square-ico-area"><i class="seller-icon icon-settlement" aria-hidden="true"></i></span></div><ul class="panel-list"><li><span class="info-title">구매확정</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_sale_purchaseDecision({summaryInfoType : 'PURCHASE_DECIDED'})" class="text-number" ng-bind="::vm.purchaseCompletion.purchaseCompletionCases" data-nclicks-code="claimset.confirmed" href="#/naverpay/sale/purchaseDecision?summaryInfoType=PURCHASE_DECIDED">0</a><!----> <!----><span>건</span></span></li><li><div class="clearfix"><span class="info-title"><em class="pull-left">오늘정산</em> <a href="javascript:void(0)" role="button" class="font-icon-button" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>&amp;apos;일반정산(전일 구매확정)금액&amp;apos;과 &amp;apos;빠른정산(전일 집화처리&amp;amp;공제)금액&amp;apos;, &amp;apos;반품안심케어 비용&amp;apos;이 합산된 <strong>오늘 정산받을 금액</strong>입니다.</li><li>빠른정산 금액은 <strong>&amp;apos;빠른정산 금액&amp;apos;과 &amp;apos;빠른정산 지급액 공제&amp;apos;가 합산</strong>되어 노출되므로 <span class=&quot;text-danger&quot;>빠른정산 금액보다 빠른정산 지급액 공제가 큰 경우, 마이너스 금액으로 노출될 수 있습니다.</span></li><li>자세한 금액은 [정산관리 >정산내역 >일별 정산내역] 에서 확인 가능합니다.<br>※ 월요일 정산의 경우, 금/토/일 포함됩니다.</li><li><a href=&quot;https://help.sell.smartstore.naver.com/faq/content.help?faqId=5885&quot; target=&quot;_blank&quot; class=&quot;btn-link text-primary&quot;><span>빠른정산 지급액 공제란?<i class=&quot;fn-shopping fn-shopping-forward2&quot; aria-hidden=&quot;true&quot;></i><span></span></li><li><a href=&quot;https://help.sell.smartstore.naver.com/faq/content.help?faqId=4121&quot; target=&quot;_blank&quot; class=&quot;btn-link text-primary&quot;><span>정산 금액은 언제 입금되나요?<i class=&quot;fn-shopping fn-shopping-forward2&quot; aria-hidden=&quot;true&quot;></i><span></span></li><li><a href=&quot;https://help.sell.smartstore.naver.com/faq/content.help?faqId=6103&quot; target=&quot;_blank&quot; class=&quot;btn-link text-primary&quot;><span>빠른정산 자세히 알아보기<i class=&quot;fn-shopping fn-shopping-forward2&quot; aria-hidden=&quot;true&quot;></i><span></span></li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" data-nclicks-code="claimset.todaytip"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span> </a></span><span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_settlemgt_sellerdailysettle({searchType: 'settleToday'})" class="text-number" ng-bind="::vm.settlement.todayAmount" data-nclicks-code="claimset.today" href="#/naverpay/settlemgt/sellerdailysettle?searchType=settleToday">0</a><!----> <!----><span>원</span></span></div><div class="clearfix panel-sub-info"><span class="info-title"><em class="sub-icon">⌞</em> 빠른정산</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_settlemgt_quicksettlebycase({searchType: 'settleToday'})" class="text-number" ng-bind="::vm.settlement.quickTodayAmount" data-nclicks-code="claimset.todayfast" href="#/naverpay/quicksettle/quicksettlebycase?searchType=settleToday">0</a><!----> <!----><span>원</span></span></div></li><li><div class="clearfix"><span class="info-title"><em class="pull-left">정산예정</em> <a href="javascript:void(0)" role="button" class="font-icon-button" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>&amp;apos;일반정산(오늘 구매확정)금액&amp;apos;과 &amp;apos;빠른정산(오늘 집화처리&amp;amp;공제)금액&amp;apos;이 합산된 <strong>내일 정산받을 금액</strong>입니다.</li><li>빠른정산 금액은 <strong>&amp;apos;빠른정산 금액&amp;apos;과 &amp;apos;빠른정산 지급액 공제&amp;apos;가 합산</strong>되어 노출되므로 <span class=&quot;text-danger&quot;>빠른정산 금액보다 빠른정산 지급액 공제가 큰 경우, 마이너스 금액으로 노출될 수 있습니다.</span></li><li>자세한 금액은 [정산관리 > 정산내역 > 건별 정산내역] 및 [정산관리 > 빠른정산 > 빠른정산내역]에서 확인이 가능합니다.<br>※ 월요일 정산의 경우, 금/토/일 포함됩니다.<br>※ 빠른정산을 이용하는 경우 정산예정금액 100%를 선정산 지급 후, 주문 종료(구매확정)시점에 세금계산서 및 부가세 발행을 위해 내부 데이터에서는 공제처리가 진행되므로 대시보드에서의 정산예정금액은 변동될 수 있습니다.</li><li><a href=&quot;https://help.sell.smartstore.naver.com/faq/content.help?faqId=5885&quot; target=&quot;_blank&quot; class=&quot;btn-link text-primary&quot;><span>빠른정산 지급액 공제란?<i class=&quot;fn-shopping fn-shopping-forward2&quot; aria-hidden=&quot;true&quot;></i><span></span></li><li><a href=&quot;https://help.sell.smartstore.naver.com/faq/content.help?faqId=3578&quot; target=&quot;_blank&quot; class=&quot;btn-link text-primary&quot;><span>발주/발송관리 메뉴에서 확인되는 정산예정 금액과 다르다면?<i class=&quot;fn-shopping fn-shopping-forward2&quot; aria-hidden=&quot;true&quot;></i><span></span></li><li><a href=&quot;https://help.sell.smartstore.naver.com/faq/content.help?faqId=6103&quot; target=&quot;_blank&quot; class=&quot;btn-link text-primary&quot;><span>빠른정산 자세히 알아보기<i class=&quot;fn-shopping fn-shopping-forward2&quot; aria-hidden=&quot;true&quot;></i><span></span></li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" data-nclicks-code="claimset.expectedtip"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span> </a></span><span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_settlemgt_settlecasebycase({searchType: 'settleExpect'})" class="text-number" ng-bind="::vm.settlement.expectedAmount" data-nclicks-code="claimset.expected" href="#/naverpay/settlemgt/settlecasebycase?searchType=settleExpect">0</a><!----> <!----><span>원</span></span></div><div class="clearfix panel-sub-info"><span class="info-title"><em class="sub-icon">⌞</em> 빠른정산</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_settlemgt_quicksettlebycase({searchType: 'settleExpect'})" class="text-number" ng-bind="::vm.settlement.quickExpectedAmount" data-nclicks-code="claimset.expectedfast" href="#/naverpay/quicksettle/quicksettlebycase?searchType=settleExpect">0</a><!----> <!----><span>원</span></span></div></li><li><span class="info-title">비즈 월렛</span> <span class="number-area"><!----><a ng-if="::vm.isDesktop" ui-sref="main.naverpay_charge" class="text-number" ng-bind="::vm.settlement.chargeBalance" data-nclicks-code="claimset.charge" href="#/naverpay/charge">0</a><!----> <!----><span>원</span></span></li></ul></div><!----></div></div><!----><!----></div>
					<!-- 취소,반품내역 / 정산내역 끝 -->

				</div>
				<!-- 페이지 컨텐츠 끝 -->
				
			</div>
			<!-- 메인 컨텐츠 끝 -->

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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
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

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

</body>
</html>