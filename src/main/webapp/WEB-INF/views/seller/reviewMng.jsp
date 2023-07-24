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

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

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
											<div class="input-content">
													<div class="form-inline narrow-area">
														<ncp-datetime-range-picker2
															date-markup-option="{onlyDate:true, buttonFixWidth:true}"
															date-max="'TODAY'"
															date-range-option="vm.config.datetimeRangePickerOption"
															date-range-usable="true" datetime-picker-format-name="DATE"
															end-date-model="vm.searchFormData.viewData.toDate"
															start-date-model="vm.searchFormData.viewData.fromDate"><!---->
														<div class="form-group" ng-if="vm.dateRangeUsable">
															<div class="btn-toolbar">
																<div class="btn-group fix-width-col-4"
																	ng-class="::{'fix-width-col-4' : vm.dateMarkupOption.buttonFixWidth}"
																	ng-attr-data-nclicks-code="{{::vm.nclicksCodeRangeButton}}">
																	<!---->
																	<button type="button" class="btn btn-primary2"
																		ng-repeat="option in vm.dateRangeOption.periods"
																		ng-click="vm.onClickRangeButton($index)"
																		ng-disabled="vm.dateDisabled"
																		ng-class="{ active: option.active }">오늘</button>
																	<!---->
																	<button type="button" class="btn btn-primary2 active"
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
																	<button type="button" class="btn btn-primary2"
																		ng-repeat="option in vm.dateRangeOption.periods"
																		ng-click="vm.onClickRangeButton($index)"
																		ng-disabled="vm.dateDisabled"
																		ng-class="{ active: option.active }">1년</button>
																	<!---->
																</div>
															</div>
														</div>
														<!---->
														<div class="form-group only-date"
															ng-class="::{'only-date' : vm.dateMarkupOption.onlyDate, 'disabled-date-dimmed' : vm.dateMarkupOption.disabledDateDimmed }">
															<div class="seller-calendar">
																<div class="input-daterange date form-inline">
																	<div
																		class="form-group _startDate_dropdown seller-datetime-picker _error_start_date_2725499104 dropdown"
																		ng-class="{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																		<div
																			class="input-group dropdown-toggle dropdown_6420206066"
																			data-toggle="dropdown"
																			ng-click="vm.isStartDateShow = !vm.dateDisabled &amp;&amp; true"
																			ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																			<input type="text"
																				class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-date-time-input"
																				name="" title="날짜 입력"
																				ng-readonly="::vm.dateInputReadonly"
																				ng-required="vm.dateRequired &amp;&amp; !vm.ignoreStartDateRequired"
																				ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType"
																				ncp-disabled="!vm.dateDisabledByPeriodType"
																				ng-model="vm.startDateModel"
																				model-type="YYYY-MM-DDTHH:mm:ss.SSSZ"
																				date-time-input="YYYY.MM.DD."
																				data-date-formats="::vm.inputModelFormats"
																				ncp-message-container="._error_start_date_2725499104"
																				ng-required-err-type="required.daterangepicker.startDate"
																				ncp-validate-change-trigger="" readonly="readOnly">
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
																		class="form-group _endDate_dropdown seller-datetime-picker _error_end_date_1530121641 dropdown"
																		ng-class="::{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																		<div
																			class="input-group dropdown-toggle dropdown_1584685767"
																			data-toggle="dropdown"
																			ng-click="vm.isEndDateShow = !vm.dateDisabled &amp;&amp; true"
																			ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																			<input type="text"
																				class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-date-time-input"
																				name="" title="날짜 입력"
																				ng-readonly="::vm.dateInputReadonly"
																				ng-required="vm.dateRequired &amp;&amp; !vm.ignoreEndDateRequired"
																				ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType"
																				ncp-disabled="!vm.dateDisabledByPeriodType"
																				ng-model="vm.endDateModel"
																				model-type="YYYY-MM-DDTHH:mm:ss.SSSZ"
																				date-time-input="YYYY.MM.DD."
																				data-date-formats="::vm.inputModelFormats"
																				ncp-message-container="._error_end_date_1530121641"
																				ng-required-err-type="required.daterangepicker.endDate"
																				ncp-validate-change-trigger="" readonly="readOnly">
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
											<li><label class="control-label">리뷰타입</label>
											<div class="input-content">
													<div class="form-inline">
														<div class="form-group">
															<div class="seller-input">
																<label><input data-checklist-value="''"
																	name="reviewContentClassTypes"
																	ng-checked="vm.func.isAllCheckedBySearchCondition(vm.searchFormData.viewData, 'reviewContentClassTypes')"
																	ng-click="vm.func.checkAllBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewContentClassTypes', checked)"
																	type="checkbox" ng-model="checked"
																	class="ng-pristine ng-untouched ng-valid ng-not-empty"
																	data-checklist-model="vm.searchFormData.viewData.reviewContentClassTypes"
																	checked="checked">전체<span></span></label>
																<!---->
																<!---->
																<label ng-if="type.name != ''"
																	ng-repeat="type in vm.config.reviewContentClassTypes"><input
																	data-checklist-value="type" name="reviewContentClassTypes"
																	ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewContentClassTypes')"
																	type="checkbox" ng-model="checked"
																	class="ng-pristine ng-untouched ng-valid ng-not-empty"
																	data-checklist-model="vm.searchFormData.viewData.reviewContentClassTypes"
																	disabled="disabled">포토리뷰<span></span></label>
																<!---->
																<!---->
																<!---->
																<label ng-if="type.name != ''"
																	ng-repeat="type in vm.config.reviewContentClassTypes"><input
																	data-checklist-value="type" name="reviewContentClassTypes"
																	ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewContentClassTypes')"
																	type="checkbox" ng-model="checked"
																	class="ng-pristine ng-untouched ng-valid ng-not-empty"
																	data-checklist-model="vm.searchFormData.viewData.reviewContentClassTypes"
																	disabled="disabled">동영상리뷰<span></span></label>
																<!---->
																<!---->
																<!---->
																<label ng-if="type.name != ''"
																	ng-repeat="type in vm.config.reviewContentClassTypes"><input
																	data-checklist-value="type" name="reviewContentClassTypes"
																	ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'reviewContentClassTypes')"
																	type="checkbox" ng-model="checked"
																	class="ng-pristine ng-untouched ng-valid ng-not-empty"
																	data-checklist-model="vm.searchFormData.viewData.reviewContentClassTypes"
																	disabled="disabled">텍스트리뷰<span></span></label>
																<!---->
																<!---->
															</div>
														</div>
													</div>
												</div></li>
											<li><label class="control-label">카테고리</label>
											<div class="input-content">
													<category-search
														exposure-option="vm.config.categorySearchConfig"
														selectable-level="1"
														selected-category="vm.searchFormData.selectedCategory"
														show-level="3">
													<div class="form-inline ng-hide"
														ng-show="vm.categoryShow &amp;&amp; vm.hasKeywordSearch() &amp;&amp; vm.exposureOption.depthSearch.show">
														<div class="form-group">
															<div class="seller-input-toggle">
																<input type="radio" name="category" class="radio" id="r_1_1"
																	ng-checked="vm.showSearchTap1"
																	ng-click="vm.showSearchTap1 = true; vm.showSearchTap2 = false"
																	ng-disabled="vm.readOnlyLevel > 0"> <label
																	for="r_1_1">카테고리명 검색</label> <input type="radio"
																	name="category" class="radio" id="r1_2_2"
																	ng-checked="vm.showSearchTap2"
																	ng-click="vm.showSearchTap1 = false; vm.showSearchTap2 = true"
																	checked="checked"> <label for="r1_2_2">카테고리명
																	선택</label>
																<div ng-show="vm.categoryBulkSelect" class="ng-hide">
																	<input type="radio" name="category" class="radio"
																		id="r2_3_3" ng-checked="vm.showSearchTap3"
																		ng-click="vm.showSearchTap1 = false; vm.showSearchTap2 = false">
																	<label for="r2_3_3">+ 카테고리 일괄선택</label>
																</div>
															</div>
														</div>
														<!---->
														<div class="form-group"
															ng-if="vm.app === 'CENTER' &amp;&amp; vm.showTemplate === true">
															<button type="button" class="btn btn-single btn-block"
																ng-click="vm.templateModal()">카테고리 템플릿</button>
														</div>
														<!---->
														<!---->
													</div>
													<div
														ng-show="vm.categoryShow &amp;&amp; vm.showSearchTap1 &amp;&amp; vm.hasKeywordSearch()"
														class="form-group ng-hide">
														<div class="selectize-control search">
															<div
																class="selectize-control ng-pristine ng-untouched ng-valid single plugin-dropdown_toolbar plugin-no_results plugin-responsive_options plugin-nclicks_code">
																<div
																	class="selectize-input items not-full ng-valid ng-pristine">
																	<input type="text" autocomplete="off" tabindex="0"
																		placeholder="카테고리명 입력" style="width: 86.3229px;">
																</div>
																<div class="selectize-dropdown selectize-no-results"
																	style="display: none;">
																	<div class="selectize-dropdown-content">
																		<div data-selectable="" class="option active">
																			<span class="highlight no-results-keyword"></span> 카테고리가
																			없습니다.
																		</div>
																		<ul class="seller-ul-list seller-ul-list-sm pd">
																			<li>단어의 철자가 정확한지 확인해 보세요.</li>
																			<li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li>
																			<li>카테고리명 선택으로 변경해서 정확한 카테고리를 찾아보세요.</li>
																		</ul>
																	</div>
																</div>
																<div
																	class="selectize-dropdown single ng-pristine ng-untouched ng-valid plugin-dropdown_toolbar plugin-no_results plugin-responsive_options plugin-nclicks_code"
																	style="display: none; width: 698.667px; top: 34px; left: 0px;">
																	<div class="dropdown_toolbar" style="position: relative">
																		<div>
																			<ul class="seller-tap ng-hide" role="tablist"
																				ng-show="vm.viewToolbar">
																				<li role="tab" ng-show="vm.viewRecentCategory"
																					ng-attr-aria-selected="{{vm.activeCategoryTab === &quot;RECENT&quot;}}"
																					aria-selected="false" class="ng-hide"><a href=""
																					ng-click="vm.changeCategoryTab(&quot;RECENT&quot;)"><span>최근
																							등록 카테고리</span></a></li>
																			</ul>
																		</div>
																	</div>
																	<div class="selectize-dropdown-content"></div>
																</div>
																<div class="selectize-dropdown" style="display: none;">
																	<h4 class="h6 bold pd-top pd-left">
																		'' 관련 이런 카테고리는 어때요?
																		<hr>
																	</h4>
																	<div class="selectize-dropdown-content">
																		<div data-selectable="" class="option active"></div>
																	</div>
																</div>
															</div>
															<input selectize="" placeholder="카테고리명 입력" name="category"
																config="vm.keywordSearchConfig" options="vm.categories"
																ng-model="vm.category" ng-disabled="vm.categoryDisabled"
																ncp-disabled=""
																class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
																tabindex="-1" value=""
																style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
														</div>
													</div>
													<!---->
													<div
														ng-show="vm.categoryBulkSelect &amp;&amp; !vm.showSearchTap1 &amp;&amp; !vm.showSearchTap2"
														class="form-group ng-hide">
														<div class="input-content">
															<textarea
																class="form-control ng-pristine ng-untouched ng-valid ng-empty"
																ng-model="vm.bulkCategoryIds"
																style="width: 100%; height: 120px;"
																ng-change="vm.setBulkCategoryIds()"
																placeholder="카테고리번호를 콤마(,) 또는 enter로 구분하여 입력
					예 50003210,50003215,50003216,50003217">        </textarea>
														</div>
													</div>
													<!---->
													<div ng-class="vm.mobileSelectizeWrapClassName()"
														ng-if="vm.showMobileDepthSearch()" class="form-inline">
														<div class="form-group">
															<div
																class="selectize-control ng-pristine ng-untouched ng-valid single">
																<div
																	class="selectize-input items full has-options has-items ng-valid ng-pristine">
																	<div data-value="" class="item">대분류</div>
																	<input type="text" autocomplete="off" tabindex="0"
																		readonly=""
																		style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
																</div>
																<div
																	class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
																	style="display: none; visibility: visible; width: 206px; top: 34px; left: 0px;">
																	<div class="selectize-dropdown-content">
																		<div data-value="" data-selectable=""
																			class="option selected">대분류</div>
																		<div data-value="50000004" data-selectable=""
																			class="option">가구/인테리어</div>
																		<div data-value="50005542" data-selectable=""
																			class="option">도서</div>
																		<div data-value="50000003" data-selectable=""
																			class="option">디지털/가전</div>
																		<div data-value="50000008" data-selectable=""
																			class="option">생활/건강</div>
																		<div data-value="50000007" data-selectable=""
																			class="option">스포츠/레저</div>
																		<div data-value="50000006" data-selectable=""
																			class="option">식품</div>
																		<div data-value="50000009" data-selectable=""
																			class="option">여가/생활편의</div>
																		<div data-value="50000005" data-selectable=""
																			class="option">출산/육아</div>
																		<div data-value="50000000" data-selectable=""
																			class="option">패션의류</div>
																		<div data-value="50000001" data-selectable=""
																			class="option">패션잡화</div>
																		<div data-value="50000002" data-selectable=""
																			class="option">화장품/미용</div>
																	</div>
																</div>
															</div>
															<select selectize="" config="vm.depthSearchConfig"
																options="vm.categories1" ng-model="vm.selectizeCategory1"
																data-level="1"
																ng-disabled="vm.readOnlyLevel >= 1 || vm.categoryDisabled"
																ncp-disabled=""
																class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
																tabindex="-1"
																style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
																	value="">대분류</option></select>
														</div>
														<div class="form-group"
															ng-show="vm.showLevel >= 2 &amp;&amp; (!vm.isMobile || vm.categories2.length > 0)">
															<div
																class="selectize-control ng-pristine ng-untouched ng-valid single">
																<div
																	class="selectize-input items full has-options has-items ng-valid ng-pristine disabled">
																	<div data-value="" class="item">중분류</div>
																	<input type="text" autocomplete="off" tabindex="-1"
																		readonly="" disabled=""
																		style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
																</div>
																<div
																	class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
																	style="display: none;">
																	<div class="selectize-dropdown-content">
																		<div data-value="" data-selectable=""
																			class="option selected">중분류</div>
																	</div>
																</div>
															</div>
															<select selectize="" config="vm.depthSearchConfig"
																options="vm.categories2" ng-model="vm.selectizeCategory2"
																data-level="2"
																ng-disabled="vm.categories2.length < 1 || vm.readOnlyLevel >= 2 || vm.categoryDisabled"
																ncp-disabled=""
																class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
																tabindex="-1"
																style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
																disabled=""><option value="">중분류</option></select>
														</div>
														<div class="form-group"
															ng-show="vm.showLevel >= 3 &amp;&amp; (!vm.isMobile || vm.categories3.length > 0)">
															<div
																class="selectize-control ng-pristine ng-untouched ng-valid single">
																<div
																	class="selectize-input items full has-options has-items ng-valid ng-pristine disabled">
																	<div data-value="" class="item">소분류</div>
																	<input type="text" autocomplete="off" tabindex="-1"
																		readonly="" disabled=""
																		style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
																</div>
																<div
																	class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
																	style="display: none;">
																	<div class="selectize-dropdown-content">
																		<div data-value="" data-selectable=""
																			class="option selected">소분류</div>
																	</div>
																</div>
															</div>
															<select selectize="" config="vm.depthSearchConfig"
																options="vm.categories3" ng-model="vm.selectizeCategory3"
																data-level="3"
																ng-disabled="vm.categories3.length < 1 || vm.readOnlyLevel >= 3 || vm.categoryDisabled"
																ncp-disabled=""
																class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
																tabindex="-1"
																style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
																disabled=""><option value="">소분류</option></select>
														</div>
														<div class="form-group ng-hide"
															ng-show="vm.showLevel >= 4 &amp;&amp; (!vm.isMobile || vm.categories4.length > 0)">
															<div
																class="selectize-control ng-pristine ng-untouched ng-valid single">
																<div
																	class="selectize-input items full has-options has-items ng-valid ng-pristine disabled">
																	<div data-value="" class="item">세분류</div>
																	<input type="text" autocomplete="off" tabindex="-1"
																		readonly="" disabled=""
																		style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
																</div>
																<div
																	class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
																	style="display: none;">
																	<div class="selectize-dropdown-content">
																		<div data-value="" data-selectable=""
																			class="option selected">세분류</div>
																	</div>
																</div>
															</div>
															<select selectize="" config="vm.depthSearchConfig"
																options="vm.categories4" ng-model="vm.selectizeCategory4"
																data-level="4"
																ng-disabled="vm.categories4.length < 1 || vm.readOnlyLevel >= 4 || vm.categoryDisabled"
																ncp-disabled=""
																class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
																tabindex="-1" disabled=""
																style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
																	value="">세분류</option></select>
														</div>
													</div>
													<!---->
													<div class="form-group">
														<input type="hidden" ng-model="vm.selectedCategory"
															ng-disabled="vm.categoryDisabled" ncp-disabled=""
															autocomplete="off"
															class="ng-pristine ng-untouched ng-valid ng-empty"> <input
															type="hidden" ng-model="vm.selectedCategory.id"
															ng-required="vm.categoryRequired"
															ncp-validate-change-trigger="" autocomplete="off"
															class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"
															required="required">
													</div>
													</category-search>
												</div></li>
											<li><label class="control-label">리뷰조건</label>
											<div class="input-content">
													<div class="form-inline">
														<div class="pc-inline-block">
															<div class="form-group mg-right-lg">구매자평점</div>
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
													<hr class="mg-top-lg mg-bottom-lg">
													<div class="form-inline">
														<div class="pc-inline-block">
															<div class="form-group mg-right-lg">전시상태</div>
															<div class="form-group">
																<div class="seller-input">
																	<label><input data-checklist-value="''"
																		name="contentsStatusTypes"
																		ng-checked="vm.func.isAllCheckedBySearchCondition(vm.searchFormData.viewData, 'contentsStatusTypes')"
																		ng-click="vm.func.checkAllBySearchCondition(vm.searchFormData.viewData, vm.config, 'contentsStatusTypes', checked)"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.contentsStatusTypes"
																		checked="checked">전체<span></span></label>
																	<!---->
																	<!---->
																	<label ng-if="type.name !=''"
																		ng-repeat="type in vm.config.contentsStatusTypes"><input
																		data-checklist-value="type" name="contentsStatusTypes"
																		ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'contentsStatusTypes')"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.contentsStatusTypes"
																		disabled="disabled">정상<span></span></label>
																	<!---->
																	<!---->
																	<!---->
																	<label ng-if="type.name !=''"
																		ng-repeat="type in vm.config.contentsStatusTypes"><input
																		data-checklist-value="type" name="contentsStatusTypes"
																		ng-disabled="vm.func.checkDisabledBySearchCondition(vm.searchFormData.viewData, vm.config, 'contentsStatusTypes')"
																		type="checkbox" ng-model="checked"
																		class="ng-pristine ng-untouched ng-valid ng-not-empty"
																		data-checklist-model="vm.searchFormData.viewData.contentsStatusTypes"
																		disabled="disabled">블라인드<span></span></label>
																	<!---->
																	<!---->
																</div>
															</div>
															<!---->
														</div>
														<!---->
													</div>
													<!---->
													<!---->
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
																	ncp-max-size-by-split-params="{&quot;maxSize&quot;: 1000, &quot;splitPatternCode&quot;: &quot;CommaEnter&quot;}"
																	ncp-shortcut-submit="vm.func.search()"
																	ng-model="vm.searchFormData.viewData.searchKeyword"
																	ng-pattern="^[0-9,
					]+"
																	ng-pattern-err-type="numberCommaEnter"
																	placeholder="복수 검색시 enter 또는 “,” 로 구분하세요." rows="3"
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
								<div class="panel-footer">
									<div class="seller-btn-area btn-group-lg">
										<button
											class="btn btn-primary progress-button progress-button-dir-horizontal progress-button-style-top-line"
											pb-style="top-line" progress-button="vm.func.search()"
											type="button">
											<span class="content" ng-transclude="">검색</span><span
												class="progress"><span class="progress-inner notransition"
												ng-style="progressStyles"
												ng-class="{ notransition: !allowProgressTransition }"></span></span>
										</button>
										<button class="btn btn-default" ng-click="vm.func.reset()"
											type="button">초기화</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색바(작성일, 타입, 카테고리, 조건, 상세검색) 끝 -->
					
					<!-- 리뷰 목록 시작 -->
					<div ui-view="list"><div class="panel panel-seller"><div class="panel-heading"><div class="pc-pull-left"><h3 class="panel-title">리뷰목록 (총 <span class="text-primary">0</span>개)</h3></div><div class="pc-pull-right"><div class="narrow-area"><div class="form-group form-group-sm"><div class="selectize-control ng-pristine ng-untouched ng-valid single" style="width: 150px;"><div class="selectize-input items not-full ng-valid ng-pristine has-options"><input type="text" autocomplete="off" tabindex="0" placeholder="리뷰등록일순" readonly="" style="width: 71.6875px;"></div><div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none; width: 150px; top: 30px; left: 0px;"><div class="selectize-dropdown-content"><div data-value="REVIEW_CREATE_DATE_DESC" data-selectable="" class="option active">리뷰등록일순</div><div data-value="PRODUCT_NAME" data-selectable="" class="option">상품명순</div><div data-value="HELP_CNT" data-selectable="" class="option">도움순</div><div data-value="REVIEW_SCORE_DESC" data-selectable="" class="option">평점높은순</div><div data-value="REVIEW_RANKING" data-selectable="" class="option">리뷰랭킹순</div><div data-value="PHOTO_COUNT" data-selectable="" class="option">첨부 사진 개수 순</div><div data-value="VIDEO_COUNT" data-selectable="" class="option">첨부 동영상 개수 순</div></div></div></div><input config="vm.config.reviewSearchSortTypesSelectize" ng-model="vm.searchFormData.reviewSearchSortType" options="::vm.config.reviewSearchSortTypes" placeholder="리뷰등록일순" selectize="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty" tabindex="-1" value=""> <div class="selectize-control ng-pristine ng-untouched ng-valid single"><div class="selectize-input items ng-valid ng-pristine has-options full has-items"><div data-value="500" class="item">500개씩</div><input type="text" autocomplete="off" tabindex="0" readonly="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div><div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none; width: 85.7188px; top: 30px; left: 0px;"><div class="selectize-dropdown-content"><div data-value="50" data-selectable="" class="option">50개씩</div><div data-value="100" data-selectable="" class="option">100개씩</div><div data-value="300" data-selectable="" class="option">300개씩</div><div data-value="500" data-selectable="" class="option selected">500개씩</div></div></div></div><input config="vm.config.pageSizeSelectize" ng-model="vm.searchFormData.viewData.pageSize" options="::vm.config.pageSize" placeholder="500개씩" selectize="" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty" tabindex="-1" value="500" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"> <!----><button class="btn btn-default hidden-xs progress-button progress-button-dir-horizontal progress-button-style-top-line" ng-if="::!vm.isMobile" pb-style="top-line" progress-button="vm.func.downloadExcel()" type="button"><span class="content" ng-transclude=""><i aria-hidden="true" class="seller-icon icon-excel"></i> 엑셀다운</span><span class="progress"><span class="progress-inner notransition" ng-style="progressStyles" ng-class="{ notransition: !allowProgressTransition }"></span></span></button><!----></div></div></div></div><div class="panel-body"><!----><p class="sub-text text-primary mg-top-reset mg-bottom" ng-if="vm.app === 'CENTER'">욕설, 허위, 비방, 음란물 등 상품과 관련 없는 내용의 부적절한 리뷰는 '리뷰 신고' 기능을 이용해주세요 서비스 규정에 맞춰 관리자 검수하여 삭제 조치될 수 있습니다.</p><!----><!----><div class="seller-btn-group" ng-if="vm.app === 'CENTER'"><div class="seller-btn-left"><div class="form-inline narrow-area"><div class="form-group"><button class="btn btn-primary btn-sm" ng-click="vm.func.openBestReviewBenefitModal()" type="button">베스트리뷰선정 · 혜택지급</button> <button class="btn btn-default btn-sm" ng-click="vm.func.openBulkUpdateCommentModal()" type="button">답글작성</button></div></div></div></div><!----><!----><div class="seller-grid-area"><div ag-grid="vm.grid.options" class="ag-theme-fresh" style="width:100%; height: 500px;"><div class="ag-root-wrapper ag-layout-normal ag-ltr">
					            <div class="ag-root-wrapper-body ag-layout-normal" ref="rootWrapperBody">
					                <!--AG-GRID-COMP--><div class="ag-root ag-unselectable ag-layout-normal" role="grid" unselectable="on" ref="gridPanel" aria-rowcount="1">
					        <!--AG-HEADER-ROOT--><div class="ag-header ag-pivot-off" role="presentation" ref="headerRoot" unselectable="on" style="height: 40px; min-height: 40px;">
					            <div class="ag-pinned-left-header" ref="ePinnedLeftHeader" role="presentation" style="width: 35px; max-width: 35px; min-width: 35px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 35px;"><div class="ag-header-cell" role="presentation" unselectable="on" col-id="checkbox" style="width: 35px; left: 0px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div><div class="seller-input ag-header-cell-label"><label><input type="checkbox" class="ag-selection-checkbox"><span class="ag-header-cell-text"></span></label></div></div></div></div></div>
					            <div class="ag-header-viewport" ref="eHeaderViewport" role="presentation">
					                <div class="ag-header-container" ref="eHeaderContainer" role="rowgroup" style="width: 2450px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 2450px;"><div class="ag-header-cell" role="presentation" unselectable="on" col-id="productNo" style="width: 100px; left: 0px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">채널상품번호</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="productName" style="width: 150px; left: 100px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">상품명</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewType" style="width: 100px; left: 250px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰구분</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewScore" style="width: 100px; left: 350px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">구매자평점</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewAttach" style="width: 100px; left: 450px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">포토/영상</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="reviewContent" style="width: 150px; left: 550px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰내용</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="helpCount" style="width: 100px; left: 700px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰도움수</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="writerId" style="width: 100px; left: 800px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">등록자</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="createDate" style="width: 150px; left: 900px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">리뷰등록일</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="modifyDate" style="width: 150px; left: 1050px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on">최종수정일</span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div></div></div>
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

</body>

</html>