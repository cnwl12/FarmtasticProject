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

    <title>seller/itemRegister</title>

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
                    <h1 class="h3 mb-2 text-gray-800">상품등록</h1>
                    <!-- 페이지 상단 끝 -->
                    
                    <!-- 카테고리 선택 시작-->
					<ui-view name="category"><div class="form-section" ng-show="!(vm.product.category.deleted &amp;&amp; vm.formType === 'EDIT')"><div class="title-line" server-field-errors="product.category.*" server-global-errors="windowCategory.windowChannelLimit" role="button" ncp-click-except-target=".fn-help1" ncp-click="vm.isMenuOpen = !vm.isMenuOpen"><label class="col-lg-2 col-sm-3 col-xs-5 control-label">카테고리<i class="icon-must" aria-label="필수항목"></i> <!----><a role="button" ng-click="vm.showHelpLayerForCategory()" ng-if="::!vm.isMobile" href=""><i class="fn fn-help1 text-primary" aria-hidden="true"></i><span class="sr-only">도움말</span></a><!----></label><div class="col-lg-10 col-sm-9 col-xs-7 input-content"><div class="set-option no-set" ng-class="{'no-set': !(vm.selectedCategory &amp;&amp; vm.selectedCategory.id)}"><a href="" class="btn btn-default btn-hide active" ng-class="{active: vm.isMenuOpen}"><span class="sr-only">메뉴토글</span></a></div></div></div><!----><div class="inner-content input-content" ng-if="vm.isMenuOpen || vm.productFormViewVO.readOnly"><div class="form-section-sub"><div class="form-sub-wrap"><div class="input-content"><!----><category-search selected-category="vm.product.category" recent-category="vm.productFormViewVO.recentCategory" frequency-category="vm.productFormViewVO.frequencyCategory" selectable-level="1" read-only-level="vm.readOnlyLevel" exposure-option="vm.exposureOption" show-template-save="vm.app !== 'ADMIN'" is-template-added="vm.savedTemplate['CATEGORY']" check-before-change="vm.checkBeforeChange(categoryId)" filter-option="vm.filterOption" is-rental-form="vm.isRentalForm" callback-empty-child="vm.alertRentalExceptionalCategoryRestrict" ng-if="!vm.hasModel"><div class="form-inline" ng-show="vm.categoryShow &amp;&amp; vm.hasKeywordSearch() &amp;&amp; vm.exposureOption.depthSearch.show"><div class="form-group"><div class="seller-input-toggle"><input type="radio" name="category" class="radio" id="r_1_1" ng-checked="vm.showSearchTap1" ng-click="vm.showSearchTap1 = true; vm.showSearchTap2 = false" ng-disabled="vm.readOnlyLevel > 0" checked="checked"> <label for="r_1_1">카테고리명 검색</label> <input type="radio" name="category" class="radio" id="r1_2_2" ng-checked="vm.showSearchTap2" ng-click="vm.showSearchTap1 = false; vm.showSearchTap2 = true"> <label for="r1_2_2">카테고리명 선택</label><div ng-show="vm.categoryBulkSelect" class="ng-hide"><input type="radio" name="category" class="radio" id="r2_3_3" ng-checked="vm.showSearchTap3" ng-click="vm.showSearchTap1 = false; vm.showSearchTap2 = false"> <label for="r2_3_3">+ 카테고리 일괄선택</label></div></div></div><!----><div class="form-group" ng-if="vm.app === 'CENTER' &amp;&amp; vm.showTemplate === true"><button type="button" class="btn btn-single btn-block" ng-click="vm.templateModal()">카테고리 템플릿</button></div><!----><!----><div class="form-group" ng-if="vm.showTemplateSave !== false"><div class="seller-input"><label><input type="checkbox" ng-model="vm.isTemplateAdded" class="ng-pristine ng-untouched ng-valid ng-empty">템플릿 추가<span></span></label></div></div><!----></div><div ng-show="vm.categoryShow &amp;&amp; vm.showSearchTap1 &amp;&amp; vm.hasKeywordSearch()" class="form-group"><div class="selectize-control search"><div class="selectize-control ng-pristine ng-untouched ng-valid single plugin-dropdown_toolbar plugin-no_results plugin-responsive_options plugin-nclicks_code"><div class="selectize-input items not-full ng-valid ng-pristine"><input type="text" autocomplete="off" tabindex="0" placeholder="카테고리명 입력" style="width: 91.3438px;"></div><div class="selectize-dropdown selectize-no-results" style="display: none;"><div class="selectize-dropdown-content"><div data-selectable="" class="option active"><span class="highlight no-results-keyword"></span> 카테고리가 없습니다.</div><ul class="seller-ul-list seller-ul-list-sm pd"><li>단어의 철자가 정확한지 확인해 보세요.</li><li>한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.</li><li>카테고리명 선택으로 변경해서 정확한 카테고리를 찾아보세요.</li></ul></div></div><div class="selectize-dropdown single ng-pristine ng-untouched ng-valid plugin-dropdown_toolbar plugin-no_results plugin-responsive_options plugin-nclicks_code" style="display: none; width: 1571px; top: 34px; left: 0px;"><div class="dropdown_toolbar" style="position:relative"><div><ul class="seller-tap ng-hide" role="tablist" ng-show="vm.viewToolbar"><li role="tab" ng-show="vm.viewRecentCategory" ng-attr-aria-selected="{{vm.activeCategoryTab === &quot;RECENT&quot;}}" aria-selected="false" class="ng-hide"><a href="" ng-click="vm.changeCategoryTab(&quot;RECENT&quot;)"><span>최근 등록 카테고리</span></a></li></ul></div></div><div class="selectize-dropdown-content"></div></div><div class="selectize-dropdown" style="display: none;"><h4 class="h6 bold pd-top pd-left">'' 관련 이런 카테고리는 어때요?<hr></h4><div class="selectize-dropdown-content"><div data-selectable="" class="option active"></div></div></div></div><input selectize="" placeholder="카테고리명 입력" name="category" config="vm.keywordSearchConfig" options="vm.categories" ng-model="vm.category" ng-disabled="vm.categoryDisabled" ncp-disabled="" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty" tabindex="-1" value="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div></div><!----><div ng-show="vm.categoryBulkSelect &amp;&amp; !vm.showSearchTap1 &amp;&amp; !vm.showSearchTap2" class="form-group ng-hide"><div class="input-content"><textarea class="form-control ng-pristine ng-untouched ng-valid ng-empty" ng-model="vm.bulkCategoryIds" style="width: 100%; height: 120px;" ng-change="vm.setBulkCategoryIds()" placeholder="카테고리번호를 콤마(,) 또는 enter로 구분하여 입력
					예 50003210,50003215,50003216,50003217">        </textarea></div></div><!----><div class="form-group"><input type="hidden" ng-model="vm.selectedCategory" ng-disabled="vm.categoryDisabled" ncp-disabled="" autocomplete="off" class="ng-pristine ng-untouched ng-valid ng-not-empty"> <input type="hidden" ng-model="vm.selectedCategory.id" ng-required="vm.categoryRequired" ncp-validate-change-trigger="" autocomplete="off" class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" required="required"></div></category-search><!----><!----><div class="form-group"><input type="hidden" id="rentalNotAllowedCategory" class="form-control ng-pristine ng-untouched ng-empty ng-valid ng-valid-required" ng-model="vm.empty" ng-required="vm.isSelectNotAllowedRentalCategory" ng-required-err-type="required.not.allowed.rental.category" ncp-message-container="#error-rentalNotAllowedCategory" autocomplete="off"><div id="error-rentalNotAllowedCategory"></div></div><!----><!----><!----><!----><!----><p class="sub-text text-primary" ng-if="!vm.hasModel">상품과 맞지 않는 카테고리에 등록할 경우 강제 이동되거나 판매중지, 판매금지 될 수 있습니다.</p><!----><!----><!----><!----></div></div><!----></div></div><!----></div></ui-view>
					<!-- 카테고리 선택 끝 -->
					
					<!-- 상품명 등록 시작 -->
					<ui-view name="name"><div class="form-section"><div class="title-line" role="button" ncp-click-except-target=".fn-help1" ncp-click="vm.toggleMenu()"><label class="col-lg-2 col-sm-3 col-xs-6 control-label">상품명<i class="icon-must" aria-label="필수항목"></i> <!----><a role="button" ng-if="::!vm.isMobile" ng-click="vm.showHelpLayerForName()" href=""><i class="fn fn-help1 text-primary" aria-hidden="true"></i><span class="sr-only">도움말</span></a><!----></label><div class="col-lg-10 col-sm-9 col-xs-6 input-content"><div class="set-option no-set" ng-class="{'no-set': !vm.product.name}"> <a class="btn btn-default btn-hide active" ng-class="{active: vm.isMenuOpen}" href=""><span class="sr-only">메뉴토글</span></a></div></div></div><!----><div class="inner-content input-content" ng-if="vm.isMenuOpen"><div class="form-section-sub"><div class="form-sub-wrap"><div class="input-content"><div class="form-group"><div class="input-group"><div class="seller-input-wrap"><input name="product.name" type="text" class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength" ng-model="vm.product.name" required="" ng-pattern-err-type="invalidSpecialCharacter" ng-maxlength="100" maxlength="100" title="상품명 입력" ncp-input-clear=""><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div><span class="input-group-addon"><span class="text-primary">0</span>/100</span></div></div><!----><p class="sub-text text-primary">판매 상품과 직접 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 관리자에 의해 판매 금지될 수 있습니다.</p><p class="sub-text text-primary">유명 상품 유사문구를 무단으로 도용하여 ~스타일, ~st 등과 같이 기재하는 경우 별도 고지 없이 제재될 수 있습니다.</p><p class="sub-text text-primary">전용 상품명을 사용 중인 경우 대표 상품명 수정 시에도 전용 상품명으로 노출됩니다.</p><p class="sub-text"><span class="text-primary">상품명을 검색최적화 가이드에 잘 맞게 입력하면 검색 노출에 도움이 될 수 있습니다.</span> <a href="" role="button" class="btn btn-xs btn-primary btn-vertical" ng-click="vm.productSearchQualityCheck()" data-nclicks-code="sch.namecheck">상품명 검색품질 체크</a></p></div></div><!----></div><!----></div><!----></div></ui-view>
					<!-- 상품명 등록 끝 --> 
					
					<!-- 판매가 설정 시작 -->
					<ui-view name="priceBenefit" id="anchor-price-benefit"><!---->
					<div class="form-section" id="price-benefit">
						<!---->  
						<div class="title-line" ng-if="::(vm.formType !== 'BULK')"
							role="button" ng-click="vm.isMenuOpen = !vm.isMenuOpen">
							<label class="col-lg-1 col-sm-2 col-xs-4 control-label">판매가 <i
								class="icon-must" aria-label="필수항목"></i></label>
							<div class="col-lg-11 col-sm-10 col-xs-8 input-content">
								<div class="set-option no-set"
									ng-class="{'no-set': (vm.viewData.previewText === '설정안함')}">
									<a class="btn btn-default active" ng-class="{active: vm.isMenuOpen}"
										href=""><span class="sr-only">메뉴토글</span></a>
								</div>
							</div>
						</div>
						<!---->
						<div ng-class="{'inner-content input-content': vm.formType !== 'BULK'}"
							ng-show="vm.formType === 'BULK' || vm.isMenuOpen"
							class="inner-content input-content">
							<div class="form-section-sub">
								<!---->
								<div class="form-sub-wrap" ng-if="::(vm.formType !== 'BULK')">
									<label class="control-label" for="prd_price2">판매가<i
										class="icon-must" aria-label="필수항목"></i></label>
									<div class="input-content">
										<div class="form-inline" id="error_salePrice">
											<div class="form-group">
												<div class="input-group">
													<div class="seller-input-wrap">
														<input
															class="form-control ng-pristine ng-untouched ng-empty ng-valid-min ng-valid-max ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
															id="prd_price2" max="999999990" max-err-type="max.won"
															maxlength="11" maxlength-err-type="max.won" min="10"
															min-err-type="min.won" minlength="2"
															minlength-err-type="min.won" name="product.salePrice"
															ncp-input-clear=""
															ncp-max-params="{&quot;param&quot;:&quot;999,999,990&quot;}"
															ncp-maxlength-params="{&quot;param&quot;:&quot;999,999,990&quot;}"
															ncp-message-container="#error_salePrice"
															ncp-min-params="{&quot;param&quot;:&quot;10&quot;}"
															ncp-minlength-params="{&quot;param&quot;:&quot;10&quot;}"
															ncp-number-format=""
															ncp-pattern-params="{&quot;param&quot;:&quot;10원&quot;}"
															ng-model="vm.product.salePrice" ng-pattern="/0$/"
															ng-pattern-err-type="pattern.unit"
															ng-disabled="!!vm.isRentalForm" placeholder="숫자만 입력"
															required="" type="tel"><a role="button"
															class="btn-clear" tabindex="-1" style="display: none;"><span
															aria-label="삭제">×</span></a>
													</div>
													<span class="input-group-addon">원</span>
												</div>
											</div>
											<div class="form-group">
												<span ncp-price-korean-text=""
													ncp-price-value="vm.product.salePrice"
													class="text-sub hidden-xs ng-hide"
													ng-show="vm.product.salePrice"> 원</span>
											</div>
										</div>
										<!---->
										<!---->
										<p ng-if="!vm.isRentalForm" class="sub-text text-primary">
											네이버 쇼핑을 통한 주문일 경우 네이버쇼핑 매출연동수수료 2%가 네이버페이 결제수수료와 별도로 과금됩니다. <a
												role="button" href="" class="btn-link"
												ng-click="vm.showHelpLayerForCommission()">수수료안내<i
												class="fn-shopping fn-shopping-forward2" aria-hidden="true"></i></a>
										</p>
										<!---->
										<!---->
										<p ng-if="!vm.isRentalForm" class="sub-text text-primary">
											판매가, 할인가를 활용한 비정상 거래는 자동 탐지되어 판매지수에 포함되지 않으니 유의해주세요. <a
												role="button" target="_blank"
												href="https://sell.smartstore.naver.com/#/center-notice/detail/100002667"
												class="btn-link">안내<i
												class="fn-shopping fn-shopping-forward2" aria-hidden="true"></i></a>
										</p>
										<!---->
										<!---->
									</div>
								</div>
								<!---->
								<!---->
								<fieldset ng-if="!vm.isRentalForm"
									ng-disabled="::(vm.app === 'ADMIN')">
									<div class="form-sub-wrap">
										<label class="control-label">할인 <a
											ng-hide="vm.productCreateType === 'INJECT'" role="button"
											class="font-icon-button"
											uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>구매자에게 할인된 가격으로 상품을 판매할 수 있습니다.<br/>단, 설정 범위가 제한됩니다.<br/>- 정액 : 최소 10원 ~ 최대 판매가 미만 (10원 단위)<br/>- 정률 : 최소 1% ~ 최대 99% (1% 단위)</li><li>할인 설정 후에는 하단의 &quot;할인가&quot; 로 구매자가 상품을 구매하게 됩니다.</li></ul>'"
											popover-trigger="'outsideClick'" popover-placement="bottom-left"
											popover-append-to-body="true" href=""><i class="fn fn-info1"
												aria-hidden="true"></i><span class="sr-only">툴팁</span></a></label>
										<div class="input-content">
											<div class="seller-input-toggle form-group">
												<input type="hidden"
													ng-model="vm.product.customerBenefit.immediateDiscountPolicy.id"
													ng-disabled="vm.isDisabledDiscountPolicyId(vm.product.customerBenefit.immediateDiscountPolicy)"
													ncp-disabled="" autocomplete="off"
													class="ng-pristine ng-untouched ng-valid ng-empty"
													disabled="disabled"> <input type="radio" name="sale2"
													id="r3_1_total"
													ng-model="vm.viewData.isEnableImmediateDiscountPolicy"
													ng-value="true"
													ng-click="vm.onClickEnableImmediateDiscountPolicy()"
													class="ng-pristine ng-untouched ng-valid ng-not-empty"
													value="true"> <label for="r3_1_total">설정함</label> <input
													type="radio" name="sale2" id="r3_2_total"
													class="r-no-set ng-pristine ng-untouched ng-valid ng-not-empty"
													ng-model="vm.viewData.isEnableImmediateDiscountPolicy"
													ng-value="false"
													ng-click="vm.onClickDisableImmediateDiscountPolicy()"
													ng-disabled="vm.viewData.hasSpecialDiscount" value="false">
												<label for="r3_2_total">설정안함</label>
											</div>
											<!---->
											<!---->
										</div>
									</div>
									<div class="form-sub-detail ng-hide"
										ng-show="vm.viewData.isEnableImmediateDiscountPolicy">
										<!---->
										<!---->
									</div>
								</fieldset>
								<!---->
								<!---->
								<!---->
								<!---->
								<div class="form-sub-wrap"
									ng-if="vm.formType !== 'BULK' &amp;&amp; (vm.productFormViewVO.productCreateType === 'BASIC' &amp;&amp; vm.isMenuOpen) &amp;&amp; !vm.parent.isPreOrderOn">
									<label class="control-label">판매기간</label>
									<div class="input-content">
										<div class="seller-input-toggle">
											<input type="radio" name="period" id="period1"
												ng-model="vm.viewData.saleDateUsable"
												data-nclicks-code="atb.periodon" ng-value="true"
												disable-auto-validate="true"
												ng-click="vm.product.useSalePeriod = true"
												class="ng-valid ng-not-empty ng-dirty ng-touched ng-valid-parse"
												value="true" style=""> <label for="period1">설정함</label> <input
												type="radio" name="period" id="period2"
												class="r-no-set ng-valid ng-not-empty ng-dirty ng-touched"
												ng-model="vm.viewData.saleDateUsable" ng-value="false"
												disable-auto-validate="true" data-nclicks-code="atb.periodoff"
												ng-click="vm.disableSaleDate()" value="false" style=""> <label
												for="period2">설정안함</label>
										</div>
									</div>
								</div>
								<!---->
								<!---->
								<div class="form-sub-detail"
									ng-if="vm.formType !== 'BULK' &amp;&amp; (vm.productFormViewVO.productCreateType === 'BASIC' &amp;&amp; vm.isMenuOpen) &amp;&amp; !vm.parent.isPreOrderOn"
									ng-show="vm.viewData.saleDateUsable" style="">
									<div class="form-sub-detail-wrap">
										<label class="control-label">기간설정<i class="icon-must"
											aria-label="필수항목"></i></label>
										<div class="input-content">
											<div class="form-inline has-error-msg">
												<ncp-datetime-range-picker2 is-timezone-guide="true"
													start-date-model="vm.product.saleStartDate"
													end-date-model="vm.product.saleEndDate"
													datetime-picker-format-name="DATETIME"
													datetime-picker-custom-option="vm.config.datetimePickerOption"
													date-min="'TODAY'" date-required="vm.viewData.saleDateUsable"
													date-disabled="!vm.viewData.saleDateUsable"
													date-range-usable="true"
													date-range-option="vm.config.saleDateRangeOption"
													date-range-button-fix-width="true"
													date-markup-option="{buttonFixWidth:true}"><!---->
												<div class="form-group" ng-if="vm.dateRangeUsable" style="">
													<div class="btn-toolbar">
														<div class="btn-group fix-width-col-4"
															ng-class="::{'fix-width-col-4' : vm.dateMarkupOption.buttonFixWidth}"
															ng-attr-data-nclicks-code="{{::vm.nclicksCodeRangeButton}}">
															<!---->
															<button type="button" class="btn btn-primary2 active"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }" style="">3일</button>
															<!---->
															<button type="button" class="btn btn-primary2"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }">5일</button>
															<!---->
															<button type="button" class="btn btn-primary2"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }">7일</button>
															<!---->
															<button type="button" class="btn btn-primary2"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }">15일</button>
															<!---->
															<button type="button" class="btn btn-primary2"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }">30일</button>
															<!---->
															<button type="button" class="btn btn-primary2"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }">60일</button>
															<!---->
															<button type="button" class="btn btn-primary2"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }">90일</button>
															<!---->
															<button type="button" class="btn btn-primary2"
																ng-repeat="option in vm.dateRangeOption.periods"
																ng-click="vm.onClickRangeButton($index)"
																ng-disabled="vm.dateDisabled"
																ng-class="{ active: option.active }">120일</button>
															<!---->
														</div>
													</div>
												</div>
												<!---->
												<div class="form-group"
													ng-class="::{'only-date' : vm.dateMarkupOption.onlyDate, 'disabled-date-dimmed' : vm.dateMarkupOption.disabledDateDimmed }">
													<div class="seller-calendar">
														<div class="input-daterange date form-inline">
															<div
																class="form-group _startDate_dropdown seller-datetime-picker _error_start_date_2677233004 dropdown"
																ng-class="{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}"
																style="">
																<div class="input-group dropdown-toggle dropdown_3882214343"
																	data-toggle="dropdown"
																	ng-click="vm.isStartDateShow = !vm.dateDisabled &amp;&amp; true"
																	ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																	<input type="text"
																		class="form-control ng-pristine ng-untouched ng-valid-date-time-input ng-not-empty ng-valid ng-valid-required"
																		name="" title="날짜 입력" ng-readonly="::vm.dateInputReadonly"
																		ng-required="vm.dateRequired &amp;&amp; !vm.ignoreStartDateRequired"
																		ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType"
																		ncp-disabled="!vm.dateDisabledByPeriodType"
																		ng-model="vm.startDateModel"
																		model-type="YYYY-MM-DDTHH:mm:ss.SSSZ"
																		date-time-input="YYYY.MM.DD. HH:mm"
																		data-date-formats="::vm.inputModelFormats"
																		ncp-message-container="._error_start_date_2677233004"
																		ng-required-err-type="required.daterangepicker.startDate"
																		ncp-validate-change-trigger="" readonly="readOnly" style=""
																		required="required">
																	<!---->
																	<span class="input-group-addon"
																		ng-if="!vm.dateDisabled &amp;&amp; !vm.dateDisabledByPeriodType &amp;&amp; !vm.startDatetimePickerDisabled"
																		style=""><a role="button" href=""><i
																			class="fn fn-calendar1" aria-hidden="true"></i><span
																			class="sr-only">달력보기</span></a> </span>
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
																class="form-group _endDate_dropdown seller-datetime-picker _error_end_date_5379535936 dropdown"
																ng-class="::{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}"
																style="">
																<div class="input-group dropdown-toggle dropdown_1344153502"
																	data-toggle="dropdown"
																	ng-click="vm.isEndDateShow = !vm.dateDisabled &amp;&amp; true"
																	ng-attr-data-nclicks-code="{{::vm.nclicksCode}}">
																	<input type="text"
																		class="form-control ng-pristine ng-untouched ng-valid-date-time-input ng-not-empty ng-valid ng-valid-required"
																		name="" title="날짜 입력" ng-readonly="::vm.dateInputReadonly"
																		ng-required="vm.dateRequired &amp;&amp; !vm.ignoreEndDateRequired"
																		ng-disabled="vm.dateDisabled || vm.dateDisabledByPeriodType"
																		ncp-disabled="!vm.dateDisabledByPeriodType"
																		ng-model="vm.endDateModel"
																		model-type="YYYY-MM-DDTHH:mm:ss.SSSZ"
																		date-time-input="YYYY.MM.DD. HH:mm"
																		data-date-formats="::vm.inputModelFormats"
																		ncp-message-container="._error_end_date_5379535936"
																		ng-required-err-type="required.daterangepicker.endDate"
																		ncp-validate-change-trigger="" readonly="readOnly" style=""
																		required="required">
																	<!---->
																	<span class="input-group-addon"
																		ng-if="!vm.dateDisabled &amp;&amp; !vm.dateDisabledByPeriodType &amp;&amp; !vm.endDatetimePickerDisabled"
																		style=""><a role="button" href=""><i
																			class="fn fn-calendar1" aria-hidden="true"></i><span
																			class="sr-only">달력보기</span></a> </span>
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
											<!---->
										</div>
									</div>
								</div>
								<!---->
								<!---->
								<!---->
							</div>
						</div>
					</div>
					</ui-view>
					<!-- 판매가 설정 끝 -->
					
					<!-- 재고 수량 설정 시작 -->
					<ui-view name="stock" id="anchor-stock"><!----><div class="form-section" ng-if="vm.product.payExposure || vm.productFormType === 'BULK'"><div class="title-line" role="button" ng-click="vm.toggleMenu()"><label class="col-lg-1 col-sm-2 col-xs-4 control-label" for="stock">재고수량<i class="icon-must" aria-label="필수항목"></i></label><div class="col-lg-11 col-sm-10 col-xs-8 input-content"><div class="set-option no-set" ng-class="{'no-set': !vm.isConfig}"> <a class="btn btn-default btn-hide active" ng-class="{active: vm.isMenuOpen}" href=""><span class="sr-only">메뉴토글</span></a></div></div></div><!----><div class="inner-content input-content" ng-if="vm.isMenuOpen || vm.productFormViewVO.readOnly"><div class="form-section-sub"><div class="form-sub-wrap"><div class="input-content"><div class="form-inline" id="error_stockQuantity"><div class="form-group"><div class="input-group"><div class="seller-input-wrap"><input name="product.stockQuantity" type="tel" class="form-control ng-pristine ng-untouched ng-empty ng-valid-max ng-invalid ng-invalid-required ng-valid-maxlength" id="stock" placeholder="숫자만 입력" title="재고수량 입력" ncp-product-fulfillment-stock="" ncp-product-fulfillment-stock-params="{&quot;useExternalStock&quot;: vm.useExternalStock, &quot;existExternalStock&quot;: vm.existExternalStock}" ng-readonly="vm.isReadonly" ng-model="vm.product.stockQuantity" ng-disabled="vm.isReadonly" ncp-validate-change-trigger="" max="99999999" max-err-type="max.quantity" ncp-max-params="{&quot;param&quot;:&quot;99,999,999&quot;}" maxlength="10" maxlength-err-type="max.quantity" ncp-maxlength-params="{&quot;param&quot;:&quot;99,999,999&quot;}" ng-required="vm.product.payExposure" ncp-number-format="" ncp-input-clear="" ncp-message-container="#error_stockQuantity" required="required"><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div><span class="input-group-addon">개</span></div></div><div class="form-group"><p class="sub-text text-primary mg-reset">옵션 재고수량을 사용하면, 옵션의 재고수량으로 적용되어 자동으로 입력됩니다.</p></div></div></div></div></div></div><!----></div><!----></ui-view>
					<!-- 재고 수량 설정 끝 -->
					
					<!-- 상품 옵션 설정 시작 -->
					<ui-view name="option" ng-if="vm.productComponentList.indexOf('OPTION') !== -1"><!----><div class="form-section" ng-if="vm.product.payExposure &amp;&amp; !(vm.productCreateType === 'INJECT' &amp;&amp; !vm.isConfig)"><div class="title-line" role="button" ncp-click-except-target=".fn-help1" ncp-click="vm.openItem()" server-field-errors="product.detailAttribute.optionInfo.*"><label class="col-lg-1 col-sm-2 col-xs-4 control-label">옵션 <!----><a role="button" ng-hide="vm.productCreateType === 'INJECT'" ng-click="vm.showHelpLayerForOption()" ng-if="::!vm.isMobile" href="" class=""><i class="fn fn-help1 text-primary" aria-hidden="true"></i><span class="sr-only">도움말</span></a><!----></label><!----><div class="col-lg-11 col-sm-10 col-xs-8 input-content" ng-if="!vm.simpleAccountInfo.branchUseYn"><div class="set-option no-set" ng-class="{'no-set': !vm.isConfig}">설정안함 <a class="btn btn-default" ng-class="{active: vm.isMenuOpen}" href=""><span class="sr-only">메뉴토글</span></a></div></div><!----><!----></div><fieldset ng-disabled="::(vm.productCreateType === 'INJECT')"><div class="inner-content input-content ng-hide" ng-show="(vm.isMenuOpen &amp;&amp; !vm.simpleAccountInfo.branchUseYn) || (vm.isConfig &amp;&amp; vm.productFormViewVO.readOnly)"><div class="form-section-sub"><div class="form-sub-wrap"><label class="control-label">선택형 <a href="" role="button" class="font-icon-button" ng-hide="vm.productCreateType === 'INJECT'" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>사이즈, 색상 등 상품의 상세 조건을 판매자가 설정하여, 구매자가 상품 구매시 옵션을 선택할 수 있도록 설정이 가능합니다.</li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" popover-append-to-body="true"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span></a></label><div class="input-content"><div class="form-inline"><div class="form-group" ng-class="vm.formType === 'BULK' ? 'sr-only' : ''"><div class="seller-input-toggle"><input type="radio" ng-model="vm.isChoiceType" ng-value="true" id="option_choice_type_true" ng-click="vm.changeIsChoiceAndCustom('choice')" data-nclicks-code="opt*c.on" class="ng-pristine ng-untouched ng-valid ng-not-empty" name="1550" value="true"> <label for="option_choice_type_true">설정함</label> <input type="radio" ng-model="vm.isChoiceType" ng-value="false" class="r-no-set ng-pristine ng-untouched ng-valid ng-not-empty" id="option_choice_type_false" data-nclicks-code="opt*c.off" ng-click="vm.changeIsChoiceAndCustom('choice')" name="1551" value="false"> <label for="option_choice_type_false">설정안함</label></div><input type="text" style="display: none; height: 0; opacity: 0" ng-model="vm.checkValueForValidate.choiceType" ng-required="vm.isChoiceType" ng-required-err-type="notEmpty.product.option" ncp-validate-change-trigger="" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"></div></div></div></div><div class="form-sub-detail ng-hide" ng-show="vm.isChoiceType"><div class="form-sub-detail-wrap"><label class="control-label">옵션 입력방식</label><div class="input-content"><!----><div class="seller-input fix-min-width form-group"><label><input type="radio" ng-model="vm.choiceInputType" data-nclicks-code="opt*c.input" ng-value="::vm.CHOICE_INPUT_TYPE.DIRECT" ng-change="vm.changeChoiceInputType('direct')" class="ng-pristine ng-untouched ng-valid ng-not-empty" name="1552" value="direct">직접 입력하기<span></span></label> <label class="hidden-xs"><input type="radio" ng-model="vm.choiceInputType" data-nclicks-code="opt*c.bundle" ng-value="::vm.CHOICE_INPUT_TYPE.EXCEL" ng-change="vm.changeChoiceInputType('direct')" class="ng-pristine ng-untouched ng-valid ng-not-empty" name="1553" value="excel">엑셀 일괄등록<span></span></label> <!----><label ng-if="!vm.isRentalForm"><input type="radio" ng-model="vm.choiceInputType" data-nclicks-code="opt*c.other" ng-value="::vm.CHOICE_INPUT_TYPE.LOAD" ng-change="vm.changeChoiceInputType('direct')" class="ng-pristine ng-untouched ng-valid ng-not-empty" name="1558" value="load">다른상품 옵션 불러오기<span></span></label><!----></div><!----><!----></div></div><!----><!----><div ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD" class="form-sub-detail-wrap"><!----><div class="form-sub-detail-wrap" ng-if="!vm.isRentalForm"><label class="control-label">옵션 구성타입 <i class="icon-must" aria-label="필수항목"></i> <a href="" role="button" class="font-icon-button" ng-hide="vm.productCreateType === 'INJECT'" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>단독형이란? 옵션별로 추가 옵션가와 재고수량이 동일한 경우를 말합니다. 옵션가/재고수량을 별도로 설정할 수 없습니다.</li><li>조합형이란? 옵션별로 옵션가가 다르거나 재고수량이 다른 경우를 말합니다. 단, 옵션 중에 정상 판매중이고, 옵션가가 0원으로 설정이 반드시 하나 이상 존재해야 합니다.</li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" popover-append-to-body="true"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span></a></label><div class="input-content"><div class="seller-input fix-min-width form-group"><!----><label ng-if="!vm.isRentalForm"><input type="radio" ng-model="vm.choiceType" ng-change="vm.changeChoiceType()" data-nclicks-code="opt*c.single" ng-value="::vm.CHOICE_TYPE.SIMPLE" ng-disabled="vm.parent.isEnableFulfillment || vm.isBulkUpdateTypeAndFulfillment" class="ng-pristine ng-untouched ng-valid ng-not-empty" name="1575" value="SIMPLE">단독형<span></span></label><!----> <label><input type="radio" ng-model="vm.choiceType" ng-change="vm.changeChoiceType()" data-nclicks-code="opt*c.mix" ng-value="::vm.CHOICE_TYPE.COMBINATION" class="ng-pristine ng-untouched ng-valid ng-not-empty" name="1572" value="COMBINATION">조합형<span></span></label></div><div class="form-group"><p class="sub-text text-primary ng-hide" ng-show="vm.parent.isEnableFulfillment || vm.isBulkUpdateTypeAndFulfillment">네이버 풀필먼트 설정한 상품은 단독형을 선택하실 수 없으며, 옵션별 재고수량과 옵션가 설정이 가능한 조합형만 사용 가능합니다.</p><p class="sub-text text-danger ng-hide" ng-show="vm.parent.isEnableFulfillment || vm.isBulkUpdateTypeAndFulfillment">※ 풀필먼트 옵션상품은 옵션의 ‘관리코드’를 기준으로 재고/주문정보가 연동되므로 옵션관리코드를 반드시 입력해주시기 바랍니다.<br>※ 풀필먼트 옵션관리코드는 한글, 영문, 숫자, -(하이픈), _(언더바), 공백만 허용됩니다. 이 외의 문자가 입력된 경우 재고연동이 불가합니다.</p><p class="sub-text text-primary" ng-show="!vm.parent.isEnableFulfillment &amp;&amp; !vm.isBulkUpdateTypeAndFulfillment">옵션별 재고수량이나 옵션가 설정이 필요하면 조합형을 선택해 주세요.</p></div></div></div><!----><div class="form-sub-detail-wrap"><!----> <label class="control-label">옵션명 개수<i class="icon-must" aria-label="필수항목"></i></label><div class="input-content"><div class="form-inline"><div class="form-group"><div class="selectize-control ng-pristine ng-untouched ng-valid single"><div class="selectize-input items ng-valid ng-pristine has-options full has-items"><div data-value="1" class="item">1개</div><input type="text" autocomplete="off" tabindex="0" readonly="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div><div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none;"><div class="selectize-dropdown-content"><div data-value="1" data-selectable="" class="option selected">1개</div><div data-value="2" data-selectable="" class="option">2개</div><div data-value="3" data-selectable="" class="option">3개</div></div></div></div><input selectize="" options="vm.CHOICE_TYPE_OPTION_NAME_COUNT_SET" config="{onChange: vm.changeChoiceOptionNameCount}" ng-model="vm.choiceOptionNameCount" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty" tabindex="-1" value="1" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div></div></div></div><div class="form-sub-detail-wrap"><label class="control-label">정렬 순서<i class="icon-must" aria-label="필수항목"></i></label><div class="input-content"><div class="form-inline"><div class="form-group"><div class="selectize-control ng-pristine ng-untouched ng-valid single"><div class="selectize-input items ng-valid ng-pristine full has-options has-items"><div data-value="CREATE" class="item">등록순</div><input type="text" autocomplete="off" tabindex="0" readonly="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div><div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none;"><div class="selectize-dropdown-content"><div data-value="CREATE" data-selectable="" class="option selected active">등록순</div><div data-value="ABC" data-selectable="" class="option">가나다순</div><div data-value="LOW_PRICE" data-selectable="" class="option">낮은 가격순</div><div data-value="HIGH_PRICE" data-selectable="" class="option">높은 가격순</div></div></div></div><input selectize="" options="vm.OPTION_SORT_TYPE_SET" config="{onChange: vm.changeChoiceOptionSortType}" ng-model="vm.choiceOptionSortType" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty" tabindex="-1" value="CREATE" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div></div></div></div><div class="form-sub-detail-wrap"><label class="control-label">옵션입력<i class="icon-must" aria-label="필수항목"></i></label><div class="input-content"><div class="seller-option-input"><!----><div class="option-wrap" ng-repeat="choiceOptionInput in vm.choiceOptionInputList track by $index"><div class="col-sm-3"><label for="choice_option_name0">옵션명</label><div class="seller-input-wrap"><input type="text" ng-model="choiceOptionInput.groupName" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" id="choice_option_name0" placeholder="예시:컬러" disable-auto-validate="true" maxlength="25" ncp-input-clear=""><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div></div><div class="col-sm-6"><label for="choice_option_value0">옵션값</label><div class="seller-input-wrap"><input type="text" ng-model="choiceOptionInput.name" class="form-control ng-pristine ng-untouched ng-valid ng-empty" id="choice_option_value0" placeholder="예시 : 빨강,노랑 ( , 로 구분 )" disable-auto-validate="true" ncp-input-clear=""><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div></div><div class="col-sm-3"><label class="hidden-xs"></label> <a role="button" href="" class="btn btn-default ng-hide" ng-show="!$first" ng-click="vm.deleteOptionInput(vm.OPTION_TYPE.CHOICE, $index)"><i class="seller-icon icon-minus" aria-label="삭제"></i> </a><a role="button" href="" class="btn btn-single" ng-show="$last &amp;&amp; ($index !== (vm.CHOICE_TYPE_OPTION_NAME_COUNT_SET.length - 1))" ng-click="vm.addOptionInput(vm.OPTION_TYPE.CHOICE)"><i class="seller-icon icon-plus-sm" aria-label="추가"></i></a></div></div><!----><div class="option-wrap"><div class="col-sm-3"><!----><a role="button" href="" class="btn btn-default2 btn-block" disabled="disabled" ng-if="vm.isShowSubmitToGridButton() === false">옵션목록으로 적용 <i class="fn fn-down1 fn-bold" aria-hidden="true"></i> </a><!----><!----></div><div class="col-sm-9"></div></div></div></div></div></div><!----><div class="form-sub-detail-wrap seller-option-list"><div class="form-inline"><div class="form-group"><!----> <!----><label class="col-sm-12 control-label" ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD">옵션목록<i class="icon-must" aria-label="필수항목"></i> <!----><a role="button" ng-click="vm.showHelpLayerForOption()" ng-if="::!vm.isMobile" href=""><i class="fn fn-help1 text-primary" aria-hidden="true"></i><span class="sr-only">도움말</span> </a><!---->(총 <em class="text-primary">0</em>개) &nbsp;<br class="visible-xs"><!----><span ng-if="!vm.isRentalForm" class="sub-text text-primary">변경된 옵션 제한기준을 <a href="" onclick="window.open('https://sell.smartstore.naver.com/#/center-notice/detail/100001516')" class="btn-link">꼭 확인해 주세요.<i class="fn-shopping fn-shopping-forward2" aria-hidden="true"></i></a> </span><!----><!----></label><!----></div></div><div class="col-sm-12 input-content"><div class="clearfix"><!----><!----><div class="pull-left" ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD"><a role="button" href="" class="btn btn-default btn-sm" ng-click="vm.openSubscriptionDeleteConfirm(vm.deleteSelectedGridRow)">선택삭제</a></div><!----><!----><div class="pull-right" ng-if="::!vm.isMobile"><div class="form-inline mobile-inline"><!----><!----><!----><div class="form-group" ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD" ng-show="!vm.isRentalForm &amp;&amp; vm.choiceType === vm.CHOICE_TYPE.COMBINATION">옵션가 <a href="" role="button" class="font-icon-button" ng-hide="vm.productCreateType === 'INJECT'" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>옵션가는 판매가 기준으로 입력할 수 있습니다.<br>- 판매가 0원 ~ 2,000원 미만 : 0 ~ 100%<br>- 판매가 2,000원 ~ 10,000원 미만 : -50% ~ +100%<br>- 판매가 10,000원 이상 : - 50% ~ +50%</li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" popover-append-to-body="true"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span></a></div><!----><!----><div class="form-group" ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD" ng-show="!vm.isRentalForm &amp;&amp; vm.choiceType === vm.CHOICE_TYPE.COMBINATION"><div class="input-group"><div class="input-group-btn"><button class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" type="button">+ <span class="caret"></span></button><ul class="dropdown-menu"><!----><li ng-repeat="data in ::vm.BULK_OPTION_PRICE_SIGN_SET"><a href="" ng-click="vm.bulkOptionPriceSign = data.value">+</a></li><!----><li ng-repeat="data in ::vm.BULK_OPTION_PRICE_SIGN_SET"><a href="" ng-click="vm.bulkOptionPriceSign = data.value">-</a></li><!----></ul></div><div class="seller-input-wrap"><input type="tel" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" maxlength="12" ng-model="vm.bulkOptionPrice" ncp-input-clear=""><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div></div></div><!----><!----><div class="form-group" ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD" ng-show="vm.choiceType === vm.CHOICE_TYPE.COMBINATION &amp;&amp; !vm.useExternalStock">재고수량</div><!----><!----><div class="form-group" ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD" ng-show="vm.choiceType === vm.CHOICE_TYPE.COMBINATION &amp;&amp; !vm.useExternalStock"><div class="input-group"><div class="seller-input-wrap"><input type="tel" class="form-control input-sm ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" maxlength="11" ng-model="vm.bulkStockQuantity" ncp-input-clear=""><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div></div></div><!----><div class="form-group">사용여부</div><div class="form-group"><div class="input-group"><div class="input-group-btn"><button class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" type="button">Y <span class="caret"></span></button><ul class="dropdown-menu pull-right"><!----><li ng-repeat="data in ::vm.OPTION_USABLE_SET"><a href="" ng-click="vm.bulkUsable = data.value">Y</a></li><!----><li ng-repeat="data in ::vm.OPTION_USABLE_SET"><a href="" ng-click="vm.bulkUsable = data.value">N</a></li><!----></ul></div></div></div><div class="form-group"><a role="button" href="" class="btn btn-default2 btn-sm" ng-click="vm.openSubscriptionModifyAlert(vm.modifySelectedRowByBulk)">선택목록 일괄수정</a></div></div></div><!----></div><!----><div ng-if="vm.gridInitialized === true &amp;&amp; vm.simpleAccountInfo.branchUseYn === false" class="seller-grid-area ag-theme-fresh has-space-top" ag-grid="vm.gridOptions" style="width:100%; height: 300px;"><div class="ag-root-wrapper ag-layout-normal ag-ltr">
					            <div class="ag-root-wrapper-body ag-layout-normal" ref="rootWrapperBody">
					                <!--AG-GRID-COMP--><div class="ag-root ag-unselectable ag-layout-normal" role="grid" unselectable="on" ref="gridPanel" aria-rowcount="2">
					        <!--AG-HEADER-ROOT--><div class="ag-header ag-pivot-off" role="presentation" ref="headerRoot" unselectable="on" style="height: 80px; min-height: 80px;">
					            <div class="ag-pinned-left-header ag-hidden" ref="ePinnedLeftHeader" role="presentation" style="width: 0px; max-width: 0px; min-width: 0px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 0px;"></div><div class="ag-header-row" role="row" aria-rowindex="2" style="top: 40px; height: 40px; width: 0px;"></div></div>
					            <div class="ag-header-viewport" ref="eHeaderViewport" role="presentation">
					                <div class="ag-header-container" ref="eHeaderContainer" role="rowgroup" style="width: 625px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 625px;"><div class="ag-header-group-cell ag-header-group-cell-no-group" role="presentation" col-id="5_0" style="width: 40px; left: 0px;"><div class="ag-header-group-cell-label" ref="agContainer" role="presentation"><span ref="agLabel" class="ag-header-group-text" role="columnheader"></span><span ref="agOpened" class="ag-header-icon ag-header-expand-icon ag-header-expand-icon-expanded ag-hidden"><i class="seller-icon grid-group-expanded" aria-label="컬럼 그룹 닫기"></i></span><span ref="agClosed" class="ag-header-icon ag-header-expand-icon ag-header-expand-icon-collapsed ag-hidden"><i class="seller-icon grid-group-contracted" aria-label="컬럼 그룹 열기"></i></span></div></div><div class="ag-header-group-cell ag-header-group-cell-with-group" role="presentation" col-id="2_0" style="width: 100px; left: 40px;"><div ref="agResize" class="ag-header-cell-resize" role="presentation"></div><div class="ag-header-group-cell-label" ref="agContainer" role="presentation"><span ref="agLabel" class="ag-header-group-text" role="columnheader">옵션명</span><span ref="agOpened" class="ag-header-icon ag-header-expand-icon ag-header-expand-icon-expanded ag-hidden"><i class="seller-icon grid-group-expanded" aria-label="컬럼 그룹 닫기"></i></span><span ref="agClosed" class="ag-header-icon ag-header-expand-icon ag-header-expand-icon-collapsed ag-hidden"><i class="seller-icon grid-group-contracted" aria-label="컬럼 그룹 열기"></i></span></div></div><div class="ag-header-group-cell ag-header-group-cell-no-group" role="presentation" col-id="6_0" style="width: 90px; left: 140px;"><div ref="agResize" class="ag-header-cell-resize" role="presentation"></div><div class="ag-header-group-cell-label" ref="agContainer" role="presentation"><span ref="agLabel" class="ag-header-group-text" role="columnheader"></span><span ref="agOpened" class="ag-header-icon ag-header-expand-icon ag-header-expand-icon-expanded ag-hidden"><i class="seller-icon grid-group-expanded" aria-label="컬럼 그룹 닫기"></i></span><span ref="agClosed" class="ag-header-icon ag-header-expand-icon ag-header-expand-icon-collapsed ag-hidden"><i class="seller-icon grid-group-contracted" aria-label="컬럼 그룹 열기"></i></span></div></div></div><div class="ag-header-row" role="row" aria-rowindex="2" style="top: 40px; height: 40px; width: 625px;"><div class="ag-header-cell" role="presentation" unselectable="on" col-id="0" style="width: 40px; left: 0px;"><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div><div class="seller-input ag-header-cell-label" style="position:absolute; width:100%; top:-41%; left:0"><label><input type="checkbox" class="ag-selection-checkbox"><span class="ag-header-cell-text"></span></label></div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="optionName1" style="width: 100px; left: 40px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div class="ag-cell-label-container" role="presentation">    <div ref="eLabel" class="ag-header-cell-label" role="presentation" unselectable="on">    <span ref="eText" class="ag-header-cell-text" role="columnheader" unselectable="on"></span>    <span ref="eFilter" class="ag-header-icon ag-filter-icon ag-hidden" aria-hidden="true"><span class="ag-icon ag-icon-filter" unselectable="on"></span></span>                  </div></div></div><div class="ag-header-cell" role="presentation" unselectable="on" col-id="price" style="width: 90px; left: 140px;"><div ref="eResize" class="ag-header-cell-resize" role="presentation"></div><!--AG-CHECKBOX--><div class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden" role="presentation" ref="cbSelectAll">
					            <label ref="eLabel" class="ag-hidden"></label>
					            <div ref="eWrapper" class="ag-wrapper ag-input-wrapper" role="presentation">
					                <input ref="eInput" type="checkbox" class="ag-hidden">
					            <div><i class="seller-icon grid-checkbox-unchecked" aria-label="선택안함"></i></div></div>
					        </div><div><div class="ag-cell-label-container" role="presentation">  <div ref="eLabel" class="ag-header-cell-label" role="presentation">    <span ref="eFilter" class="ag-header-icon ag-filter-icon"></span>    <span ref="eText" class="ag-header-cell-text" role="columnheader" style="position:absolute; width:100%; top:-20%; left:0;">옵션가</span>  </div></div></div></div></div></div>
					            </div>
					            <div class="ag-pinned-right-header ag-hidden" ref="ePinnedRightHeader" role="presentation" style="width: 0px; max-width: 0px; min-width: 0px;"><div class="ag-header-row" role="row" aria-rowindex="1" style="top: 0px; height: 40px; width: 0px;"></div><div class="ag-header-row" role="row" aria-rowindex="2" style="top: 40px; height: 40px; width: 0px;"></div></div>
					        </div>
					        <div class="ag-floating-top" ref="eTop" role="presentation" unselectable="on" style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
					            <div class="ag-pinned-left-floating-top ag-hidden" ref="eLeftTop" role="presentation" unselectable="on"></div>
					            <div class="ag-floating-top-viewport" ref="eTopViewport" role="presentation" unselectable="on">
					                <div class="ag-floating-top-container" ref="eTopContainer" role="presentation" unselectable="on" style="width: 625px;"></div>
					            </div>
					            <div class="ag-pinned-right-floating-top ag-hidden" ref="eRightTop" role="presentation" unselectable="on"></div>
					            <div class="ag-floating-top-full-width-container ag-hidden" ref="eTopFullWidthContainer" role="presentation" unselectable="on"></div>
					        </div>
					        <div class="ag-body-viewport ag-layout-normal ag-row-no-animation" ref="eBodyViewport" role="presentation" unselectable="on">
					            <div class="ag-pinned-left-cols-container ag-hidden" ref="eLeftContainer" role="presentation" unselectable="on" style="height: 1px;"></div>
					            <div class="ag-center-cols-clipper" ref="eCenterColsClipper" role="presentation" unselectable="on" style="height: 1px;">
					                <div class="ag-center-cols-viewport" ref="eCenterViewport" role="presentation" unselectable="on" style="height: calc(100% + 0px);">
					                    <div class="ag-center-cols-container" ref="eCenterContainer" role="rowgroup" unselectable="on" style="width: 625px; height: 1px;"></div>
					                </div>
					            </div>
					            <div class="ag-pinned-right-cols-container ag-hidden" ref="eRightContainer" role="presentation" unselectable="on" style="height: 1px;"></div>
					            <div class="ag-full-width-container" ref="eFullWidthContainer" role="presentation" unselectable="on" style="height: 1px;"></div>
					        </div>
					        <div class="ag-floating-bottom" ref="eBottom" role="presentation" unselectable="on" style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
					            <div class="ag-pinned-left-floating-bottom ag-hidden" ref="eLeftBottom" role="presentation" unselectable="on"></div>
					            <div class="ag-floating-bottom-viewport" ref="eBottomViewport" role="presentation" unselectable="on">
					                <div class="ag-floating-bottom-container" ref="eBottomContainer" role="presentation" unselectable="on" style="width: 625px;"></div>
					            </div>
					            <div class="ag-pinned-right-floating-bottom ag-hidden" ref="eRightBottom" role="presentation" unselectable="on"></div>
					            <div class="ag-floating-bottom-full-width-container ag-hidden" ref="eBottomFullWidthContainer" role="presentation" unselectable="on"></div>
					        </div>
					        <div class="ag-body-horizontal-scroll" ref="eHorizontalScrollBody" aria-hidden="true" style="height: 0px; max-height: 0px; min-height: 0px;">
					            <div class="ag-horizontal-left-spacer ag-scroller-corner" ref="eHorizontalLeftSpacer" style="width: 0px; max-width: 0px; min-width: 0px;"></div>
					            <div class="ag-body-horizontal-scroll-viewport" ref="eBodyHorizontalScrollViewport" style="height: 0px; max-height: 0px; min-height: 0px;">
					                <div class="ag-body-horizontal-scroll-container" ref="eBodyHorizontalScrollContainer" style="width: 625px; height: 0px; max-height: 0px; min-height: 0px;"></div>
					            </div>
					            <div class="ag-horizontal-right-spacer ag-scroller-corner" ref="eHorizontalRightSpacer" style="width: 0px; max-width: 0px; min-width: 0px;"></div>
					        </div>
					        <!--AG-OVERLAY-WRAPPER--><div class="ag-overlay" aria-hidden="true" ref="overlayWrapper">
					            <div class="ag-overlay-panel">
					                <div class="ag-overlay-wrapper ag-layout-normal ag-overlay-no-rows-wrapper" ref="eOverlayWrapper"><div class="result-info"><i class="fn-shopping fn-65 fn-shopping-caution1 icon-color-big" aria-hidden="true"></i><p class="title">데이터가 존재하지 않습니다.</p></div></div>
					            </div>
					        </div>
					    </div>
					            </div>
					            <!--AG-PAGINATION--><nav class="seller-pagination ag-hidden">   <span class="ag-paging-row-summary-panel _sell_pageRowSummaryPanel" style="display:none;">       <span ref="lbFirstRowOnPage" class="_sell_firstRowOnPage"></span>[[TO]]       <span ref="lbLastRowOnPage" class="_sell_lastRowOnPage"></span>[[OF]]       <span ref="lbRecordCount" class="_sell_recordCount"></span>       <span ref="lbCurrent" class="_sell_current"></span>       <span ref="lbTotal" class="_sell_total"></span>   </span>   <div class="visible-xs">       <div class="_mobile_pagination"></div>   </div>   <div class="hidden-xs">      <ul class="pagination _pc_pagination">          <li style="display: none"><a href="" ref="btFirst" aria-label="처음 페이지로 이동" class="_sell_btFirst"><span class="ag-icon ag-icon-first" unselectable="on"></span><i class="seller-icon icon-double-left" aria-hidden="true"></i></a></li>          <li style="display: none"><a href="" ref="btPrevious" aria-label="이전 페이지로 이동" class="_sell_btPrevious"><span class="ag-icon ag-icon-previous" unselectable="on"></span><i class="seller-icon icon-left" aria-hidden="true"></i></a></li>          <li class="active"><a href="">1<span class="sr-only">(현재 페이지)</span></a></li>          <li style="display: none"><a href="" ref="btNext" aria-label="다음 페이지로 이동" class="_sell_btNext"><span class="ag-icon ag-icon-next" unselectable="on"></span><i class="seller-icon icon-right" aria-hidden="true"></i></a></li>          <li style="display: none"><a href="" ref="btLast" aria-label="마지막 페이지로 이동" class="_sell_btLast"><span class="ag-icon ag-icon-last" unselectable="on"></span><i class="seller-icon icon-double-right" aria-hidden="true"></i></a></li>       </ul>   </div></nav>
					        </div></div><!----><div class="btn-block"><div class="form-inline pc-pull-left"><div id="error-message-optionCombinations" class="error-message-optionCombinations"></div><div id="error-message-optionSimple" class="error-message-optionSimple"></div><div class="form-group sr-only"><input type="text" style="visibility: hidden; height:1px" name="product.detailAttribute.optionInfo.optionCombinations" ng-model="vm.product.detailAttribute.optionInfo.optionCombinations" ncp-message-container="#error-message-optionCombinations" class="ng-pristine ng-untouched ng-valid ng-empty"> <input type="text" style="visibility: hidden; height:1px" name="product.detailAttribute.optionInfo.optionSimple" ng-model="vm.product.detailAttribute.optionInfo.optionSimple" ncp-message-container="#error-message-optionSimple" class="ng-pristine ng-untouched ng-valid ng-empty"></div></div><!----><!----><div class="form-inline pull-right" ng-if="vm.choiceInputType !== vm.CHOICE_INPUT_TYPE.STANDARD"><div class="form-group"><a role="button" href="" class="btn btn-default btn-sm" ng-click="vm.addGridRow()"><i class="fn-booking fn-booking-plus1 text-sub" aria-hidden="true"></i> 목록추가</a></div><div class="form-group"><a role="button" href="" class="btn btn-default btn-sm hidden-xs" ng-click="vm.downloadExcel()"><i class="seller-icon icon-excel" aria-hidden="true"></i> 엑셀다운</a></div></div><!----></div></div></div></div><!----><div ng-if="!vm.isRentalForm &amp;&amp; !vm.isStandardOption()" class="form-sub-wrap"><label class="control-label">직접입력형 <a href="" role="button" class="font-icon-button" uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>옵션의 종류가 너무 다양하여, 구매자가 직접 정보를 입력할 수 있도록 설정이 가능합니다.</li></ul>'" popover-trigger="'outsideClick'" popover-placement="bottom-left" popover-append-to-body="true"><i class="fn fn-info1" aria-hidden="true"></i><span class="sr-only">툴팁</span></a></label><div class="input-content"><div class="form-inline"><div class="form-group"><div class="seller-input-toggle"><input type="radio" ng-model="vm.isCustomType" ng-value="true" data-nclicks-code="opt*d.on" id="option_direct_type_true" ng-click="vm.changeIsChoiceAndCustom('custom')" class="ng-pristine ng-untouched ng-valid ng-not-empty" name="1568" value="true"> <label for="option_direct_type_true">설정함</label> <input type="radio" ng-model="vm.isCustomType" ng-value="false" data-nclicks-code="opt*d.off" class="r-no-set ng-pristine ng-untouched ng-valid ng-not-empty" id="option_direct_type_false" ng-click="vm.changeIsChoiceAndCustom('custom')" name="1569" value="false"> <label for="option_direct_type_false">설정안함</label></div><input type="text" style="display: none; height: 0; opacity: 0" ng-model="vm.checkValueForValidate.customType" ng-required="vm.isCustomType" ng-required-err-type="notEmpty.product.option" ncp-validate-change-trigger="" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"></div></div></div></div><!----><div class="form-sub-detail ng-hide" ng-show="vm.isCustomType"><div class="form-sub-detail-wrap"><label class="control-label">옵션명 개수<i class="icon-must" aria-label="필수항목"></i></label><div class="input-content"><div class="form-inline"><div class="form-group"><div class="selectize-control ng-pristine ng-untouched ng-valid single"><div class="selectize-input items ng-valid ng-pristine has-options full has-items"><div data-value="1" class="item">1개</div><input type="text" autocomplete="off" tabindex="0" readonly="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div><div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none;"><div class="selectize-dropdown-content"><div data-value="1" data-selectable="" class="option selected">1개</div><div data-value="2" data-selectable="" class="option">2개</div><div data-value="3" data-selectable="" class="option">3개</div><div data-value="4" data-selectable="" class="option">4개</div><div data-value="5" data-selectable="" class="option">5개</div></div></div></div><input selectize="" options="vm.CUSTOM_TYPE_OPTION_NAME_COUNT_SET" config="{onChange: vm.changeCustomOptionNameCount}" ng-model="vm.customOptionNameCount" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty" tabindex="-1" value="1" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div></div></div></div><div class="form-sub-detail-wrap"><label class="control-label">옵션목록<br class="visible-xs">(총 <em class="text-primary">1</em>개)<i class="icon-must" aria-label="필수항목"></i></label><div class="input-content"><div class="seller-option-input"><!----><div class="option-wrap" ng-repeat="customOptionInput in vm.customOptionInputList track by $index"><div class="col-sm-7"><label for="custom_option_name0">옵션명</label><div class="seller-input-wrap"><input type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-maxlength" id="custom_option_name0" placeholder="예시:컬러" ng-model="customOptionInput.groupName" ng-model-options="{debounce: 250}" disable-auto-validate="true" maxlength="25" ncp-input-clear=""><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div></div><div class="col-sm-2"><label>사용여부</label> <div class="selectize-control ng-pristine ng-untouched ng-valid single"><div class="selectize-input items ng-valid ng-pristine full has-options has-items"><div data-value="true" class="item">Y</div><input type="text" autocomplete="off" tabindex="0" readonly="" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div><div class="selectize-dropdown single ng-pristine ng-untouched ng-valid" style="display: none;"><div class="selectize-dropdown-content"><div data-value="true" data-selectable="" class="option selected active">Y</div><div data-value="false" data-selectable="" class="option">N</div></div></div></div><input selectize="" options="vm.OPTION_USABLE_SET" ng-model="customOptionInput.usable" disable-auto-validate="true" class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty" tabindex="-1" value="true" style="width: 4px; opacity: 0; position: absolute; left: -10000px;"></div><div class="col-sm-3"><label class="hidden-xs"></label> <a role="button" href="" class="btn btn-default ng-hide" ng-show="!$first" ng-click="vm.deleteOptionInput(vm.OPTION_TYPE.CUSTOM, $index)"><i class="seller-icon icon-minus" aria-label="삭제"></i> </a><a role="button" href="" class="btn btn-single" ng-show="$last &amp;&amp; ($index != (vm.CUSTOM_TYPE_OPTION_NAME_COUNT_SET.length - 1))" ng-click="vm.addOptionInput(vm.OPTION_TYPE.CUSTOM)"><i class="seller-icon icon-plus-sm" aria-label="추가"></i></a></div></div><!----><div class="option-wrap"><div class="col-sm-12"><span class="sub-text text-danger">옵션을 통한 개인정보(휴대폰 번호, 이메일 주소) 수집은 금지되므로 등록시 노출이 제재될 수 있습니다. <a href="" onclick="window.open('https://ips.smartstore.naver.com/main/rules/safety/steal')" class="btn-link">개인정보보호정책<i class="fn-shopping fn-shopping-forward2" aria-hidden="true"></i></a><br></span><span class="sub-text text-primary">해외직배송 개인통관고유부호도 개인정보에 포함되며, 주문서에서 입력 받으므로 별도 수집하지 않아도 됩니다.</span></div></div></div><div id="error-message-optionCustom" class="error-message-optionCustom"></div><div class="form-group sr-only"><input type="text" style="visibility: hidden; height:1px" name="product.detailAttribute.optionInfo.optionCustom" ng-model="vm.product.detailAttribute.optionInfo.optionCustom" ncp-message-container="#error-message-optionCustom" class="ng-pristine ng-untouched ng-valid ng-empty"></div></div></div></div></div></div></fieldset></div><!----></ui-view>
					<!-- 상품 옵션 설정 끝 -->
					
					<!-- 상품 이미지 등록 시작 -->
					<ui-view name="images"><div class="form-section"><div class="title-line" role="button" ncp-click-except-target=".fn-help1" ncp-click="vm.isMenuOpen = !vm.isMenuOpen" server-field-errors="product.images.*"><label class="col-lg-2 col-sm-3 col-xs-6 control-label">상품이미지 <i class="icon-must" aria-label="필수항목"></i> <!----><a role="button" ng-click="vm.showHelpLayerForImages()" ng-if="::!vm.isMobile" href=""><i class="fn fn-help1 text-primary" aria-hidden="true"></i><span class="sr-only">도움말</span></a><!----></label><div class="col-lg-10 col-sm-9 col-xs-6 input-content"><div class="set-option"><a class="btn btn-default active" ng-class="{active: vm.isMenuOpen}" href=""><span class="sr-only">메뉴 토글</span></a></div></div></div><!----><div class="input-content inner-content" ng-if="vm.isMenuOpen"><div class="form-section-sub"><div ng-form="_REPRESENTATIVE_IMAGE" server-field-errors="product.images.*" class="ng-pristine ng-invalid ng-invalid-required"><div class="form-sub-wrap"><label class="control-label">대표이미지<i class="icon-must" aria-label="필수항목"></i> <!----><a role="button" ng-click="vm.showHelpLayerForImages('map/prod.cre/thumbnail')" ng-if="::!vm.isMobile" href=""><i class="fn fn-help1 text-primary" aria-hidden="true"></i><span class="sr-only">도움말</span></a><!----></label><div class="input-content"><ncp-product-temp-photo-infra-image-upload id="representImage" use-photo-storage="true" uploaded-images="vm.viewData.representImages" is-readonly="false" is-required="true" is-required-err-type="required.product.representImage" limit-count="'1'" image-class="'PROD_REPRESENTATIVE'" descriptions="vm.imageGuide.representImage" back-drop="static"><div ng-class="{'pc': !vm.isMobile, 'mobile': vm.isMobile}" class="pc"><div class="seller-product-img add-img" ng-class="{'round-img': vm.useRoundImg()}"><div class="wrap-img"><ul class="img-list" ng-style="vm.viewData.cssStyleForScroll"><!----><!----><li ng-if="!(vm.isReadonly() || vm.isMaxUploaded())"><!----><!----><div class="register-img" ng-if="vm.enablePhotoStorage()" style=""><a role="button" href="" class="btn-add-img" ng-click="vm.openUploadModal()" ng-attr-data-nclicks-code="{{::vm.nclicksCode}}"><i class="seller-icon icon-plus" aria-hidden="true"></i> <span class="sr-only">이미지 등록</span></a></div><!----></li><!----></ul></div></div><div class="form-group sr-only"><input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_names" ng-model="vm.uploadedNames" ng-required="vm.isRequired()" ng-required-err-type="required.product.representImage" ncp-message-container=".230719183729795_6_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" required="required"> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_all_names" ng-model="vm.uploadedAllDoneNames" ng-required="vm.isRequired() &amp;&amp; vm.limitCount > 1 &amp;&amp; vm.isCheckCount()" ng-required-err-type="image.select.count" ncp-required-params="{&quot;count&quot;: 1}" ncp-message-container=".230719183729795_6_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"> <!----> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_minSize" ng-model="vm.uploadedValidImageMinSize" ng-required="vm.isCheckImageMinSize()" ng-required-err-type="image.select.minSize" ncp-required-params="{&quot;width&quot;: &quot;0&quot;, &quot;height&quot;: &quot;0&quot;}" ncp-message-container=".230719183729795_6_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_maxSize" ng-model="vm.uploadedValidImageMaxSize" ng-required="vm.isCheckImageMaxSize()" ng-required-err-type="image.select.maxSize" ncp-required-params="{&quot;width&quot;: &quot;0&quot;, &quot;height&quot;: &quot;0&quot;}" ncp-message-container=".230719183729795_6_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_square" ng-model="vm.uploadedValidSquare" ng-required="vm.isCheckImageSquare()" ng-required-err-type="image.select.square" ncp-message-container=".230719183729795_6_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"></div><div class="230719183729795_6_img_upload_error_area"></div><!----><!----><div class="form-group" ng-if="vm.getDescriptions().length > 0"><p class="sub-text text-primary mg-reset" ncp-bind-html="vm.getDescriptions()">권장 크기 : 1000 x 1000 (윈도대상 750 x 1000)<br>대표이미지 기준 1000x1000 이상 이미지를 등록하시면, <a target="_blank" href="https://sell.smartstore.naver.com/#/center-notice/detail/100010565" class="btn-link">이미지 확대 기능</a>이 제공됩니다.<br>쇼핑검색에 노출되지 않는 경우 <a href="" ng-show="::!vm.isMobile" role="button" ng-click="vm.showHelpLayerForImages()" class="btn-link">가이드를 확인해주세요.</a><span ng-show="::vm.isMobile" class="ng-hide">가이드를 확인해주세요.</span></p></div><!----><!----></div></ncp-product-temp-photo-infra-image-upload></div></div></div><div ng-form="_ADDTIONAL_IMAGE" server-field-errors="product.images.*" class="ng-pristine ng-valid ng-valid-required"><div class="form-sub-wrap"><label class="control-label">추가이미지&nbsp;<br class="visible-xs"><span class="sub-text text-muted">(<i class="text-primary">0</i>/9)</span><i ng-show="vm.isRequiredOptionalImages" class="icon-must ng-hide" aria-label="필수항목"></i></label><div class="input-content"><ncp-product-temp-photo-infra-image-upload id="optionalImages" use-photo-storage="true" uploaded-images="vm.viewData.optionalImages" is-readonly="false" is-required="vm.isRequiredOptionalImages" is-required-err-type="required.product.optionalImages" is-check-count="false" limit-count="'9'" image-class="'PROD_OPTIONAL'" descriptions="['권장 크기 : 1000 x 1000 (윈도대상 750 x 1000)', '추가이미지는 최대 9개까지 설정할 수 있습니다.', 'jpg,jpeg,gif,png,bmp 형식의 정지 이미지만 등록됩니다.<br class=\'visible-xs\'>(움직이는 이미지의 경우 첫 번째 컷이 등록)']" use-order-modal="true" order-modal-title="추가이미지" back-drop="static"><div ng-class="{'pc': !vm.isMobile, 'mobile': vm.isMobile}" class="pc"><div class="seller-product-img add-img" ng-class="{'round-img': vm.useRoundImg()}"><div class="wrap-img"><ul class="img-list" ng-style="vm.viewData.cssStyleForScroll"><!----><!----><li ng-if="!(vm.isReadonly() || vm.isMaxUploaded())"><!----><!----><div class="register-img" ng-if="vm.enablePhotoStorage()" style=""><a role="button" href="" class="btn-add-img" ng-click="vm.openUploadModal()" ng-attr-data-nclicks-code="{{::vm.nclicksCode}}"><i class="seller-icon icon-plus" aria-hidden="true"></i> <span class="sr-only">이미지 등록</span></a></div><!----></li><!----></ul></div></div><div class="form-group sr-only"><input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_names" ng-model="vm.uploadedNames" ng-required="vm.isRequired()" ng-required-err-type="required.product.optionalImages" ncp-message-container=".230719183729798_7_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_all_names" ng-model="vm.uploadedAllDoneNames" ng-required="vm.isRequired() &amp;&amp; vm.limitCount > 1 &amp;&amp; vm.isCheckCount()" ng-required-err-type="image.select.count" ncp-required-params="{&quot;count&quot;: 9}" ncp-message-container=".230719183729798_7_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"> <!----> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_minSize" ng-model="vm.uploadedValidImageMinSize" ng-required="vm.isCheckImageMinSize()" ng-required-err-type="image.select.minSize" ncp-required-params="{&quot;width&quot;: &quot;0&quot;, &quot;height&quot;: &quot;0&quot;}" ncp-message-container=".230719183729798_7_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_maxSize" ng-model="vm.uploadedValidImageMaxSize" ng-required="vm.isCheckImageMaxSize()" ng-required-err-type="image.select.maxSize" ncp-required-params="{&quot;width&quot;: &quot;0&quot;, &quot;height&quot;: &quot;0&quot;}" ncp-message-container=".230719183729798_7_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"> <input type="text" style="visibility: hidden; opacity: 0" name="_hidden_uploaded_upload_square" ng-model="vm.uploadedValidSquare" ng-required="vm.isCheckImageSquare()" ng-required-err-type="image.select.square" ncp-message-container=".230719183729798_7_img_upload_error_area" class="ng-pristine ng-untouched ng-empty ng-valid ng-valid-required"></div><div class="230719183729798_7_img_upload_error_area"></div><!----><div class="form-group" ng-if="vm.useOrderModal()"><a class="btn btn-default" role="button" ng-click="vm.openOrderModal()" ng-disabled="!(vm.uploadedImages.length > 1)" disabled="disabled">순서 변경</a></div><!----><!----><div class="form-group" ng-if="vm.getDescriptions().length > 0"><p class="sub-text text-primary mg-reset" ncp-bind-html="vm.getDescriptions()">권장 크기 : 1000 x 1000 (윈도대상 750 x 1000)<br>추가이미지는 최대 9개까지 설정할 수 있습니다.<br>jpg,jpeg,gif,png,bmp 형식의 정지 이미지만 등록됩니다.<br class="visible-xs">(움직이는 이미지의 경우 첫 번째 컷이 등록)</p></div><!----><!----></div></ncp-product-temp-photo-infra-image-upload></div></div></div><div ng-form="_PRODUCT_3D_IMAGE" server-field-errors="product.product3dImageConfig" class="ng-pristine ng-valid ng-valid-pattern ng-valid-maxlength"><!----><div ng-form="_FOLDIO_360_IMAGE" server-field-errors="product.images.*" class="ng-pristine ng-valid"><!----></div><div ng-form="_TAG" server-field-errors="product.images.*" class="ng-pristine ng-valid"><!----></div><div ng-form="_VIDEO" server-field-errors="product.images.*" class="ng-pristine ng-valid ng-valid-pattern ng-valid-maxlength"><div class="form-sub-wrap"><label class="control-label control-label-relative">동영상 <!----><a role="button" ng-click="vm.showHelpLayerForImages('map/prod.cre/video')" ng-if="::!vm.isMobile" href="" class="ng-scope"><i class="fn fn-help1 text-primary" aria-hidden="true"></i><span class="sr-only">도움말</span></a><!----></label><div class="input-content input-content-relative"><ncp-video-infra-upload interlock-type="SELLER" videos="vm.product.videos" contents-type="PRODUCT" limit-count="vm.PROP.VIDEOS.LIMIT_COUNT" duration-limit="vm.PROP.VIDEOS.DURATION_LIMIT" file-size-limit-str="vm.PROP.VIDEOS.FILE_SIZE_LIMIT_STR" descriptions="vm.PROP.VIDEOS.DESCRIPTIONS"><div class="seller-product-img add-img _videoInfraUploadComponent"><div class="wrap-img"><ul class="img-list"><!----><!----><li ng-if="vm.videos.length < vm.limitCount"><div class="register-img"><a role="button" href="" class="btn-add-img" ng-click="vm.uploadVideo()"><i class="seller-icon icon-plus" aria-hidden="true"></i> <span class="sr-only">동영상 등록</span></a></div><div class="form-group mg-top"><a href="" class="btn btn-block btn-default disabled" role="button">GIF 미리보기</a></div></li><!----></ul></div></div><div class="form-group"><input type="text" style="display: none; height: 0; opacity: 0" ng-model="vm.checkValueForValidate.encode" ncp-validate-change-trigger="" class="ng-pristine ng-untouched ng-valid ng-not-empty"><!----><div ng-if="vm.descriptions" ng-bind-html="vm.descriptions"><p class="sub-text text-primary mg-reset">권장 동영상 길이: 최대 1분</p><p class="sub-text text-primary"><a target="_blank" href="https://sell.smartstore.naver.com/#/center-notice/detail/100003395" class="btn-link">좋은 동영상 등록하는 방법 보기<i class="fn-shopping fn-shopping-forward2"></i></a></p></div><!----></div><hr><div class="form-group"><a href="" class="btn btn-xs btn-default" role="button" ng-click="vm.openExampleModal()">동영상 노출 예시보기</a></div><!----><div class="info-progress" ng-if="vm.app === 'CENTER' &amp;&amp; !vm.isMobile &amp;&amp; vm.videos.length === 0"><div class="panel panel-seller"><div class="panel-heading"><p class="sub-text"><span class="inline-block vertical-top"><span class="label label-info">TIP</span></span> <span class="inline-block"><strong>특정 윈도는 <span class="text-info">최대 10초까지 GIF 움직이는 이미지를<br>자동 생성</span>하여 리스팅 대표이미지로 활용합니다.</strong></span></p></div><div class="panel-body pd-reset"><img src="../../images/register/info-video-pc.png" srcset="../../images/register/info-video-pc-2x.png 2x" width="380" alt="동영상 등록 프로세스 안내"></div></div></div><!----></ncp-video-infra-upload></div></div><div class="form-sub-detail"><div class="form-sub-detail-wrap"><label class="control-label">동영상 타이틀</label><div class="input-content"><div class="form-group"><div class="input-group"><div class="seller-input-wrap"><input name="videos0.title" type="text" class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-maxlength" ng-model="vm.product.videos[0].title" ng-pattern="/^[^\\*?&quot;<>]+$/" ng-pattern-err-type="invalidSpecialCharacter" ng-disabled="vm.isVideoEmpty()" ng-maxlength="20" maxlength="20" title="동영상 타이틀 입력" ncp-input-clear="" disabled="disabled"><a role="button" class="btn-clear" tabindex="-1" style="display:none;"><span aria-label="삭제">×</span></a></div><span class="input-group-addon"><span class="text-primary">0</span>/20</span></div></div><p class="sub-text text-primary">상품 상세 및 통합 검색 노출시 활용되는 문구입니다.<br>상품과 직접 관련 없는 내용 입력 시 판매금지될 수 있습니다.</p></div></div></div></div></div></div></div><!----></div></ui-view>
					<!-- 상품 이미지 등록 끝 -->
					
					<!-- 상품 상세설명 등록 시작 -->
					<ui-view name="detailContent" id="anchor-detail-content"><div class="form-section"><div class="title-line" role="button" ncp-click-except-target=".fn-help1" ncp-click="vm.viewData.isMenuOpen = (vm.formType !== 'BULK') ? !vm.viewData.isMenuOpen : true" server-field-errors="product.detailContent.*" server-global-errors="Invalid.window.detailContent.editorType"><label class="col-lg-2 col-sm-3 col-xs-6 control-label">상세설명<i class="icon-must" aria-label="필수항목"></i> <!----><a role="button" ng-click="vm.func.showHelpLayerForDetailContent()" ng-if="::!vm.isMobile" href=""><i class="fn fn-help1 text-primary" aria-hidden="true"></i> <span class="sr-only">도움말</span></a><!----></label><div class="col-lg-10 col-sm-9 col-xs-6 input-content"><div class="set-option no-set" ng-class="{'no-set': !vm.viewData.isConfig}"> <a class="btn btn-default active" ng-class="{ active: vm.viewData.isMenuOpen}" href=""><span class="sr-only">메뉴토글</span></a></div></div></div><!----><div class="input-content inner-content" ng-if="vm.viewData.isMenuOpen || (vm.viewData.isConfig &amp;&amp; vm.productFormViewVO.readOnly)"><div class="form-section-sub"><div class="form-sub-wrap"><ncp-editor-form editor-content="vm.product.detailContent.productDetailInfoContent" editor-type="vm.product.detailContent.editorType" guide-content="vm.editorGuideContent" button-disabeld="vm.productFormViewVO.readOnly" only-editor-usable="vm.viewData.editor.onlyEditorUsable" required="true" parent-id="'product_form_' + vm.product.id"><div class="seller-product-detail seller-tap-wrapper"><ul class="seller-tap" role="tablist" ng-hide="vm.onlyEditorUsable"><li role="tab" ng-attr-aria-selected="{{vm.editorType !== vm.CONSTANTS.EDITOR_TYPE.NONE}}" aria-selected="true"><a role="button" href="" ng-disabled="vm.disabled" ng-click="vm.func.changeEditorType(vm.CONSTANTS.EDITOR_TYPE.SEONE)"><span>직접 작성</span></a></li><li role="tab" ng-attr-aria-selected="{{vm.editorType === vm.CONSTANTS.EDITOR_TYPE.NONE}}" aria-selected="false"><a role="button" href="" ng-disabled="vm.disabled" ng-click="vm.func.changeEditorType(vm.CONSTANTS.EDITOR_TYPE.NONE)"><span>HTML 작성</span></a></li></ul><!----><div class="content" ng-if="vm.editorType !== vm.CONSTANTS.EDITOR_TYPE.NONE"><div class="form-group sr-only"><textarea name="editorContent" style="visibility: hidden; opacity: 0" ng-model="vm.isNotEditorDocumentEmpty" ng-disabled="vm.disabled" ng-required="vm.required" ncp-message-container="#error-message-detail-content" class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" required="required"></textarea></div><p class="ico-status"><i class="fn-shopping fn-65 fn-shopping-caution1 icon-color-big" aria-hidden="true" ng-class="vm.func.isModifyMode() ? 'fn-shopping-confirm1 text-info' :'fn-shopping-caution1 icon-color-big'"></i></p><p class="mg-bottom text-larger" ng-class="vm.func.isModifyMode() ? 'text-info' : ''">작성된 내용이 없습니다.</p><p class="text-muted"><i class="inline-block sp-editorone-logo-black-16 sp-editorone-logo-black-16-dims vertical-icon-middle"></i><span class="sr-only">스마트 에디터 ONE</span>&nbsp;<br class="visible-xs">PC/모바일 어디서나 수정 가능합니다.</p><p class="btn-area"><button class="btn btn-primary btn-lg" type="button" ng-disabled="vm.disabled" ng-click="vm.func.openEditor($event)"><i class="inline-block sp-editorone-logo-white-24 sp-editorone-logo-white-24-dims vertical-icon-middle"></i><span class="sr-only">스마트 에디터 ONE</span> 으로 작성 <i class="fn-booking fn-booking-forward1" aria-hidden="true"></i></button></p></div><!----><!----></div><div id="error-message-detail-content" class="mg-bottom"></div><!----><div class="sub-text detail-content-info" ng-if="vm.guideContent"><ng-bind-html ng-bind-html="vm.guideContent"><span class="sub-text text-danger">외부 링크(네이버 폼 등)를 통한 개인정보(휴대폰 번호, 이메일 주소) 수집은 금지되므로 등록시 노출이 제재될 수 있습니다. <a href="https://ips.smartstore.naver.com/main/rules/safety/steal" target="_blank" class="btn-link">개인정보보호정책<i class="fn-shopping fn-shopping-forward2"></i></a><br></span><p class="sub-text text-primary">
						상품명과 직접적 관련 없는 상세설명, 외부 링크 입력 시 관리자에 의해 판매 금지 될 수 있습니다.<br>
						<a href="http://ips.smartstore.naver.com/main/rules/safety" target="_blank" class="btn-link">안전거래정책</a>에 위배될 경우 관리자에 의해 제재조치가 있을 수 있습니다.<br>
						네이버 이외의 외부링크, 일부 스크립트 및 태그는 자동 삭제될 수 있습니다.<br>
						상세설명 권장 크기 : 가로 860px
					</p></ng-bind-html></div><!----><div class="detail-content btn-group-lg"><a role="button" href="" class="btn btn-primary ng-hide" ng-disabled="vm.disabled" ng-show="vm.editorType === 'NONE'" ng-click="vm.func.preview(vm.editorType, vm.editorContent, false)"><i class="fn fn-pc1 fn-18" aria-hidden="true"></i> PC 미리보기 </a><a role="button" href="" class="btn btn-primary ng-hide" ng-disabled="vm.disabled" ng-show="vm.editorType === 'NONE'" ng-click="vm.func.preview(vm.editorType, vm.editorContent, true)"><i class="fn fn-smartphone2 fn-18" aria-hidden="true"></i> 모바일 미리보기 </a><a role="button" href="" class="btn btn-default" ng-disabled="vm.disabled" ng-show="vm.editorType !== 'NONE'" ng-click="vm.func.openGuideModal()"><i class="inline-block sp-editorone-logo-black-24 sp-editorone-logo-black-24-dims vertical-icon-middle"></i><span class="sr-only">스마트 에디터 ONE</span> <em class="txt">쉽게 작성하는 방법<i class="fn-shopping fn-shopping-forward2 text-muted" aria-hidden="true"></i></em> </a><!----><a role="button" href="" class="btn btn-default2 ng-hide" ng-disabled="vm.disabled" ng-click="vm.func.reset()" ng-hide="vm.func.isEditorDocumentEmpty()" ng-if="::!vm.isMobile"><i class="fn fn-refresh fn-auto-size" aria-hidden="true"></i> 초기화</a><!----><div class="btn-group-lg"><a role="button" href="" class="btn btn-default ng-hide" ng-disabled="vm.disabled" ng-show="vm.editorType === 'NONE'" ng-click="vm.func.editorLoadForHtml($event)"><i class="inline-block sp-editorone-logo-black-24 sp-editorone-logo-black-24-dims vertical-icon-middle"></i><span class="sr-only">스마트 에디터 ONE</span> <em class="txt">으로 변환하기 (1회성)</em></a></div><!----></div></ncp-editor-form></div></div></div><!----></div></ui-view>
					<!-- 상품 상세설명 등록 끝 -->
				
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