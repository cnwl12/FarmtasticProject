var __ghtVariables = {
    "htData": {
        "bLogin": false,
        "sUserId": "",
        "sImagePath": "http://static.naver.net/me/",
        "sServiceUrl": "",
        "sRestrictionRegexp": /[^\/\\\\:*?\"<>]+/g

    },
    "htAPI": {
        // 공통으로 사용하는 API는 API0001번부터 시작
        "API0001": "",

        // 공통 모듈이 아닌 일반 서비스 모듈에서 사용하는 API는 API1001번부터 시작
        "API1001": "/address/domestic/new",

        // 개발 및 테스트 시에 사용하는 API는 API9001번부터 시작
        "API9001": "getData.nhn",
        "API9002": "getData2.nhn",
        "API9003": "getData3.nhn",
        "API9004": "getData4.nhn"
    },
    "htMessage": {
        // 공통으로 사용하는 메시지는 MSG0001번부터 시작
        "MSG0001": "팝업창이 차단되어 있습니다.\n팝업창 설정을 변경해 주세요.",
        "MSG0002": "[{0}] 다시 시도하여 주시기 바랍니다.",
        "MSG0003": "Ajax 응답 객체가 존재하지 않습니다.",
        "MSG0004": "파라미터가 올바르지 않습니다.",
        "MSG0005": "요청할 API 주소가 올바르지 않습니다.",
        "MSG0006": "root 엘리먼트 셀렉터를 지정해 주세요.",
        "MSG0007": "[{0}] 모듈의 root 엘리먼트 셀렉터에 해당하는 엘리먼트가 존재하지 않습니다.\n\nCSS Selector : \"{1}\"",
        "MSG0008": "폼을 전송할 action 속성이 지정되지 않았습니다.\n\n폼의 action 속성을 확인해 주세요.",
        "MSG0009": "팝업창 주소가 올바르지 않습니다.",
        "MSG0010": "root 엘리먼트가 설정되지 않아 엘리먼트 탐색 기능을 사용할 수 없습니다.\n\n서비스 모듈의 root 엘리먼트 셀렉터를 확인해 주세요.",
        "MSG0011": "IFRAME 주소가 올바르지 않습니다.",
        "MSG0012": "다음의 클래스가 정의된 자바스크립트 파일이 로딩되지 않았습니다.\n\n{0}",
        "MSG0013": "Form의 {0} name이 없습니다. name을 확인해 주세요.",
        "MSG0014": "부모창이 변경되었습니다.",
        "MSG0015": "저장하였습니다.",
        "MSG0016": "저장에 실패 하였습니다.",
        "MSG0017": "[{0}] 모듈의 root 엘리먼트가 정의되어 있지 않습니다.\n\n서비스 모듈의 root 엘리먼트 셀렉터를 확인해 주세요.",
        "MSG0018": "loadScript() Error : 실행할 모듈이 존재하지 않습니다.",
        "MSG0019": "적용되었습니다.",
        "MSG0020": "권장 사이즈에 맞지 않는 이미지 입니다.\n\n프론트에 전시시 이미지가 깨질 수 있습니다. 등록하시겠습니까?",
        "MSG0021": "이미지를 삭제하시겠습니까?",
        // "MSG0022" : "단 변경 시 일부 컴포넌트는 자동으로 사이즈가 변경되며,\n특히 이미지가 등록된 컴포넌트의 경우 자동 리사이징 될 수 있습니다.\n변경을 계속하시겠습니까?",
        "MSG0023": "해당하는 레이아웃 템플릿이 없습니다.",
        "MSG0024": "입력한 내용을 저장하시겠습니까?",
        "MSG0025": "error : {0}",
        "MSG0026": "fail : {0}",
        "MSG0027": "성공하였습니다.",
        "MSG0028": "삭제되었습니다.",
        "MSG0029": "검색어를 입력해 주세요.",
        "MSG0030": "로드 되지 않은 서비스 모듈이 있습니다. 확인 부탁합니다.",
        "MSG0031": "변경된 정보를 저장하지 않고 이동하시겠습니까?",
        "MSG0032": "Form Element가 1개 이상 있습니다. 여러개 form 태그가 있다면 {0} 클래스를 추가해주세요.",
        "MSG0033": "한글{0}자,영문{1}자 입력가능",
        "MSG0034": "Form Element가 없습니다. form 태그를 추가해주세요.",
        "MSG0035": "jpg,png,gif,jpeg,bmp 파일만 입력 가능합니다.",
        "MSG0036": "한글이나 특수문자는 이름으로 사용할수 없습니다.(IE에서 스크립트 오류 발생)",
        "MSG0037": "업로드 중에는 추가 이미지를 업로드를 할 수 없습니다.",

        // 공통 모듈이 아닌 일반 서비스 모듈에서 사용하는 메시지는 MSG1001번부터 시작
        "MSG1001": "선택하신 레이아웃을 설정하시겠습니까?",
        "MSG1002": "최대 {0}개까지 가능합니다.",
        "MSG1003": "목록에 적용할 옵션 정보가 없습니다.",
        "MSG1004": "입력된 옵션 정보가 없습니다.",
        "MSG1005": "기존의 옵션 정보가 삭제됩니다. 계속 진행하시겠습니까?",
        "MSG1006": "기존의 추가 상품 정보가 삭제됩니다. 계속 진행하시겠습니까?",
        "MSG1007": "5000개 이상 조합이 됩니다. 조합 개수를 5000개 이하로 내려주세요.",
        "MSG1008": "해당 건을 {0} 처리합니다. 처리하시겠습니까?", // 상품 판매자 권한승인
        "MSG1009": "{0} 하위 카테고리에 전체 {1} 처리합니다. 처리하시겠습니까?", // 상품 판매자 권한승인
        "MSG1010": "이미 선정된 상품입니다. 다른 상품을 선정해 주세요.",
        "MSG1011": "최대 3개까지 수동선정 가능합니다.",
        "MSG1012": "최대 3개까지 상품 선정 가능합니다.",
        "MSG1013": "상품을 선정해 주세요.",
        "MSG1014": "기간을 지정해 주세요.",
        "MSG1015": "미니샵 소개를 100byte(약. 한글 50자) 이내로 해주세요.",
        "MSG1016": "즐거운 쇼핑 NMP - 미니샵 '{0}'",
        "MSG1017": "최대 5개까지 선정 가능합니다. 하단 선정된 Best 구매평을 삭제하신 후 선정해주세요.",
        "MSG1018": "최대 5개까지 선정 가능합니다.",
        "MSG1019": "[{0}] 은 이미 선정된 구매평입니다. 다른 구매평을 선정해 주세요.",

        "MSG1020": "기존의 갤러리 정보가 삭제됩니다. 계속 진행하시겠습니까?",
        "MSG1021": "변경 가능한 상태가 아닙니다.",
        "MSG1022": "판매상태는 판매중 또는 판매중지만 가능합니다.",
        "MSG1023": "(상품명은) 필수 사항 입니다.",
        "MSG1024": "50자 이내로 입력해 주세요.",
        "MSG1025": "(홍보문구) 는 40자 이내로 입력해 주세요.",
        "MSG1126": "1원 판매가 상품은 판매가를 변경할 수 없습니다.",
        "MSG1027": "조합형 옵션 상품인 경우 재고 값을 변경할 수 없습니다.",
        "MSG1028": "변경할 상품이 없습니다.",
        "MSG1029": "일괄 수정에 실패 하였습니다.",
        "MSG1030": "상품명을 수정할 수 없는 카테고리입니다.",

        "MSG1031": "[{0}] 은  이미 선정된 상품입니다. 다른 상품을 선정해 주세요.",
        "MSG1032": "타이틀 이미지를 업로드해 주세요.",
        "MSG1033": "타이틀을 입력해 주세요.",
        "MSG1034": "상품의 수동선정은 {0}개까지 가능합니다.",
        "MSG1035": "삭제하시겠습니까?",

        // Grid 상품없음
        "MSG1036": "선정된 상품이 없습니다.",

        "MSG1037": "갤러리를 등록해 주세요.",
        "MSG1038": "옵션을 등록해 주세요.",
        "MSG1039": "추가상품을 등록해 주세요.",

        "MSG1041": "판매중지인 상품만 판매중으로 변경됩니다.",
        "MSG1042": "판매중인 상품만 판매중지로 변경됩니다.",

        "MSG1043": "전시중지인 상품만 전시중으로 변경됩니다.",
        "MSG1044": "전시중인 상품만 전시중지로 변경됩니다.",
        "MSG1045": "이벤트설정해제인 상품만 설정으로 변경됩니다.",
        "MSG1046": "이벤트설정중인 상품만중지로 변경됩니다.",
        "MSG1047": "최종 카테고리까지 선택되어야 합니다.",
        "MSG1048": "해당 묶음그룹을 적용중인 상품이 {0}개 있습니다. 수정시 묶음그룹에 포함된 모든 상품에 적용됩니다. 수정하시겠습니까?",
        "MSG1049": "묶음그룹 정보를 수정하시겠습니까?",
        "MSG1050": "삭제하시겠습니까?",
        "MSG1051": "묶음그룹에서 상품을 삭제하시겠습니까? 삭제시 해당 상품은 묶음불가 상품으로 변경됩니다",
        "MSG1052": "{0} 템플릿의 배송비 정보가 변경됩니다.\n배송비 정보를 변경하시겠습니까?",
        "MSG1053": "{0}개 상품의 배송비 정보를 변경하시겠습니까?",
        "MSG1054": "레이아웃을 적용하시겠습니까?",
        "MSG1055": "정말 취소하시겠습니까?",
        "MSG1056": "갤러리를 변경하시면 동일한 갤러리를 사용하는 다른 상품에도 같이 변경됩니다. 변경하시겠습니까?",
        "MSG1057": "상품에 등록되어있는 템플릿을 [일괄등록]하시겠습니까?",
        "MSG1058": "상품에 등록되어있는 템플릿을 [일괄해제]하시겠습니까?",
        "MSG1059": "레이아웃을 상품상세에 적용하시겠습니까?",
        "MSG1060": "삭제일로부터 30일 이내 상품만 복구할 수 있습니다.복구 하시겠습니까?",
        "MSG1061": "이미지를 삭제하시겠습니까?",
        "MSG1062": "선택한 공지사항을 삭제하시겠습니까?",
        "MSG1063": "상품에 적용 중인 공지사항은 삭제하실 수 없습니다. 적용 중인 공지를 제외하고 삭제하시겠습니까?",
        "MSG1064": "선택한 공지사항을 전시종료하시겠습니까?",
        "MSG1065": "반품택배사를 삭제하시겠습니까?",
        "MSG1066": "설정하실 반품택배사를 선택해 주세요",
        "MSG1067": "공지사항을 선택해주세요.",
        "MSG1068": "{0}을 선택해주세요.",
        "MSG1069": "초기화하시겠습니까?",
        "MSG1070": "적용되었습니다.",
        "MSG1071": "검색어가 없습니다.",
        "MSG1072": "더 이상 북마크를 추가하실 수 없습니다.",
        "MSG1073": "비공개 문의내역은 작성자 본인만 확인하실수 있습니다.",
        "MSG1074": "주문서 이동 예정",
        "MSG1075": "주문하실 상품을 선택해 주세요.",
        "MSG1076": "상품을 삭제하시겠습니까?",
        "MSG1077": "동일한 인증유형이 이미 있습니다.",
        "MSG1078": "만 19세 미만인 경우 성인 카테고리에서는 상품등록을 하실 수 없습니다.",
        "MSG1079": "주소록 불러오기를 실패하였습니다.",
        "MSG1080": "편집중인 이미지 정보가 {0}개 삭제됩니다.\n\n삭제하시겠습니까?",
        "MSG1081": "이미지는 {0}개만 등록하실 수 있습니다.\n\n[삭제] 버튼을 클릭해서 이미지를 삭제해 주세요",
        "MSG1082": "연동을 해지하시겠습니까?",
        "MSG1083": "취소 하시겠습니까?\n 취소시 작성된 묶음그룹 정보는 저장되지 않습니다",
        "MSG1084": "{0} 템플릿이 삭제됩니다.\n해당 템플릿을 삭제하시겠습니까?",
        "MSG1085": "특수 문자는 사용할 수 없습니다. \\ / : * ? \" < >",
        "MSG1086": "상품번호 항목이 유효하지 않습니다.",
        //"MSG1087" : "최대구매수량 제한시 제한수량은 필수사항입니다.",
        "MSG1088": "인증유형을 선택해주세요.",
        "MSG1089": "필수 속성정보는 필수사항입니다.",
        "MSG1090": "숫자만 입력가능합니다.",
        "MSG1091": "구독회원 추가 지급시 지급 항목을 1장이상 입력해 주세요.",
        "MSG1092": "상품을 삭제하시면 전시도 중지됩니다. 삭제하시겠습니까?",
        "MSG1093": "{0}원 단위로 입력하세요.",
        "MSG1094": "{0}개 단위로 입력하세요.",
        "MSG1095": "99,999,999개 이하로 입력하세요.",
        "MSG1096": "999,999,990원 이하로 입력하세요.",
        "MSG1097": "{0}원 이상으로 입력하세요.",
        "MSG1098": "{0}개 이상으로 입력하세요.",
        "MSG1099": "이벤트 상품으로 설정된 상품입니다.\n판매상태/재고수량 외 다른 정보를 변경하실 수 없습니다.",

        "MSG1100": "이 카테고리는 상품등록권한이 필요합니다. 내정보관리 > 판매자권한 신청에서 신청하실 수 있습니다.",

        "MSG1101": "해당 모델정보로 카테고리/제조사/브랜드/속성 정보가 변경됩니다. 변경하시겠습니까?",
        "MSG1102": "이 판매자는 해당 카테고리에 상품등록권한이 없습니다.",
        "MSG1103": "{0} 항목을 입력해 주세요.",
        "MSG1104": "동일한 묶음그룹명이 이미 있습니다.",

        "MSG1105": "테마 변경 시 일부 컴포넌트는 자동으로 사이즈가 변경되며,\n특히 이미지가 등록된 컴포넌트의 경우 자동 리사이징 될 수 있습니다.\n변경을 계속하시겠습니까?",
        "MSG1106": "선택한 배경을 적용하시겠습니까?",
        "MSG1107": "설정된 정보 중 저장하지 않은 정보들이 초기화 됩니다. 초기화 하시겠습니까?",

        "MSG1108": "상품5개미만 템플릿을 사용하시겠습니까?\n상품5개미만 템플릿을 사용하시면 관리하신\n대표이미지, 상품컴포넌트는 전시되지 않습니다",

        "MSG1109": "등록된 이미지가 없습니다.",

        "MSG1110": "중 카테고리부터 선택할 수 있습니다.",
        "MSG1111": "{0} 하위 카테고리에 전체 신청됩니다. 권한 신청을 하시겠습니까?",

        "MSG1112": "상품은 최대 12개까지 지정 가능합니다",
        "MSG1113": "삭제 되었습니다.",

        "MSG1201": "변경된 내용이 있습니다.\n변경된 내용을 적용하지 않고 페이지를 이동하시겠습니까?",
        "MSG1202": "기획전을 선택해주세요.",
        "MSG1203": "{0} 항목이 {1} 항목과 중복됩니다.",

        "MSG1204": "검색어는 최소 1자 이상 30자 이하로 입력해 주세요.",
        "MSG1205": "카테고리를 선택해 주세요.",

        "MSG1206": "등록된 이미지가 없습니다.",
        "MSG1207": "해제되었습니다.",

        "MSG1208": "수정된 내용이 있습니다. 페이지를 나가시겠습니까?",
        "MSG1209": "수정한 내용이 있습니다. 정말 이동하시겠습니까?",

        //전시용 상품찾기 팝업
        "MSG1210": "상품은 최대 {0}개까지 직접 선정할 수 있습니다.",
        "MSG1211": "{0}개 상품이 선택되었습니다.",
        "MSG1212": "이미 선택된 상품이 있습니다.\n중복선택 상품을 제외한\n나머지 {0}개 상품만 선택하시겠습니까?",
        "MSG1213": "중복된 상품입니다.",
        "MSG1214": "[검색] 버튼을 클릭 하셔서 상품을 조회해주세요",
        "MSG1215": "이미 선택된 상품이 있습니다.\n중복선택 상품을 제외한\n나머지 상품만 선택하시겠습니까?",

        // Product > Option
        "MSG1300": "조합형의 경우 헤더 정보가 필요합니다. 우선 헤더 정보를 입력해 주세요.",
        "MSG1301": "선택된 값이 없습니다.",
        "MSG1302": "사용여부 Y인 {0}은 재고수량을 1개 이상 입력해 주세요.",

        // Product > Index
        "MSG1500": "검색이 완료된 후 시도해주세요.",
        "MSG1501": "저장할 상품이 없습니다.",
        "MSG1502": "상품을 선택해 주세요.",
        "MSG1503": "최소 중분류까지 선택해주세요.",
        "MSG1504": "검색 조건을 설정해주세요.",
        "MSG1505": "기간검색 조건을 설정해주세요.",

        // FRONT
        "MSG3001": "해당 상품을 장바구니에서 삭제하시겠습니까?",
        "MSG3002": "선택하신 {0}개 상품을 장바구니에서 삭제하시겠습니까?",
        "MSG3003": "해당 상품을 장바구니에서 삭제하시겠습니까?",
        "MSG3004": "작성형 옵션을 입력해 주세요.",
        "MSG3005": "품절인 {0}은 구매하실 수 없습니다.",
        "MSG3006": "이미 선택한 {0}입니다.",
        "MSG3007": "현재 구매가 불가능한 상품이 있습니다. 해당 상품을 삭제하신 후 주문을 진행해 주십시오.",
        "MSG3008": "삭제하실 상품을 선택해 주세요.",
        "MSG3009": "찜하실 상품을 선택해 주세요.",
        "MSG3010": "19세 미만은 구매가 불가능한 상품입니다.",



        // NMP 관리자 어드민
        "MSG5001": "쿠폰을 발급중지 처리 하시겠습니까?",
        "MSG5002": "변경하시겠습니까?",
        "MSG5003": "변경되었습니다.",
        "MSG5004": "실패했습니다.",
        "MSG5005": "카테고리를 선택해주세요",
        "MSG5006": "카테고리아이디를 입력해 주세요",
        "MSG5007": "카테고리명을 입력해 주세요",
        "MSG5008": "묶음그룹에서 상품을 삭제하시겠습니까? 삭제시 해당 상품은 묶음불가 상품으로 변경됩니다",
        "MSG5009": "{0}개 상품의 배송비 정보를 변경하시겠습니까?",
        "MSG5010": "선택하신 배송비 묶음그룹 정책을 삭제하시겠습니까?",
        "MSG5101": "입력가능한 상품번호는 최대 1000개 입니다.",
        "MSG5102": "판매자 또는 상품명 또는 상품번호 또는 카테고리를 선택해 주세요",
        "MSG5103": "상품명 검색시 기간은 필수 항목입니다.",
        "MSG5104": "시작일 입력시 종료일도 함께 입력해야 합니다.",
        "MSG5105": "예외카테고리를 선택해주세요",
        "MSG5201": "{0} 상품군에 설정된 카테고리입니다.",
        "MSG5202": "이미 설정된 카테고리입니다.",
        "MSG5203": "최소 한 개의 카테고리는 필요합니다.",
        "MSG5204": "카테고리를 추가해주세요.",
        "MSG5205": "1개 이상의 결제수단은 사용가능해야 합니다.",
        "MSG5206": "결제수단제한 미설정한 경우는 증빙서류 발급제한 설정이 불가능합니다.",
        "MSG5207": "{0} 항목은 최대 {1}자 이하로 입력해 주세요",
        "MSG5208": "카테고리는 중분류까지 선택해 주세요.",

        "MSG5301": "기준 카테고리를 선택해주세요.",
        "MSG5302": "설정 카테고리를 선택해주세요.",
        "MSG5303": "기준 카테고리는 최종 카테고리까지 선택되어야 합니다.",
        "MSG5304": "설정 카테고리는 최종 카테고리까지 선택되어야 합니다.",
        "MSG5305": "서로 다른 카테고리를 선택해주세요.",

        // 개발 및 테스트 시에 사용하는 메시지는 MSG9001번부터 시작
        "MSG9001": "테스트용 메시지입니다.",
        "MSG9002": "{0} - {1} - {2}",
        "MSG9101": "sPopupType 인수가 누락 되었습니다.",
        "MSG9102": "sSearchApiUrl 인수가 누락 되었습니다.",
        "MSG9103": "sExternalCallbackUrl 인수가 누락 되었습니다.",
        "MSG9104": "sCallbackFunctionName 인수가 누락 되었습니다."
    },
    "htPage": {
        // 공통으로 사용하는 페이지 주소는 PAGE0001번부터 시작
        "PAGE0001": "/callback/external?callbackFunctionName={0}", // 외부 팝업 연동용 공용 콜백 페이지
        "PAGE0002": "/callback/fileupload", // 파일 업로드용 공용 콜백 페이지
        "PAGE0003": "/callback/se2map", // 스마트에디터2 지도 연동 콜백 페이지

        // 공통 모듈이 아닌 일반 서비스 모듈에서 사용하는 페이지 주소는 PAGE1001번부터 시작
        "PAGE1001": "/address/domestic/new",

        // 개발 및 테스트 시에 사용하는 페이지 주소는 PAGE9001번부터 시작
        "PAGE9001": "http://www.naver.com",
        "PAGE9002": "/api.nhn?action={0}&param1={1}"
    }
};