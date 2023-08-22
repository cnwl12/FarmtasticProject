<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>    
    
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body>
 	<div class="card shadow mb-4" id="sellerAdmin">
       <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">업체상세정보</h6>
       </div>
         <div class="card-body">
  			<div class="table-responsive">
  				<input type="hidden" name="seller_num" value="${sellerNum}" />
                   <table class="table table-bordered" id="dataTable" >
                      <tbody>
                        <tr>
                        <th>판매자 코드</th>
                        <td>${sellerDetail.seller_num}</td>
                        </tr>
						<tr>
                        <th>판매 타입</th>
                        <td>${sellerDetail.seller_type}</td>
                        </tr>
                        <tr>
                        <th>사업자 등록번호</th>
                        <td>${sellerDetail.seller_licenseNum}</td>
                        </tr>
                        <tr>
                        <th>판매자 ID</th>
                        <td>${sellerDetail.seller_id}</td>
                        </tr>
                        <tr>
                        <th>대표자</th>
                        <td>${sellerDetail.seller_name}</td>
                        </tr>
                        <tr>
                        <th>상호명</th>
                        <td>${sellerDetail.seller_storeName}</td>
                        </tr>
                        <tr>
                        <th>우편번호</th>
                        <td>${sellerDetail.seller_post}</td>
                        </tr>
                        <tr>
                        <th>주소</th>
                        <td>${sellerDetail.seller_addMain}</td>
                        </tr>
                        <tr>
                        <th>상세주소</th>
                        <td>${sellerDetail.seller_addSub}</td>
                        </tr>
                        <tr>
                        <th>업체 대표 번호</th>
                        <td>${sellerDetail.seller_phone}</td>
                        </tr>
                        <tr>
                        <th>은행명</th>
                        <td>${sellerDetail.seller_bank}</td>
                        </tr>
                        <tr>
                        <th>계좌번호</th>
                        <td>${sellerDetail.seller_accountNum}</td>
                        </tr>
                        <tr>
                        <th>예금주</th>
                        <td>${sellerDetail.seller_accountHolder}</td>
                        </tr>
                        <tr>
                        <th>이메일</th>
                        <td>${sellerDetail.seller_email}</td>
                        </tr>
                        <tr>
                        <th>가입일</th>
                        <td>${sellerDetail.seller_joinDay}</td>
                        </tr>
                        <tr>
                        <th>사업자등록증</th>
                        <td>${sellerDetail.seller_file}</td>
                        </tr>                              
                     </tbody>
                  </table>
                  <Button id="edit-button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">수정</Button>
                  <Button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="window.close()">닫기</Button>
             </div>
         </div>
    </div>
    
    <div class="modal fade" tabindex="-1" id="edit-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">업체 정보 수정</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="update-form" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="modal-seller-num">판매자 고유번호</label>
            <input type="text" class="form-control" name="seller_num" id="modal-seller-num"  readonly/>
          </div>
          <div class="mb-3">
            <label for="modal-seller-type">판매 타입</label>
            <input type="text" class="form-control" name="seller_type" id="modal-seller-type"  readonly/>
          </div>
          <div class="mb-3">
            <label for="modal-seller-licenseNum">사업자 등록번호</label>
            <input type="text" class="form-control" name="seller_licenseNum" id="modal-seller-licenseNum"  />
          </div>
          <div class="mb-3">
            <label for="modal-seller-id">판매자 ID</label>
            <input type="text" class="form-control" name="seller_id" id="modal-seller-id" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-name">대표자</label>
            <input type="text" class="form-control" name="seller_name" id="modal-seller-name"/>
          </div>
          <div class="mb-3">
            <label for="modal-seller-storeName">상호명</label>
            <input type="text" class="form-control" name="seller_storeName" id="modal-seller-storeName"  />
          </div>
          <div class="mb-3">
            <label for="modal-seller-post">우편번호</label>
            <input type="text" class="form-control" name="seller_post" id="modal-seller-post" readonly/>
          </div>
          <div class="mb-3">
            <label for="modal-seller-addMain">주소</label>
            <input type="text" class="form-control" name="seller_addMain" id="modal-seller-addMain" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-addSub">상세주소</label>
            <input type="text" class="form-control" name="seller_addSub" id="modal-seller-addSub" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-phone">업체 대표 번호</label>
            <input type="text" class="form-control" name="seller_phone" id="modal-seller-phone" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-bank">은행명</label>
            <input type="text" class="form-control" name="seller_bank" id="modal-seller-bank" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-accountNum">계좌번호</label>
            <input type="text" class="form-control" name="seller_accountNum" id="modal-seller-accountNum" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-accountHolder">예금주</label>
            <input type="text" class="form-control" name="seller_accountHolder" id="modal-seller-accountHolder" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-email">이메일</label>
            <input type="text" class="form-control" name="seller_email" id="modal-seller-email" readonly />
          </div>
          <div class="mb-3">
            <label for="modal-seller-joinDay">가입일</label>
            <input type="text" class="form-control" name="seller_joinday" id="modal-seller-joinDay" readonly  />
          </div>
          <div class="mb-3">
            <label for="modal-seller-file">사업자등록증</label>
            <input type="file" class="form-control" name="seller_file" id="modal-seller-file"  />
          </div>
          <button type="submit" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">업데이트</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="closeModal()">닫기</button>
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
    
<script>
// 모달 닫기 함수
function closeModal() {
    $("#edit-modal").modal("hide");
}
</script>
    
<script> 
   $(document).ready(function () {
     // 수정 버튼 클릭 이벤트
     $("#edit-button").on("click", function () {
       // 팝업창에 기존 데이터를 불러옵니다.
       $("#modal-seller-num").val("${sellerDetail.seller_num}");
       $("#modal-seller-type").val("${sellerDetail.seller_type}");
       $("#modal-seller-licenseNum").val("${sellerDetail.seller_licenseNum}");
       $("#modal-seller-id").val("${sellerDetail.seller_id}");
       $("#modal-seller-name").val("${sellerDetail.seller_name}");
       $("#modal-seller-storeName").val("${sellerDetail.seller_storeName}");
       $("#modal-seller-post").val("${sellerDetail.seller_post}");
       $("#modal-seller-addMain").val("${sellerDetail.seller_addMain}");
       $("#modal-seller-addSub").val("${sellerDetail.seller_addSub}");
       $("#modal-seller-phone").val("${sellerDetail.seller_phone}");
       $("#modal-seller-bank").val("${sellerDetail.seller_bank}");
       $("#modal-seller-accountNum").val("${sellerDetail.seller_accountNum}");
       $("#modal-seller-accountHolder").val("${sellerDetail.seller_accountHolder}");
       $("#modal-seller-email").val("${sellerDetail.seller_email}");
       $("#modal-seller-joinDay").val("${sellerDetail.seller_joinDay}");
       $("#edit-modal").modal("show"); // 팝업창을 보여줍니다.
     });
   });
    

    $('#update-form').on('submit', function (e) {
        e.preventDefault();

        // FormData 객체 생성
        var formData = new FormData(this);

        // Ajax 요청 보내기
        $("#update-form").on("submit", function(e) {
            e.preventDefault();

            // FormData 객체 생성
            var formData = new FormData(this);

            // Ajax 요청 보내기
            $.ajax({
              url: "updateSellerInfo",
              type: "POST",
              data: formData,
              contentType: false,
              processData: false,
              success: function(responseText) {
                console.log(responseText);
                if (responseText === "The info has been successfully updated.") {
                  alert("정보가 성공적으로 수정되었습니다.");
                  $("#edit-modal").modal("hide"); // 모달창 닫기
                  window.opener.location.reload(); // 부모창 새로고침
                  window.close(); // 팝업창 닫기
                  
                } else {
                  alert("정보 수정에 실패했습니다. 다시 시도해 주세요.");
                }
              },
              error: function() {
                alert("정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
              }
            });
          });
        });
    </script> 
</body>
</html>