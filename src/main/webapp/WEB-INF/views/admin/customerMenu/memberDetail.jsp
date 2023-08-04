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
 <div class="card shadow mb-4" id="memberAdmin">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원상세정보</h6>
                        </div>
                         <div class="card-body">
  <div class="table-responsive">
  <input type="hidden" name="member_num" value="${memberNum}" />
                                <table class="table table-bordered" id="dataTable" >
                                    <tbody>
                                        <tr>
                                        <th>회원번호</th>
                                        <td>${memberDetail.member_num}</td>
                                        </tr>
										<tr>
                                        <th>회원아이디</th>
                                        <td>${memberDetail.member_id}</td>
                                        </tr>
                                        <tr>
                                        <th>회원이름</th>
                                        <td>${memberDetail.member_name}</td>
                                        </tr>
                                        <tr>
                                        <th>회원전화번호</th>
                                        <td>${memberDetail.member_phone}</td>
                                        </tr>
                                        <tr>
                                        <th>회원이메일</th>
                                        <td>${memberDetail.member_email}</td>
                                        </tr>
                                        <tr>
                                        <th>회원가입일</th>
                                        <td>${memberDetail.member_joinDay}</td>
                                        </tr>
                                        <tr>
                                        <th>우편번호</th>
                                        <td>${memberDetail.member_post}</td>
                                        </tr>
                                        <tr>
                                        <th>주소</th>
                                        <td>${memberDetail.member_addMain}</td>
                                        </tr>
                                        <tr>
                                        <th>상세주소</th>
                                        <td>${memberDetail.member_addSub}</td>
                                        </tr>
                                        <tr>
                                        <th>탈퇴여부</th>
                                        <td>${memberDetail.member_delYn}</td>
                                        </tr>                              
                                    </tbody>
                                </table>
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