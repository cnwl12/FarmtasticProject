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

    <title>seller/reviewMng</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">
    
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
	
	<!-- Bootstrap Datepicker CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet"/>
		
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
                        <h1 class="h3 mb-0 text-gray-800">리뷰관리</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i> Generate Report
                        </a>
                    </div>
                    <!-- 페이지 상단 끝 -->                     

					<!-- 검색바(작성일, 타입, 카테고리, 조건, 상세검색) 시작 -->
					<div class="seller-sub-content">
					<div ui-view="search">
						<form name="vm.searchForm" ng-submit="vm.func.search()" novalidate=""
							class="ng-pristine ng-valid-date-time-input ng-invalid ng-invalid-required ng-valid-pattern ng-valid-max-size-by-split">
							<div class="panel panel-seller">
								<div class="panel-body">
									<div class="seller-search-section">
										<ul class="seller-list-border">
											<li><label class="control-label">리뷰작성일</label>
													<div class="form-inline narrow-area">
														 <div id="datepicker">
        <div class="input-content">
            <input type="button" value="오늘" onclick="setDateRange(0);">
            <input type="button" value="1주" onclick="setDateRange(7);">
            <input type="button" value="1개월" onclick="setDateRange(30);">
            <input type="button" value="3개월" onclick="setDateRange(90);">
            <input type="button" value="6개월" onclick="setDateRange(180);">
            <input type="button" value="1년" onclick="setDateRange(365);">
            <br>
            <div class="input-group">
                <input type="text" class="form-control" id="start-date" readonly>
                <span class="input-group-addon">
                  <i class="glyphicon glyphicon-calendar" aria-hidden="true"></i>
                </span>
            </div>
            <div class="input-group">
                <input type="text" class="form-control" id="end-date" readonly>
                <span class="input-group-addon">
                  <i class="glyphicon glyphicon-calendar" aria-hidden="true"></i>
                </span>
            </div>
        </div>
    </div>
													</div>
												</li>

											<li><label class="control-label">구매자평점</label>
											<div class="input-content">
													<div class="form-inline">
														<div class="pc-inline-block">
															<div class="form-group">
																<div class="seller-input">
																	<label><input data-checklist-value="''"
																		name="reviewScores"
																		ng-checked="vm.func.isAllCheckedBySearchCondition(vm.searchFormData.viewData, 'reviewScores')"
																		ng-click="vm.func.checkAllBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewScores', checked)"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.reviewScores"
																		checked="checked">전체<span></span></label>
																	<!---->
																	<!---->
																	<label ng-if="type.name != ''"
																		ng-repeat="type in vm.viewData.reviewScores"><input
																		data-checklist-value="type.name" name="reviewScores"
																		ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewScores')"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.reviewScores"
																		disabled="disabled">1점<span></span></label>
																	<!---->
																	<!---->
																	<!---->
																	<label ng-if="type.name != ''"
																		ng-repeat="type in vm.viewData.reviewScores"><input
																		data-checklist-value="type.name" name="reviewScores"
																		ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewScores')"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.reviewScores"
																		disabled="disabled">2점<span></span></label>
																	<!---->
																	<!---->
																	<!---->
																	<label ng-if="type.name != ''"
																		ng-repeat="type in vm.viewData.reviewScores"><input
																		data-checklist-value="type.name" name="reviewScores"
																		ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewScores')"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.reviewScores"
																		disabled="disabled">3점<span></span></label>
																	<!---->
																	<!---->
																	<!---->
																	<label ng-if="type.name != ''"
																		ng-repeat="type in vm.viewData.reviewScores"><input
																		data-checklist-value="type.name" name="reviewScores"
																		ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewScores')"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.reviewScores"
																		disabled="disabled">4점<span></span></label>
																	<!---->
																	<!---->
																	<!---->
																	<label ng-if="type.name != ''"
																		ng-repeat="type in vm.viewData.reviewScores"><input
																		data-checklist-value="type.name" name="reviewScores"
																		ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewScores')"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.reviewScores"
																		disabled="disabled">5점<span></span></label>
																	<!---->
																	<!---->
																</div>
															</div>
															<div class="form-group form-group-bar"></div>
														</div>
													</div>
												</div></li>
											<!---->
											<!---->
											<!---->
											<li><label class="control-label">상세검색</label>
											<div class="input-content">
													<div class="form-inline has-error-msg">
														<div class="form-group">
															<div
																class="selectize-control ng-pristine ng-untouched ng-valid single">
																<div
																	class="selectize-input items ng-valid ng-pristine full has-options has-items">
																	<div data-value="IDS" class="item">리뷰글번호</div>
																	<input type="text" autocomplete="off" tabindex="0"
																		readonly=""
																		style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
																</div>
																<div
																	class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
																	style="display: none; width: 206px; top: 34px; left: 0px;">
																	<div class="selectize-dropdown-content">
																		<div data-value="PRODUCT_NO" data-selectable=""
																			class="option">상품번호</div>
																		<div data-value="IDS" data-selectable=""
																			class="option selected active">리뷰글번호</div>
																		<div data-value="PRODUCT_ORDER_NO" data-selectable=""
																			class="option">상품주문번호</div>
																	</div>
																</div>
															</div>
															<input config="vm.config.searchKeywordTypesSelectize"
																ng-click="vm.func.changeSearchKeywordType()"
																ng-model="vm.searchFormData.viewData.searchKeywordType"
																options="::vm.config.searchKeywordTypes" placeholder="리뷰글번호"
																selectize=""
																class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
																tabindex="-1" value="IDS"
																style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
														</div>
														<!---->
														<!---->
														<div class="form-group"
															ng-if="vm.searchFormData.viewData.searchKeywordType === 'IDS' || vm.searchFormData.viewData.searchKeywordType === 'EVENT_SEQ'">
															<div class="seller-input-wrap">
																<textarea
																	class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-max-size-by-split"
																	ncp-max-size-by-split=""
																	ncp-max-size-by-split-params="{&quot;maxSize&quot;: 100, &quot;splitPatternCode&quot;: &quot;CommaEnter&quot;}"
																	ncp-shortcut-submit="vm.func.search()"
																	ng-model="vm.searchFormData.viewData.searchKeyword"
																	ng-pattern="^[0-9,]+"
																	ng-pattern-err-type="numberCommaEnter"
																	placeholder="" rows="1"
																	title="검색어 입력"></textarea>
															</div>
														</div>
														<!---->
													</div>
													<!---->
													<!---->
													<!---->
												</div></li>
										</ul>
									</div>
								</div>
								<!--  -->								
								<!--  -->
								<div class="panel-footer">
									<div class="seller-btn-area btn-group-lg">
										<button
											class="btn btn-primary progress-button progress-button-dir-horizontal progress-button-style-top-line"
											pb-style="top-line" progress-button="vm.func.search()"
											type="button">
											<span class="content" ng-transclude="">검색</span>
									
										</button>
										<button class="btn btn-primary" ng-click="vm.func.reset()"
											type="button">초기화</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색바(작성일, 타입, 카테고리, 조건, 상세검색) 끝 -->
					
					<!-- 리뷰 목록 시작 -->
					<div ui-view="list">
					<div class="panel panel-seller"><div class="panel-heading"><div class="pc-pull-left">
					<h3 class="panel-title">리뷰목록 (총 <span class="text-primary">0</span>개)</h3>
					</div>
					<div class="pc-pull-right">
					<div class="narrow-area">
					<div class="form-group form-group-sm">
					<div class="selectize-control ng-pristine ng-untouched ng-valid single" style="width: 150px;">
					<div class="selectize-input items not-full ng-valid ng-pristine has-options">
					<input type="text" autocomplete="off" tabindex="0" placeholder="리뷰등록일순" readonly="" style="width: 71.6875px;"></div>
					<div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none; width: 150px; top: 30px; left: 0px;">
					<div class="selectize-dropdown-content">
					<div data-value="REVIEW_CREATE_DATE_DESC" data-selectable="" class="option active">리뷰등록일순</div>
					<div data-value="PRODUCT_NAME" data-selectable="" class="option">상품명순</div>
					<div data-value="REVIEW_SCORE_DESC" data-selectable="" class="option">평점높은순</div>
					<div data-value="REVIEW_RANKING" data-selectable="" class="option">리뷰랭킹순</div>
					</div>
					</div>
					</div>
					<input config="vm.config.reviewSearchSortTypesSelectize" ng-model="vm.searchFormData.reviewSearchSortType" options="::vm.config.reviewSearchSortTypes" placeholder="리뷰등록일순" selectize="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty" tabindex="-1" value=""> 
					<div class="selectize-control ng-pristine ng-untouched ng-valid single">
					<div class="selectize-input items ng-valid ng-pristine has-options full has-items">
					<div data-value="10" class="item">10개씩</div>
					<input type="text" autocomplete="off" tabindex="0" readonly="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div>
					<div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none; width: 85.7188px; top: 30px; left: 0px;">
					<div class="selectize-dropdown-content">
					<div data-value="10" data-selectable="" class="option selected">10개씩</div>
					<div data-value="50" data-selectable="" class="option">50개씩</div>
					<div data-value="100" data-selectable="" class="option">100개씩</div>
					<div data-value="300" data-selectable="" class="option">300개씩</div>
					</div>
					</div>
					</div>
					<input config="vm.config.pageSizeSelectize" ng-model="vm.searchFormData.viewData.pageSize" options="::vm.config.pageSize" placeholder="500개씩" selectize="" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty" tabindex="-1" value="500" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"> 
					<!---->
					<button class="btn btn-default hidden-xs progress-button progress-button-dir-horizontal progress-button-style-top-line" ng-if="::!vm.isMobile" pb-style="top-line" progress-button="vm.func.downloadExcel()" type="button">
					<span class="progress">
					<span class="progress-inner notransition" ng-style="progressStyles" ng-class="{ notransition: !allowProgressTransition }">
					</span>
					</span>
					</button>
					<!---->
					</div>
					</div>
					</div>
					</div>
					<div class="panel-body"><!---->
					<p class="sub-text text-primary mg-top-reset mg-bottom" ng-if="vm.app === 'CENTER'">욕설, 허위, 비방, 음란물 등 상품과 관련 없는 내용의 부적절한 리뷰는 '리뷰 신고' 기능을 이용해주세요 서비스 규정에 맞춰 관리자 검수하여 삭제 조치될 수 있습니다.</p><!----><!---->
<!-- 					<div class="seller-btn-group" ng-if="vm.app === 'CENTER'"> -->
<!-- 					<div class="seller-btn-left"><div class="form-inline narrow-area"> -->
<!-- 					<div class="form-group"><button class="btn btn-primary btn-sm" ng-click="vm.func.openBestReviewBenefitModal()" type="button">베스트리뷰선정 · 혜택지급</button> -->
<!-- 					 <button class="btn btn-default btn-sm" ng-click="vm.func.openBulkUpdateCommentModal()" type="button">답글작성</button> -->
<!-- 					 </div> -->
<!-- 					 </div> -->
<!-- 					 </div> -->
<!-- 					 </div> -->
					 <!----><!---->
					 <div class="seller-grid-area">
					 <div ag-grid="vm.grid.options" class="ag-theme-fresh" style="width:100%; height: 500px;">
					 <div class="ag-root-wrapper ag-layout-normal ag-ltr">
					            <div class="ag-root-wrapper-body ag-layout-normal" ref="rootWrapperBody">
					                <!--AG-GRID-COMP-->
					                <div class="ag-root ag-unselectable ag-layout-normal" role="grid" unselectable="on" ref="gridPanel" aria-rowcount="1">
					        <!--AG-HEADER-ROOT--><div class="ag-header ag-pivot-off" role="presentation" ref="headerRoot" unselectable="on" style="height: 40px; min-height: 40px;">
					            <div class="ag-pinned-left-header" ref="ePinnedLeftHeader" role="presentation" style="width: 35px; max-width: 35px; min-width: 35px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 35px;"><div class="ag-header-cell" role="presentation" unselectable="on" col-id="checkbox" style="width: 35px; left: 0px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					           
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div>
					            <i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i>
					            </div>
					          </div>
					        </div>
					        <div>
					        <div class="seller-input ag-header-cell-label">
					        <label><input type="checkbox" class="ag-selection-checkbox">
					        <span class="ag-header-cell-text"></span>
					        </label>
					        </div>
					        </div>
					        </div>
					        </div>
					        </div>
					            <div class="ag-header-viewport" ref="eHeaderViewport" role="presentation">
					                
					                <div class="ag-header-container" ref="eHeaderContainer" role="rowgroup" style="width: 2450px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 2450px;">
					                <div class="ag-header-cell" role="presentation" unselectable="on" col-id="productNo" style="width: 100px; left: 0px;">
					                <div ref="eResize" class="ag-header-cell-resize" role="presentation">
					                </div>
					                <!--AG-CHECKBOX-->
					                <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					           
					           
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i>
					            </div>
					           </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        	<div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        		<span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">상품번호</span>    
					        			<span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        				<span class="ag-icon ag-icon-filter" unselectable="on">
					        			</span>	
					        		</span>                  
					        	</div>
					        	</div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="productName" style="width: 150px; left: 100px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					           
					           
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">상품명</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewType" style="width: 100px; left: 250px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰구분</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewScore" style="width: 100px; left: 350px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">구매자평점</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewAttach" style="width: 100px; left: 450px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">포토</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewContent" style="width: 150px; left: 550px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰제목</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="helpCount" style="width: 100px; left: 700px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰내용</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="writerId" style="width: 100px; left: 800px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">등록자</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="createDate" style="width: 150px; left: 900px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰등록일</span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>                  
					        </div>
					        </div>
					        </div>
					        <div class="ag-header-cell" role="presentation" unselectable="on" col-id="modifyDate" style="width: 150px; left: 1050px;">
					        <div ref="eResize" class="ag-header-cell-resize" role="presentation"></div>
					        <!--AG-CHECKBOX-->
					        <div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					          
					          
					          
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div>
					            </div>
					        </div>
					        <div class="ag-cell-label-container" role="presentation">    
					        <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    
					        <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on"></span>    
					        <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true">
					        <span class="ag-icon ag-icon-filter" unselectable="on"></span>
					        </span>
					        </div>
					        </div>
					        </div>
					        </div>
					        </div>
					    </div>
					            
					            
					            
					            
					            <div class="ag-pinned-right-header ag-hidden" ref="ePinnedRightHeader" role="presentation" style="width: 0px; max-width: 0px; min-width: 0px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 0px;"></div></div>
					        </div>
					        <div class="ag-floating-top" ref="eTop" role="presentation" unselectable="on" style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
					            <div class="ag-pinned-left-floating-top" ref="eLeftTop" role="presentation" unselectable="on" style="width: 35px; max-width: 35px; min-width: 35px;"></div>
					            <div class="ag-floating-top-viewport" ref="eTopViewport" role="presentation" unselectable="on">
					                <div class="ag-floating-top-container" ref="eTopContainer" role="presentation" unselectable="on" style="width: 2450px;"></div>
					            </div>
					            <div class="ag-pinned-right-floating-top ag-hidden" ref="eRightTop" role="presentation" unselectable="on"></div>
					            <div class="ag-floating-top-full-width-container ag-hidden" ref="eTopFullWidthContainer" role="presentation" unselectable="on"></div>
					        </div>
					        <div class="ag-body-viewport ag-layout-normal ag-row-no-animation" ref="eBodyViewport" role="presentation" unselectable="on">
					            <div class="ag-pinned-left-cols-container" ref="eLeftContainer" role="presentation" unselectable="on" style="height: 1px; width: 35px; max-width: 35px; min-width: 35px;"></div>
					            <div class="ag-center-cols-clipper" ref="eCenterColsClipper" role="presentation" unselectable="on" style="height: 1px;">
					                <div class="ag-center-cols-viewport" ref="eCenterViewport" role="presentation" unselectable="on" style="height: calc(100% + 23px);">
					                    <div class="ag-center-cols-container" ref="eCenterContainer" role="rowgroup" unselectable="on" style="width: 2450px; height: 1px;"></div>
					                </div>
					            </div>
					            <div class="ag-pinned-right-cols-container ag-hidden" ref="eRightContainer" role="presentation" unselectable="on" style="height: 1px;"></div>
					            <div class="ag-full-width-container" ref="eFullWidthContainer" role="presentation" unselectable="on" style="height: 1px;"></div>
					        </div>
					        <div class="ag-floating-bottom" ref="eBottom" role="presentation" unselectable="on" style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
					            <div class="ag-pinned-left-floating-bottom" ref="eLeftBottom" role="presentation" unselectable="on" style="width: 35px; max-width: 35px; min-width: 35px;"></div>
					            <div class="ag-floating-bottom-viewport" ref="eBottomViewport" role="presentation" unselectable="on">
					                <div class="ag-floating-bottom-container" ref="eBottomContainer" role="presentation" unselectable="on" style="width: 2450px;"></div>
					            </div>
					            <div class="ag-pinned-right-floating-bottom ag-hidden" ref="eRightBottom" role="presentation" unselectable="on"></div>
					            <div class="ag-floating-bottom-full-width-container ag-hidden" ref="eBottomFullWidthContainer" role="presentation" unselectable="on"></div>
					        </div>
					        <div class="ag-body-horizontal-scroll" ref="eHorizontalScrollBody" aria-hidden="true" style="height: 23px; max-height: 23px; min-height: 23px;">
					            <div class="ag-horizontal-left-spacer" ref="eHorizontalLeftSpacer" style="width: 35px; max-width: 35px; min-width: 35px;"></div>
					            <div class="ag-body-horizontal-scroll-viewport" ref="eBodyHorizontalScrollViewport" style="height: 23px; max-height: 23px; min-height: 23px;">
					                <div class="ag-body-horizontal-scroll-container" ref="eBodyHorizontalScrollContainer" style="width: 2450px; height: 23px; max-height: 23px; min-height: 23px;"></div>
					            </div>
					            <div class="ag-horizontal-right-spacer ag-scroller-corner" ref="eHorizontalRightSpacer" style="width: 0px; max-width: 0px; min-width: 0px;"></div>
					        </div>
					        <!--AG-OVERLAY-WRAPPER--><div class="ag-overlay" aria-hidden="true" ref="overlayWrapper">
					            <div class="ag-overlay-panel">
					                <div class="ag-overlay-wrapper ag-layout-normal ag-overlay-no-rows-wrapper" ref="eOverlayWrapper"><div class="result-info"><i class="fn-shopping fn-65 fn-shopping-caution1 icon-color-big" aria-hidden="true"></i><p class="title">리뷰가 존재하지 않습니다.</p></div></div>
					            </div>
					        </div>
					    </div>
					            </div>
					            <!--AG-PAGINATION--><nav class="seller-pagination">   <span class="ag-paging-row-summary-panel _sell_pageRowSummaryPanel" style="display:none;">       <span ref="lbFirstRowOnPage" class="_sell_firstRowOnPage">0</span>[[TO]]       <span ref="lbLastRowOnPage" class="_sell_lastRowOnPage">0</span>[[OF]]       <span ref="lbRecordCount" class="_sell_recordCount">0</span>       <span ref="lbCurrent" class="_sell_current">0</span>       <span ref="lbTotal" class="_sell_total">0</span>   </span>   <div class="visible-xs">       <div class="_mobile_pagination"></div>   </div>   <div class="hidden-xs">      <ul class="pagination _pc_pagination"></ul>   </div></nav>
					        </div></div></div></div></div></div>
					</div>
					<!-- 리뷰 목록 끝 -->

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
	
	

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- Bootstrap Datepicker JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
    function setDateRange(days) {
        const now = new Date();

        if (days === 0) {
            $('#start-date').datepicker('setDate', now);
        } else {
            const start = new Date();
            start.setDate(now.getDate() - days + 1);
            $('#start-date').datepicker('setDate', start);
        }
        $('#end-date').datepicker('setDate', now);
    }

    // 버튼을 활성화하고 상태 설정
    document.addEventListener('DOMContentLoaded', () => {
        const buttons = document.querySelectorAll('#datepicker input[type="button"]');
        buttons.forEach((button, index) => {
            button.addEventListener('click', () => {
                buttons.forEach(btn => btn.classList.remove('active'));
                button.classList.add('active');
            });
        });

        // 첫 번째 버튼의 기본 활성화 상태 설정
        buttons[0].classList.add('active');

        // datePicker 초기화 및 현재 날짜로 설정
        $('#start-date, #end-date').datepicker();
        setDateRange(0);
    });
    </script>

</body>

</html>