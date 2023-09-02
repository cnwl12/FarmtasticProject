<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
	 				 <div class="input-group">
                        
                        <a href="${pageContext.request.contextPath}/main">
               				<img class="logo" src="${pageContext.request.contextPath}/resources/bootstrap/img/logo.png" style="margin-left: -20px; width: 30%;">
              			 </a>
                        <li style="display: inline-block; vertical-align: middle;">
    						<a href="javascript:void(0);" onclick="openChatPopup()"><img src="${pageContext.request.contextPath}/resources/img/chat.JPG" alt="" width="20" height="20">실시간채팅</a>
                  		    
                        </div>
                  

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${admin.admin_nickname}님</span>
                                <img class="img-profile rounded-circle"
                                    src="${pageContext.request.contextPath}/resources/bootstrap/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                               
                                <div class="dropdown-divider"></div>
                                 <a class="dropdown-item" href="adminProfile">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                
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
                		<div class="modal-body">로그아웃하시겠습니까?</div>
                         <div class="modal-footer">
                    		<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    		<a class="btn btn-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
                        </div>
            		</div>
        		 </div>
   			  </div>
   			  
<script>   			  
  function openChatPopup() {
        // 팝업 창 옵션 설정
        var popupWidth = 500; // 팝업 창 가로 크기
        var popupHeight = 400; // 팝업 창 세로 크기

        // 브라우저 창의 가운데 좌표 계산
        var leftPosition = (window.screen.width - popupWidth) / 2;
        var topPosition = (window.screen.height - popupHeight) / 2;

        // 실제 팝업 창 열기
        window.open(contextPath + "/adminrealtimechatBot", "chatPopup", "width=" + popupWidth + ", height=" + popupHeight +
                    ", left=" + leftPosition + ", top=" + topPosition +
                    ", resizable=no, scrollbars=no, status=no");
    }
	//서버 사이드 변수인 contextPath을 JavaScript 변수에 할당합니다.
	var contextPath = "//c2d2303t2.itwillbs.com/FarmProject";
    </script>