<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>seller/questionMng</title>

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

	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/npay_seller.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/uio_calendar.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/naver/naverCss/grid.css">
						
	<!-- 사이드바 줄어든거 되돌리기 -->
	<style type="text/css">
	 html {font-size: 1rem !important;}
	 body {font-size: 1rem !important;}
	</style>
	<style>
	.uio_grid table td {
	white-space: nowrap;
	word-break: break-all
	}
	</style>
	<style>
	    .custom-th {
    padding-top: 8px;
    padding-bottom: 8px;
    vertical-align: middle; /* 글자를 수직 가운데 정렬합니다. */
  }
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
                        <h1 class="h3 mb-0 text-gray-800">문의관리</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                        <i class="fas fa-download fa-sm text-white-50"></i> Generate Report
                        </a>
                    </div>
                    <!-- 페이지 상단 끝 -->


					<!-- 고객문의관리 시작 -->
						<div id="wrap">
							<div id="container">
								<div id="content">
									<div class="hd2_wrap">
										<h2 class="hd2 h_sell8 fl">
											<span class="blind">고객문의 관리</span>
										</h2>
									</div>
					
									<div class="tbl_type">
										<form id="searchForm" name="searchForm"
											onsubmit="return searchFormSubmit();">
											<input type="submit"
												style="position: absolute; left: -5000px; top: -5000px"
												value="검색">
											<table class="custom-table">
												<caption>고객문의</caption>
												<colgroup>
													<col width="13%">
													<col>
													<col width="13%">
													<col width="13%">
													<col width="13%">
													<col width="35%">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row" class="vline_m">문의 접수일</th>
														<td colspan="3">
															<div style="display: inline-block;"
																class="_displayArea _dateRangePickerArea">
																<!--  이부분에 선택하는 버튼을 넣던지 달력을 넣자 지금 아무것도 안뜸 -->
<!-- 																<ul id="period_selector" class="day_link_ct _quickArea"> -->
<!-- 																	<li class="_quick_today"><a href="#" class="per"><span -->
<!-- 																			class="blind">오늘</span></a></li> -->
<!-- 																	<li class="_quick_day_3"><a href="#" class="per7"><span -->
<!-- 																			class="blind">3일</span></a></li> -->
<!-- 																	<li class="_quick_week"><a href="#" class="per2"><span -->
<!-- 																			class="blind">1주일</span></a></li> -->
<!-- 																	<li class="_quick_month"><a href="#" class="per3"><span -->
<!-- 																			class="blind">1개월</span></a></li> -->
<!-- 																	<li class="_quick_month_3 on"><a href="#" class="per4"><span -->
<!-- 																			class="blind">3개월</span></a></li> -->
<!-- 																</ul> -->
<!-- 																<span class="h_bar">|</span> <span class="ipt_date"> <span -->
<!-- 																	id="start_date"> <input name="fromDate" type="text" -->
<!-- 																		title="시작날짜" style="width: 81px;" readonly=""> <a -->
<!-- 																		href="#" class="_btn calendar"><span class="blind">달력</span></a> -->
<!-- 																</span> <span id="end_date"> <input name="toDate" type="text" -->
<!-- 																		title="시작날짜" style="width: 81px;" readonly=""> <a -->
<!-- 																		href="#" class="_btn calendar"><span class="blind">달력</span></a> -->
<!-- 																</span> <input type="hidden" name="searchStartYmdt" -->
<!-- 																	id="searchStartYmdt" value="2023-04-20 00:00:00"> <input -->
<!-- 																	type="hidden" name="searchEndYmdt" id="searchEndYmdt" -->
<!-- 																	value="2023-07-20 23:59:59"> -->
<!-- 																</span> -->
															</div>
														</td>
<!-- 														<th scope="row" class="vline_m">만족도</th> -->
<!-- 														<td><select name="satisfaction"> -->
<!-- 																<option value="">전체</option> -->
<!-- 																<option value="both">만족+불만족</option> -->
<!-- 																<option value="satisfied">만족</option> -->
<!-- 																<option value="disSatisfied">불만족</option> -->
<!-- 														</select></td> -->
													</tr>
													<tr>
														<th scope="row" class="vline_m"><label for="sel_choice">처리상태</label></th>
														<td><select id="sel_choice" name="treatmentStatus"
															style="width: 85px">
																<option value="">전체</option>
																<option value="Y">답변완료</option>
																<option value="N">미답변</option>
														</select></td>
														<th scope="row" class="vline_m"><label for="sel_choice2">문의유형</label></th>
														<td><select id="sel_choice2" name="inquiryType"
															style="width: 85px">
																<option value="">전체</option>
																<option value="60001">상품</option>
																<option value="60002">배송</option>
																<option value="60006">환불</option>
																<option value="60007">기타</option>
														</select></td>
														<th scope="row" class="vline_m"><label for="sel_choice3">상세검색</label></th>
														<td><select id="sel_choice3" name="searchType"
															style="width: 85px">
																<option value="">선택</option>
																<option value="productName">상품명</option>
																<option value="purchaserName">질문자명</option>
														</select> <input type="text" title="상세검색" class="ipt" name="queryText"
															onfocus="this.className='ipt ipt_on';"
															onblur="this.className='ipt';" maxlength="20"
															style="width: 167px"></td>
													</tr>
												</tbody>
											</table>
											<!--  어디에쓰는건지 몰라서 주석 : 서영 -->
<!-- 											<input type="hidden" name="orderBy" value=""> <input -->
<!-- 												type="hidden" name="orderDir" value=""> -->
										</form>
									</div>
					
									<div class="btn_wrap" style="margin-top: 20px">
										<a href="#" class="btn_b" id="search_bt" onclick="return false;"><span>검색</span></a>
									</div>
					
									<div style="height: 378px;">
										<div class="_qna_list_container scrl uio_grid"
											style="width: 100%; height: 377px;">
											<div class="_flexible_area flexible_area" style="display: block;">
												<div class="_header header" style="height: 30px;">
													<table>
													  <colgroup>
													    <col style="width: 150px;">
													    <col style="width: 120px;">
													    <col style="width: 100px;">
													    <col style="width: 500px;">
													    <col style="width: 400px;">
													    <col style="width: 150px;">
													    <col style="width: 150px;">
													  </colgroup>
													  <tbody>
													    <tr>
													<th class="custom-th">접수일</th>
													  <th class="custom-th">처리상태</th>
													  <th class="custom-th">문의유형</th>
													  <th class="custom-th">문의제목</th>
													  <th class="custom-th">상품명</th>
													  <th class="custom-th">질문자</th>
													  <th class="custom-th">처리일시</th>
													    </tr>
													  </tbody>
													</table>

													<div class="_resize_handle_container resize_handle_container"></div>
												</div>
												<div class="_body body" style="height: 360px;">
													<div class="_virtual_bar virtual_bar" style="display: block;"></div>
													<div class="_table_container">
													<input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
														<table>
															<colgroup>
															<col data-columnname="regDate" style="width: 150px;">
															<col data-columnname="answerYn" style="width: 120px;">
															<col data-columnname="inquiryCategory" style="width: 100px;">
															<col data-columnname="title" style="width: 500px;">
															<col data-columnname="productName" style="width: 400px;">
															<col data-columnname="inquiryMemberName" style="width: 150px;">
															<col data-columnname="treatmentDate" style="width: 150px;">
															</colgroup>
															<tbody>
															  <c:forEach var="row" items="${oneboard}">
															    <tr class="data-row" data-one-board-content="${row.one_board_content}" data-one-board-num="${row.one_board_num}" >
															      <td>${row.one_board_day}</td>
															      <td>${row.one_board_repYn}</td>
															      <td>${row.one_board_type}</td>
															      <td class="one_board_title">${row.one_board_title}</td>
															      <td>${row.item_name}</td>
															      <td>${row.member_name}</td>
															      <td>${row.one_board_repDay}</td>
															    </tr>
															  </c:forEach>
															</tbody>

														</table>
													</div>
													<div class="_selection_layer selection_layer"></div>
												</div>
												<div class="_virtual_scrollbar virtual_scrollbar"
													style="display: block; height: 340px; top: 20px;">
													<div class="_content content"></div>
												</div>
												<div class="_space space" style="display: block; height: 20px;"></div>
											</div>
											<div class="left_line"></div>
											<div class="right_line"></div>
											<textarea class="_clipboard clipboard"></textarea>
										</div>
									</div>
					
									<div class="box_column2">
										<div class="ct_box">
											<div class="hd_wrap">
											<input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
												<h3 class="hd3">
													고객문의 내용 보기
												</h3>
											</div>
											<div class="tbl_type">
					
												<table>
													<caption>고객문의 내용 보기</caption>
													<colgroup>
														<col width="25%">
														<col width="25%">
														<col width="25%">
														<col width="25%">
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">접수일</th>
															<td id="one_board_day" colspan="3" class="line_h18">&nbsp;</td>
														</tr>
														<tr>
														<th scope="row">처리일</th>
															<td id="one_board_repDay" colspan="3" class="line_h18">&nbsp;</td>
														</tr>
														<tr>
														<th scope="row">질문자</th>
															<td id="seller_name" colspan="3" class="line_h18">&nbsp;</td>
														</tr>
														<tr>
															<th scope="row">상품명</th>
															<td id="item_name">&nbsp;</td>
															<th scope="row">문의유형</th>
															<td id="one_board_type">&nbsp;</td>
														</tr>
														<tr>
															<th scope="row">제목</th>
															<td id="one_board_title" colspan="3" class="line_h18">&nbsp;</td>
														</tr>
														<tr>
															<th scope="row">문의내용</th>
															<td id="one_board_content" colspan="3" class="line_h18">&nbsp;</td>
															
														</tr>
													</tbody>
												</table>
											</div>
										</div>
					
										<div class="ct_box fr">
											<div class="hd_wrap">
												<h3 class="hd3 fl">판매자 답변 처리</h3>
												
											</div>
											<div class="tbl_type">
												<form id="answerForm" action="updateReply" method="POST">
  <input type="hidden" id="seller_num" value="${sessionScope.seller_num}">
  <input type="hidden" id="one_board_num" name="one_board_num">
  
  <table>
    <caption>판매자 답변 처리</caption>
    <colgroup>
      <col width="25%">
      <col>
    </colgroup>
    <tbody>
      <tr>
        <th scope="row">답변내용</th>
        <td>
          <textarea cols="30" rows="5" id="one_board_reply"
            name="one_board_reply" onfocus="this.className='ta scrl ta_on';"
            onblur="this.className='ta scrl';" class="ta scrl"
            style="width: 100%; height: 250px"></textarea>
          <div class="space_h">
            <span class="num_meta2 fr"><em><span
              class="blind">입력된 글자수 : </span><span
              id="_char_count_span">0</span></em>/<strong><span
              class="blind">최대 입력 글자 : </span>1,000</strong></span>
           <button type="submit" class="btn_d"><span>답변하기</span></button>

            <a href="#" style="display: none;" onclick="sendFormData(event, 'update')" id="editComment" class="btn_d"><span>답변수정</span></a>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
</form>


											</div>
										</div>
									</div>
					
									<script type="text/javascript">
										var toDate = "2023-07-20";
										var fromDate = "2023-04-20";
										var treatmentStatus = false;
										var productUrl = "http://sell.smartstore.naver.com/p";
										var wtfProductUrl = "https://sell.smartstore.naver.com/#/products";
										var orderSellerAdminUrl = "https://sell.smartstore.naver.com/o";
										var viewInquiryId = "0";
										var templates = {};
									</script>
					
									<script type="text/javascript">
										var oDateRange = {};
					
										var ghtRowList = [];
					
										var _requestParameters = "";
					
										var oPagination = new jindo.Pagination("paginate", {
											nItem : 1,
											nItemPerPage : 1,
											nPagePerPageList : 10,
											nPage : 1
										}).attach({
											move : function(oCustomEvent) {
												setGridByPaging(oCustomEvent.nPage);
											}
										});
					
// 										var _gridInstance = new nmp.component.ExtendGrid(
// 												{
// 													"sGridName" : "qna_grid",
// 													"sRootElementSelector" : "._qna_list_container",
// 													"nHeaderHeight" : 45,
// 													"nRowHeight" : 37,
// 													"bUseAutoNumbering" : false,
// 													"bUseColumnResizing" : false,
// 													"bUseRowCopy" : true,
// 													"sKeyColumnName" : "productOrderNo",
// 													"sNoRowMessage" : "데이터가 존재하지 않습니다.",
// 													"aColumnModel" : [
// 															{
// 																"sTitle" : "접수일",
// 																"nWidth" : 120,
// 																"sAlign" : "center",
// 																"sColumnName" : "regDate",
// 																"htSort" : {
// 																	"sDirection" : "DESC",
// 																	"sRequestName" : "regDate",
// 																	"bDefault" : true
// 																}
// 															},
// 															{
// 																"sTitle" : "처리상태",
// 																"nWidth" : 60,
// 																"sColumnName" : "answerYn",
// 																"sAlign" : "center"
// 															},
// 															{
// 																"sTitle" : "문의유형",
// 																"nWidth" : 60,
// 																"sColumnName" : "inquiryCategory",
// 																"sAlign" : "center"
// 															},
// 															{
// 																"sTitle" : "주문번호",
// 																"sColumnName" : "orderNo",
// 																"nWidth" : 130,
// 																"sAlign" : "center",
// 																"fFormater" : function(vValue,
// 																		htRow) {
// 																	var sValue = String(vValue);
// 																	return sValue ? "<a href='#' onClick='openOrderPopup("
// 																			+ htRow.orderNo
// 																			+ ");return false;'> "
// 																			+ sValue + "</a>"
// 																			: "";
// 																}
// 															},
// 															{
// 																"sTitle" : "문의제목",
// 																"sColumnName" : "title",
// 																"nWidth" : 320,
// 																"fFormater" : function(vValue,
// 																		htRow) {
// 																	var sValue = String(vValue);
// 																	return sValue ? "<a href='#' onClick='viewDetail("
// 																			+ htRow.id
// 																			+ ");return false;'> "
// 																			+ sValue + "</a>"
// 																			: "";
// 																}
// 															},
// 															{
// 																"sTitle" : "상품번호",
// 																"nWidth" : 100,
// 																"sColumnName" : "productNo",
// 																"sAlign" : "center",
// 																"htSort" : {
// 																	"sDirection" : "DESC",
// 																	"sRequestName" : "productNo",
// 																	"bDefault" : false
// 																}
// 															},
// 															{
// 																"sTitle" : "상품명",
// 																"sColumnName" : "productName",
// 																"nWidth" : 320,
// 																"htSort" : {
// 																	"sDirection" : "DESC",
// 																	"sRequestName" : "productName",
// 																	"bDefault" : false
// 																}
// 															},
// 															{
// 																"sTitle" : "질문자",
// 																"nWidth" : 120,
// 																"sColumnName" : "inquiryMemberName",
// 																"sAlign" : "center",
// 																"fFormater" : function(vValue,
// 																		htRow) {
// 																	return htRow['inquiryMemberName']
// 																			+ "("
// 																			+ htRow['inquiryMemberId']
// 																			+ ")";
// 																}
// 															},
// 															{
// 																"sTitle" : "처리일시",
// 																"nWidth" : 150,
// 																"sColumnName" : "treatmentDate",
// 																"sAlign" : "center"
// 															},
// 															{
// 																"sTitle" : "만족도",
// 																"nWidth" : 80,
// 																"sColumnName" : "answerSatisfactionYn",
// 																"sAlign" : "center"
// 															} ],
// 													"htDataRequester" : {
// 														"elForm" : "searchForm"
// 													}
// 												})
// 												.attach({
// 													"beforeRequest" : function(oCustomEvent) {
// 														var form = $Form('searchForm');
// 														if (oCustomEvent.htParameter["page.sort"]
// 																&& oCustomEvent.htParameter["page.sort.dir"]) {
// 															_requestParameters["orderBy"] = oCustomEvent.htParameter["page.sort"];
// 															_requestParameters["orderDir"] = oCustomEvent.htParameter["page.sort.dir"];
// 															_requestParameters["paging.current"] = 1;
// 															_gridAjax();
// 														}
// 														oCustomEvent.stop(); // 호출시 리퀘스트 전송 되지 않음
// 													}
// 												});
					
										var test = function() {
											alert("test");
										}
					
										var initializeGrid = function() {
											if (treatmentStatus) {
												setGridNewInquiries();
											} else {
												setGridBySearchForm();
											}
										}
					
										var initSorting = function() {
											var form = $Form('searchForm');
											form.value("orderBy", "");
											form.value("orderDir", "");
											_gridInstance.resetSortHeader();
										}
					
										var _gridAjax = function(currentPage, itemCount) {
											_gridInstance.showLoadingLayer();
											var ajax = $Ajax("/u/customerInquiry/list", {
												onload : function(res) {
													var result = res.json();
													// 성공시 처리
													if (result.bSuccess) {
														_gridInstance
																.setRowList(result.htReturnValue);
														if (currentPage == undefined
																&& itemCount == undefined) {
															setPaginate(result);
														} else {
															//페이지가 지정되어있으면
															oPagination.setItemCount(itemCount);
															oPagination.reset();
															oPagination._paginate(currentPage);
														}
													}
												},
												onerror : function(res) {
													alert("문의 리스트를 불러오는 중에 오류가 발생했습니다.");
													_gridInstance.setRowList([]);
												}
											});
											ajax.header("Accept", "application/json");
											ajax.request(_requestParameters);
					
										}
					
										var setGridBySearchForm = function() {
											var form = $Form('searchForm');
											var htDateInfo = oDateRange.getValue();
											if (DateCoreAPI._getSolarDistance(
													htDateInfo.htStartDate, htDateInfo.htEndDate) > 184) {
												alert("검색기간은 6개월 미만이어야 합니다.");
												return false;
											}
											form.value("searchStartYmdt", form.value("fromDate")
													+ " 00:00:00");
											form.value("searchEndYmdt", form.value("toDate")
													+ " 23:59:59");
											_requestParameters = $S(form.serialize()).parseString();
											_gridAjax();
										}
					
										var setGridNewInquiries = function() {
											var form = $Form('searchForm');
											form.value("treatmentStatus", "N");
											_requestParameters = $S(form.serialize()).parseString();
											_gridAjax();
										}
					
										var setGridByPaging = function(nowPage) {
											_requestParameters["paging.current"] = nowPage;
											_gridAjax();
										}
					
										var setPaginate = function(paging) {
											oPagination.setItemCount(Math.ceil(paging.totalCount
													/ paging.rowsPerPage));
											oPagination.reset();
											oPagination._paginate(paging.currentPage);
											oPagination._nCurrentPage = paging.currentPage;
										}
					
										var gridRefresh = function() {
											_gridAjax(oPagination.getCurrentPage(), oPagination
													.getItemCount());
					
										}
					
										var viewDetail = function(id) {
											var ajax = $Ajax("/u/customerInquiry/inquiryComment/"
													+ id, {
												onload : function(res) {
													var result = res.json();
													// 성공시 처리
													if (result.bSuccess) {
														setInquiryComment(result.htReturnValue);
													}
												},
												onerror : function(res) {
													alert("상세 문의 내역을 불러오는 중에 오류가 발생했습니다.");
												}
											});
											ajax.header("Accept", "application/json");
											ajax.request();
										}
					
										var commentAction = function(el) {
											if ($Form("answerForm").value(
													"inquiryAnswerTempleteType") == 'NONE') {
												alert('문의유형을 선택해 주세요.');
												return false;
											}
											if ($Form("answerForm")
													.value("inquiryAnswerTempleteNo") == '') {
												alert('제목을 선택해 주세요.');
												return false;
											}
											if ($Form("answerForm").value("content") == '') {
												alert('답변내용을 입력해 주세요.');
												return false;
											}
											if ($Form("answerForm").value("content").length > 1000) {
												alert('답변내용 항목은 최대 1000자 이하로 입력해 주세요.');
												return false;
											}
											$Element(el).hide();
											var ajax = $Ajax(
													"/u/customerInquiry/commentAction",
													{
														onload : function(res) {
															var result = res.json();
															if (result.htReturnValue != null
																	&& result.htReturnValue.message != undefined
																	&& result.htReturnValue.message != "") { //메시지 출력
																alert(result.htReturnValue.message);
															}
															// 성공시 처리
															if (result.bSuccess) {
																gridRefresh();
																viewDetail($Form("answerForm")
																		.value("id.inquiryNo"));
															}
														},
														onerror : function(res) {
															alert("답변 처리 중에 오류가 발생했습니다.");
															$(el).style.display = '';
														}
													});
											ajax.header("Accept", "application/json");
											ajax.request($S($Form("answerForm").serialize())
													.parseString());
										}
					
										var printTemplateOptions = function(templateOptions) {
											var form = $Form('answerForm');
											var templateNo = form.value('inquiryAnswerTempleteNo');
											$Element('inquiryAnswerTempleteNo').html(
													"<option value=\'\'>템플릿을 선택해 주세요</option>"
															+ templateOptions);
											if (templateNo != "") {
												if (templates[templateNo] != undefined) {
													form.value('inquiryAnswerTempleteNo',
															templateNo);
													form.value('content', templates[templateNo]);
												} else {
													form.value('inquiryAnswerTempleteNo', '');
												}
											}
										}
					
										//템플릿 리프레쉬
										var templateRefresh = function() {
											var ajax = $Ajax(
													"/u/templateRefresh",
													{
														onload : function(res) {
															var result = res.json();
															// 성공시 처리
															if (result.bSuccess
																	&& result.htReturnValue) {
																templates = result.htReturnValue.templates;
																printTemplateOptions(result.htReturnValue.templateOptions);
															}
														}
													});
											ajax.header("Accept", "application/json");
											ajax
													.request({
														'questionType' : $('inquiryAnswerTempleteType').value
													});
										}
					
										var notOrderInquiryTemplateTypeList = [ '상품', '배송', '기타',
												'선택안함' ];
										var setInquiryComment = function(htValue) {
											$Element('regComment').hide();
											$Element('editComment').hide();
											$('regDate').innerHTML = htValue.modifyDate;
											$('treatDate').innerHTML = (htValue.treatmentDate == undefined) ? '&nbsp'
													: htValue.treatmentDate + '&nbsp';
											$('purchaser').innerHTML = htValue.inquiryMemberName;
											$('purchaserId').innerHTML = htValue.inquiryMemberId;
											$('orderNo').innerHTML = htValue.orderNo;
											$('prodName').innerHTML = htValue.productName;
											$('prodOption').innerHTML = htValue.prodOrderNoLinkString;
											if (htValue.orderContractNo !== undefined
													&& htValue.orderContractNo !== "") {
												$('orderContractNo').innerHTML = "<a href='#' class='link_com' onClick='openOrderContractPopup(\""
														+ htValue.orderContractNo
														+ "\");return false;'> "
														+ htValue.orderContractNo + "</a>"
											} else {
												$('orderContractNo').innerHTML = ""
											}
											$('_title').innerHTML = "[" + htValue.inquiryCategory
													+ "] " + htValue.title;
											$('inquiryContent').innerHTML = htValue.inquiryContent;
											$Form('answerForm').value('id.inquiryNo', htValue.id);
											$Form('answerForm').value('alarmType',
													htValue.alarmType);
					
											if (htValue.commentContent == undefined
													|| htValue.commentContent == "") {
												$Form('answerForm')
														.value('id.inquiryCommentNo', '');
												$Form('answerForm').value('content', '');
												$Form('answerForm').value(
														'inquiryAnswerTempleteType', "NONE");
												$Element('inquiryAnswerTempleteNo').empty();
												$Element('inquiryAnswerTempleteNo').appendHTML(
														'<option value=\'\'>템플릿을 선택해 주세요</option>');
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', true);
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', false);
												$('regComment').style.display = '';
											} else {
												$Form('answerForm').value('id.inquiryCommentNo',
														htValue.commentId);
												$Form('answerForm').value('content',
														htValue.commentContent);
												if (htValue.answerTempleteTypeCode == undefined
														|| htValue.answerTempleteTypeCode == "") {
													$Form('answerForm').value(
															'inquiryAnswerTempleteType',
															"NONE_SELECTED");
													$Element('inquiryAnswerTempleteNo').empty();
													$Element('inquiryAnswerTempleteNo')
															.appendHTML(
																	'<option value="NONE_SELECTED">답변직접입력(제목없음)</option>');
													$Element("inquiryAnswerTempleteNo").attr(
															'disabled', true);
													$Element("inquiryAnswerTempleteNo").attr(
															'disabled', false);
												} else {
													searchTemplateSelected(
															htValue.answerTempleteTypeCode,
															htValue.commentTemplete);
													$Form('answerForm').value(
															'inquiryAnswerTempleteType',
															htValue.answerTempleteTypeCode);
													$('inquiryAnswerTempleteType').value = htValue.answerTempleteTypeCode;
												}
												$('editComment').style.display = '';
											}
											var templateTypeList = $$("#inquiryAnswerTempleteType > option");
											$A(templateTypeList)
													.forEach(
															function(o) {
																var el = $Element(o);
																if (htValue.orderYn) {
																	el.show();
																} else {
																	if (-1 == $A(
																			notOrderInquiryTemplateTypeList)
																			.indexOf(el.html())) {
																		el.hide();
																	}
																}
															});
										}
					
										function searchFormSubmit() {
											var form = $Form('searchForm');
											if (form.value("queryText") != ""
													&& form.value("searchType") == "") {
												alert("상세검색할 항목을 선택 후 검색하세요.");
												form.element("searchType").focus();
												return false;
											}
											if (form.value("queryText") != ""
													&& form.value("searchType") == "productNo") {
												if (!inNum(form.value("queryText"))) {
													alert("상품번호는 숫자만 가능합니다.");
													form.element("queryText").focus();
													return false;
												}
											}
											treatmentStatus = false; //검색을 시도하면 url을 통해 넘어온 조건 초기화
											initSorting(); //정렬조건 초기화
											setGridBySearchForm();
										}
					
										function inNum(sStr) {
											var NumberPattern = /\D/;
											if (NumberPattern.test(sStr))
												return false;
											return true;
										}
					
										function searchTemplate(questionType) {
											if (questionType == "NONE") {
												$Form('answerForm').value('content', '');
												$Element('inquiryAnswerTempleteNo').empty();
												$Element('inquiryAnswerTempleteNo').appendHTML(
														'<option value=\'\'>템플릿을 선택해 주세요</option>');
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', true);
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', false);
											} else if (questionType == "NONE_SELECTED") {
												$Form('answerForm').value('content', '');
												$Element('inquiryAnswerTempleteNo').empty();
												$Element('inquiryAnswerTempleteNo')
														.appendHTML(
																'<option value="NONE_SELECTED">답변직접입력(제목없음)</option>');
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', true);
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', false);
											} else {
												// ajax 생성
												var ajax = $Ajax('/u/customerInquiry/templeteList',
														{
															type : 'xhr',
															method : 'post',
															onload : function(res) {
																var param = res.json();
																fillTemplateSelectBox(param);
															}
														});
												// 요청
												ajax.header("Accept", "application/json");
												ajax.request({
													'questionType' : questionType
												});
											}
										}
					
										function fillTemplateSelectBox(json) {
											$Element('inquiryAnswerTempleteNo').empty();
					
											$Element('inquiryAnswerTempleteNo').appendHTML(
													'<option value=\'\'>템플릿을 선택해 주세요</option>')
											$A(json.htReturnValue.templates).forEach(
													function(v, k) {
														$Element('inquiryAnswerTempleteNo')
																.appendHTML(
																		'<option value=\'' + v.id + '\'>'
																				+ v.subject
																				+ '</option>');
													});
											$Element("inquiryAnswerTempleteNo").attr('disabled',
													true);
											$Element("inquiryAnswerTempleteNo").attr('disabled',
													false);
										}
					
										function searchTemplateSelected(questionType, templeteNo) {
											if (questionType == "NONE") {
												$Form('answerForm').value('content', '');
												$Element('inquiryAnswerTempleteNo').empty();
												$Element('inquiryAnswerTempleteNo').appendHTML(
														'<option value=\'\'>템플릿을 선택해 주세요</option>');
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', true);
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', false);
											} else if (questionType == "NONE_SELECTED") {
												$Form('answerForm').value('content', '');
												$Element('inquiryAnswerTempleteNo').empty();
												$Element('inquiryAnswerTempleteNo')
														.appendHTML(
																'<option value="NONE_SELECTED">답변직접입력(제목없음)</option>');
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', true);
												$Element("inquiryAnswerTempleteNo").attr(
														'disabled', false);
											} else {
												// ajax 생성
												var ajax = $Ajax('/u/customerInquiry/templeteList',
														{
															type : 'xhr',
															method : 'post',
															onload : function(res) {
																var param = res.json();
																fillTemplateSelectBoxSelected(
																		param, templeteNo);
															}
														});
												// 요청
												ajax.header("Accept", "application/json");
												ajax.request({
													'questionType' : questionType
												});
											}
										}
					
										function fillTemplateSelectBoxSelected(json, templeteNo) {
											$Element('inquiryAnswerTempleteNo').empty();
											$Element("inquiryAnswerTempleteNo").attr('disabled',
													true);
											$Element("inquiryAnswerTempleteNo").attr('disabled',
													false);
											var htmlOption = '<option value=\'\'>템플릿을 선택해 주세요</option>';
											$A(json.htReturnValue.templates)
													.forEach(
															function(v, k) {
																if (v.id == templeteNo) {
																	htmlOption = htmlOption
																			+ '<option value=\'' + v.id + '\' selected>'
																			+ v.subject
																			+ '</option>';
																} else {
																	htmlOption = htmlOption
																			+ '<option value=\'' + v.id + '\' >'
																			+ v.subject
																			+ '</option>';
																}
															});
											$Element('inquiryAnswerTempleteNo').html(htmlOption);
										}
					
										function openOrderPopup(seq) {
											window
													.open(
															'/u/orderPopup?orderNo=' + seq,
															'order',
															'toolbar=no, channelmode=no, location=no, directories=no, menubar=no, scrollbars=yes, resizable=yes, width=720, height=640');
										}
					
										function openProductOrderPopup(seq) {
											window
													.open(
															'https://sell.smartstore.naver.com/o/v3/manage/order/popup/'
																	+ seq + '/productOrderDetail',
															'productOrder',
															'toolbar=no, channelmode=no, location=no, directories=no, menubar=no, scrollbars=yes, resizable=yes, width=802, height=800');
										}
					
										function openOrderContractPopup(seq) {
											window
													.open(
															'/rntl/v3/contract/popup/' + seq
																	+ '/contractInfo',
															'orderContract',
															'toolbar=no, channelmode=no, location=no, directories=no, menubar=no, scrollbars=yes, resizable=yes, width=1000, height=800');
										}
					
										var searchTypes = {
											'CMA4BAND' : [ '', 'productNo', 'productOrderNo' ]
										}
					
										$Fn(
												function() {
					
													oDateRange = new jindo.DateRangePicker({
														"sDateFormat" : "yyyy-mm-dd",
														"elQuick" : $("period_selector"),
														"elStartDate" : $("start_date"),
														"elEndDate" : $("end_date"),
														"vStartDate" : fromDate,
														"vEndDate" : toDate,
														"vToday" : $Date(nmp.getDate(true)).format(
																"Y-m-d"),
														"bUseTime" : false,
														"sCalendarText" : ""
													});
					
													initializeGrid();
					
													if (viewInquiryId != "" && viewInquiryId != "0") {
														viewDetail(viewInquiryId);
														document.location.href = "#viewInquiry";
													}
					
													$Fn(function(e) {
														e.stop($Event.CANCEL_DEFAULT);
														commentAction('regComment');
													}).attach($('regComment'), 'click');
													$Fn(function(e) {
														e.stop($Event.CANCEL_DEFAULT);
														commentAction('editComment');
													}).attach($('editComment'), 'click');
													$Fn(function(e) {
														e.stop($Event.CANCEL_DEFAULT);
														searchFormSubmit();
													}).attach($('search_bt'), 'click');
													$Fn(
															function(e) {
																e.stop($Event.CANCEL_DEFAULT);
																window
																		.open(
																				wtfProductUrl
																						+ "/template/qna/popup?callbackName=templateRefresh",
																				'templetePopup',
																				'scrollbars=yes, width=800,height=600');
															}).attach($('templetePopup'), 'click');
													$Fn(
															function(e) {
																e.stop($Event.CANCEL_DEFAULT);
																searchTemplate($('inquiryAnswerTempleteType').value);
																$Form('answerForm').value(
																		'content', '');
																refreshCharCount(e);
															}).attach(
															$('inquiryAnswerTempleteType'),
															'change');
													$Fn(
															function(e) {
																e.stop($Event.CANCEL_DEFAULT);
																var templateNo = $Form('answerForm')
																		.value(
																				'inquiryAnswerTempleteNo');
																if (templates[templateNo] != undefined) {
																	$Form('answerForm').value(
																			'content',
																			templates[templateNo]);
																	refreshCharCount(e);
																}
															}).attach($('inquiryAnswerTempleteNo'),
															'change');
													$Fn(
															function(e) {
																$Form('answerForm')
																		.value(
																				'inquiryAnswerTempleteType',
																				'NONE_SELECTED');
																$Element('inquiryAnswerTempleteNo')
																		.empty();
																$Element('inquiryAnswerTempleteNo')
																		.appendHTML(
																				'<option value="NONE_SELECTED">답변직접입력(제목없음)</option>');
																$Element("inquiryAnswerTempleteNo")
																		.attr('disabled', true);
																$Element("inquiryAnswerTempleteNo")
																		.attr('disabled', false);
																refreshCharCount(e);
															}).attach($('commentContent'),
															'keydown');
													$Fn(
															function(e) {
																$Form('answerForm')
																		.value(
																				'inquiryAnswerTempleteType',
																				'NONE_SELECTED');
																$Element('inquiryAnswerTempleteNo')
																		.empty();
																$Element('inquiryAnswerTempleteNo')
																		.appendHTML(
																				'<option value="NONE_SELECTED">답변직접입력(제목없음)</option>');
																$Element("inquiryAnswerTempleteNo")
																		.attr('disabled', true);
																$Element("inquiryAnswerTempleteNo")
																		.attr('disabled', false);
																refreshCharCount(e);
															}).attach($('commentContent'), 'keyup');
					
												}).attach(window, 'load');
					
										function refreshCharCount(el) {
											var result = true;
					
											var message = $('commentContent').value;
											if (message.length > 1000) {
												$('commentContent').value = message.substring(0,
														1000);
												alert('답변내용은 최대 1,000자 이하로 입력해 주세요.');
												result = false;
											}
											$Element('_char_count_span').text(
													$('commentContent').value.length);
					
											return result;
										}
									</script>
					
					
								</div>
							</div>
						</div>
					
					
					
					
					
					<!-- 고객문의관리 끝 -->

				</div>
				<!-- 페이지 컨텐츠 끝 -->
				
			</div>
			</div>
			</div>
			<!-- 메인 컨텐츠 끝 -->		
</body>
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

	<!-- 서영: 1대1문의를 위한 js -->
	<script>
	$(document).ready(function () {
		  // 기존 코드
		  var seller_num = $("#seller_num").val();

		  if (seller_num) {
		    getDetail(seller_num);
		  } else {
		    console.error("seller_num is undefined");
		  }

		  // 이벤트 핸들러 추가
		  $(".data-row").on("click", function () {
		    var one_board_day = $(this).find("td:eq(0)").text();
		    var one_board_repDay = $(this).find("td:eq(1)").text();
		    var one_board_type = $(this).find("td:eq(2)").text();
		    var one_board_title = $(this).find("td.one_board_title").text();
		    var item_name = $(this).find("td:eq(4)").text();
		    var member_name = $(this).find("td:eq(5)").text();
		    var one_board_repDay = $(this).find("td:eq(6)").text();
		    var one_board_content = $(this).data("one-board-content");
		    var one_board_num = $(this).data("one-board-num");

		 // 이 정보를 사용하여 필요한 곳에 데이터를 채웁니다.
		    $('#one_board_day').html(one_board_day || '&nbsp;');
		    $('#one_board_repDay').html(one_board_repDay || '&nbsp;');
		    $('#seller_name').html(member_name || '&nbsp;');
		    $('#item_name').html(item_name || '&nbsp;');
		    $('#one_board_type').html(one_board_type || '&nbsp;');
		    $('#one_board_title').html(one_board_title || '&nbsp;');
		    $('#one_board_content').html(one_board_content || '&nbsp;');
		    $('#one_board_num').val(one_board_num);
		  });
		});


	function getDetail(seller_num) {
	  $.ajax({
	    url: "/getDetails",
	    type: "GET",
	    data: {seller_num: seller_num},
	    dataType: "json",
	    success: function(response){
	      // Assign fetched data to the elements
	      $('#one_board_day').html(response.one_board_day || '&nbsp;');
	      $('#one_board_repDay').html(response.one_board_repDay || '&nbsp;');
	      $('#seller_name').html(response.seller_name || '&nbsp;');
	      $('#item_name').html(response.item_name || '&nbsp;');
	      $('#one_board_type').html(response.one_board_type || '&nbsp;');
	      $('#one_board_title').html(response.one_board_title || '&nbsp;');
	      $('#one_board_content').html(response.one_board_content || '&nbsp;');
	      $('#one_board_num').html(response.one_board_num || '&nbsp;');
	    },
	    error: function(error){
	      console.error("Error fetching detail data:", error);
	    }
	  });
	}
	
// 	function handleClickOneBoardTitle(event) {
// 	    const targetRow = event.target.closest('tr');
// 	    const one_board_num = targetRow.getAttribute('data-one-board-num'); // 속성을 변경했습니다.
// 	    const one_board_repYn = targetRow.querySelector('td:nth-child(2)').textContent;

// 	    if (one_board_num) {
// 	        const currentForm = document.getElementById('answerForm');

// 	        const regCommentButton = document.getElementById('regComment');
// 	        const editCommentButton = document.getElementById('editComment');

// 	        if (one_board_repYn === '미답변') {
// 	            regCommentButton.style.display = 'inline';
// 	            editCommentButton.style.display = 'none';
// 	        } else if (one_board_repYn === '답변완료') {
// 	            regCommentButton.style.display = 'none';
// 	            editCommentButton.style.display = 'inline';
// 	        }

// 	        const existingHiddenInput = document.querySelector('input[name="one_board_num"]');
// 	    }
// 	}

	document.getElementById("processComment").addEventListener("click", sendFormData);

function sendFormData() {
    const answerForm = document.getElementById("answerForm");
    const formData = new FormData(answerForm);

    // action 변수를 "update"로 설정
    const action = "update";
    formData.append("action", action);
    for (const [key, value] of formData.entries()) {
        console.log(key, value);
    }

    $.ajax({
        url: "/updateReply",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            // 업데이트 성공시 처리
            // getDetail 함수 호출 시 적절한 seller_num 값을 전달해야 합니다.
            getDetail(formData.get("seller_num"));
        },
        error: function (error) {
            console.error("Error sending form data:", error);
        }
    });
}

// 선택한 행의 데이터를 answerForm에 설정하는 함수
function setAnswerFormData(selectedRow) {
  const oneBoardNum = selectedRow.getAttribute("data-one-board-num");

  document.getElementById("one_board_num").value = oneBoardNum;
}

function handleClick(event) {
  let clickedElement = event.target;

  // 클릭 된 요소에서 상위 요소로 이동하면서 data-row 클래스를 가진 요소를 찾습니다.
  while (clickedElement) {
    if (clickedElement.classList.contains("data-row")) {
      setAnswerFormData(clickedElement);
      break;
    }
    clickedElement = clickedElement.parentElement;
  }
}

document.addEventListener("click", handleClick);






</script>

</body>

</html>