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

    <title>seller/salesMng</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
                    <h1 class="h3 mb-2 text-gray-800">매출관리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net"> official DataTables documentation</a>.</p>
                    <!-- 페이지 상단 끝 -->
                    
					<!-- 월별 매출 테이블 시작 -->
					<!-- 월별 매출 테이블 끝 -->
					
					<!-- 월별 판매량 테이블 시작 -->
					<!-- 월별 판매량 테이블 끝 -->
					
					<!-- 매출통계그래프 시작 -->
					<div class="panel panel-dashboard panel-stats">
						<div class="panel-body">
							<div class="text-center">
								<div data-toggle="buttons" class="btn-group btn-group-customize">
									<label class="btn btn-default"
										ng-class="{active: vm.currentChartIndex === 0}"
										ng-click="vm.showChart(0)" data-nclicks-code="sales.numofpay"><input
										type="radio">결제건수</label> <label class="btn btn-default"
										ng-class="{active: vm.currentChartIndex === 1}"
										ng-click="vm.showChart(1)" data-nclicks-code="sales.payer"><input
										type="radio">결제자수</label> <label class="btn btn-default active"
										ng-class="{active: vm.currentChartIndex === 2}"
										ng-click="vm.showChart(2)" data-nclicks-code="sales.price"><input
										type="radio">결제금액</label>
								</div>
							</div>
							<div class="stats-area">
								<!---->
								<!---->
								<!---->
								<div id="chart-container-payamount"
									style="height: 275px; margin: 0px auto; overflow: hidden;"
									ng-if="vm.currentChartIndex === 2 &amp;&amp; vm.canShowChart()"
									ng-click="vm.movePeriodStat()" data-nclicks-code="sales.pricecont"
									class="" data-highcharts-chart="12">
									<div id="highcharts-ivbnxbt-378" dir="ltr"
										class="highcharts-container "
										style="position: relative; overflow: hidden; width: 858px; height: 275px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
										<svg version="1.1" class="highcharts-root"
											style="font-family: &amp; quot; Lucida Grande&amp;quot; , &amp; quot; Lucida Sans Unicode&amp;quot; , Arial , Helvetica, sans-serif; font-size: 12px;"
											xmlns="http://www.w3.org/2000/svg" width="858" height="275"
											viewBox="0 0 858 275">
											<desc>Created with Highcharts 7.1.1</desc>
											<defs>
											<clipPath id="highcharts-ivbnxbt-379-">
											<rect x="0" y="0" width="816" height="207" fill="none"></rect></clipPath>
											<clipPath id="highcharts-ivbnxbt-411-">
											<rect x="0" y="0" width="816" height="207" fill="none"></rect></clipPath></defs>
											<rect fill="#ffffff" class="highcharts-background" x="0" y="0"
												width="858" height="275" rx="0" ry="0"></rect>
											<rect fill="none" class="highcharts-plot-background" x="32" y="10"
												width="816" height="207"></rect>
											<g class="highcharts-grid highcharts-xaxis-grid" data-z-index="1">
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 58.5 10 L 58.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 85.5 10 L 85.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 113.5 10 L 113.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 140.5 10 L 140.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 167.5 10 L 167.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 194.5 10 L 194.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 221.5 10 L 221.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 249.5 10 L 249.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 276.5 10 L 276.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 303.5 10 L 303.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 330.5 10 L 330.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 357.5 10 L 357.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 385.5 10 L 385.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 412.5 10 L 412.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 439.5 10 L 439.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 466.5 10 L 466.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 493.5 10 L 493.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 521.5 10 L 521.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 548.5 10 L 548.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 575.5 10 L 575.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 602.5 10 L 602.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 629.5 10 L 629.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 657.5 10 L 657.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 684.5 10 L 684.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 711.5 10 L 711.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 738.5 10 L 738.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 765.5 10 L 765.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 793.5 10 L 793.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 820.5 10 L 820.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 847.5 10 L 847.5 217" opacity="1"></path>
											<path fill="none" data-z-index="1" class="highcharts-grid-line"
												d="M 31.5 10 L 31.5 217" opacity="1"></path></g>
											<g class="highcharts-grid highcharts-yaxis-grid" data-z-index="1">
											<path fill="none" stroke="#dfe5e7" stroke-width="1"
												stroke-dasharray="1,3" data-z-index="1"
												class="highcharts-grid-line" d="M 32 114.5 L 848 114.5"
												opacity="1"></path></g>
											<rect fill="none" class="highcharts-plot-border" data-z-index="1"
												x="32" y="10" width="816" height="207"></rect>
											<g class="highcharts-axis highcharts-xaxis" data-z-index="2">
											<path fill="none" class="highcharts-axis-line" stroke="#ccd6eb"
												stroke-width="1" data-z-index="7" d="M 32 217.5 L 848 217.5"></path></g>
											<g class="highcharts-axis highcharts-yaxis" data-z-index="2">
											<path fill="none" class="highcharts-axis-line" data-z-index="7"
												d="M 32 10 L 32 217"></path></g>
											<g class="highcharts-series-group" data-z-index="3">
											<g data-z-index="0.1"
												class="highcharts-series highcharts-series-0 highcharts-spline-series  "
												transform="translate(32,10) scale(1 1)"
												clip-path="url(#highcharts-ivbnxbt-411-)">
											<path fill="none"
												d="M 13.6 103.5 C 13.6 103.5 29.919999999999998 103.5 40.8 103.5 C 51.67999999999999 103.5 57.120000000000005 103.5 68 103.5 C 78.88 103.5 84.32000000000001 103.5 95.2 103.5 C 106.08000000000001 103.5 111.52000000000001 103.5 122.4 103.5 C 133.28000000000003 103.5 138.71999999999997 103.5 149.6 103.5 C 160.48 103.5 165.92000000000002 103.5 176.8 103.5 C 187.68 103.5 193.12 103.5 204 103.5 C 214.88000000000002 103.5 220.32 103.5 231.2 103.5 C 242.07999999999998 103.5 247.51999999999998 103.5 258.4 103.5 C 269.28000000000003 103.5 274.71999999999997 103.5 285.6 103.5 C 296.48 103.5 301.92 103.5 312.8 103.5 C 323.68 103.5 329.12 103.5 340 103.5 C 350.88 103.5 356.32 103.5 367.2 103.5 C 378.08 103.5 383.52 103.5 394.4 103.5 C 405.28 103.5 410.7200000000001 103.5 421.6 103.5 C 432.48 103.5 437.9200000000001 103.5 448.8 103.5 C 459.68 103.5 465.12 103.5 476 103.5 C 486.88 103.5 492.32 103.5 503.2 103.5 C 514.0799999999999 103.5 519.52 103.5 530.4 103.5 C 541.28 103.5 546.72 103.5 557.6 103.5 C 568.48 103.5 573.92 103.5 584.8 103.5 C 595.68 103.5 601.12 103.5 612 103.5 C 622.88 103.5 628.32 103.5 639.2 103.5 C 650.08 103.5 655.52 103.5 666.4 103.5 C 677.28 103.5 682.72 103.5 693.6 103.5 C 704.48 103.5 709.9199999999998 103.5 720.8 103.5 C 731.68 103.5 737.12 103.5 748 103.5 C 758.88 103.5 764.32 103.5 775.2 103.5 C 786.0800000000002 103.5 802.4 103.5 802.4 103.5"
												class="highcharts-graph" data-z-index="1" stroke="#40c65a"
												stroke-width="2" stroke-linejoin="round" stroke-linecap="round"></path>
											<path fill="none"
												d="M 3.5999999999999996 103.5 L 13.6 103.5 C 13.6 103.5 29.919999999999998 103.5 40.8 103.5 C 51.67999999999999 103.5 57.120000000000005 103.5 68 103.5 C 78.88 103.5 84.32000000000001 103.5 95.2 103.5 C 106.08000000000001 103.5 111.52000000000001 103.5 122.4 103.5 C 133.28000000000003 103.5 138.71999999999997 103.5 149.6 103.5 C 160.48 103.5 165.92000000000002 103.5 176.8 103.5 C 187.68 103.5 193.12 103.5 204 103.5 C 214.88000000000002 103.5 220.32 103.5 231.2 103.5 C 242.07999999999998 103.5 247.51999999999998 103.5 258.4 103.5 C 269.28000000000003 103.5 274.71999999999997 103.5 285.6 103.5 C 296.48 103.5 301.92 103.5 312.8 103.5 C 323.68 103.5 329.12 103.5 340 103.5 C 350.88 103.5 356.32 103.5 367.2 103.5 C 378.08 103.5 383.52 103.5 394.4 103.5 C 405.28 103.5 410.7200000000001 103.5 421.6 103.5 C 432.48 103.5 437.9200000000001 103.5 448.8 103.5 C 459.68 103.5 465.12 103.5 476 103.5 C 486.88 103.5 492.32 103.5 503.2 103.5 C 514.0799999999999 103.5 519.52 103.5 530.4 103.5 C 541.28 103.5 546.72 103.5 557.6 103.5 C 568.48 103.5 573.92 103.5 584.8 103.5 C 595.68 103.5 601.12 103.5 612 103.5 C 622.88 103.5 628.32 103.5 639.2 103.5 C 650.08 103.5 655.52 103.5 666.4 103.5 C 677.28 103.5 682.72 103.5 693.6 103.5 C 704.48 103.5 709.9199999999998 103.5 720.8 103.5 C 731.68 103.5 737.12 103.5 748 103.5 C 758.88 103.5 764.32 103.5 775.2 103.5 C 786.0800000000002 103.5 802.4 103.5 802.4 103.5 L 812.4 103.5"
												visibility="visible" data-z-index="2"
												class="highcharts-tracker-line" stroke-linejoin="round"
												stroke="rgba(192,192,192,0.0001)" stroke-width="22"></path></g>
											<g data-z-index="0.1"
												class="highcharts-markers highcharts-series-0 highcharts-spline-series  highcharts-tracker "
												transform="translate(32,10) scale(1 1)">
											<path fill="#40c65a" visibility="hidden"
												d="M 720 103.5 A 0 0 0 1 1 720 103.5 Z"
												class="highcharts-halo highcharts-color-undefined"
												data-z-index="-1" fill-opacity="0.25"></path>
											<path fill="#40c65a"
												d="M 13 107.5 A 4 4 0 1 1 13.003999999333336 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 40 107.5 A 4 4 0 1 1 40.00399999933334 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 68 107.5 A 4 4 0 1 1 68.00399999933333 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 95 107.5 A 4 4 0 1 1 95.00399999933333 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 122 107.5 A 4 4 0 1 1 122.00399999933333 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 149 107.5 A 4 4 0 1 1 149.00399999933333 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 176 107.5 A 4 4 0 1 1 176.00399999933333 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 204 107.5 A 4 4 0 1 1 204.00399999933333 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 231 107.5 A 4 4 0 1 1 231.00399999933333 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 258 107.5 A 4 4 0 1 1 258.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 285 107.5 A 4 4 0 1 1 285.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 312 107.5 A 4 4 0 1 1 312.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 340 107.5 A 4 4 0 1 1 340.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 367 107.5 A 4 4 0 1 1 367.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 394 107.5 A 4 4 0 1 1 394.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 421 107.5 A 4 4 0 1 1 421.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 448 107.5 A 4 4 0 1 1 448.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 476 107.5 A 4 4 0 1 1 476.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 503 107.5 A 4 4 0 1 1 503.00399999933336 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 530 107.5 A 4 4 0 1 1 530.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 557 107.5 A 4 4 0 1 1 557.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 584 107.5 A 4 4 0 1 1 584.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 612 107.5 A 4 4 0 1 1 612.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 639 107.5 A 4 4 0 1 1 639.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 666 107.5 A 4 4 0 1 1 666.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 693 107.5 A 4 4 0 1 1 693.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 720 107.5 A 4 4 0 1 1 720.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point "></path>
											<path fill="#40c65a"
												d="M 748 107.5 A 4 4 0 1 1 748.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 775 107.5 A 4 4 0 1 1 775.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path>
											<path fill="#40c65a"
												d="M 802 107.5 A 4 4 0 1 1 802.0039999993334 107.49999800000016 Z"
												opacity="1" class="highcharts-point"></path></g></g>
											<text x="429" text-anchor="middle" class="highcharts-title"
												data-z-index="4"
												style="color:#333333;font-size:18px;fill:#333333;" y="24"></text>
											<text x="429" text-anchor="middle" class="highcharts-subtitle"
												data-z-index="4" style="color:#666666;fill:#666666;" y="24"></text>
											<g class="highcharts-axis-labels highcharts-xaxis-labels"
												data-z-index="7">
											<text x="48.19272486435067"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 48.19272486435067 233)"
												y="233" opacity="1">06.20.</text>
											<text x="75.39272486435068"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 75.39272486435068 233)"
												y="233" opacity="1">06.21.</text>
											<text x="102.59272486435067"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 102.59272486435067 233)"
												y="233" opacity="1">06.22.</text>
											<text x="129.7927248643507"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 129.7927248643507 233)"
												y="233" opacity="1">06.23.</text>
											<text x="156.9927248643507"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 156.9927248643507 233)"
												y="233" opacity="1">06.24.</text>
											<text x="184.19272486435068"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 184.19272486435068 233)"
												y="233" opacity="1">06.25.</text>
											<text x="211.3927248643507"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 211.3927248643507 233)"
												y="233" opacity="1">06.26.</text>
											<text x="238.59272486435069"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 238.59272486435069 233)"
												y="233" opacity="1">06.27.</text>
											<text x="265.79272486435065"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 265.79272486435065 233)"
												y="233" opacity="1">06.28.</text>
											<text x="292.99272486435063"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 292.99272486435063 233)"
												y="233" opacity="1">06.29.</text>
											<text x="320.1927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 320.1927248643506 233)"
												y="233" opacity="1">06.30.</text>
											<text x="347.3927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 347.3927248643506 233)"
												y="233" opacity="1">07.01.</text>
											<text x="374.59272486435066"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 374.59272486435066 233)"
												y="233" opacity="1">07.02.</text>
											<text x="401.79272486435065"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 401.79272486435065 233)"
												y="233" opacity="1">07.03.</text>
											<text x="428.99272486435063"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 428.99272486435063 233)"
												y="233" opacity="1">07.04.</text>
											<text x="456.1927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 456.1927248643506 233)"
												y="233" opacity="1">07.05.</text>
											<text x="483.3927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 483.3927248643506 233)"
												y="233" opacity="1">07.06.</text>
											<text x="510.59272486435066"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 510.59272486435066 233)"
												y="233" opacity="1">07.07.</text>
											<text x="537.7927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 537.7927248643506 233)"
												y="233" opacity="1">07.08.</text>
											<text x="564.9927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 564.9927248643506 233)"
												y="233" opacity="1">07.09.</text>
											<text x="592.1927248643507"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 592.1927248643507 233)"
												y="233" opacity="1">07.10.</text>
											<text x="619.3927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 619.3927248643506 233)"
												y="233" opacity="1">07.11.</text>
											<text x="646.5927248643507"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 646.5927248643507 233)"
												y="233" opacity="1">07.12.</text>
											<text x="673.7927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 673.7927248643506 233)"
												y="233" opacity="1">07.13.</text>
											<text x="700.9927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 700.9927248643506 233)"
												y="233" opacity="1">07.14.</text>
											<text x="728.1927248643507"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 728.1927248643507 233)"
												y="233" opacity="1">07.15.</text>
											<text x="755.3927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 755.3927248643506 233)"
												y="233" opacity="1">07.16.</text>
											<text x="782.5927248643507"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 782.5927248643507 233)"
												y="233" opacity="1">07.17.</text>
											<text x="809.7927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 809.7927248643506 233)"
												y="233" opacity="1">07.18.</text>
											<text x="836.9927248643506"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end"
												transform="translate(0,0) rotate(-45 836.9927248643506 233)"
												y="233" opacity="1">07.19.</text></g>
											<g class="highcharts-axis-labels highcharts-yaxis-labels"
												data-z-index="7">
											<text x="17"
												style="color:#858992;cursor:default;font-size:11px;fill:#858992;"
												text-anchor="end" transform="translate(0,0)" y="118" opacity="1">0</text></g>
											<g
												class="highcharts-label highcharts-tooltip highcharts-color-undefined"
												style="pointer-events:none;white-space:nowrap;" data-z-index="8"
												transform="translate(726,-9999)" opacity="0" visibility="visible">
											<path fill="none"
												class="highcharts-label-box highcharts-tooltip-box highcharts-shadow"
												d="M 3.5 0.5 L 51.5 0.5 C 54.5 0.5 54.5 0.5 54.5 3.5 L 54.5 60.5 C 54.5 63.5 54.5 63.5 51.5 63.5 L 32.5 63.5 26.5 69.5 20.5 63.5 3.5 63.5 C 0.5 63.5 0.5 63.5 0.5 60.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"
												stroke="#000000" stroke-opacity="0.049999999999999996"
												stroke-width="5" transform="translate(1, 1)"></path>
											<path fill="none"
												class="highcharts-label-box highcharts-tooltip-box highcharts-shadow"
												d="M 3.5 0.5 L 51.5 0.5 C 54.5 0.5 54.5 0.5 54.5 3.5 L 54.5 60.5 C 54.5 63.5 54.5 63.5 51.5 63.5 L 32.5 63.5 26.5 69.5 20.5 63.5 3.5 63.5 C 0.5 63.5 0.5 63.5 0.5 60.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"
												stroke="#000000" stroke-opacity="0.09999999999999999"
												stroke-width="3" transform="translate(1, 1)"></path>
											<path fill="none"
												class="highcharts-label-box highcharts-tooltip-box highcharts-shadow"
												d="M 3.5 0.5 L 51.5 0.5 C 54.5 0.5 54.5 0.5 54.5 3.5 L 54.5 60.5 C 54.5 63.5 54.5 63.5 51.5 63.5 L 32.5 63.5 26.5 69.5 20.5 63.5 3.5 63.5 C 0.5 63.5 0.5 63.5 0.5 60.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"
												stroke="#000000" stroke-opacity="0.15" stroke-width="1"
												transform="translate(1, 1)"></path>
											<path fill="rgba(255,255,255,0.90)"
												class="highcharts-label-box highcharts-tooltip-box"
												d="M 3.5 0.5 L 51.5 0.5 C 54.5 0.5 54.5 0.5 54.5 3.5 L 54.5 60.5 C 54.5 63.5 54.5 63.5 51.5 63.5 L 32.5 63.5 26.5 69.5 20.5 63.5 3.5 63.5 C 0.5 63.5 0.5 63.5 0.5 60.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"
												stroke="#91959d" stroke-width="1"></path></g></svg>
										<div
											class="highcharts-label highcharts-tooltip highcharts-color-undefined"
											style="position: absolute; left: 726px; top: -9999px; opacity: 0; pointer-events: none; visibility: visible;">
											<span data-z-index="1"
												style="position: absolute; font-family: &amp; quot; Lucida Grande&amp;quot; , &amp; quot; Lucida Sans Unicode&amp;quot; , Arial , Helvetica, sans-serif; font-size: 12px; white-space: nowrap; color: rgb(51, 51, 51); cursor: default; margin-left: 0px; margin-top: 0px; left: 8px; top: 8px;"><span
												style="font-size: 12px; color: #52555c"><b>07.16.</b></span><br>
											<span style="font-size: 18px; color: #40c65a"><b>0</b></span><span
												style="font-size: 12px; color: #848992"> 원</span></span>
										</div>
									</div>
								</div>
								<!---->
								<!---->
								<!---->
							</div>
						</div>
						<!---->
						<!---->
					</div>
					<!-- 매출통계그래프 -->
					
					<!-- 검색바 -->
					<div class="panel panel-seller"
						ng-include="'shared/products/relation-list/include/search-condition-area.html.inc'">
						<form name="vm.searchForm" novalidate="" ng-submit="vm.func.search()"
							class="ng-pristine ng-valid ng-valid-pattern ng-valid-max-size-by-split ng-valid-maxlength ng-valid-required ng-valid-date-time-input">
							<div class="panel-body">
								<div class="seller-search-section">
									<ul class="seller-list-border">
										<!---->
										<li><label class="control-label">매출 발생 기간</label>
										<div class="input-content">
												<div class="form-inline narrow-area"
													ng-class="{'has-error-msg': (vm.searchForm.fromDate.$invalid || vm.searchForm.toDate.$invalid)}">
													<ncp-datetime-range-picker2
														start-date-model="vm.searchFormData.fromDate"
														start-date-name="fromDate"
														end-date-model="vm.searchFormData.toDate"
														end-date-name="toDate" date-max="'TODAY'"
														datetime-picker-format-name="DATE" date-required="true"
														date-range-usable="true"
														date-range-option="vm.config.SearchDateRangePickerPeriodOptions"
														date-markup-option="{onlyDate:true, disabledDateDimmed:true}"><!---->
													<div class="form-group" ng-if="vm.dateRangeUsable">
														<div class="btn-toolbar">
															<div class="btn-group"
																ng-class="::{'fix-width-col-4' : vm.dateMarkupOption.buttonFixWidth}"
																ng-attr-data-nclicks-code="{{::vm.nclicksCodeRangeButton}}">
																<!---->
																<button type="button" class="btn btn-primary2"
																	ng-repeat="option in vm.dateRangeOption.periods"
																	ng-click="vm.onClickRangeButton($index)"
																	ng-disabled="vm.dateDisabled"
																	ng-class="{ active: option.active }">오늘</button>
																<!---->
																<button type="button" class="btn btn-primary2"
																	ng-repeat="option in vm.dateRangeOption.periods"
																	ng-click="vm.onClickRangeButton($index)"
																	ng-disabled="vm.dateDisabled"
																	ng-class="{ active: option.active }">1주일</button>
																<!---->
																<button type="button" class="btn btn-primary2"
																	ng-repeat="option in vm.dateRangeOption.periods"
																	ng-click="vm.onClickRangeButton($index)"
																	ng-disabled="vm.dateDisabled"
																	ng-class="{ active: option.active }">1개월</button>
																<!---->
																<button type="button" class="btn btn-primary2"
																	ng-repeat="option in vm.dateRangeOption.periods"
																	ng-click="vm.onClickRangeButton($index)"
																	ng-disabled="vm.dateDisabled"
																	ng-class="{ active: option.active }">3개월</button>
																<!---->
																<button type="button" class="btn btn-primary2"
																	ng-repeat="option in vm.dateRangeOption.periods"
																	ng-click="vm.onClickRangeButton($index)"
																	ng-disabled="vm.dateDisabled"
																	ng-class="{ active: option.active }">6개월</button>
																<!---->
																<button type="button" class="btn btn-primary2 active"
																	ng-repeat="option in vm.dateRangeOption.periods"
																	ng-click="vm.onClickRangeButton($index)"
																	ng-disabled="vm.dateDisabled"
																	ng-class="{ active: option.active }">1년</button>
																<!---->
																<button type="button" class="btn btn-primary2"
																	ng-repeat="option in vm.dateRangeOption.periods"
																	ng-click="vm.onClickRangeButton($index)"
																	ng-disabled="vm.dateDisabled"
																	ng-class="{ active: option.active }">전체</button>
																<!---->
															</div>
														</div>
													</div>
													<!---->
													<div class="form-group only-date disabled-date-dimmed"
														ng-class="::{'only-date' : vm.dateMarkupOption.onlyDate, 'disabled-date-dimmed' : vm.dateMarkupOption.disabledDateDimmed }">
														<div class="seller-calendar">
															<div class="input-daterange date form-inline">
																<div
																	class="form-group _startDate_dropdown seller-datetime-picker _error_start_date_3978005840 dropdown"
																	ng-class="{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																	<div
																		class="input-group dropdown-toggle dropdown_1693764282"
																		data-toggle="dropdown"
																		ng-click="vm.isStartDateShow = !vm.dateDisabled &amp;&amp; true"
																		ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																		<input type="text"
																			class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-date-time-input"
																			name="fromDate" title="날짜 입력"
																			ng-readonly="::vm.dateInputReadonly"
																			ng-required="vm.dateRequired &amp;&amp; !vm.ignoreStartDateRequired"
																			ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType"
																			ncp-disabled="!vm.dateDisabledByPeriodType"
																			ng-model="vm.startDateModel"
																			model-type="YYYY-MM-DDTHH:mm:ss.SSSZ"
																			date-time-input="YYYY.MM.DD."
																			data-date-formats="::vm.inputModelFormats"
																			ncp-message-container="._error_start_date_3978005840"
																			ng-required-err-type="required.daterangepicker.startDate"
																			ncp-validate-change-trigger="" required="required"
																			readonly="readOnly">
																		<!---->
																		<span class="input-group-addon"
																			ng-if="!vm.dateDisabled &amp;&amp; !vm.dateDisabledByPeriodType &amp;&amp; !vm.startDatetimePickerDisabled"><a
																			role="button" href=""><i class="fn fn-calendar1"
																				aria-hidden="true"></i><span class="sr-only">달력보기</span></a>
																		</span>
																		<!---->
																		<!---->
																	</div>
																	<!---->
																</div>
																<div class="form-group dash">
																	<div class="input-group">
																		<span class="input-group-addon">~</span>
																	</div>
																</div>
																<div
																	class="form-group _endDate_dropdown seller-datetime-picker _error_end_date_6583036381 dropdown"
																	ng-class="::{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																	<div
																		class="input-group dropdown-toggle dropdown_8625679209"
																		data-toggle="dropdown"
																		ng-click="vm.isEndDateShow = !vm.dateDisabled &amp;&amp; true"
																		ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																		<input type="text"
																			class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-date-time-input"
																			name="toDate" title="날짜 입력"
																			ng-readonly="::vm.dateInputReadonly"
																			ng-required="vm.dateRequired &amp;&amp; !vm.ignoreEndDateRequired"
																			ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType"
																			ncp-disabled="!vm.dateDisabledByPeriodType"
																			ng-model="vm.endDateModel"
																			model-type="YYYY-MM-DDTHH:mm:ss.SSSZ"
																			date-time-input="YYYY.MM.DD."
																			data-date-formats="::vm.inputModelFormats"
																			ncp-message-container="._error_end_date_6583036381"
																			ng-required-err-type="required.daterangepicker.endDate"
																			ncp-validate-change-trigger="" required="required"
																			readonly="readOnly">
																		<!---->
																		<span class="input-group-addon"
																			ng-if="!vm.dateDisabled &amp;&amp; !vm.dateDisabledByPeriodType &amp;&amp; !vm.endDatetimePickerDisabled"><a
																			role="button" href=""><i class="fn fn-calendar1"
																				aria-hidden="true"></i><span class="sr-only">달력보기</span></a>
																		</span>
																		<!---->
																		<!---->
																	</div>
																	<!---->
																</div>
															</div>
														</div>
														<!---->
													</div>
													</ncp-datetime-range-picker2>
												</div>
											</div></li>
									</ul>
								</div>
							</div>
							<div class="panel-footer">
								<div class="seller-btn-area btn-group-lg">
									<button type="submit" class="btn btn-primary">검색</button>
									<button type="button" class="btn btn-default"
										ng-click="vm.func.reset()">초기화</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색바 끝 -->
					
					<!-- 발생한 매출 목록 시작 -->
					<!-- 발생한 매출 목록 끝 -->

				</div>
				<!-- 페이지 컨텐츠 끝 -->
				
			</div>
			<!-- 메인 컨텐츠 끝 -->	

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
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
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/datatables-demo.js"></script>

</body>

</html>