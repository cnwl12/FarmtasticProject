<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>seller/sellerMng</title>

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css"
	rel="stylesheet"> 

<!-- Custom styles for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/app.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/pace.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naver/naverCss/vendors.css">

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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">판매자정보</h1>
					</div>
					<!-- 페이지 상단 끝 -->

					<!-- 로그인정보 / 기본정보 시작 -->
					<div class="panel panel-seller"
						id="chargePersonInfoPanelInSellerInfoPage">
						<div class="panel-heading">
							<div class="pull-left">
								<h3 class="panel-title">판매자 정보</h3>
							</div>
							<!---->
						</div>
						<div class="panel-body">
							<ul class="seller-list-border">
								<li>
								<label class="control-label">이름</label>
								<div class="input-content">
									<div class="form-control-static">${seller.seller_name}</div>
								</div>
								</li>
								
								<li>
								<label class="control-label">로그인ID</label>
								<div class="input-content">
									<div class="form-control-static">${seller.seller_id}</div>
								</div>
								</li>
								
								<li>
								<label class="control-label">이메일 주소</label>
								<div class="input-content">
									<div class="form-control-static">${seller.seller_email}</div>
								</div>
								</li>
								
								<li>
								<label class="control-label">휴대폰<br class="visible-xs">번호
								</label>
								<div class="input-content">
									<div class="form-control-static">${seller.seller_mobile}</div>
								</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- 로그인정보 / 기본정보 끝 -->

					<!-- 정산정보 시작 -->
					<div class="panel panel-seller">
						<div class="panel-heading">
							<h3 class="panel-title">정산정보</h3>
						</div>
						<div class="panel-body">
							<ul class="seller-list-border">
								<!---->
								<li
									ng-if="(vm.accountInfo.represent.representType === 'DOMESTIC_PERSONAL' || vm.accountInfo.represent.representType === 'DOMESTIC_BUSINESS')"><label
									class="control-label">정산대금<br class="visible-xs">수령방법
								</label>
								<div class="input-content">
										<div class="form-group">
											<div class="seller-input">
												<!---->
												<label
													ng-repeat="settlementType in vm.enums['SettlementType'].values"><input
													type="radio"
													ng-model="vm.accountInfo.naverPay.settlementType"
													name="settlementType" value="BANKACCOUNT"
													class="ng-pristine ng-untouched ng-valid ng-not-empty">정산대금
													입금계좌<span></span></label>
												<!---->
												<label
													ng-repeat="settlementType in vm.enums['SettlementType'].values"><input
													type="radio"
													ng-model="vm.accountInfo.naverPay.settlementType"
													name="settlementType" value="CHARGEPAY"
													class="ng-pristine ng-untouched ng-valid ng-not-empty">네이버페이
													비즈 월렛<span></span></label>
												<!---->
											</div>
										</div>
										<p class="sub-text text-primary">정산대금 수령방법 변경시 변경일로부터 1영업일
											이후에 적용됩니다.</p>
										<!---->
										<p class="sub-text text-primary"
											ng-if="vm.accountInfo.represent.representType === 'DOMESTIC_PERSONAL'">개인판매자는
											세금계산서발행동의 후 정산대금이 계좌로 정산됩니다.</p>
										<!---->
										<!---->
										<p class="sub-text text-primary"
											ng-if="vm.accountInfo.represent.representType === 'DOMESTIC_PERSONAL'">세금계산서
											발행동의는 정산예정금액이 있을경우, 스마트스토어센터 &gt; 판매자 정보 메뉴에서 동의할 수 있습니다.</p>
										<!---->
									</div></li>
								<!---->
								<!---->
								<li
									ng-if="vm.accountInfo.represent.representType === 'DOMESTIC_PERSONAL' || vm.accountInfo.represent.representType === 'DOMESTIC_BUSINESS'"><label
									class="control-label long-label">정산대금<br
										class="visible-xs">입금계좌
								</label>
								<div class="input-content">
										<div class="form-inline mobile-inline">
											<div class="form-group form-control-static">
												농협 35104******** <span class="text-sub">(예금주:정선진)</span>
											</div>
											<div class="form-group">
												<button type="button" class="btn btn-default2"
													ng-click="vm.openBankAccountInfoModal()"
													data-nclicks-code="settleInfo.changeIndividualSettleBA">변경</button>
											</div>
										</div>
										<!---->
										<p class="sub-text text-primary">
											판매자 정보 메뉴에서 정산계좌 변경이 불가능할 경우 정보변경신청 메뉴에서 변경 신청 해주세요. <a
												ui-sref="main.judgment.modification.input-info"
												href="#/judgment/modification" class="btn-link text-primary"
												data-nclicks-code="settleInfo.changeSettleBA">정보변경신청<i
												class="fn-shopping fn-shopping-forward2" aria-hidden="true"></i></a>
										</p>
									</div></li>
								<!---->
								<!---->
							</ul>
						</div>
					</div>
					<!-- 정산정보 끝 -->

					<!-- 배송정보 시작 -->
					<div class="panel panel-seller">
						<div class="panel-heading">
							<h3 class="panel-title">배송정보</h3>
						</div>
						<div class="panel-body">
							<div class="panel-body-info">
								<span class="pull-left">출고지 주소와 반품/교환지 주소는 주소록에서 수정/변경이
									가능합니다.</span> <span class="pull-right"><button type="button"
										class="btn btn-default2 btn-sm"
										ng-click="vm.openAddressBookModal()"
										data-nclicks-code="dlvInfo.addressBook">주소록</button></span>
							</div>
							<ul class="seller-list-border">
								<li><label class="control-label" for="delivery-addr">출고지
										주소</label>
								<div class="input-content">
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control" value="상품출고지"
													id="delivery-addr" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<input type="text" class="form-control"
												value="(우 : 47246) 부산광역시 부산진구 동천로 109 (삼한골든게이트) "
												title="출고지 주소" readonly="readonly">
										</div>
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control"
													value="010-9170-1021" title="출고지 전화번호1" readonly="readonly">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" value="-"
													title="출고지 전화번호2" readonly="readonly">
											</div>
										</div>
									</div></li>
								<li><label class="control-label long-label"
									for="return-addr">반품/<br class="visible-xs">교환지 주소
								</label>
								<div class="input-content">
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control" value="반품교환지"
													id="return-addr" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<input type="text" class="form-control"
												value="(우 : 47246) 부산광역시 부산진구 동천로 109 (삼한골든게이트) "
												title="반품/교환지 주소" readonly="readonly">
										</div>
										<div class="form-inline">
											<div class="form-group">
												<input type="text" class="form-control"
													value="010-9170-1021" title="반품/교환지 전화번호1"
													readonly="readonly">
											</div>
											<div class="form-group">
												<input type="text" class="form-control" value="-"
													title="반품/교환지 전화번호2" readonly="readonly">
											</div>
										</div>
									</div></li>
								<!---->
								<!---->
								<!---->
							</ul>
						</div>
					</div>
					<!-- 배송정보 끝 -->

					<!-- 관리자권한 시작 -->
					<div class="panel panel-seller" ng-if="vm.authList.length != 0">
						<div class="panel-heading">
							<div class="pull-left">
								<h3 class="panel-title">
									매니저 목록 <em class="bar">|</em> <em class="sub-title sub-text">스마트스토어
										운영 업무 도구, 네이버웍스를 이용해 보세요. <a class="btn btn-primary btn-sm"
										href="" role="button" ng-click="vm.moveToBusinessTool()"
										data-nclicks-code="lineworks.moveto">연결하러 가기</a>
									</em>
								</h3>
							</div>
							<div class="pull-right">
								<button type="button" class="btn btn-default2 btn-sm"
									ng-click="vm.openInviteModal()">매니저 초대</button>
							</div>
						</div>
						<div class="panel-body">
							<div class="panel-body-info">
								<ul class="seller-ul-list">
									<li>매니저 초대를 통해 서브 권한 매니저가 채널을 관리할 수 있습니다.</li>
									<li>스마트스토어에 접속하는 계정 정보는 다른 직원과 공유하지 말고 매니저 초대 기능을 이용해 주세요.</li>
									<li>매니저로 초대하면 스마트스토어의 채널이나 판매 관리 등의 활동을 할 수 있으니, 꼭 필요한 직원만
										초대해 주세요.</li>
									<li>판매자는 주기적으로 매니저 초대 또는 삭제 이력, 매니저가 스마트스토어센터에 접속한 기록을
										관리해야 할 의무가 있습니다.</li>
									<li>매니저 초대, 삭제 이력이나 접속 기록은 고객센터로 문의해 주세요. <a href=""
										ng-click="vm.openHelpIndex()" class="btn-link text-primary">고객센터<i
											class="fn-shopping fn-shopping-forward2"></i></a></li>
									<li>“담당자” 변경은 ‘판매자정보 &gt; 판매자 정보’ 메뉴에서 가능합니다. <a href=""
										ng-click="vm.openSellerInfo()" class="btn-link text-primary">변경하러
											가기<i class="fn-shopping fn-shopping-forward2"></i>
									</a></li>
								</ul>
							</div>
							<p class="mg-bottom">
								매니저 <span class="text-primary">1</span>명
							</p>
							<div class="no-more-tables">
								<table class="seller-table seller-table-bordered"
									summary="매니저 목록을 출력합니다.">
									<caption>
										<span class="sr-only">멤버관리 목록</span>
									</caption>
									<colgroup>
										<col>
										<col style="width: 15%">
										<col style="width: 17%">
										<col style="width: 13%">
										<col style="width: 12%">
									</colgroup>
									<thead class="cf">
										<tr>
											<th scope="col">아이디</th>
											<th scope="col">이름</th>
											<th scope="col">권한</th>
											<th scope="col">초대일자<br>(수락일자)
											</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<!---->
										<tr ng-repeat="auth in vm.authList" class="" style="">
											<!---->
											<td data-title="아이디" class="text-center"
												ng-if="auth.memberStatusType">
												<!---->
												<span class="label label-primary label-logo"
												ng-if="auth.memberType === 'NAVER'"><i
													class="seller-icon icon-logo-n-xs" aria-hidden="true"></i>
													네이버 ID</span>
											<!----> wl******* <!---->
												<span class="label label-outline label-info"
												ng-if="auth.isChargeMember === true">담당자</span>
											<!---->
											</td>
											<!---->
											<!---->
											<td data-title="이름" class="text-center">정선진<!---->
												<span ng-if="auth.isCurrentLogined">(나)</span>
											<!----></td>
											<td data-title="권한" class="text-center">
												<!---->
												<span ng-if="auth.roleGroupDetailType === undefined">통합
													매니저 </span>
											<!---->
												<!---->
												<!---->
											</td>
											<!---->
											<!---->
											<td data-title="초대일자(수락일자)" class="text-center"
												ng-if="! auth.inviteAcceptDate"><span class="text-sub">2023.07.18.</span></td>
											<!---->
											<td data-title="삭제" class="text-center">
												<!---->
											</td>
										</tr>
										<!---->
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 관리자권한 끝 -->

					<!-- 정보 변경 버튼 클릭시 뜨는 팝업창 -->
					<!-- 정산정보변경 시작 -->
					<div class="panel panel-seller">
						<div class="panel-heading">
							<h3 class="panel-title">배송ㆍ정산정보</h3>
						</div>
						<div class="panel-body">
							<ul class="seller-list-border">
								<ncp-address-book-field represent-info="vm.changeJudgment"
									phone-number-container="vm.accountInfo.defaultChannel.contactInfo"
									is-oversea-product-sales="vm.isOverSeaProductSales()"
									is-disabled="!vm.isValidBusinessStatus"
									address-books="vm.changeJudgment.addressBooks"><!---->
								<li ng-repeat="addressBook in vm.addressBooks"
									ng-init="dAddressIndex = $index" class="_addressBookArea0"><label
									class="control-label">상품 출고지&nbsp;<br
										class="visible-xs">주소 <i class="icon-must"
										aria-label="필수항목"></i></label>
								<div class="input-content">
										<!---->
										<!---->
										<div class="form-group">
											<label for="delivery-name">출고지 이름 (2~12자 한글, 영문, 숫자
												사용가능)</label>
										</div>
										<div class="form-inline wide-form-inline">
											<div class="form-group">
												<div class="seller-input-wrap">
													<input type="text"
														class="form-control ng-pristine ng-untouched ng-not-empty ng-valid-required ng-valid-minlength ng-valid-maxlength ng-valid ng-valid-regex-pattern-custom"
														placeholder="2~12자 한글, 영문, 숫자 사용가능" id="delivery-name"
														name="addressBookAlias_0" minlength="2" maxlength="12"
														ncp-regex-pattern-custom=""
														ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;upperCase&quot;, &quot;lowerCase&quot;, &quot;numeric&quot;, &quot;korean&quot;, &quot;space&quot;]}"
														ng-regex-pattern-custom-err-type="pattern.custom"
														ng-model="addressBook.alias"
														ng-model-options="{debounce: 50}"
														ng-disabled="vm.isDisabled()" required=""
														ncp-input-clear=""
														ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;영문 대문자, 영문 소문자, 숫자, 한글, 문자사이 공백만 입력 가능합니다.&quot;}"
														disabled="disabled"><a role="button"
														class="btn-clear" tabindex="-1" style="display: none;"><span
														aria-label="삭제">×</span></a>
												</div>
											</div>
										</div>
										<div class="division"></div>
										<div class="form-group">
											<label>출고지 주소</label>
										</div>
										<!---->
										<div class="form-group" ng-if="!vm.isOverseaProductSales()">
											<div class="seller-input">
												<div class="form-group">
													<label><input type="checkbox"
														class="form-control ng-pristine ng-untouched ng-valid ng-empty"
														ng-model="addressBook.isCopyFromRepresent"
														ng-change="vm.copyFromRepresent(dAddressIndex)"
														ng-disabled="addressBook.isCopyFromRelease || vm.isDisabled()"
														name="copy-address-represent-0"
														data-nclicks-code="delivery.address1" disabled="disabled">사업장주소와
														동일<span></span></label>
													<!---->
												</div>
											</div>
										</div>
										<!---->
										<!---->
										<ncp-address-info-field
											ng-if="!addressBook.addressInfo.overseas"
											address-info="addressBook.addressInfo"
											is-readonly="(addressBook.isCopyFromRepresent || addressBook.isCopyFromRelease) || vm.isDisabled()"
											is-required="true" data-nclicks-code="delivery.findaddress"><!---->
										<div class="form-group"
											ng-if="vm.addressInfo.overseas === undefined || !vm.addressInfo.overseas">
											<div class="input-group">
												<span class="input-group-btn"><button type="button"
														id="domestic-address" ng-disabled="vm.isReadonly()"
														ng-click="vm.openAddressModal()"
														class="btn btn-md btn-default2" disabled="disabled">
														<i class="glyphicon glyphicon-search" aria-hidden="true"></i>
														주소수정
													</button></span> <input type="hidden" name="_hidden_domestic_address"
													ng-model="vm.addressInfo.address"
													ng-required="vm.isRequired()" autocomplete="off"
													class="ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required"
													required="required">
											</div>
											<p class="info-result text-info"
												ng-show="vm.addressInfo != null &amp;&amp; vm.addressInfo.address != null">
												<strong>(우 : 47246) 부산광역시 부산진구 동천로 109 (삼한골든게이트) </strong>
											</p>
										</div>
										<!----><!----></ncp-address-info-field>
										<!---->
										<!---->
										<div class="division"></div>
										<div class="form-group">
											<label for="phoneNumber1">출고지 연락처1 (필수)</label>
										</div>
										<div class="form-inline wide-form-inline has-error-msg">
											<ncp-phone-field phone-number-info="addressBook.phoneNumber1"
												is-oversea="addressBook.addressInfo.overseas"
												is-required="true" is-disabled="vm.isDisabled()"
												valid-mobile="false" element-id="phoneNumber1"
												custom-placeholder="-없이 연락가능한 전화번호 입력">
											<div class="form-group ng-hide" ng-show="vm.isOversea()">
												<div
													class="selectize-control ng-pristine ng-untouched ng-valid single">
													<div
														class="selectize-input items ng-pristine has-options disabled ng-invalid not-full">
														<input type="text" autocomplete="off" tabindex="-1"
															readonly=""
															style="width: 52.4896px; opacity: 1; position: relative; left: 0px;"
															disabled="" placeholder="국가 코드">
													</div>
													<div
														class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
														style="display: none; width: 100px; top: 0px; left: 0px;">
														<div class="selectize-dropdown-content">
															<div data-value="KOR" data-selectable="" class="selected">
																<strong>대한민국</strong> (+82)
															</div>
															<div data-value="GTM" data-selectable="">
																<strong>과테말라</strong> (+502)
															</div>
															<div data-value="GRC" data-selectable="">
																<strong>그리스</strong> (+30)
															</div>
															<div data-value="NGA" data-selectable="">
																<strong>나이지리아</strong> (+234)
															</div>
															<div data-value="ZAF" data-selectable="">
																<strong>남아프리카공화국</strong> (+27)
															</div>
															<div data-value="NLD" data-selectable="">
																<strong>네덜란드</strong> (+31)
															</div>
															<div data-value="NPL" data-selectable="">
																<strong>네팔</strong> (+977)
															</div>
															<div data-value="NOR" data-selectable="">
																<strong>노르웨이</strong> (+47)
															</div>
															<div data-value="NZL" data-selectable="">
																<strong>뉴질랜드</strong> (+64)
															</div>
															<div data-value="NIC" data-selectable="">
																<strong>니카라과</strong> (+505)
															</div>
															<div data-value="TWN" data-selectable="">
																<strong>대만</strong> (+886)
															</div>
															<div data-value="DNK" data-selectable="">
																<strong>덴마크</strong> (+45)
															</div>
															<div data-value="DEU" data-selectable="">
																<strong>독일</strong> (+49)
															</div>
															<div data-value="LAO" data-selectable="">
																<strong>라오스</strong> (+856)
															</div>
															<div data-value="ROU" data-selectable="">
																<strong>루마니아</strong> (+40)
															</div>
															<div data-value="LUX" data-selectable="">
																<strong>룩셈부르크</strong> (+352)
															</div>
															<div data-value="LTU" data-selectable="">
																<strong>리투아니아</strong> (+370)
															</div>
															<div data-value="MAC" data-selectable="">
																<strong>마카오</strong> (+853)
															</div>
															<div data-value="MYS" data-selectable="">
																<strong>말레이시아</strong> (+60)
															</div>
															<div data-value="MEX" data-selectable="">
																<strong>멕시코</strong> (+52)
															</div>
															<div data-value="MAR" data-selectable="">
																<strong>모로코</strong> (+212)
															</div>
															<div data-value="MNE" data-selectable="">
																<strong>몬테네그로</strong> (+382)
															</div>
															<div data-value="MLT" data-selectable="">
																<strong>몰타</strong> (+356)
															</div>
															<div data-value="MNG" data-selectable="">
																<strong>몽골</strong> (+976)
															</div>
															<div data-value="USA" data-selectable="">
																<strong>미국</strong> (+1)
															</div>
															<div data-value="BGD" data-selectable="">
																<strong>방글라데시</strong> (+880)
															</div>
															<div data-value="VEN" data-selectable="">
																<strong>베네수엘라</strong> (+58)
															</div>
															<div data-value="VNM" data-selectable="">
																<strong>베트남</strong> (+84)
															</div>
															<div data-value="BEL" data-selectable="">
																<strong>벨기에</strong> (+32)
															</div>
															<div data-value="BLR" data-selectable="">
																<strong>벨라루스</strong> (+375)
															</div>
															<div data-value="BLZ" data-selectable="">
																<strong>벨리즈</strong> (+501)
															</div>
															<div data-value="BGR" data-selectable="">
																<strong>불가리아</strong> (+359)
															</div>
															<div data-value="BRA" data-selectable="">
																<strong>브라질</strong> (+55)
															</div>
															<div data-value="SAU" data-selectable="">
																<strong>사우디아라비아</strong> (+966)
															</div>
															<div data-value="SRB" data-selectable="">
																<strong>세르비아</strong> (+381)
															</div>
															<div data-value="LCA" data-selectable="">
																<strong>세인트루시아</strong> (+1)
															</div>
															<div data-value="KNA" data-selectable="">
																<strong>세인트키츠 네비스</strong> (+1)
															</div>
															<div data-value="LKA" data-selectable="">
																<strong>스리랑카</strong> (+94)
															</div>
															<div data-value="SWE" data-selectable="">
																<strong>스웨덴</strong> (+46)
															</div>
															<div data-value="CHE" data-selectable="">
																<strong>스위스</strong> (+41)
															</div>
															<div data-value="ESP" data-selectable="">
																<strong>스페인</strong> (+34)
															</div>
															<div data-value="SVN" data-selectable="">
																<strong>슬로베니아</strong> (+386)
															</div>
															<div data-value="SGP" data-selectable="">
																<strong>싱가폴</strong> (+65)
															</div>
															<div data-value="ARE" data-selectable="">
																<strong>아랍에미리트</strong> (+971)
															</div>
															<div data-value="ARG" data-selectable="">
																<strong>아르헨티나</strong> (+54)
															</div>
															<div data-value="IRL" data-selectable="">
																<strong>아일랜드</strong> (+353)
															</div>
															<div data-value="AZE" data-selectable="">
																<strong>아제르바이잔</strong> (+994)
															</div>
															<div data-value="EST" data-selectable="">
																<strong>에스토니아</strong> (+372)
															</div>
															<div data-value="SLV" data-selectable="">
																<strong>엘살바도르</strong> (+503)
															</div>
															<div data-value="GBR" data-selectable="">
																<strong>영국</strong> (+44)
															</div>
															<div data-value="YEM" data-selectable="">
																<strong>예맨</strong> (+967)
															</div>
															<div data-value="AUT" data-selectable="">
																<strong>오스트리아</strong> (+43)
															</div>
															<div data-value="JOR" data-selectable="">
																<strong>요르단</strong> (+962)
															</div>
															<div data-value="UZB" data-selectable="">
																<strong>우즈베키스탄</strong> (+998)
															</div>
															<div data-value="UKR" data-selectable="">
																<strong>우크라이나</strong> (+380)
															</div>
															<div data-value="ISR" data-selectable="">
																<strong>이스라엘</strong> (+972)
															</div>
															<div data-value="EGY" data-selectable="">
																<strong>이집트</strong> (+20)
															</div>
															<div data-value="ITA" data-selectable="">
																<strong>이탈리아</strong> (+39)
															</div>
															<div data-value="IND" data-selectable="">
																<strong>인도</strong> (+91)
															</div>
															<div data-value="IDN" data-selectable="">
																<strong>인도네시아</strong> (+62)
															</div>
															<div data-value="JPN" data-selectable="">
																<strong>일본</strong> (+81)
															</div>
															<div data-value="CHN" data-selectable="">
																<strong>중국</strong> (+86)
															</div>
															<div data-value="ZWE" data-selectable="">
																<strong>짐바브웨</strong> (+263)
															</div>
															<div data-value="CZE" data-selectable="">
																<strong>체코</strong> (+420)
															</div>
															<div data-value="KAZ" data-selectable="">
																<strong>카자흐스탄</strong> (+7)
															</div>
															<div data-value="QAT" data-selectable="">
																<strong>카타르</strong> (+974)
															</div>
															<div data-value="KHM" data-selectable="">
																<strong>캄보디아</strong> (+855)
															</div>
															<div data-value="CAN" data-selectable="">
																<strong>캐나다</strong> (+1)
															</div>
															<div data-value="KEN" data-selectable="">
																<strong>케냐</strong> (+254)
															</div>
															<div data-value="CRI" data-selectable="">
																<strong>코스타리카</strong> (+506)
															</div>
															<div data-value="COL" data-selectable="">
																<strong>콜롬비아</strong> (+57)
															</div>
															<div data-value="CUB" data-selectable="">
																<strong>쿠바</strong> (+53)
															</div>
															<div data-value="KWT" data-selectable="">
																<strong>쿠웨이트</strong> (+965)
															</div>
															<div data-value="KGZ" data-selectable="">
																<strong>키르키즈스탄</strong> (+996)
															</div>
															<div data-value="TJK" data-selectable="">
																<strong>타지키스탄</strong> (+992)
															</div>
															<div data-value="THA" data-selectable="">
																<strong>태국</strong> (+66)
															</div>
															<div data-value="TKM" data-selectable="">
																<strong>투르크메니스탄</strong> (+993)
															</div>
															<div data-value="TUN" data-selectable="">
																<strong>튀니지</strong> (+216)
															</div>
															<div data-value="TUR" data-selectable="">
																<strong>튀르키예</strong> (+90)
															</div>
															<div data-value="PRY" data-selectable="">
																<strong>파라과이</strong> (+595)
															</div>
															<div data-value="PAK" data-selectable="">
																<strong>파키스탄</strong> (+92)
															</div>
															<div data-value="PER" data-selectable="">
																<strong>페루</strong> (+51)
															</div>
															<div data-value="PRT" data-selectable="">
																<strong>포르투갈</strong> (+351)
															</div>
															<div data-value="POL" data-selectable="">
																<strong>폴란드</strong> (+48)
															</div>
															<div data-value="FRA" data-selectable="">
																<strong>프랑스</strong> (+33)
															</div>
															<div data-value="FJI" data-selectable="">
																<strong>피지</strong> (+679)
															</div>
															<div data-value="FIN" data-selectable="">
																<strong>핀란드</strong> (+358)
															</div>
															<div data-value="PHL" data-selectable="">
																<strong>필리핀</strong> (+63)
															</div>
															<div data-value="HUN" data-selectable="">
																<strong>헝가리</strong> (+36)
															</div>
															<div data-value="AUS" data-selectable="">
																<strong>호주</strong> (+61)
															</div>
															<div data-value="HKG" data-selectable="">
																<strong>홍콩</strong> (+852)
															</div>
														</div>
													</div>
												</div>
												<select selectize="" config="vm.config.phoneCountryCode"
													options="vm.phoneCodes" ng-readonly="vm.isReadonly()"
													ng-disabled="vm.isDisabled()" ncp-disabled=""
													ng-model="vm.phoneNumberInfo.countryCode"
													placeholder="국가 코드" ng-required="vm.isRequired()"
													class="ng-pristine ng-untouched selectized ng-not-empty ng-invalid ng-invalid-required"
													tabindex="-1"
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
													required="required" disabled=""><option value=""
														selected="selected"></option></select>
											</div>
											<div class="form-group">
												<div class="seller-input-wrap">
													<input type="tel"
														class="form-control ng-pristine ng-untouched ng-not-empty ng-valid-required ng-valid-maxlength ng-valid-global-phone-no ng-valid ng-valid-regex-pattern-custom"
														id="phoneNumber1"
														name="230720043838871_57_phone_field_key"
														placeholder="-없이 연락가능한 전화번호 입력"
														ncp-regex-pattern-custom=""
														ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;numeric&quot;]}"
														ng-regex-pattern-custom-err-type="pattern.custom"
														ng-model="vm.phoneNumberInfo.phoneNo"
														ng-model-options="{debounce: 300}" maxlength="20"
														ng-disabled="vm.isDisabled()" ncp-disabled=""
														ng-readonly="vm.isReadonly()"
														ncp-global-phone-no="!vm.isDisabled()"
														ncp-valid-mobile="false" ncp-valid-country-code=""
														ng-required="vm.isRequired()" ncp-message-container=""
														ncp-input-clear=""
														ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;숫자만 입력 가능합니다.&quot;}"
														required="required" disabled="disabled"><a
														role="button" class="btn-clear" tabindex="-1"
														style="display: none;"><span aria-label="삭제">×</span></a>
												</div>
											</div>
											</ncp-phone-field>
										</div>
										<div class="form-group">
											<label for="phoneNumber2">출고지 비상 연락처2 (선택)</label>
										</div>
										<div class="form-inline wide-form-inline has-error-msg">
											<ncp-phone-field phone-number-info="addressBook.phoneNumber2"
												is-oversea="addressBook.addressInfo.overseas"
												is-required="false" is-disabled="vm.isDisabled()"
												valid-mobile="false" element-id="phoneNumber2"
												custom-placeholder="-없이 연락가능한 전화번호 입력">
											<div class="form-group ng-hide" ng-show="vm.isOversea()">
												<div
													class="selectize-control ng-pristine ng-untouched ng-valid single">
													<div
														class="selectize-input items ng-valid ng-pristine has-options disabled not-full">
														<input type="text" autocomplete="off" tabindex="-1"
															readonly=""
															style="width: 52.4896px; opacity: 1; position: relative; left: 0px;"
															disabled="" placeholder="국가 코드">
													</div>
													<div
														class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
														style="display: none; width: 100px; top: 0px; left: 0px;">
														<div class="selectize-dropdown-content">
															<div data-value="KOR" data-selectable="" class="selected">
																<strong>대한민국</strong> (+82)
															</div>
															<div data-value="GTM" data-selectable="">
																<strong>과테말라</strong> (+502)
															</div>
															<div data-value="GRC" data-selectable="">
																<strong>그리스</strong> (+30)
															</div>
															<div data-value="NGA" data-selectable="">
																<strong>나이지리아</strong> (+234)
															</div>
															<div data-value="ZAF" data-selectable="">
																<strong>남아프리카공화국</strong> (+27)
															</div>
															<div data-value="NLD" data-selectable="">
																<strong>네덜란드</strong> (+31)
															</div>
															<div data-value="NPL" data-selectable="">
																<strong>네팔</strong> (+977)
															</div>
															<div data-value="NOR" data-selectable="">
																<strong>노르웨이</strong> (+47)
															</div>
															<div data-value="NZL" data-selectable="">
																<strong>뉴질랜드</strong> (+64)
															</div>
															<div data-value="NIC" data-selectable="">
																<strong>니카라과</strong> (+505)
															</div>
															<div data-value="TWN" data-selectable="">
																<strong>대만</strong> (+886)
															</div>
															<div data-value="DNK" data-selectable="">
																<strong>덴마크</strong> (+45)
															</div>
															<div data-value="DEU" data-selectable="">
																<strong>독일</strong> (+49)
															</div>
															<div data-value="LAO" data-selectable="">
																<strong>라오스</strong> (+856)
															</div>
															<div data-value="ROU" data-selectable="">
																<strong>루마니아</strong> (+40)
															</div>
															<div data-value="LUX" data-selectable="">
																<strong>룩셈부르크</strong> (+352)
															</div>
															<div data-value="LTU" data-selectable="">
																<strong>리투아니아</strong> (+370)
															</div>
															<div data-value="MAC" data-selectable="">
																<strong>마카오</strong> (+853)
															</div>
															<div data-value="MYS" data-selectable="">
																<strong>말레이시아</strong> (+60)
															</div>
															<div data-value="MEX" data-selectable="">
																<strong>멕시코</strong> (+52)
															</div>
															<div data-value="MAR" data-selectable="">
																<strong>모로코</strong> (+212)
															</div>
															<div data-value="MNE" data-selectable="">
																<strong>몬테네그로</strong> (+382)
															</div>
															<div data-value="MLT" data-selectable="">
																<strong>몰타</strong> (+356)
															</div>
															<div data-value="MNG" data-selectable="">
																<strong>몽골</strong> (+976)
															</div>
															<div data-value="USA" data-selectable="">
																<strong>미국</strong> (+1)
															</div>
															<div data-value="BGD" data-selectable="">
																<strong>방글라데시</strong> (+880)
															</div>
															<div data-value="VEN" data-selectable="">
																<strong>베네수엘라</strong> (+58)
															</div>
															<div data-value="VNM" data-selectable="">
																<strong>베트남</strong> (+84)
															</div>
															<div data-value="BEL" data-selectable="">
																<strong>벨기에</strong> (+32)
															</div>
															<div data-value="BLR" data-selectable="">
																<strong>벨라루스</strong> (+375)
															</div>
															<div data-value="BLZ" data-selectable="">
																<strong>벨리즈</strong> (+501)
															</div>
															<div data-value="BGR" data-selectable="">
																<strong>불가리아</strong> (+359)
															</div>
															<div data-value="BRA" data-selectable="">
																<strong>브라질</strong> (+55)
															</div>
															<div data-value="SAU" data-selectable="">
																<strong>사우디아라비아</strong> (+966)
															</div>
															<div data-value="SRB" data-selectable="">
																<strong>세르비아</strong> (+381)
															</div>
															<div data-value="LCA" data-selectable="">
																<strong>세인트루시아</strong> (+1)
															</div>
															<div data-value="KNA" data-selectable="">
																<strong>세인트키츠 네비스</strong> (+1)
															</div>
															<div data-value="LKA" data-selectable="">
																<strong>스리랑카</strong> (+94)
															</div>
															<div data-value="SWE" data-selectable="">
																<strong>스웨덴</strong> (+46)
															</div>
															<div data-value="CHE" data-selectable="">
																<strong>스위스</strong> (+41)
															</div>
															<div data-value="ESP" data-selectable="">
																<strong>스페인</strong> (+34)
															</div>
															<div data-value="SVN" data-selectable="">
																<strong>슬로베니아</strong> (+386)
															</div>
															<div data-value="SGP" data-selectable="">
																<strong>싱가폴</strong> (+65)
															</div>
															<div data-value="ARE" data-selectable="">
																<strong>아랍에미리트</strong> (+971)
															</div>
															<div data-value="ARG" data-selectable="">
																<strong>아르헨티나</strong> (+54)
															</div>
															<div data-value="IRL" data-selectable="">
																<strong>아일랜드</strong> (+353)
															</div>
															<div data-value="AZE" data-selectable="">
																<strong>아제르바이잔</strong> (+994)
															</div>
															<div data-value="EST" data-selectable="">
																<strong>에스토니아</strong> (+372)
															</div>
															<div data-value="SLV" data-selectable="">
																<strong>엘살바도르</strong> (+503)
															</div>
															<div data-value="GBR" data-selectable="">
																<strong>영국</strong> (+44)
															</div>
															<div data-value="YEM" data-selectable="">
																<strong>예맨</strong> (+967)
															</div>
															<div data-value="AUT" data-selectable="">
																<strong>오스트리아</strong> (+43)
															</div>
															<div data-value="JOR" data-selectable="">
																<strong>요르단</strong> (+962)
															</div>
															<div data-value="UZB" data-selectable="">
																<strong>우즈베키스탄</strong> (+998)
															</div>
															<div data-value="UKR" data-selectable="">
																<strong>우크라이나</strong> (+380)
															</div>
															<div data-value="ISR" data-selectable="">
																<strong>이스라엘</strong> (+972)
															</div>
															<div data-value="EGY" data-selectable="">
																<strong>이집트</strong> (+20)
															</div>
															<div data-value="ITA" data-selectable="">
																<strong>이탈리아</strong> (+39)
															</div>
															<div data-value="IND" data-selectable="">
																<strong>인도</strong> (+91)
															</div>
															<div data-value="IDN" data-selectable="">
																<strong>인도네시아</strong> (+62)
															</div>
															<div data-value="JPN" data-selectable="">
																<strong>일본</strong> (+81)
															</div>
															<div data-value="CHN" data-selectable="">
																<strong>중국</strong> (+86)
															</div>
															<div data-value="ZWE" data-selectable="">
																<strong>짐바브웨</strong> (+263)
															</div>
															<div data-value="CZE" data-selectable="">
																<strong>체코</strong> (+420)
															</div>
															<div data-value="KAZ" data-selectable="">
																<strong>카자흐스탄</strong> (+7)
															</div>
															<div data-value="QAT" data-selectable="">
																<strong>카타르</strong> (+974)
															</div>
															<div data-value="KHM" data-selectable="">
																<strong>캄보디아</strong> (+855)
															</div>
															<div data-value="CAN" data-selectable="">
																<strong>캐나다</strong> (+1)
															</div>
															<div data-value="KEN" data-selectable="">
																<strong>케냐</strong> (+254)
															</div>
															<div data-value="CRI" data-selectable="">
																<strong>코스타리카</strong> (+506)
															</div>
															<div data-value="COL" data-selectable="">
																<strong>콜롬비아</strong> (+57)
															</div>
															<div data-value="CUB" data-selectable="">
																<strong>쿠바</strong> (+53)
															</div>
															<div data-value="KWT" data-selectable="">
																<strong>쿠웨이트</strong> (+965)
															</div>
															<div data-value="KGZ" data-selectable="">
																<strong>키르키즈스탄</strong> (+996)
															</div>
															<div data-value="TJK" data-selectable="">
																<strong>타지키스탄</strong> (+992)
															</div>
															<div data-value="THA" data-selectable="">
																<strong>태국</strong> (+66)
															</div>
															<div data-value="TKM" data-selectable="">
																<strong>투르크메니스탄</strong> (+993)
															</div>
															<div data-value="TUN" data-selectable="">
																<strong>튀니지</strong> (+216)
															</div>
															<div data-value="TUR" data-selectable="">
																<strong>튀르키예</strong> (+90)
															</div>
															<div data-value="PRY" data-selectable="">
																<strong>파라과이</strong> (+595)
															</div>
															<div data-value="PAK" data-selectable="">
																<strong>파키스탄</strong> (+92)
															</div>
															<div data-value="PER" data-selectable="">
																<strong>페루</strong> (+51)
															</div>
															<div data-value="PRT" data-selectable="">
																<strong>포르투갈</strong> (+351)
															</div>
															<div data-value="POL" data-selectable="">
																<strong>폴란드</strong> (+48)
															</div>
															<div data-value="FRA" data-selectable="">
																<strong>프랑스</strong> (+33)
															</div>
															<div data-value="FJI" data-selectable="">
																<strong>피지</strong> (+679)
															</div>
															<div data-value="FIN" data-selectable="">
																<strong>핀란드</strong> (+358)
															</div>
															<div data-value="PHL" data-selectable="">
																<strong>필리핀</strong> (+63)
															</div>
															<div data-value="HUN" data-selectable="">
																<strong>헝가리</strong> (+36)
															</div>
															<div data-value="AUS" data-selectable="">
																<strong>호주</strong> (+61)
															</div>
															<div data-value="HKG" data-selectable="">
																<strong>홍콩</strong> (+852)
															</div>
														</div>
													</div>
												</div>
												<select selectize="" config="vm.config.phoneCountryCode"
													options="vm.phoneCodes" ng-readonly="vm.isReadonly()"
													ng-disabled="vm.isDisabled()" ncp-disabled=""
													ng-model="vm.phoneNumberInfo.countryCode"
													placeholder="국가 코드" ng-required="vm.isRequired()"
													class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
													tabindex="-1"
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
													disabled=""><option value="" selected="selected"></option></select>
											</div>
											<div class="form-group">
												<div class="seller-input-wrap">
													<input type="tel"
														class="form-control ng-pristine ng-untouched ng-empty ng-valid-maxlength ng-valid-global-phone-no ng-valid-required ng-valid ng-valid-regex-pattern-custom"
														id="phoneNumber2"
														name="230720043838873_59_phone_field_key"
														placeholder="-없이 연락가능한 전화번호 입력"
														ncp-regex-pattern-custom=""
														ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;numeric&quot;]}"
														ng-regex-pattern-custom-err-type="pattern.custom"
														ng-model="vm.phoneNumberInfo.phoneNo"
														ng-model-options="{debounce: 300}" maxlength="20"
														ng-disabled="vm.isDisabled()" ncp-disabled=""
														ng-readonly="vm.isReadonly()"
														ncp-global-phone-no="!vm.isDisabled()"
														ncp-valid-mobile="false" ncp-valid-country-code=""
														ng-required="vm.isRequired()" ncp-message-container=""
														ncp-input-clear=""
														ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;숫자만 입력 가능합니다.&quot;}"
														disabled="disabled"><a role="button"
														class="btn-clear" tabindex="-1" style="display: none;"><span
														aria-label="삭제">×</span></a>
												</div>
											</div>
											</ncp-phone-field>
										</div>
									</div></li>
								<!---->
								<li ng-repeat="addressBook in vm.addressBooks"
									ng-init="dAddressIndex = $index" class="_addressBookArea1"><label
									class="control-label">반품/교환지&nbsp;<br
										class="visible-xs">주소 <i class="icon-must"
										aria-label="필수항목"></i></label>
								<div class="input-content">
										<!---->
										<!---->
										<div class="form-group">
											<label for="delivery-name">반품/교환지 이름 (2~12자 한글, 영문,
												숫자 사용가능)</label>
										</div>
										<div class="form-inline wide-form-inline">
											<div class="form-group">
												<div class="seller-input-wrap">
													<input type="text"
														class="form-control ng-pristine ng-untouched ng-not-empty ng-valid-required ng-valid-minlength ng-valid-maxlength ng-valid ng-valid-regex-pattern-custom"
														placeholder="2~12자 한글, 영문, 숫자 사용가능" id="delivery-name"
														name="addressBookAlias_1" minlength="2" maxlength="12"
														ncp-regex-pattern-custom=""
														ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;upperCase&quot;, &quot;lowerCase&quot;, &quot;numeric&quot;, &quot;korean&quot;, &quot;space&quot;]}"
														ng-regex-pattern-custom-err-type="pattern.custom"
														ng-model="addressBook.alias"
														ng-model-options="{debounce: 50}"
														ng-disabled="vm.isDisabled()" required=""
														ncp-input-clear=""
														ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;영문 대문자, 영문 소문자, 숫자, 한글, 문자사이 공백만 입력 가능합니다.&quot;}"
														disabled="disabled"><a role="button"
														class="btn-clear" tabindex="-1" style="display: none;"><span
														aria-label="삭제">×</span></a>
												</div>
											</div>
										</div>
										<div class="division"></div>
										<div class="form-group">
											<label>반품/교환지 주소</label>
										</div>
										<!---->
										<div class="form-group" ng-if="!vm.isOverseaProductSales()">
											<div class="seller-input">
												<div class="form-group">
													<label><input type="checkbox"
														class="form-control ng-pristine ng-untouched ng-valid ng-empty"
														ng-model="addressBook.isCopyFromRepresent"
														ng-change="vm.copyFromRepresent(dAddressIndex)"
														ng-disabled="addressBook.isCopyFromRelease || vm.isDisabled()"
														name="copy-address-represent-1"
														data-nclicks-code="delivery.address1" disabled="disabled">사업장주소와
														동일<span></span></label>
													<!---->
													<label ng-if="dAddressIndex === 1"><input
														type="checkbox"
														class="form-control ng-pristine ng-untouched ng-valid ng-empty"
														ng-model="addressBook.isCopyFromRelease"
														ng-change="vm.copyReleaseToReturn()"
														ng-disabled="addressBook.isCopyFromRepresent || vm.isDisabled()"
														name="copy-address-release-1"
														data-nclicks-code="delivery.address2" disabled="disabled">출고지주소와
														동일<span></span></label>
													<!---->
												</div>
											</div>
										</div>
										<!---->
										<!---->
										<ncp-address-info-field
											ng-if="!addressBook.addressInfo.overseas"
											address-info="addressBook.addressInfo"
											is-readonly="(addressBook.isCopyFromRepresent || addressBook.isCopyFromRelease) || vm.isDisabled()"
											is-required="true" data-nclicks-code="delivery.findaddress"><!---->
										<div class="form-group"
											ng-if="vm.addressInfo.overseas === undefined || !vm.addressInfo.overseas">
											<div class="input-group">
												<span class="input-group-btn"><button type="button"
														id="domestic-address" ng-disabled="vm.isReadonly()"
														ng-click="vm.openAddressModal()"
														class="btn btn-md btn-default2" disabled="disabled">
														<i class="glyphicon glyphicon-search" aria-hidden="true"></i>
														주소수정
													</button></span> <input type="hidden" name="_hidden_domestic_address"
													ng-model="vm.addressInfo.address"
													ng-required="vm.isRequired()" autocomplete="off"
													class="ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required"
													required="required">
											</div>
											<p class="info-result text-info"
												ng-show="vm.addressInfo != null &amp;&amp; vm.addressInfo.address != null">
												<strong>(우 : 47246) 부산광역시 부산진구 동천로 109 (삼한골든게이트) </strong>
											</p>
										</div>
										<!----><!----></ncp-address-info-field>
										<!---->
										<!---->
										<div class="division"></div>
										<div class="form-group">
											<label for="phoneNumber1">반품/교환지 연락처1 (필수)</label>
										</div>
										<div class="form-inline wide-form-inline has-error-msg">
											<ncp-phone-field phone-number-info="addressBook.phoneNumber1"
												is-oversea="addressBook.addressInfo.overseas"
												is-required="true" is-disabled="vm.isDisabled()"
												valid-mobile="false" element-id="phoneNumber1"
												custom-placeholder="-없이 연락가능한 전화번호 입력">
											<div class="form-group ng-hide" ng-show="vm.isOversea()">
												<div
													class="selectize-control ng-pristine ng-untouched ng-valid single">
													<div
														class="selectize-input items ng-pristine has-options disabled ng-invalid not-full">
														<input type="text" autocomplete="off" tabindex="-1"
															readonly=""
															style="width: 52.4896px; opacity: 1; position: relative; left: 0px;"
															disabled="" placeholder="국가 코드">
													</div>
													<div
														class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
														style="display: none; width: 100px; top: 0px; left: 0px;">
														<div class="selectize-dropdown-content">
															<div data-value="KOR" data-selectable="" class="selected">
																<strong>대한민국</strong> (+82)
															</div>
															<div data-value="GTM" data-selectable="">
																<strong>과테말라</strong> (+502)
															</div>
															<div data-value="GRC" data-selectable="">
																<strong>그리스</strong> (+30)
															</div>
															<div data-value="NGA" data-selectable="">
																<strong>나이지리아</strong> (+234)
															</div>
															<div data-value="ZAF" data-selectable="">
																<strong>남아프리카공화국</strong> (+27)
															</div>
															<div data-value="NLD" data-selectable="">
																<strong>네덜란드</strong> (+31)
															</div>
															<div data-value="NPL" data-selectable="">
																<strong>네팔</strong> (+977)
															</div>
															<div data-value="NOR" data-selectable="">
																<strong>노르웨이</strong> (+47)
															</div>
															<div data-value="NZL" data-selectable="">
																<strong>뉴질랜드</strong> (+64)
															</div>
															<div data-value="NIC" data-selectable="">
																<strong>니카라과</strong> (+505)
															</div>
															<div data-value="TWN" data-selectable="">
																<strong>대만</strong> (+886)
															</div>
															<div data-value="DNK" data-selectable="">
																<strong>덴마크</strong> (+45)
															</div>
															<div data-value="DEU" data-selectable="">
																<strong>독일</strong> (+49)
															</div>
															<div data-value="LAO" data-selectable="">
																<strong>라오스</strong> (+856)
															</div>
															<div data-value="ROU" data-selectable="">
																<strong>루마니아</strong> (+40)
															</div>
															<div data-value="LUX" data-selectable="">
																<strong>룩셈부르크</strong> (+352)
															</div>
															<div data-value="LTU" data-selectable="">
																<strong>리투아니아</strong> (+370)
															</div>
															<div data-value="MAC" data-selectable="">
																<strong>마카오</strong> (+853)
															</div>
															<div data-value="MYS" data-selectable="">
																<strong>말레이시아</strong> (+60)
															</div>
															<div data-value="MEX" data-selectable="">
																<strong>멕시코</strong> (+52)
															</div>
															<div data-value="MAR" data-selectable="">
																<strong>모로코</strong> (+212)
															</div>
															<div data-value="MNE" data-selectable="">
																<strong>몬테네그로</strong> (+382)
															</div>
															<div data-value="MLT" data-selectable="">
																<strong>몰타</strong> (+356)
															</div>
															<div data-value="MNG" data-selectable="">
																<strong>몽골</strong> (+976)
															</div>
															<div data-value="USA" data-selectable="">
																<strong>미국</strong> (+1)
															</div>
															<div data-value="BGD" data-selectable="">
																<strong>방글라데시</strong> (+880)
															</div>
															<div data-value="VEN" data-selectable="">
																<strong>베네수엘라</strong> (+58)
															</div>
															<div data-value="VNM" data-selectable="">
																<strong>베트남</strong> (+84)
															</div>
															<div data-value="BEL" data-selectable="">
																<strong>벨기에</strong> (+32)
															</div>
															<div data-value="BLR" data-selectable="">
																<strong>벨라루스</strong> (+375)
															</div>
															<div data-value="BLZ" data-selectable="">
																<strong>벨리즈</strong> (+501)
															</div>
															<div data-value="BGR" data-selectable="">
																<strong>불가리아</strong> (+359)
															</div>
															<div data-value="BRA" data-selectable="">
																<strong>브라질</strong> (+55)
															</div>
															<div data-value="SAU" data-selectable="">
																<strong>사우디아라비아</strong> (+966)
															</div>
															<div data-value="SRB" data-selectable="">
																<strong>세르비아</strong> (+381)
															</div>
															<div data-value="LCA" data-selectable="">
																<strong>세인트루시아</strong> (+1)
															</div>
															<div data-value="KNA" data-selectable="">
																<strong>세인트키츠 네비스</strong> (+1)
															</div>
															<div data-value="LKA" data-selectable="">
																<strong>스리랑카</strong> (+94)
															</div>
															<div data-value="SWE" data-selectable="">
																<strong>스웨덴</strong> (+46)
															</div>
															<div data-value="CHE" data-selectable="">
																<strong>스위스</strong> (+41)
															</div>
															<div data-value="ESP" data-selectable="">
																<strong>스페인</strong> (+34)
															</div>
															<div data-value="SVN" data-selectable="">
																<strong>슬로베니아</strong> (+386)
															</div>
															<div data-value="SGP" data-selectable="">
																<strong>싱가폴</strong> (+65)
															</div>
															<div data-value="ARE" data-selectable="">
																<strong>아랍에미리트</strong> (+971)
															</div>
															<div data-value="ARG" data-selectable="">
																<strong>아르헨티나</strong> (+54)
															</div>
															<div data-value="IRL" data-selectable="">
																<strong>아일랜드</strong> (+353)
															</div>
															<div data-value="AZE" data-selectable="">
																<strong>아제르바이잔</strong> (+994)
															</div>
															<div data-value="EST" data-selectable="">
																<strong>에스토니아</strong> (+372)
															</div>
															<div data-value="SLV" data-selectable="">
																<strong>엘살바도르</strong> (+503)
															</div>
															<div data-value="GBR" data-selectable="">
																<strong>영국</strong> (+44)
															</div>
															<div data-value="YEM" data-selectable="">
																<strong>예맨</strong> (+967)
															</div>
															<div data-value="AUT" data-selectable="">
																<strong>오스트리아</strong> (+43)
															</div>
															<div data-value="JOR" data-selectable="">
																<strong>요르단</strong> (+962)
															</div>
															<div data-value="UZB" data-selectable="">
																<strong>우즈베키스탄</strong> (+998)
															</div>
															<div data-value="UKR" data-selectable="">
																<strong>우크라이나</strong> (+380)
															</div>
															<div data-value="ISR" data-selectable="">
																<strong>이스라엘</strong> (+972)
															</div>
															<div data-value="EGY" data-selectable="">
																<strong>이집트</strong> (+20)
															</div>
															<div data-value="ITA" data-selectable="">
																<strong>이탈리아</strong> (+39)
															</div>
															<div data-value="IND" data-selectable="">
																<strong>인도</strong> (+91)
															</div>
															<div data-value="IDN" data-selectable="">
																<strong>인도네시아</strong> (+62)
															</div>
															<div data-value="JPN" data-selectable="">
																<strong>일본</strong> (+81)
															</div>
															<div data-value="CHN" data-selectable="">
																<strong>중국</strong> (+86)
															</div>
															<div data-value="ZWE" data-selectable="">
																<strong>짐바브웨</strong> (+263)
															</div>
															<div data-value="CZE" data-selectable="">
																<strong>체코</strong> (+420)
															</div>
															<div data-value="KAZ" data-selectable="">
																<strong>카자흐스탄</strong> (+7)
															</div>
															<div data-value="QAT" data-selectable="">
																<strong>카타르</strong> (+974)
															</div>
															<div data-value="KHM" data-selectable="">
																<strong>캄보디아</strong> (+855)
															</div>
															<div data-value="CAN" data-selectable="">
																<strong>캐나다</strong> (+1)
															</div>
															<div data-value="KEN" data-selectable="">
																<strong>케냐</strong> (+254)
															</div>
															<div data-value="CRI" data-selectable="">
																<strong>코스타리카</strong> (+506)
															</div>
															<div data-value="COL" data-selectable="">
																<strong>콜롬비아</strong> (+57)
															</div>
															<div data-value="CUB" data-selectable="">
																<strong>쿠바</strong> (+53)
															</div>
															<div data-value="KWT" data-selectable="">
																<strong>쿠웨이트</strong> (+965)
															</div>
															<div data-value="KGZ" data-selectable="">
																<strong>키르키즈스탄</strong> (+996)
															</div>
															<div data-value="TJK" data-selectable="">
																<strong>타지키스탄</strong> (+992)
															</div>
															<div data-value="THA" data-selectable="">
																<strong>태국</strong> (+66)
															</div>
															<div data-value="TKM" data-selectable="">
																<strong>투르크메니스탄</strong> (+993)
															</div>
															<div data-value="TUN" data-selectable="">
																<strong>튀니지</strong> (+216)
															</div>
															<div data-value="TUR" data-selectable="">
																<strong>튀르키예</strong> (+90)
															</div>
															<div data-value="PRY" data-selectable="">
																<strong>파라과이</strong> (+595)
															</div>
															<div data-value="PAK" data-selectable="">
																<strong>파키스탄</strong> (+92)
															</div>
															<div data-value="PER" data-selectable="">
																<strong>페루</strong> (+51)
															</div>
															<div data-value="PRT" data-selectable="">
																<strong>포르투갈</strong> (+351)
															</div>
															<div data-value="POL" data-selectable="">
																<strong>폴란드</strong> (+48)
															</div>
															<div data-value="FRA" data-selectable="">
																<strong>프랑스</strong> (+33)
															</div>
															<div data-value="FJI" data-selectable="">
																<strong>피지</strong> (+679)
															</div>
															<div data-value="FIN" data-selectable="">
																<strong>핀란드</strong> (+358)
															</div>
															<div data-value="PHL" data-selectable="">
																<strong>필리핀</strong> (+63)
															</div>
															<div data-value="HUN" data-selectable="">
																<strong>헝가리</strong> (+36)
															</div>
															<div data-value="AUS" data-selectable="">
																<strong>호주</strong> (+61)
															</div>
															<div data-value="HKG" data-selectable="">
																<strong>홍콩</strong> (+852)
															</div>
														</div>
													</div>
												</div>
												<select selectize="" config="vm.config.phoneCountryCode"
													options="vm.phoneCodes" ng-readonly="vm.isReadonly()"
													ng-disabled="vm.isDisabled()" ncp-disabled=""
													ng-model="vm.phoneNumberInfo.countryCode"
													placeholder="국가 코드" ng-required="vm.isRequired()"
													class="ng-pristine ng-untouched selectized ng-not-empty ng-invalid ng-invalid-required"
													tabindex="-1"
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
													required="required" disabled=""><option value=""
														selected="selected"></option></select>
											</div>
											<div class="form-group">
												<div class="seller-input-wrap">
													<input type="tel"
														class="form-control ng-pristine ng-untouched ng-not-empty ng-valid-required ng-valid-maxlength ng-valid-global-phone-no ng-valid ng-valid-regex-pattern-custom"
														id="phoneNumber1"
														name="230720043838872_58_phone_field_key"
														placeholder="-없이 연락가능한 전화번호 입력"
														ncp-regex-pattern-custom=""
														ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;numeric&quot;]}"
														ng-regex-pattern-custom-err-type="pattern.custom"
														ng-model="vm.phoneNumberInfo.phoneNo"
														ng-model-options="{debounce: 300}" maxlength="20"
														ng-disabled="vm.isDisabled()" ncp-disabled=""
														ng-readonly="vm.isReadonly()"
														ncp-global-phone-no="!vm.isDisabled()"
														ncp-valid-mobile="false" ncp-valid-country-code=""
														ng-required="vm.isRequired()" ncp-message-container=""
														ncp-input-clear=""
														ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;숫자만 입력 가능합니다.&quot;}"
														required="required" disabled="disabled"><a
														role="button" class="btn-clear" tabindex="-1"
														style="display: none;"><span aria-label="삭제">×</span></a>
												</div>
											</div>
											</ncp-phone-field>
										</div>
										<div class="form-group">
											<label for="phoneNumber2">반품/교환지 비상 연락처2 (선택)</label>
										</div>
										<div class="form-inline wide-form-inline has-error-msg">
											<ncp-phone-field phone-number-info="addressBook.phoneNumber2"
												is-oversea="addressBook.addressInfo.overseas"
												is-required="false" is-disabled="vm.isDisabled()"
												valid-mobile="false" element-id="phoneNumber2"
												custom-placeholder="-없이 연락가능한 전화번호 입력">
											<div class="form-group ng-hide" ng-show="vm.isOversea()">
												<div
													class="selectize-control ng-pristine ng-untouched ng-valid single">
													<div
														class="selectize-input items ng-valid ng-pristine has-options disabled not-full">
														<input type="text" autocomplete="off" tabindex="-1"
															readonly=""
															style="width: 52.4896px; opacity: 1; position: relative; left: 0px;"
															disabled="" placeholder="국가 코드">
													</div>
													<div
														class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
														style="display: none; width: 100px; top: 0px; left: 0px;">
														<div class="selectize-dropdown-content">
															<div data-value="KOR" data-selectable="" class="selected">
																<strong>대한민국</strong> (+82)
															</div>
															<div data-value="GTM" data-selectable="">
																<strong>과테말라</strong> (+502)
															</div>
															<div data-value="GRC" data-selectable="">
																<strong>그리스</strong> (+30)
															</div>
															<div data-value="NGA" data-selectable="">
																<strong>나이지리아</strong> (+234)
															</div>
															<div data-value="ZAF" data-selectable="">
																<strong>남아프리카공화국</strong> (+27)
															</div>
															<div data-value="NLD" data-selectable="">
																<strong>네덜란드</strong> (+31)
															</div>
															<div data-value="NPL" data-selectable="">
																<strong>네팔</strong> (+977)
															</div>
															<div data-value="NOR" data-selectable="">
																<strong>노르웨이</strong> (+47)
															</div>
															<div data-value="NZL" data-selectable="">
																<strong>뉴질랜드</strong> (+64)
															</div>
															<div data-value="NIC" data-selectable="">
																<strong>니카라과</strong> (+505)
															</div>
															<div data-value="TWN" data-selectable="">
																<strong>대만</strong> (+886)
															</div>
															<div data-value="DNK" data-selectable="">
																<strong>덴마크</strong> (+45)
															</div>
															<div data-value="DEU" data-selectable="">
																<strong>독일</strong> (+49)
															</div>
															<div data-value="LAO" data-selectable="">
																<strong>라오스</strong> (+856)
															</div>
															<div data-value="ROU" data-selectable="">
																<strong>루마니아</strong> (+40)
															</div>
															<div data-value="LUX" data-selectable="">
																<strong>룩셈부르크</strong> (+352)
															</div>
															<div data-value="LTU" data-selectable="">
																<strong>리투아니아</strong> (+370)
															</div>
															<div data-value="MAC" data-selectable="">
																<strong>마카오</strong> (+853)
															</div>
															<div data-value="MYS" data-selectable="">
																<strong>말레이시아</strong> (+60)
															</div>
															<div data-value="MEX" data-selectable="">
																<strong>멕시코</strong> (+52)
															</div>
															<div data-value="MAR" data-selectable="">
																<strong>모로코</strong> (+212)
															</div>
															<div data-value="MNE" data-selectable="">
																<strong>몬테네그로</strong> (+382)
															</div>
															<div data-value="MLT" data-selectable="">
																<strong>몰타</strong> (+356)
															</div>
															<div data-value="MNG" data-selectable="">
																<strong>몽골</strong> (+976)
															</div>
															<div data-value="USA" data-selectable="">
																<strong>미국</strong> (+1)
															</div>
															<div data-value="BGD" data-selectable="">
																<strong>방글라데시</strong> (+880)
															</div>
															<div data-value="VEN" data-selectable="">
																<strong>베네수엘라</strong> (+58)
															</div>
															<div data-value="VNM" data-selectable="">
																<strong>베트남</strong> (+84)
															</div>
															<div data-value="BEL" data-selectable="">
																<strong>벨기에</strong> (+32)
															</div>
															<div data-value="BLR" data-selectable="">
																<strong>벨라루스</strong> (+375)
															</div>
															<div data-value="BLZ" data-selectable="">
																<strong>벨리즈</strong> (+501)
															</div>
															<div data-value="BGR" data-selectable="">
																<strong>불가리아</strong> (+359)
															</div>
															<div data-value="BRA" data-selectable="">
																<strong>브라질</strong> (+55)
															</div>
															<div data-value="SAU" data-selectable="">
																<strong>사우디아라비아</strong> (+966)
															</div>
															<div data-value="SRB" data-selectable="">
																<strong>세르비아</strong> (+381)
															</div>
															<div data-value="LCA" data-selectable="">
																<strong>세인트루시아</strong> (+1)
															</div>
															<div data-value="KNA" data-selectable="">
																<strong>세인트키츠 네비스</strong> (+1)
															</div>
															<div data-value="LKA" data-selectable="">
																<strong>스리랑카</strong> (+94)
															</div>
															<div data-value="SWE" data-selectable="">
																<strong>스웨덴</strong> (+46)
															</div>
															<div data-value="CHE" data-selectable="">
																<strong>스위스</strong> (+41)
															</div>
															<div data-value="ESP" data-selectable="">
																<strong>스페인</strong> (+34)
															</div>
															<div data-value="SVN" data-selectable="">
																<strong>슬로베니아</strong> (+386)
															</div>
															<div data-value="SGP" data-selectable="">
																<strong>싱가폴</strong> (+65)
															</div>
															<div data-value="ARE" data-selectable="">
																<strong>아랍에미리트</strong> (+971)
															</div>
															<div data-value="ARG" data-selectable="">
																<strong>아르헨티나</strong> (+54)
															</div>
															<div data-value="IRL" data-selectable="">
																<strong>아일랜드</strong> (+353)
															</div>
															<div data-value="AZE" data-selectable="">
																<strong>아제르바이잔</strong> (+994)
															</div>
															<div data-value="EST" data-selectable="">
																<strong>에스토니아</strong> (+372)
															</div>
															<div data-value="SLV" data-selectable="">
																<strong>엘살바도르</strong> (+503)
															</div>
															<div data-value="GBR" data-selectable="">
																<strong>영국</strong> (+44)
															</div>
															<div data-value="YEM" data-selectable="">
																<strong>예맨</strong> (+967)
															</div>
															<div data-value="AUT" data-selectable="">
																<strong>오스트리아</strong> (+43)
															</div>
															<div data-value="JOR" data-selectable="">
																<strong>요르단</strong> (+962)
															</div>
															<div data-value="UZB" data-selectable="">
																<strong>우즈베키스탄</strong> (+998)
															</div>
															<div data-value="UKR" data-selectable="">
																<strong>우크라이나</strong> (+380)
															</div>
															<div data-value="ISR" data-selectable="">
																<strong>이스라엘</strong> (+972)
															</div>
															<div data-value="EGY" data-selectable="">
																<strong>이집트</strong> (+20)
															</div>
															<div data-value="ITA" data-selectable="">
																<strong>이탈리아</strong> (+39)
															</div>
															<div data-value="IND" data-selectable="">
																<strong>인도</strong> (+91)
															</div>
															<div data-value="IDN" data-selectable="">
																<strong>인도네시아</strong> (+62)
															</div>
															<div data-value="JPN" data-selectable="">
																<strong>일본</strong> (+81)
															</div>
															<div data-value="CHN" data-selectable="">
																<strong>중국</strong> (+86)
															</div>
															<div data-value="ZWE" data-selectable="">
																<strong>짐바브웨</strong> (+263)
															</div>
															<div data-value="CZE" data-selectable="">
																<strong>체코</strong> (+420)
															</div>
															<div data-value="KAZ" data-selectable="">
																<strong>카자흐스탄</strong> (+7)
															</div>
															<div data-value="QAT" data-selectable="">
																<strong>카타르</strong> (+974)
															</div>
															<div data-value="KHM" data-selectable="">
																<strong>캄보디아</strong> (+855)
															</div>
															<div data-value="CAN" data-selectable="">
																<strong>캐나다</strong> (+1)
															</div>
															<div data-value="KEN" data-selectable="">
																<strong>케냐</strong> (+254)
															</div>
															<div data-value="CRI" data-selectable="">
																<strong>코스타리카</strong> (+506)
															</div>
															<div data-value="COL" data-selectable="">
																<strong>콜롬비아</strong> (+57)
															</div>
															<div data-value="CUB" data-selectable="">
																<strong>쿠바</strong> (+53)
															</div>
															<div data-value="KWT" data-selectable="">
																<strong>쿠웨이트</strong> (+965)
															</div>
															<div data-value="KGZ" data-selectable="">
																<strong>키르키즈스탄</strong> (+996)
															</div>
															<div data-value="TJK" data-selectable="">
																<strong>타지키스탄</strong> (+992)
															</div>
															<div data-value="THA" data-selectable="">
																<strong>태국</strong> (+66)
															</div>
															<div data-value="TKM" data-selectable="">
																<strong>투르크메니스탄</strong> (+993)
															</div>
															<div data-value="TUN" data-selectable="">
																<strong>튀니지</strong> (+216)
															</div>
															<div data-value="TUR" data-selectable="">
																<strong>튀르키예</strong> (+90)
															</div>
															<div data-value="PRY" data-selectable="">
																<strong>파라과이</strong> (+595)
															</div>
															<div data-value="PAK" data-selectable="">
																<strong>파키스탄</strong> (+92)
															</div>
															<div data-value="PER" data-selectable="">
																<strong>페루</strong> (+51)
															</div>
															<div data-value="PRT" data-selectable="">
																<strong>포르투갈</strong> (+351)
															</div>
															<div data-value="POL" data-selectable="">
																<strong>폴란드</strong> (+48)
															</div>
															<div data-value="FRA" data-selectable="">
																<strong>프랑스</strong> (+33)
															</div>
															<div data-value="FJI" data-selectable="">
																<strong>피지</strong> (+679)
															</div>
															<div data-value="FIN" data-selectable="">
																<strong>핀란드</strong> (+358)
															</div>
															<div data-value="PHL" data-selectable="">
																<strong>필리핀</strong> (+63)
															</div>
															<div data-value="HUN" data-selectable="">
																<strong>헝가리</strong> (+36)
															</div>
															<div data-value="AUS" data-selectable="">
																<strong>호주</strong> (+61)
															</div>
															<div data-value="HKG" data-selectable="">
																<strong>홍콩</strong> (+852)
															</div>
														</div>
													</div>
												</div>
												<select selectize="" config="vm.config.phoneCountryCode"
													options="vm.phoneCodes" ng-readonly="vm.isReadonly()"
													ng-disabled="vm.isDisabled()" ncp-disabled=""
													ng-model="vm.phoneNumberInfo.countryCode"
													placeholder="국가 코드" ng-required="vm.isRequired()"
													class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
													tabindex="-1"
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
													disabled=""><option value="" selected="selected"></option></select>
											</div>
											<div class="form-group">
												<div class="seller-input-wrap">
													<input type="tel"
														class="form-control ng-pristine ng-untouched ng-empty ng-valid-maxlength ng-valid-global-phone-no ng-valid-required ng-valid ng-valid-regex-pattern-custom"
														id="phoneNumber2"
														name="230720043838873_60_phone_field_key"
														placeholder="-없이 연락가능한 전화번호 입력"
														ncp-regex-pattern-custom=""
														ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;numeric&quot;]}"
														ng-regex-pattern-custom-err-type="pattern.custom"
														ng-model="vm.phoneNumberInfo.phoneNo"
														ng-model-options="{debounce: 300}" maxlength="20"
														ng-disabled="vm.isDisabled()" ncp-disabled=""
														ng-readonly="vm.isReadonly()"
														ncp-global-phone-no="!vm.isDisabled()"
														ncp-valid-mobile="false" ncp-valid-country-code=""
														ng-required="vm.isRequired()" ncp-message-container=""
														ncp-input-clear=""
														ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;숫자만 입력 가능합니다.&quot;}"
														disabled="disabled"><a role="button"
														class="btn-clear" tabindex="-1" style="display: none;"><span
														aria-label="삭제">×</span></a>
												</div>
											</div>
											</ncp-phone-field>
										</div>
									</div></li>
								<!----></ncp-address-book-field>
								<li><label class="control-label">기본 반품&nbsp;<br
										class="visible-xs">택배사 설정
								</label>
								<div class="input-content">
										<strong class="text-info">네이버 페이 지정택배 : 우체국택배</strong> (건당
										3,000원 네이버 페이 계약요율 적용)
										<p>
											<a ui-sref="main.seller-info" href="#/seller/info"><strong>‘판매자정보’</strong></a>
											메뉴에서 변경 가능합니다.
										</p>
										<p class="text-primary">
											<a href="https://parcel.epost.go.kr" target="_blank"
												class="btn-link"
												data-nclicks-code="dlvSettleInfo.seeNaverPayDlvTOS">네이버페이
												지정택배(우체국택배) 약관보기</a><i class="fn-shopping fn-shopping-forward2"
												aria-hidden="true"></i>
										</p>
									</div></li>
								<ncp-settle-account-info-field
									pay-info="vm.changeJudgment.naverPay" type="CHANGE"
									use-settlement-type="true"
									is-readonly="!vm.isValidBusinessStatus" is-required="true"><!----><!----><!----><!----><!----><!---->
								<ng-include
									ng-if="vm.type === 'CHANGE' &amp;&amp; !vm.isOversea() &amp;&amp; vm.isCenter()"
									src="'shared/settle-account/include/domestic-change.html.inc'">
								<li ng-class="{&quot;include-line&quot;:true}"
									class="include-line"><label
									class="control-label long-label">정산대금&nbsp;<br
										class="visible-xs">입금계좌/<br>수령방법
								</label>
								<!---->
									<div class="input-content" ng-if="vm.useSettlementType()">
										<div class="form-group">
											<!---->
											<!---->
											<div class="seller-input" ng-if="vm.isReadonly()">정산대금
												입금계좌</div>
											<!---->
										</div>
										<p class="sub-text text-primary">네이버페이 비즈 월렛은 판매대금을 정산받을 수
											있는 예치금 수단입니다.</p>
										<p class="sub-text text-primary">비즈 월렛은 판매자 정보에 등록된 계좌로 출금
											요청 하실 수 있으며 쇼핑파트너센터(네이버쇼핑) 충전금으로 전환 후 쇼핑 부가 광고 구매 시 사용하실 수
											있습니다</p>
										<!---->
										<!---->
									</div>
									<!----></li>
								<li class="sub-info"><div class="inner">
										<label class="control-label"></label>
										<div class="input-content">
											<div class="form-inline">
												<div class="form-group">
													<div
														class="selectize-control ng-pristine ng-untouched ng-valid single">
														<div
															class="selectize-input items full has-options has-items ng-invalid ng-pristine locked">
															<div data-value="" class="item">은행선택</div>
															<input type="text" autocomplete="off" tabindex="0"
																readonly=""
																style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
														</div>
														<div
															class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
															style="display: none; width: 206px; top: 34px; left: 0px;">
															<div class="selectize-dropdown-content">
																<div data-value="" data-selectable=""
																	class="option selected active">은행선택</div>
																<div data-value="KB" data-selectable="" class="option">국민은행</div>
																<div data-value="IBK" data-selectable="" class="option">기업은행</div>
																<div data-value="NH" data-selectable="" class="option">농협</div>
																<div data-value="SHINHAN" data-selectable=""
																	class="option">신한은행</div>
																<div data-value="WOORI" data-selectable=""
																	class="option">우리은행</div>
																<div data-value="SC" data-selectable="" class="option">SC제일은행</div>
																<div data-value="HANA" data-selectable="" class="option">KEB하나은행</div>
																<div data-value="CITI" data-selectable="" class="option">한국시티은행</div>
																<div data-value="KJB" data-selectable="" class="option">광주은행</div>
																<div data-value="KNB" data-selectable="" class="option">경남은행</div>
																<div data-value="DGB" data-selectable="" class="option">대구은행</div>
																<div data-value="BS" data-selectable="" class="option">부산은행</div>
																<div data-value="JB" data-selectable="" class="option">전북은행</div>
																<div data-value="JEJU" data-selectable="" class="option">제주은행</div>
																<div data-value="SUHYUP" data-selectable=""
																	class="option">수협</div>
																<div data-value="POST" data-selectable="" class="option">우체국</div>
																<div data-value="KDB" data-selectable="" class="option">산업은행</div>
																<div data-value="KFCC" data-selectable="" class="option">새마을금고</div>
																<div data-value="CU" data-selectable="" class="option">신협</div>
																<div data-value="FSB" data-selectable="" class="option">저축은행</div>
																<div data-value="HSBC" data-selectable="" class="option">HSBC은행</div>
																<div data-value="KBANK" data-selectable=""
																	class="option">케이뱅크</div>
																<div data-value="KKOBANK" data-selectable=""
																	class="option">카카오뱅크</div>
																<div data-value="TOSS" data-selectable="" class="option">토스뱅크</div>
																<div data-value="JPMC" data-selectable="" class="option">JP모건은행</div>
																<div data-value="DEUTSCHE" data-selectable=""
																	class="option">도이치은행</div>
															</div>
														</div>
													</div>
													<select selectize="" config="vm.config.selectize.default"
														options="vm.options.bankCode"
														ng-model="vm.payInfo.bankAccountInfo.bankCode"
														ng-required="vm.isRequired()"
														ng-change="vm.clearCertificate()" placeholder="은행선택"
														ng-readonly="vm.isReadonly()" title="은행선택"
														class="ng-pristine ng-untouched selectized ng-invalid ng-invalid-required ng-empty"
														tabindex="-1"
														style="width: 4px; opacity: 0; position: absolute; left: -10000px;"
														required="required" readonly="readOnly"><option
															value="">은행선택</option></select>
												</div>
											</div>
											<div class="form-inline has-error-msg">
												<div class="form-group">
													<div class="seller-input-wrap">
														<input type="text"
															class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-minlength ng-valid-maxlength"
															name="accountHolder" placeholder="예금주명" title="예금주명 입력"
															minlength="2" maxlength="40"
															ng-required="vm.isRequired()"
															ng-model="vm.payInfo.bankAccountInfo.accountHolder"
															ng-model-options="{debounce: 300}"
															ng-change="vm.clearCertificate()"
															ng-readonly="vm.isReadonly()" ncp-input-clear=""
															required="required" readonly="readOnly"><a
															role="button" class="btn-clear" tabindex="-1"
															style="display: none;"><span aria-label="삭제">×</span></a>
													</div>
												</div>
												<div class="form-group">
													<div class="input-group">
														<div class="seller-input-wrap">
															<input type="text"
																class="form-control ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-minlength ng-valid-maxlength"
																placeholder="계좌번호 (-없이 입력)" title="계좌번호 입력"
																name="accountNumber" minlength="4" maxlength="20"
																ng-required="vm.isRequired()"
																ncp-regex-pattern-custom=""
																ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;numeric&quot;]}"
																ng-regex-pattern-custom-err-type="pattern.custom"
																ng-model="vm.payInfo.bankAccountInfo.accountNumber"
																ng-model-options="{debounce: 300}"
																ng-change="vm.clearCertificate()"
																ng-readonly="vm.isReadonly()" ncp-input-clear=""
																ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;숫자만 입력 가능합니다.&quot;}"
																required="required" readonly="readOnly"><a
																role="button" class="btn-clear" tabindex="-1"
																style="display: none;"><span aria-label="삭제">×</span></a>
														</div>
														<!---->
													</div>
													<input type="hidden"
														name="_hidden_cert_230720043838721_54_settle_account_info_key"
														ng-model="vm.payInfo.certificatedDate"
														ng-required="vm.isRequired()" autocomplete="off"
														class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"
														required="required">
												</div>
												<!---->
											</div>
											<!---->
											<!---->
											<p class="sub-text text-primary">
												일반(간이) 사업자의 예금주는 대표자명 또는 사업자등록증의 상호명과 동일해야 하며<br>법인사업자의
												예금주는 사업자등록증의 법인 명의와 동일해야 합니다.
											</p>
										</div>
									</div></li>
								</ng-include><!----><!----><!----><!----><!----><!----></ncp-settle-account-info-field>
							</ul>
						</div>
					</div>
					<!-- 정산정보변경 끝 -->

					<!-- 배송정보변경 시작 -->
					<!-- 정산정보변경이랑 통합 -->
					<!-- 배송정보변경 끝 -->

					<!-- 관리자권한추가/삭제 시작 -->
					<div class="modal-dialog modal-md">
						<div class="modal-content" uib-modal-transclude="">
							<div class="modal-header bg-primary"
								ng-show="vm.headerHtml == undefined"
								ng-class="{'bg-snow': vm.isSnowSdk, 'bg-default': vm.useGray}">
								<!---->
								<button type="button" class="close" aria-label="Close"
									ng-if="vm.closeBtnNotUse === undefined || !vm.closeBtnNotUse"
									ng-click="vm.closeModal()">
									<span aria-hidden="true">×</span>
								</button>
								<!---->
								<h3 class="modal-title">
									<span ng-bind-html="vm.title">초대하기</span>
									<!---->
								</h3>
							</div>
							<!---->
							<div class="modal-body" ng-include="vm.bodyHtml">
								<form name="vm.inviteForm" ng-submit="vm.addInviteMember()"
									novalidate="" autocomplete="off"
									class="ng-pristine ng-valid-required ng-valid-minlength ng-valid-maxlength ng-valid-pattern ng-valid-regex-pattern-custom ng-valid ng-valid-global-phone-no">
									<p class="sub-text">
										초대하고자 하는 매니저의 이름과 휴대폰 번호를 입력해서 초대하세요.<br>매니저 초대는 한 번에 최대
										10명까지 가능합니다.
									</p>
									<p class="sub-text text-primary">매니저 초대를 통해 발생하는 모든 책임은 판매자
										회원님 당사자에게 있습니다.</p>
									<p class="sub-text">
										<strong>네이버</strong>는 <strong>매니저 초대로 인해 발생할 수 있는 모든
											일</strong>에 대해 <strong>책임을 지지 않습니다.</strong>
									</p>
									<div class="form-group-wrap">
										<div class="form-inline">
											<div class="form-group">
												<div class="input-group">
													<div class="seller-input-wrap">
														<input type="text"
															class="form-control ng-pristine ng-untouched ng-empty ng-valid-minlength ng-valid-maxlength ng-valid ng-valid-regex-pattern-custom"
															placeholder="이름" ng-model="vm.inviteMemberName"
															title="이름 입력" ng-minlength="2" ng-maxlength="40"
															ncp-regex-pattern-custom=""
															ncp-regex-pattern-custom-rules="{&quot;type&quot;: &quot;matched&quot;, &quot;names&quot;: [&quot;korean&quot;, &quot;upperCase&quot;, &quot;lowerCase&quot;, &quot;space&quot;]}"
															ng-regex-pattern-custom-err-type="pattern.custom"
															ncp-input-clear=""
															ncp-regex-pattern-custom-params="{&quot;message&quot;:&quot;한글, 영문 대문자, 영문 소문자, 문자사이 공백만 입력 가능합니다.&quot;}"><a
															role="button" class="btn-clear" tabindex="-1"
															style="display: none;"><span aria-label="삭제">×</span></a>
													</div>
												</div>
											</div>
										</div>
										<div class="form-inline has-error-msg">
											<div class="form-group">
												<div
													class="selectize-control ng-pristine ng-untouched ng-valid single">
													<div
														class="selectize-input items ng-valid ng-pristine full has-options has-items">
														<div data-value="KOR">
															<strong>대한민국</strong> (+82)
														</div>
														<input type="text" autocomplete="off" tabindex="0"
															readonly=""
															style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
													</div>
													<div
														class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
														style="display: none;">
														<div class="selectize-dropdown-content">
															<div data-value="KOR" data-selectable=""
																class="selected active">
																<strong>대한민국</strong> (+82)
															</div>
															<div data-value="NZL" data-selectable="">
																<strong>뉴질랜드</strong> (+64)
															</div>
															<div data-value="TWN" data-selectable="">
																<strong>대만</strong> (+886)
															</div>
															<div data-value="DEU" data-selectable="">
																<strong>독일</strong> (+49)
															</div>
															<div data-value="USA" data-selectable="">
																<strong>미국</strong> (+1)
															</div>
															<div data-value="VNM" data-selectable="">
																<strong>베트남</strong> (+84)
															</div>
															<div data-value="SGP" data-selectable="">
																<strong>싱가폴</strong> (+65)
															</div>
															<div data-value="GBR" data-selectable="">
																<strong>영국</strong> (+44)
															</div>
															<div data-value="ITA" data-selectable="">
																<strong>이탈리아</strong> (+39)
															</div>
															<div data-value="IDN" data-selectable="">
																<strong>인도네시아</strong> (+62)
															</div>
															<div data-value="JPN" data-selectable="">
																<strong>일본</strong> (+81)
															</div>
															<div data-value="CHN" data-selectable="">
																<strong>중국</strong> (+86)
															</div>
															<div data-value="THA" data-selectable="">
																<strong>태국</strong> (+66)
															</div>
															<div data-value="TUR" data-selectable="">
																<strong>튀르키예</strong> (+90)
															</div>
															<div data-value="FRA" data-selectable="">
																<strong>프랑스</strong> (+33)
															</div>
															<div data-value="AUS" data-selectable="">
																<strong>호주</strong> (+61)
															</div>
															<div data-value="HKG" data-selectable="">
																<strong>홍콩</strong> (+852)
															</div>
														</div>
													</div>
												</div>
												<select selectize="" title="국가 코드"
													config="vm.config.selectize.phoneCountryCode"
													options="vm.config.options.phoneCountryCode"
													ng-model="vm.countryCode"
													class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
													tabindex="-1"
													style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
														value="? string:KOR ?" selected="selected"></option>
													<option value="KOR">Korea</option></select>
											</div>
											<div class="form-group">
												<div class="input-group">
													<div class="seller-input-wrap">
														<input type="tel" pattern="[0-9]*"
															class="form-control ng-pristine ng-untouched ng-empty ng-valid-pattern ng-valid ng-valid-global-phone-no"
															id="cell-phone" placeholder="휴대폰 번호 입력"
															ng-model="vm.cellphoneNo" ncp-valid-country-code="KOR"
															ncp-valid-mobile="true" ncp-global-phone-no="true"
															ncp-input-clear=""><a role="button"
															class="btn-clear" tabindex="-1" style="display: none;"><span
															aria-label="삭제">×</span></a>
													</div>
													<span class="input-group-btn"><button type="submit"
															class="btn btn-default2">추가</button></span>
												</div>
											</div>
										</div>
									</div>
								</form>
								<div class="form-group-wrap">
									<!---->
									<!---->
									<div class="box-info" ng-if="vm.inviteMembers.length == 0">
										<div class="result-info">
											<i
												class="fn-shopping fn-65 fn-shopping-caution1 icon-color-big"
												aria-hidden="true"></i>
											<h3 class="title">추가된 매니저가 없습니다.</h3>
										</div>
									</div>
									<!---->
								</div>
								<div class="form-group-wrap form-group pd-bottom-xxlg">
									<div
										class="selectize-control ng-pristine ng-untouched ng-valid single">
										<div
											class="selectize-input items required ng-valid ng-pristine full has-options has-items">
											<div data-value="ACCOUNT_SUB" class="item">계정 부매니저</div>
											<input type="text" autocomplete="off" tabindex="0"
												readonly=""
												style="width: 4px; opacity: 0; position: absolute; left: -10000px;">
										</div>
										<div
											class="selectize-dropdown single ng-pristine ng-untouched ng-valid"
											style="display: none; width: 608.667px; top: 34px; left: 0px;">
											<div class="selectize-dropdown-content">
												<div data-value="ACCOUNT" data-selectable="" class="option">계정
													주매니저</div>
												<div data-value="ACCOUNT_SUB" data-selectable=""
													class="option selected active">계정 부매니저</div>
												<div data-value="INFLUENCER" data-selectable=""
													class="option">인플루언서</div>
												<div data-value="AGENCY" data-selectable="" class="option">대행사</div>
											</div>
										</div>
									</div>
									<select selectize="" placeholder="권한 선택"
										config="vm.config.selectize.default"
										options="vm.config.options.invitableRoleType"
										ng-model="vm.inviteRoleType" required=""
										class="ng-pristine ng-untouched ng-valid selectized ng-valid-required ng-not-empty"
										tabindex="-1"
										style="width: 4px; opacity: 0; position: absolute; left: -10000px;"><option
											value="? string:ACCOUNT_SUB ?" selected="selected"></option>
										<option value="ACCOUNT_SUB">계정 부매니저</option></select>
								</div>
							</div>
							<!---->
							<!---->
							<!---->
							<div class="modal-footer"
								ng-if="(vm.footerNotUse == undefined || !vm.footerNotUse) &amp;&amp; !_.isEmpty(vm.footerHtml)"
								ng-include="vm.footerHtml">
								<div class="seller-btn-area pd-top-xxlg">
									<button type="button" class="btn btn-default"
										data-dismiss="modal" ng-click="vm.closeModal()">취소</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" ng-click="vm.submit()">확인</button>
								</div>
							</div>
							<!---->
						</div>
					</div>
					<!-- 관리자권한추가/삭제 끝 -->

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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

</body>

</html>