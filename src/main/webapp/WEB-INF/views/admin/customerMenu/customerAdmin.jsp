
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> <%-- JSP에서 EL(Expression Language)을 사용하기 위한 설정입니다. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL 라이브러리를 사용하기 위한 설정입니다. --%>
        
<!DOCTYPE html>
<html lang="en">

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

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="../inc/sidemenu.jsp"></jsp:include>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                 <jsp:include page="../inc/top.jsp"></jsp:include>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="m-0 font-weight-bold text-primary">회원관리</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4" id="memberAdmin">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
                        </div>
                       <form action="${pageContext.request.contextPath}/changeMemberStatus" method="post"> 
                   		<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="deletemember" type="submit">회원탈퇴</button>
                        <div class="card-body">
                        <input type="hidden" name="member_num" value="${member_num}">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th><input type="checkbox" class="check-all"/></th>
                                            <th>회원번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>상태</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                 	<c:forEach items="${members}" var="member">
                                        <tr>
                                        	<td><input type="checkbox" class="memberCheckbox" name="result" value="${member.member_num}" /></td>
                                            <td>${member.member_num}</td>
                                            <td><a href="javascript:void(0);" onclick="showDetail(${member.member_num})">${member.member_id}</a></td>
                                            <td>${member.member_name}</td>
                                            <td>${member.member_delYn}</td>
                                        </tr>
                                     </c:forEach>   
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                      </form>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

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
const memberAdmin = document.querySelector('#memberAdmin');
// Check All checkboxes
const checkAll = memberAdmin.querySelectorAll('.check-all');
  
const memberCheckbox = memberAdmin.querySelectorAll('.memberCheckbox');

function toggleCheckboxes(checkboxes, checked) {
    checkboxes.forEach(checkbox => {
        if (checkbox.closest('.card-body') === memberAdmin.querySelector('.card-body')) {
            checkbox.checked = checked;
        }
    });
}

checkAll.forEach(checkAll => {
    checkAll.addEventListener('click', (event) => {
        toggleCheckboxes(memberCheckbox, event.target.checked);
    });
});
function showDetail(memberNum) {
    // 회원 정보 조회 API URL
	  const url = '${pageContext.request.contextPath}/memberDetail?member_num=' + memberNum;
    // 팝업 창 열기
    window.open(url, 'memberInfoPopup', 'width=800,height=600');

    // 팝업 창에서 메인 창으로 포커스 이동
    opener.focus();
}
</script>
</body>

</html>