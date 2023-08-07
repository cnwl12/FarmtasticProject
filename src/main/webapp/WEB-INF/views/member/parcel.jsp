<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>배송 조회</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%--
     SweetTracker API 키를 설정합니다.
     --%>
    <% String api_key = "B4WxVwnUkFj7kESy39zWhQ"; %>
    <script>
        $(document).ready(function() {
            /**
             * API를 호출하여 운송 정보를 조회합니다.
             *
             * @param carrier         택배사 코드
             * @param trackingNumber  운송장 번호
             */
            function loadTrackingInfo(carrier, trackingNumber) {
                var api_key = '<%= api_key %>';
                var url = "https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=" + api_key + "&t_code=" + carrier + "&t_invoice=" + trackingNumber;
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: "json",
                    success: function (response) {
                        var result = response.trackingDetails;
                        if (result && result.length > 0) {
                            // 조회된 운송 정보가 있을 경우
                            var html = "<tr><th>시간</th><th>현재위치</th><th>상태</th></tr>";

                            $.each(result, function (index, item) {
                                var time = item.timeString;
                                var location = item.where;
                                var description = item.kind;
                                html += "<tr><td>"
                                    + time
                                    + "</td><td>"
                                    + location
                                    + "</td><td>"
                                    + description
                                    + "</td></tr>";
                            });

                            $("#tracking-info-table").html(html);
                            $(".title-invoice").html(trackingNumber);
                            $(".title-company").html($("#carrier option:selected").text());
                            // 운송 상태를 업데이트합니다.
                            updateParcelStatus(result);
                        } else {
                            // 조회된 운송 정보가 없을 경우
                            var html = "<tr><td colspan='3'>조회된 운송 정보가 없습니다.</td></tr>";
                            $("#tracking-info-table").html(html);
                        }
                    },
                    error: function (xhr, status, error) {
                        var errorMessage = "Error: " + xhr.status + " " + xhr.statusText + "\nResponse Text: " + xhr.responseText;
                        alert(errorMessage);
                    }
                });
            }

            /**
             * 운송 상태를 업데이트합니다.
             *
             * @param details 운송 상세 정보
             */
            function updateParcelStatus(details) {
                var delivered = false;
                var latestStatus = details[details.length - 1].kind;
                for (var i = 0; i < details.length; i++) {
                    var status = details[i].kind;
                    if (status === "배달완료") {
                        delivered = true;
                        break;
                    } else if (status === "집화완료" || status === "배송출발") {
                        latestStatus = status;
                    }
                }

                if (delivered) {
                    $(".info-back-line").addClass("delivery-complete");
                    $(".info-parcel-text-none").hide();
                    $(".info-parcel-text-active").html("배송완료");
                    $(".info-parcel-text-active").show();
                } else {
                    $(".info-back-line").removeClass("delivery-complete");
                    $(".info-parcel-text-none:first").html("집화접수");
                    $(".info-parcel-text-none").not(":first").hide();
                    $(".info-parcel-text-active").html(latestStatus);
                }

                var lastResult = details[details.length - 1];
                $(".time-text:first").html(lastResult.timeString);
                $(".time-text:first").next().html(lastResult.where);
                $(".info-parcel-text-none:first").html(lastResult.kind);
            }

            /**
             * 폼을 제출합니다.
             *
             * @param event 이벤트 객체
             */
            function onSubmitForm(event) {
                event.preventDefault();
                var carrier = $("#carrier").val();
                var trackingNumber = $("#tracking-number").val();
                if (carrier && trackingNumber) {
                    loadTrackingInfo(carrier, trackingNumber);
                } else {
                    alert("택배사와 운송장 번호를 모두 입력해주세요.");
                }
            }

            $("#tracking-number").on("input", function () {
                var trackingNumber = $(this).val();
                var selectedCarrier = $("#carrier option:selected").text();
                $(".title-invoice").html(trackingNumber);
                $(".title-company").html(selectedCarrier);
            });

            $("#carrier").change(function () {
                var selectedCarrier = $("#carrier option:selected").text();
                $(".title-company").html(selectedCarrier);
            });

            // URL 파라미터로 전달된 운송 정보를 조회합니다.
            var urlParams = new URLSearchParams(window.location.search);
            var carrier = urlParams.get("carrier");
            var trackingNumber = urlParams.get("trackingNumber");

            if (carrier && trackingNumber) {
                $("#carrier").val(carrier);
                $("#tracking-number").val(trackingNumber);
                loadTrackingInfo(carrier, trackingNumber);
            } else {
                var html = "<tr><td colspan='3'>택배사와 운송장 번호를 입력해주세요.</td></tr>";
                $("#tracking-info-table").html(html);
            }

            // 폼 제출 이벤트를 바인딩합니다.
            $("form").submit(onSubmitForm);
        });
    </script>
    <style>
        .parcel-img {
            width: 100px;
            height: 100px;
            margin-right: 30px;
        }

        .info-back-line {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
        }

        .info-area {
            color: #959eac;
            margin-right: 100px;
        }

        .info-parcel-text-none {
            font-size: 10px;
            color: #a0a0a0;
            margin-bottom: 5px;
        }

        .info-parcel-text-active {
            font-size: 12px;
            color: #6f7885;
            margin-bottom: 3px;
            font-weight: 800;
            display: none; /* 기본적으로 숨겨진 상태 */
        }

        .delivery-complete .info-parcel-text-active {
             display: inline-block; /* 배송 상태가 "완료"일 때만 보여지도록 함 */
        }

        .time-text {
            color: #959eac;
            font-size: 10px;
            margin-top: 5px;
        }

        .title-content {
            margin: 20px 0;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            text-align: left;
        }

        .title-notice {
            font-size: 12px;
            color: #959eac;
            margin-bottom: 3px;
        }

        .title-invoice {
            font-size: 28px;
            color: #6F7885;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .title-company {
            font-size: 14px;
            color: #959eac;
            margin-bottom: 3px;
        }

        table {
            width: 100%;
            max-width: 800px;
            margin: 30px auto 0px 0px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px 20px;
            border-bottom: 1px solid #ddd;
            margin-bottom: 1px;
            font-size: 14px;
        }

        th {
            background-color: #f8f8f8;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
<form>
    <div class="form-group">
        <label for="carrier">택배사:</label>
        <select id="carrier" name="carrier">
            <option value="" selected disabled>선택하세요</option>
            <option value="04">CJ대한통운</option>
            <option value="05">한진택배</option>
            <option value="08">롯데택배</option>
            <option value="01">우체국택배</option>
            <option value="06">로젠택배</option>
            <option value="11">일양로지스</option>
            <option value="20">한덱스</option>
            <option value="22">대신택배</option>
            <option value="23">경동택배</option>
            <option value="32">합동택배</option>
            <option value="46">CU편의점택배</option>
            <option value="24">GSPostBox택배</option>
            <option value="17">천일택배</option>
            <option value="18">건영택배</option>
            <option value="21">FedEx</option>
        </select>
    </div>

    <div class="form-group">
        <label for="tracking-number">운송장 번호:</label>
        <input id="tracking-number" type="text" name="tracking-number" placeholder="운송장 번호를 입력하세요."
               required>
    </div>

    <button id="submit-button" type="submit">조회</button>
</form>
<%-- 
<div class="col-xs-12 info-area no-padding">
    <div class="info-back-line">
        <div class="col-xs-15 text-center" style="justify-content: flex-start">
            <img src="${pageContext.request.contextPath}/resources/img/ic_sky_delivery_step1_off.png"
                 class="parcel-img"/>

            <div class="info-parcel-text-none">상품인수</div>
        </div>

        <div class="col-xs-15 text-center" style="justify-content: flex-start">
            <img src="${pageContext.request.contextPath}/resources/img/ic_sky_delivery_step2_off.png"
                 class="parcel-img"/>
            <div class="info-parcel-text-none">상품이동중</div>
        </div>

        <div class="col-xs-15 text-center" style="justify-content: flex-start">
            <img src="${pageContext.request.contextPath}/resources/img/ic_sky_delivery_step3_off.png"
                 class="parcel-img"/>
            <div class="info-parcel-text-none">배송지도착</div>
        </div>
        <div class="col-xs-15 text-center" style="justify-content: flex-start">
            <img src="${pageContext.request.contextPath}/resources/img/ic_sky_delivery_step4_off.png"
                 class="parcel-img"/>
            <div class="info-parcel-text-none">배송출발</div>
        </div>

        <div class="col-xs-15 text-center info-parcel-text-none">
            <img src="${pageContext.request.contextPath}/resources/img/ic_sky_delivery_step5_on.png"
                 class="parcel-img"/>
            <div class="info-parcel-text-active">배송완료</div>
        </div>
    </div>
 --%>

    <div class="title-content">
        <div class="title-notice">운송장 번호</div>
        <div class="title-invoice"></div>
        <div class="title-company"></div>
    </div>


    <table id="tracking-info-table" class="table">
        <thead>
        <tr>
            <th>시간</th>
            <th>현재 위치</th>
            <th>배송 상태</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

<div class="col-xs-12 info-area no-padding">
    <div class="info-back-line">
        <div class="col-xs-15 text-center info-parcel-text-none">
            <div class="time-text"></div>
            <div class="time-text"></div>
        </div>

        <div class="col-xs-15 text-center info-parcel-text-none">
            <div class="time-text"></div>
            <div class="time-text"></div>
        </div>

        <div class="col-xs-15 text-center info-parcel-text-none">
            <div class="time-text"></div>
            <div class="time-text"></div>
        </div>
        <div class="col-xs-15 text-center info-parcel-text-none">
            <div class="time-text"></div>
            <div class="time-text"></div>
        </div>

        <div class="col-xs-15 text-center info-parcel-text-none">
            <div class="time-text"></div>
            <div class="time-text"></div>
        </div>
    </div>
</div>
</body>
</html>
