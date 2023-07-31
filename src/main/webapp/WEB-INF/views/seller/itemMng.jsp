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

    <title>seller/itemMng</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">
    
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css">

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
                    <h1 class="h3 mb-2 text-gray-800">상품처리</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net"> official DataTables documentation</a>.</p>
                    <!-- 페이지 상단 끝 -->   
                    
                    <!-- 검색바, 카테고리, 기간설정 시작 -->
					<ui-view name="search"><!---->
					<div class="panel panel-seller"
						ng-include="'shared/products/origin-list/include/search-condition-area.html.inc'">
						<form name="vm.searchForm" novalidate="" ng-submit="vm.func.search()"
							class="ng-pristine ng-valid-pattern ng-valid-max-size-by-split ng-valid-maxlength ng-valid-date-time-input ng-invalid ng-invalid-required">
							<div class="panel-body">
								<div class="seller-search-section">
									<ul class="seller-list-border">
										<!---->
										<!---->
										<li><label class="control-label">검색어</label>
										<div class="input-content narrow-area">
												<div class="form-inline form-group-horizontal">
													<!---->
													<div class="form-group" ng-if="vm.app === 'CENTER'">
														<div class="seller-input narrow-input">
															<!---->
															<div
																ng-repeat="type in ::vm.enums['ProductSearchKeywordType'].getGroupValues('PC_GROUP')">
																<label><input type="radio" name="searchKeywordType"
																	value="CHANNEL_PRODUCT_NO"
																	ng-model="vm.searchFormData.searchKeywordType"
																	ng-click="vm.func.changeSearchKeywordType(type.name)"
																	data-nclicks-code="swd.number"
																	class="ng-pristine ng-untouched ng-valid ng-not-empty">상품번호<span></span></label>
																<!---->
																<a href="" role="button" class="font-icon-button"
																	ng-if="vm.tooltip[type.name]" data-nclicks-code="swd.help"
																	uib-popover-html="'<ul class=&quot;seller-ul-list&quot;><li>상품이 가지고 있는 unique한 고유 번호를 말합니다.</li><li>상품번호는 사이트 주소에 노출되므로 사이트 주소로 상품번호를 확인할 수 있습니다.</li><li>스마트스토어 : http://smartstore.naver.com/main/products/상품번호</li><li>윈도 : http://shoppingw.naver.com/itemdetail/상품번호</li></ul>'"
																	popover-trigger="'outsideClick'"
																	popover-placement="bottom-left"
																	popover-append-to-body="true"><i class="fn fn-info1"
																	aria-hidden="true"></i><span class="sr-only">툴팁</span></a>
																<!---->
															</div>
															<!---->
															<div
																ng-repeat="type in ::vm.enums['ProductSearchKeywordType'].getGroupValues('PC_GROUP')">
																<label><input type="radio" name="searchKeywordType"
																	value="SELLER_CODE"
																	ng-model="vm.searchFormData.searchKeywordType"
																	ng-click="vm.func.changeSearchKeywordType(type.name)"
																	data-nclicks-code="swd.code"
																	class="ng-pristine ng-untouched ng-valid ng-not-empty">판매자상품코드<span></span></label>
																<!---->
															</div>
															<!---->
														</div>
													</div>
													<!---->
													<!---->
													<div class="form-group">
														<textarea
															class="form-control textarea-vertical ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-max-size-by-split"
															rows="3" placeholder="복수 검색 
					(enter 또는 “,” 로 구분)"
															title="검색어 입력" ng-model="vm.searchFormData.searchKeyword"
															ng-pattern="^[0-9,
					]+" ng-pattern-err-type="numberCommaEnter"
															ncp-max-size-by-split=""
															ncp-max-size-by-split-params="{&quot;maxSize&quot;: 1000, &quot;splitPatternCode&quot;: &quot;CommaEnter&quot;}">                            </textarea>
													</div>
													<div class="form-group">
														<div class="wrap-horizontal"
															id="error_searchKeyword_productName">
															<div class="form-group form-control-static">
																<label for="prd_name">상품명</label>
															</div>
															<div class="form-group">
																<div class="seller-input-wrap">
																	<input type="text"
																		class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-maxlength"
																		id="prd_name" name="productName"
																		ng-model="vm.searchFormData.productName" maxlength="100"
																		maxlength-err-type="max.product.productName"
																		ng-pattern="/^[^\\*?&quot;<>]+$/"
																		ng-pattern-err-type="invalidSpecialCharacter"
																		ncp-message-container="#error_searchKeyword_productName"
																		ncp-input-clear=""><a role="button"
																		class="btn-clear" tabindex="-1" style="display: none;"><span
																		aria-label="삭제">×</span></a>
																</div>
															</div>
														</div>
														<div class="wrap-horizontal" id="error_searchKeyword_modelName">
															<div class="form-group form-control-static">
																<label for="model_name">모델명</label>
															</div>
															<div class="form-group">
																<div class="seller-input-wrap">
																	<input type="text"
																		class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-maxlength"
																		id="model_name" name="modelName"
																		ng-model="vm.searchFormData.modelName" maxlength="150"
																		maxlength-err-type="max.product.modelName"
																		ng-pattern="/^[^\\*?&quot;<>]+$/"
																		ng-pattern-err-type="invalidSpecialCharacter"
																		ncp-message-container="#error_searchKeyword_modelName"
																		ncp-input-clear=""><a role="button"
																		class="btn-clear" tabindex="-1" style="display: none;"><span
																		aria-label="삭제">×</span></a>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="wrap-horizontal"
															id="error_searchKeyword_manufacturerName">
															<div class="form-group form-control-static">
																<label for="maker_name">제조사명</label>
															</div>
															<div class="form-group">
																<div class="seller-input-wrap">
																	<input type="text"
																		class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-maxlength"
																		id="maker_name" name="manufacturerName"
																		ng-model="vm.searchFormData.manufacturerName"
																		maxlength="30"
																		maxlength-err-type="max.product.manufacturerName"
																		ng-pattern="/^[^\\*?&quot;<>]+$/"
																		ng-pattern-err-type="invalidSpecialCharacter"
																		ncp-message-container="#error_searchKeyword_manufacturerName"
																		ncp-input-clear=""><a role="button"
																		class="btn-clear" tabindex="-1" style="display: none;"><span
																		aria-label="삭제">×</span></a>
																</div>
															</div>
														</div>
														<div class="wrap-horizontal" id="error_searchKeyword_brandName">
															<div class="form-group form-control-static">
																<label for="brand_name">브랜드명</label>
															</div>
															<div class="form-group">
																<div class="seller-input-wrap">
																	<input type="text"
																		class="form-control ng-pristine ng-untouched ng-valid ng-empty ng-valid-pattern ng-valid-maxlength"
																		id="brand_name" name="brandName"
																		ng-model="vm.searchFormData.brandName" maxlength="30"
																		maxlength-err-type="max.product.brandName"
																		ng-pattern="/^[^\\*?&quot;<>]+$/"
																		ng-pattern-err-type="invalidSpecialCharacter"
																		ncp-message-container="#error_searchKeyword_brandName"
																		ncp-input-clear=""><a role="button"
																		class="btn-clear" tabindex="-1" style="display: none;"><span
																		aria-label="삭제">×</span></a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div></li>
										<!---->
										<li ng-if="vm.app === 'CENTER'"><label class="control-label">카테고리</label>
										<div class="input-content">
												<category-search
													selected-category="vm.searchFormData.selectedCategory"
													selectable-level="1"
													exposure-option="vm.config.CategorySearchConfig">
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
																<input type="radio" name="category" class="radio" id="r2_3_3"
																	ng-checked="vm.showSearchTap3"
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
																	readonly="" style="width: 4px;">
															</div>
															<div
																class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
																style="display: none;">
																<div class="selectize-dropdown-content">
																	<div data-value="" data-selectable=""
																		class="option selected active">대분류</div>
																	<div data-value="50000004" data-selectable="" class="option">가구/인테리어</div>
																	<div data-value="50005542" data-selectable="" class="option">도서</div>
																	<div data-value="50000003" data-selectable="" class="option">디지털/가전</div>
																	<div data-value="50000008" data-selectable="" class="option">생활/건강</div>
																	<div data-value="50000007" data-selectable="" class="option">스포츠/레저</div>
																	<div data-value="50000006" data-selectable="" class="option">식품</div>
																	<div data-value="50000009" data-selectable="" class="option">여가/생활편의</div>
																	<div data-value="50000005" data-selectable="" class="option">출산/육아</div>
																	<div data-value="50000000" data-selectable="" class="option">패션의류</div>
																	<div data-value="50000001" data-selectable="" class="option">패션잡화</div>
																	<div data-value="50000002" data-selectable="" class="option">화장품/미용</div>
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
													<div class="form-group"
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
										<!---->
										<li><label class="control-label">기간</label>
										<div class="input-content">
												<div class="form-inline narrow-area"
													ng-class="{'has-error-msg': (vm.searchForm.fromDate.$invalid || vm.searchForm.toDate.$invalid)}">
													<div class="form-group">
														<div
															class="selectize-control ng-pristine ng-untouched ng-valid single"
															style="width: 100px;">
															<div
																class="selectize-input items ng-valid ng-pristine full has-options has-items">
																<div data-value="PROD_REG_DAY" class="item">상품등록일</div>
																<input type="text" autocomplete="off" tabindex="0"
																	readonly=""
																	style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
															</div>
															<div
																class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
																style="display: none; width: 100px; top: 34px; left: 0px; visibility: visible;">
																<div class="selectize-dropdown-content">
																	<div data-value="PROD_REG_DAY" data-selectable=""
																		class="option selected">상품등록일</div>
																	<div data-value="SALE_START_DAY" data-selectable=""
																		class="option">판매시작일</div>
																	<div data-value="SALE_END_DAY" data-selectable=""
																		class="option">판매종료일</div>
																	<div data-value="PROD_MOD_DAY" data-selectable=""
																		class="option">최종수정일</div>
																</div>
															</div>
														</div>
														<select selectize="" placeholder="상품등록일"
															config="::vm.config.periodTypeSelectizeConfig"
															options="::vm.enums['ProductSearchPeriodType'].values"
															ng-model="vm.searchFormData.searchPeriodType"
															style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
															class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
															tabindex="-1"><option value="? string:PROD_REG_DAY ?"
																selected="selected"></option>
															<option value="PROD_REG_DAY">상품등록일</option></select>
													</div>
													<ncp-datetime-range-picker2
														start-date-model="vm.searchFormData.fromDate"
														start-date-name="fromDate"
														end-date-model="vm.searchFormData.toDate"
														end-date-name="toDate"
														date-max="vm.searchFormData.searchPeriodType === 'PROD_REG_DAY' || vm.searchFormData.searchPeriodType === 'PROD_MOD_DAY' ? 'TODAY' : undefined"
														datetime-picker-format-name="DATE"
														date-required="vm.app === 'CENTER' &amp;&amp; vm.func.isRequireDateFormData()"
														date-range-usable="true"
														date-range-option="vm.config.SearchDateRangePickerPeriodOptions"
														date-markup-option="{onlyDate:true, disabledDateDimmed:true}"
														nclicks-code="spd.cal" nclicks-code-range-button="spd.quick"><!---->
													<div class="form-group" ng-if="vm.dateRangeUsable">
														<div class="btn-toolbar">
															<div class="btn-group"
																ng-class="::{'fix-width-col-4' : vm.dateMarkupOption.buttonFixWidth}"
																ng-attr-data-nclicks-code="{{::vm.nclicksCodeRangeButton}}"
																data-nclicks-code="spd.quick">
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
																	class="form-group _startDate_dropdown seller-datetime-picker _error_start_date_8146779117 dropdown"
																	ng-class="{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																	<div class="input-group dropdown-toggle dropdown_8778057453"
																		data-toggle="dropdown"
																		ng-click="vm.isStartDateShow = !vm.dateDisabled &amp;&amp; true"
																		ng-attr-data-nclicks-code="{{::vm.nclicksCode}}"
																		data-nclicks-code="spd.cal">
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
																			ncp-message-container="._error_start_date_8146779117"
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
																	class="form-group _endDate_dropdown seller-datetime-picker _error_end_date_8923036005 dropdown"
																	ng-class="::{dropdown : !vm.datetimePickerDropUp, dropup : vm.datetimePickerDropUp}">
																	<div class="input-group dropdown-toggle dropdown_9134609450"
																		data-toggle="dropdown"
																		ng-click="vm.isEndDateShow = !vm.dateDisabled &amp;&amp; true"
																		ng-attr-data-nclicks-code="{{::vm.nclicksCode}}"
																		data-nclicks-code="spd.cal">
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
																			ncp-message-container="._error_end_date_8923036005"
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
									<button type="submit" class="btn btn-primary"
										ng-click="vm.viewData.selectedProductStatusType = undefined"
										data-nclicks-code="sgn.search">검색</button>
									<button type="button" class="btn btn-default"
										ng-click="vm.func.reset()" data-nclicks-code="sgn.reset">초기화</button>
									<button type="button" class="btn btn-default btn-right active"
										ng-class="{active: vm.viewData.detailSearchAreaHide}"
										ng-click="vm.viewData.detailSearchAreaHide = !vm.viewData.detailSearchAreaHide"
										data-nclicks-code="sss.open">
										상세검색 <i class="fn fn-down2"
											ng-class="vm.viewData.detailSearchAreaHide ? 'fn-down2' : 'fn-up2'"
											aria-hidden="true"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					</ui-view>
					<!-- 검색바, 카테고리, 기간설정 끝 -->
					
					<!-- 상품목록 시작 -->
					<ui-view name="list">
					<div class="panel panel-seller">
						<div class="panel-heading">
							<div class="pull-left">
								<h3 class="panel-title">
									상품목록 (총 <span class="text-primary">0</span>개)
								</h3>
							</div>
							<div class="pull-right">
								<div class="form-inline narrow-area mobile-inline">
									<div class="form-group form-group-sm">
										<div
											class="selectize-control ng-pristine ng-untouched ng-valid single"
											style="width: 140px;">
											<div
												class="selectize-input items ng-valid ng-pristine full has-options has-items">
												<div data-value="REG_DATE" class="item">상품등록일순</div>
												<input type="text" autocomplete="off" tabindex="0" readonly=""
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
											</div>
											<div
												class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
												style="display: none; width: 140px; top: 30px; left: 0px;">
												<div class="selectize-dropdown-content">
													<div data-value="NAME" data-selectable="" class="option">상품명순</div>
													<div data-value="SELLER_CODE" data-selectable="" class="option">판매자상품코드순</div>
													<div data-value="LOW_PRICE" data-selectable="" class="option">판매가
														낮은순</div>
													<div data-value="HIGH_PRICE" data-selectable="" class="option">판매가
														높은순</div>
													<div data-value="REG_DATE" data-selectable=""
														class="option selected active">상품등록일순</div>
													<div data-value="MOD_DATE" data-selectable="" class="option">상품수정일순</div>
													<div data-value="SALE_START" data-selectable="" class="option">판매시작일순</div>
													<div data-value="SALE_END" data-selectable="" class="option">판매종료일순</div>
													<div data-value="POPULARITY" data-selectable="" class="option">인기도순</div>
													<div data-value="ACCUMULATE_SALE" data-selectable=""
														class="option">누적판매건수순</div>
													<div data-value="LOW_DISCOUNT_PRICE" data-selectable=""
														class="option">할인가 낮은순</div>
												</div>
											</div>
										</div>
										<select selectize="" placeholder="최신등록순"
											style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
											config="vm.config.SearchOrderSelectizeConfig"
											options="::vm.config.ProductSearchOrderTypeOptions"
											ng-model="vm.searchFormData.searchOrderType"
											class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
											tabindex="-1"><option value="? string:REG_DATE ?"
												selected="selected"></option>
											<option value="REG_DATE">상품등록일순</option></select>
										<div
											class="selectize-control ng-pristine ng-untouched ng-valid single"
											style="width: 95px;">
											<div
												class="selectize-input items ng-valid ng-pristine has-options full has-items">
												<div data-value="100" class="item">100개씩</div>
												<input type="text" autocomplete="off" tabindex="0" readonly=""
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
											</div>
											<div
												class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
												style="display: none; width: 95px; top: 30px; left: 0px;">
												<div class="selectize-dropdown-content">
													<div data-value="50" data-selectable="" class="option">50개씩</div>
													<div data-value="100" data-selectable="" class="option selected">100개씩</div>
													<div data-value="300" data-selectable="" class="option">300개씩</div>
													<div data-value="500" data-selectable="" class="option">500개씩</div>
													<div data-value="1000" data-selectable="" class="option">1000개씩</div>
												</div>
											</div>
										</div>
										<select selectize="" placeholder="100개씩"
											style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
											config="vm.config.PageSizeSelectizeConfig"
											options="vm.config.DefaultPageSize"
											ng-model="vm.searchFormData.viewData.pageSize"
											class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
											tabindex="-1"><option value="100" selected="selected">100개씩</option></select>
										<!---->
										<div
											class="selectize-control excel ng-pristine ng-untouched ng-valid single"
											style="width: 150px;">
											<div
												class="selectize-input items full has-options has-items ng-valid ng-pristine">
												<div data-value="" class="item">엑셀 일괄작업</div>
												<input type="text" autocomplete="off" tabindex="0" readonly=""
													style="width: 4px;">
											</div>
											<div
												class="selectize-dropdown single selectize-control excel ng-pristine ng-untouched ng-valid"
												style="display: none;">
												<div class="selectize-dropdown-content">
													<div data-value="" data-selectable=""
														class="option selected active">엑셀 일괄작업</div>
													<div data-value="PRODUCT_DOWNLOAD" data-selectable=""
														class="option">상품목록 다운로드</div>
													<div data-value="DELIVERY_COMPANY_SEARCH" data-selectable=""
														class="option">택배사코드 다운로드</div>
													<div data-value="EDIT_FORM_DOWNLOAD" data-selectable=""
														class="option">수정양식 다운로드</div>
													<div data-value="EDIT_FROM_UPLOAD" data-selectable=""
														class="option">수정양식 업로드</div>
												</div>
											</div>
										</div>
										<select selectize=""
											class="selectize-control excel ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
											style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
											id="task_excel" config="vm.config.ExcelSelectizeConfig"
											options="::vm.config.ExcelOptions"
											ng-if="::vm.viewData.isExcelBetaUser"
											ng-model="vm.selectExcelTask" tabindex="-1"><option
												value="">엑셀 일괄작업</option></select>
										<!---->
										<!---->
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<!---->
							<div class="seller-btn-group"
								ng-include="'shared/products/origin-list/include/bulk-action-area.html.inc'">
								<!---->
								<div class="seller-btn-left"
									ng-if="vm.app === 'CENTER' || (vm.app === 'ADMIN' &amp;&amp; !vm.config.usableSelectPage)">
									<div class="form-inline narrow-area mobile-inline">
										<div class="form-group">
											<button type="submit" class="btn btn-default btn-sm"
												ng-click="vm.func.changeProductStatus('DELETE')"
												data-nclicks-code="itl.delete">선택삭제</button>
										</div>
										<div class="form-group">
											<div
												class="selectize-control ng-pristine ng-untouched ng-valid single">
												<div
													class="selectize-input items full has-options has-items ng-valid ng-pristine">
													<div data-value="" class="item">판매변경</div>
													<input type="text" autocomplete="off" tabindex="0" readonly=""
														style="width: 4px;">
												</div>
												<div
													class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
													style="display: none;">
													<div class="selectize-dropdown-content">
														<div data-value="" data-selectable=""
															class="option selected active">판매변경</div>
														<div data-value="SALE" data-selectable="" class="option">판매중</div>
														<div data-value="SUSPENSION" data-selectable="" class="option">판매중지</div>
													</div>
												</div>
											</div>
											<select selectize=""
												config="::vm.config.ChangeProductStatusSelectizeConfig"
												options="::vm.config.DefaultChangeableProductStatusTypes"
												ng-model="vm.bulkUpdateAction.productStatusType"
												class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
												tabindex="-1"
												style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
													value="">판매변경</option></select>
											<div
												class="selectize-control ng-pristine ng-untouched ng-valid single">
												<div
													class="selectize-input items full has-options has-items ng-valid ng-pristine">
													<div data-value="" class="item">전시변경</div>
													<input type="text" autocomplete="off" tabindex="0" readonly=""
														style="width: 4px;">
												</div>
												<div
													class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
													style="display: none;">
													<div class="selectize-dropdown-content">
														<div data-value="" data-selectable=""
															class="option selected active">전시변경</div>
														<div data-value="ON" data-selectable="" class="option">전시중</div>
														<div data-value="SUSPENSION" data-selectable="" class="option">전시중지</div>
													</div>
												</div>
											</div>
											<select selectize=""
												config="::vm.config.ChangeChannelProductDisplayStatusSelectizeConfig"
												options="::vm.config.DefaultChangeableChannelProductDisplayStatusTypes"
												ng-model="vm.bulkUpdateAction.channelProductDisplayStatusType"
												class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
												tabindex="-1"
												style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
													value="">전시변경</option></select>
										</div>
										<!---->
										<!---->
										<!---->
										<div class="form-group btn-group-sm" ng-if="vm.app === 'CENTER'">
											<!---->
											<button type="button" class="btn btn-default"
												ng-repeat="productBulkUpdateDisplayType in vm.enums['ProductBulkUpdateDisplayType'].getGroupValues('BUTTON_GROUP')"
												ng-click="vm.func.openBulkUpdateModal(productBulkUpdateDisplayType.name)"
												data-nclicks-code="itl.discount">즉시할인 설정</button>
											<!---->
											<button type="button" class="btn btn-default"
												ng-repeat="productBulkUpdateDisplayType in vm.enums['ProductBulkUpdateDisplayType'].getGroupValues('BUTTON_GROUP')"
												ng-click="vm.func.openBulkUpdateModal(productBulkUpdateDisplayType.name)"
												data-nclicks-code="itl.price">판매가 변경</button>
											<!---->
											<button type="button" class="btn btn-default"
												ng-repeat="productBulkUpdateDisplayType in vm.enums['ProductBulkUpdateDisplayType'].getGroupValues('BUTTON_GROUP')"
												ng-click="vm.func.openBulkUpdateModal(productBulkUpdateDisplayType.name)"
												data-nclicks-code="itl.period">판매기간 변경</button>
											<!---->
											<div
												class="selectize-control ng-pristine ng-untouched ng-valid single">
												<div
													class="selectize-input items full has-options has-items ng-valid ng-pristine">
													<div data-value="" class="item">배송변경</div>
													<input type="text" autocomplete="off" tabindex="0" readonly=""
														style="width: 4px;">
												</div>
												<div
													class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
													style="display: none;">
													<div class="selectize-dropdown-content">
														<div data-value="" data-selectable=""
															class="option selected active">배송변경</div>
														<div data-value="DELIVERY" data-selectable="" class="option">배송정보</div>
													</div>
												</div>
											</div>
											<select selectize=""
												config="::vm.config.BulkUpdateSelectizeConfig"
												options="::vm.config.ProductDeliveryBulkUpdateDisplayTypes"
												ng-model="vm.bulkUpdateAction.productDeliveryBulkUpdateDisplayType"
												class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
												tabindex="-1"
												style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
													value="">배송변경</option></select>
										</div>
										<!---->
										<!---->
										<div class="form-group" ng-if="vm.app === 'CENTER'">
											<div
												class="selectize-control ng-pristine ng-untouched ng-valid single"
												style="width: 130px;">
												<div
													class="selectize-input items full has-options has-items ng-valid ng-pristine">
													<div data-value="" class="item">일괄변경</div>
													<input type="text" autocomplete="off" tabindex="0" readonly=""
														style="width: 4px;">
												</div>
												<div
													class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
													style="display: none; width: 130px; top: 30px; left: 0px;">
													<div class="selectize-dropdown-content">
														<div data-value="" data-selectable=""
															class="option selected active">일괄변경</div>
														<div data-value="EVENT_PHRASE" data-selectable=""
															class="option">이벤트문구</div>
														<div data-value="PURCHASE_BENEFIT" data-selectable=""
															class="option">구매/혜택</div>
														<div data-value="PURCHASE_QUANTITY_LIMIT" data-selectable=""
															class="option">구매수량제한</div>
														<div data-value="PRODUCT_INFO_PROVIDED_NOTICE"
															data-selectable="" class="option">상품정보제공고시</div>
														<div data-value="ORIGIN_AREA" data-selectable="" class="option">원산지</div>
														<div data-value="AS" data-selectable="" class="option">A/S,
															특이사항</div>
														<div data-value="MANUFACTURER_BRAND" data-selectable=""
															class="option">브랜드/제조사</div>
														<div data-value="EP" data-selectable="" class="option">가격비교사이트
															설정</div>
														<div data-value="PRODUCT_SNAP" data-selectable=""
															class="option">모바일미리보기 생성</div>
													</div>
												</div>
											</div>
											<select selectize="" placeholder="일괄변경"
												style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
												config="::vm.config.BulkUpdateSelectizeConfig"
												options="::vm.config.ProductBulkUpdateDisplayTypes"
												ng-model="vm.bulkUpdateAction.productBulkUpdateDisplayType"
												ng-disabled="vm.simpleAccountInfo.branchUseYn"
												class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-empty"
												tabindex="-1"><option value="">일괄변경</option></select>
										</div>
										<!---->
									</div>
								</div>
								<!---->
								<!---->
								<div class="seller-btn-right"
									ng-if="vm.app === 'CENTER' &amp;&amp; !vm.simpleAccountInfo.branchUseYn">
									<button type="button" class="btn btn-primary btn-sm"
										ng-click="vm.func.editGrid()" data-nclicks-code="itl.edit">수정저장</button>
								</div>
								<!---->
							</div>
							<div class="seller-btn-group">
								<p class="text-primary">관리자 검수가 필요한 채널 ‘쇼핑윈도’의 경우에는 전시상태를 직접 변경하실
									수 없습니다.</p>
								<!---->
							</div>
							<div class="seller-grid-area">
								<div ag-grid="vm.grid.GridOptions" class="ag-theme-fresh"
									style="width: 100%; height: 500px;">
									<div class="ag-root-wrapper ag-layout-normal ag-ltr">
										<div class="ag-root-wrapper-body ag-layout-normal"
											ref="rootWrapperBody">
											<!--AG-GRID-COMP-->
											<div class="ag-root ag-unselectable ag-layout-normal" role="grid"
												unselectable="on" ref="gridPanel" aria-rowcount="1">
												<!--AG-HEADER-ROOT-->
												<div class="ag-header ag-pivot-off" role="presentation"
													ref="headerRoot" unselectable="on"
													style="height: 40px; min-height: 40px;">
													<div class="ag-pinned-left-header" ref="ePinnedLeftHeader"
														role="presentation"
														style="width: 465px; max-width: 465px; min-width: 465px;">
														<div class="ag-header-row" role="row" aria-rowindex="1"
															style="top: 0px; height: 40px; width: 465px;">
															<div class="ag-header-cell" role="presentation"
																unselectable="on" col-id="0" style="width: 35px; left: 0px;">
																<!--AG-CHECKBOX-->
																<div
																	class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																	role="presentation" ref="cbSelectAll">
																	<label ref="eLabel" class="ag-hidden"></label>
																	<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																		role="presentation">
																		<input ref="eInput" type="checkbox" class="ag-hidden">
																		<div>
																			<i class="seller-icon grid-checkbox-unchecked"
																				aria-label="선택안함"></i>
																		</div>
																	</div>
																</div>
																<div>
																	<div class="seller-input ag-header-cell-label">
																		<label><input type="checkbox"
																			class="ag-selection-checkbox"
																			data-nclicks-code="itg.allcheck"><span
																			class="ag-header-cell-text"></span></label>
																	</div>
																</div>
															</div>
															<div class="ag-header-cell" role="presentation"
																unselectable="on" col-id="edit"
																style="width: 60px; left: 35px;">
																<div ref="eResize" class="ag-header-cell-resize"
																	role="presentation"></div>
																<!--AG-CHECKBOX-->
																<div
																	class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																	role="presentation" ref="cbSelectAll">
																	<label ref="eLabel" class="ag-hidden"></label>
																	<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																		role="presentation">
																		<input ref="eInput" type="checkbox" class="ag-hidden">
																		<div>
																			<i class="seller-icon grid-checkbox-unchecked"
																				aria-label="선택안함"></i>
																		</div>
																	</div>
																</div>
																<div class="ag-cell-label-container" role="presentation">
																	<div ref="eLabel" class="ag-header-cell-label"
																		role="presentation" unselectable="on">
																		<span ref="eText" class="ag-header-cell-text"
																			role="columnheader" unselectable="on">수정</span> <span
																			ref="eFilter"
																			class="ag-header-icon ag-filter-icon ag-hidden"
																			aria-hidden="true"><span
																			class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																	</div>
																</div>
															</div>
															<div class="ag-header-cell" role="presentation"
																unselectable="on" col-id="copy"
																style="width: 60px; left: 95px;">
																<div ref="eResize" class="ag-header-cell-resize"
																	role="presentation"></div>
																<!--AG-CHECKBOX-->
																<div
																	class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																	role="presentation" ref="cbSelectAll">
																	<label ref="eLabel" class="ag-hidden"></label>
																	<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																		role="presentation">
																		<input ref="eInput" type="checkbox" class="ag-hidden">
																		<div>
																			<i class="seller-icon grid-checkbox-unchecked"
																				aria-label="선택안함"></i>
																		</div>
																	</div>
																</div>
																<div class="ag-cell-label-container" role="presentation">
																	<div ref="eLabel" class="ag-header-cell-label"
																		role="presentation" unselectable="on">
																		<span ref="eText" class="ag-header-cell-text"
																			role="columnheader" unselectable="on">복사</span> <span
																			ref="eFilter"
																			class="ag-header-icon ag-filter-icon ag-hidden"
																			aria-hidden="true"><span
																			class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																	</div>
																</div>
															</div>
															<div class="ag-header-cell" role="presentation"
																unselectable="on" col-id="sellerManagementCode"
																style="width: 150px; left: 315px;">
																<div ref="eResize" class="ag-header-cell-resize"
																	role="presentation"></div>
																<!--AG-CHECKBOX-->
																<div
																	class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																	role="presentation" ref="cbSelectAll">
																	<label ref="eLabel" class="ag-hidden"></label>
																	<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																		role="presentation">
																		<input ref="eInput" type="checkbox" class="ag-hidden">
																		<div>
																			<i class="seller-icon grid-checkbox-unchecked"
																				aria-label="선택안함"></i>
																		</div>
																	</div>
																</div>
																<div class="ag-cell-label-container" role="presentation">
																	<div ref="eLabel" class="ag-header-cell-label"
																		role="presentation" unselectable="on">
																		<span ref="eText" class="ag-header-cell-text"
																			role="columnheader" unselectable="on">판매자상품코드</span> <span
																			ref="eFilter"
																			class="ag-header-icon ag-filter-icon ag-hidden"
																			aria-hidden="true"><span
																			class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																	</div>
																</div>
															</div>
															<div class="ag-header-cell" role="presentation"
																unselectable="on" col-id="storefarmChannelProductNo"
																style="width: 160px; left: 155px;">
																<div ref="eResize" class="ag-header-cell-resize"
																	role="presentation"></div>
																<!--AG-CHECKBOX-->
																<div
																	class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																	role="presentation" ref="cbSelectAll">
																	<label ref="eLabel" class="ag-hidden"></label>
																	<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																		role="presentation">
																		<input ref="eInput" type="checkbox" class="ag-hidden">
																		<div>
																			<i class="seller-icon grid-checkbox-unchecked"
																				aria-label="선택안함"></i>
																		</div>
																	</div>
																</div>
																<div class="ag-cell-label-container" role="presentation">
																	<div ref="eLabel" class="ag-header-cell-label"
																		role="presentation" unselectable="on">
																		<span ref="eText" class="ag-header-cell-text"
																			role="columnheader" unselectable="on">상품번호(스마트스토어)</span>
																		<span ref="eFilter"
																			class="ag-header-icon ag-filter-icon ag-hidden"
																			aria-hidden="true"><span
																			class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="ag-header-viewport" ref="eHeaderViewport"
														role="presentation">
														<div class="ag-header-container" ref="eHeaderContainer"
															role="rowgroup" style="width: 7630px;">
															<div class="ag-header-row" role="row" aria-rowindex="1"
																style="top: 0px; height: 40px; width: 7630px;">
																<div class="ag-header-cell" role="presentation"
																	unselectable="on" col-id="payExposure"
																	style="width: 80px; left: 0px;">
																	<div ref="eResize" class="ag-header-cell-resize"
																		role="presentation"></div>
																	<!--AG-CHECKBOX-->
																	<div
																		class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																		role="presentation" ref="cbSelectAll">
																		<label ref="eLabel" class="ag-hidden"></label>
																		<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																			role="presentation">
																			<input ref="eInput" type="checkbox" class="ag-hidden">
																			<div>
																				<i class="seller-icon grid-checkbox-unchecked"
																					aria-label="선택안함"></i>
																			</div>
																		</div>
																	</div>
																	<div class="ag-cell-label-container" role="presentation">
																		<div ref="eLabel" class="ag-header-cell-label"
																			role="presentation" unselectable="on">
																			<span ref="eText" class="ag-header-cell-text"
																				role="columnheader" unselectable="on">결제여부</span> <span
																				ref="eFilter"
																				class="ag-header-icon ag-filter-icon ag-hidden"
																				aria-hidden="true"><span
																				class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																		</div>
																	</div>
																</div>
																<div class="ag-header-cell" role="presentation"
																	unselectable="on" col-id="productName"
																	style="width: 200px; left: 80px;">
																	<div ref="eResize" class="ag-header-cell-resize"
																		role="presentation"></div>
																	<!--AG-CHECKBOX-->
																	<div
																		class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																		role="presentation" ref="cbSelectAll">
																		<label ref="eLabel" class="ag-hidden"></label>
																		<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																			role="presentation">
																			<input ref="eInput" type="checkbox" class="ag-hidden">
																			<div>
																				<i class="seller-icon grid-checkbox-unchecked"
																					aria-label="선택안함"></i>
																			</div>
																		</div>
																	</div>
																	<div class="ag-cell-label-container" role="presentation">
																		<div ref="eLabel" class="ag-header-cell-label"
																			role="presentation" unselectable="on">
																			<span ref="eText" class="ag-header-cell-text"
																				role="columnheader" unselectable="on">상품명</span> <span
																				ref="eFilter"
																				class="ag-header-icon ag-filter-icon ag-hidden"
																				aria-hidden="true"><span
																				class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																		</div>
																	</div>
																</div>
																<div class="ag-header-cell" role="presentation"
																	unselectable="on" col-id="stormFarmChannelProductName"
																	style="width: 180px; left: 280px;">
																	<div ref="eResize" class="ag-header-cell-resize"
																		role="presentation"></div>
																	<!--AG-CHECKBOX-->
																	<div
																		class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																		role="presentation" ref="cbSelectAll">
																		<label ref="eLabel" class="ag-hidden"></label>
																		<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																			role="presentation">
																			<input ref="eInput" type="checkbox" class="ag-hidden">
																			<div>
																				<i class="seller-icon grid-checkbox-unchecked"
																					aria-label="선택안함"></i>
																			</div>
																		</div>
																	</div>
																	<div class="ag-cell-label-container" role="presentation">
																		<div ref="eLabel" class="ag-header-cell-label"
																			role="presentation" unselectable="on">
																			<span ref="eText" class="ag-header-cell-text"
																				role="columnheader" unselectable="on">스마트스토어전용 상품명</span>
																			<span ref="eFilter"
																				class="ag-header-icon ag-filter-icon ag-hidden"
																				aria-hidden="true"><span
																				class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																		</div>
																	</div>
																</div>
																<div class="ag-header-cell" role="presentation"
																	unselectable="on" col-id="windowsChannelProductName"
																	style="width: 140px; left: 460px;">
																	<div ref="eResize" class="ag-header-cell-resize"
																		role="presentation"></div>
																	<!--AG-CHECKBOX-->
																	<div
																		class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																		role="presentation" ref="cbSelectAll">
																		<label ref="eLabel" class="ag-hidden"></label>
																		<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																			role="presentation">
																			<input ref="eInput" type="checkbox" class="ag-hidden">
																			<div>
																				<i class="seller-icon grid-checkbox-unchecked"
																					aria-label="선택안함"></i>
																			</div>
																		</div>
																	</div>
																	<div class="ag-cell-label-container" role="presentation">
																		<div ref="eLabel" class="ag-header-cell-label"
																			role="presentation" unselectable="on">
																			<span ref="eText" class="ag-header-cell-text"
																				role="columnheader" unselectable="on">쇼핑윈도전용 상품명</span> <span
																				ref="eFilter"
																				class="ag-header-icon ag-filter-icon ag-hidden"
																				aria-hidden="true"><span
																				class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																		</div>
																	</div>
																</div>
																<div class="ag-header-cell" role="presentation"
																	unselectable="on" col-id="detailContent"
																	style="width: 90px; left: 600px;">
																	<div ref="eResize" class="ag-header-cell-resize"
																		role="presentation"></div>
																	<!--AG-CHECKBOX-->
																	<div
																		class="ag-header-select-all ag-labeled ag-label-align-right ag-checkbox ag-hidden"
																		role="presentation" ref="cbSelectAll">
																		<label ref="eLabel" class="ag-hidden"></label>
																		<div ref="eWrapper" class="ag-wrapper ag-input-wrapper"
																			role="presentation">
																			<input ref="eInput" type="checkbox" class="ag-hidden">
																			<div>
																				<i class="seller-icon grid-checkbox-unchecked"
																					aria-label="선택안함"></i>
																			</div>
																		</div>
																	</div>
																	<div class="ag-cell-label-container" role="presentation">
																		<div ref="eLabel" class="ag-header-cell-label"
																			role="presentation" unselectable="on">
																			<span ref="eText" class="ag-header-cell-text"
																				role="columnheader" unselectable="on">상세설명</span> <span
																				ref="eFilter"
																				class="ag-header-icon ag-filter-icon ag-hidden"
																				aria-hidden="true"><span
																				class="ag-icon ag-icon-filter" unselectable="on"></span></span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="ag-pinned-right-header ag-hidden"
														ref="ePinnedRightHeader" role="presentation"
														style="width: 0px; max-width: 0px; min-width: 0px;">
														<div class="ag-header-row" role="row" aria-rowindex="1"
															style="top: 0px; height: 40px; width: 0px;"></div>
													</div>
												</div>
												<div class="ag-floating-top" ref="eTop" role="presentation"
													unselectable="on"
													style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
													<div class="ag-pinned-left-floating-top" ref="eLeftTop"
														role="presentation" unselectable="on"
														style="width: 465px; max-width: 465px; min-width: 465px;"></div>
													<div class="ag-floating-top-viewport" ref="eTopViewport"
														role="presentation" unselectable="on">
														<div class="ag-floating-top-container" ref="eTopContainer"
															role="presentation" unselectable="on" style="width: 7630px;"></div>
													</div>
													<div class="ag-pinned-right-floating-top ag-hidden"
														ref="eRightTop" role="presentation" unselectable="on"></div>
													<div class="ag-floating-top-full-width-container ag-hidden"
														ref="eTopFullWidthContainer" role="presentation"
														unselectable="on"></div>
												</div>
												<div
													class="ag-body-viewport ag-layout-normal ag-row-no-animation"
													ref="eBodyViewport" role="presentation" unselectable="on">
													<div class="ag-pinned-left-cols-container" ref="eLeftContainer"
														role="presentation" unselectable="on"
														style="height: 1px; width: 465px; max-width: 465px; min-width: 465px;"></div>
													<div class="ag-center-cols-clipper" ref="eCenterColsClipper"
														role="presentation" unselectable="on" style="height: 1px;">
														<div class="ag-center-cols-viewport" ref="eCenterViewport"
															role="presentation" unselectable="on"
															style="height: calc(100% + 23px);">
															<div class="ag-center-cols-container" ref="eCenterContainer"
																role="rowgroup" unselectable="on"
																style="width: 7630px; height: 1px;"></div>
														</div>
													</div>
													<div class="ag-pinned-right-cols-container ag-hidden"
														ref="eRightContainer" role="presentation" unselectable="on"
														style="height: 1px;"></div>
													<div class="ag-full-width-container" ref="eFullWidthContainer"
														role="presentation" unselectable="on" style="height: 1px;"></div>
												</div>
												<div class="ag-floating-bottom" ref="eBottom" role="presentation"
													unselectable="on"
													style="min-height: 0px; height: 0px; display: none; overflow-y: hidden;">
													<div class="ag-pinned-left-floating-bottom" ref="eLeftBottom"
														role="presentation" unselectable="on"
														style="width: 465px; max-width: 465px; min-width: 465px;"></div>
													<div class="ag-floating-bottom-viewport" ref="eBottomViewport"
														role="presentation" unselectable="on">
														<div class="ag-floating-bottom-container"
															ref="eBottomContainer" role="presentation" unselectable="on"
															style="width: 7630px;"></div>
													</div>
													<div class="ag-pinned-right-floating-bottom ag-hidden"
														ref="eRightBottom" role="presentation" unselectable="on"></div>
													<div class="ag-floating-bottom-full-width-container ag-hidden"
														ref="eBottomFullWidthContainer" role="presentation"
														unselectable="on"></div>
												</div>
												<div class="ag-body-horizontal-scroll"
													ref="eHorizontalScrollBody" aria-hidden="true"
													style="height: 23px; max-height: 23px; min-height: 23px;">
													<div class="ag-horizontal-left-spacer"
														ref="eHorizontalLeftSpacer"
														style="width: 465px; max-width: 465px; min-width: 465px;"></div>
													<div class="ag-body-horizontal-scroll-viewport"
														ref="eBodyHorizontalScrollViewport"
														style="height: 23px; max-height: 23px; min-height: 23px;">
														<div class="ag-body-horizontal-scroll-container"
															ref="eBodyHorizontalScrollContainer"
															style="width: 7630px; height: 23px; max-height: 23px; min-height: 23px;"></div>
													</div>
													<div class="ag-horizontal-right-spacer ag-scroller-corner"
														ref="eHorizontalRightSpacer"
														style="width: 0px; max-width: 0px; min-width: 0px;"></div>
												</div>
												<!--AG-OVERLAY-WRAPPER-->
												<div class="ag-overlay" aria-hidden="true" ref="overlayWrapper">
													<div class="ag-overlay-panel">
														<div
															class="ag-overlay-wrapper ag-layout-normal ag-overlay-no-rows-wrapper"
															ref="eOverlayWrapper">
															<div class="result-info">
																<i
																	class="fn-shopping fn-65 fn-shopping-caution1 icon-color-big"
																	aria-hidden="true"></i>
																<p class="title">데이터가 존재하지 않습니다.</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--AG-PAGINATION-->
										<nav class="seller-pagination">
											<span
												class="ag-paging-row-summary-panel _sell_pageRowSummaryPanel"
												style="display: none;"> <span ref="lbFirstRowOnPage"
												class="_sell_firstRowOnPage">0</span>[[TO]] <span
												ref="lbLastRowOnPage" class="_sell_lastRowOnPage">0</span>[[OF]]
												<span ref="lbRecordCount" class="_sell_recordCount">0</span> <span
												ref="lbCurrent" class="_sell_current">0</span> <span
												ref="lbTotal" class="_sell_total">0</span>
											</span>
											<div class="visible-xs">
												<div class="_mobile_pagination" data-nclicks-code="itg.page"></div>
											</div>
											<div class="hidden-xs">
												<ul class="pagination _pc_pagination"
													data-nclicks-code="itg.page"></ul>
											</div>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<!---->
							<div class="seller-btn-area" ng-if="!vm.simpleAccountInfo.branchUseYn">
								<button type="button" class="btn btn-primary btn-lg"
									ng-click="vm.func.editGrid()">수정 항목 저장</button>
							</div>
							<!---->
						</div>
					</div>
					<!---->
					<!----></ui-view>
					<!-- 상품목록 끝 -->
                    
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