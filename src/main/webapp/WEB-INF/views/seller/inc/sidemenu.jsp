<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" >
               <!--  <div class="sidebar-brand-icon rotate-n-15"> -->
               <a href="${pageContext.request.contextPath}/main">
               <img class="logo" src="${pageContext.request.contextPath}/resources/bootstrap/img/logo.png" style="width: 70%">
                </a>
               <!--  </div> -->
               <!--  <div class="sidebar-brand-text mx-3">판매자</div> -->
            </a> 

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="sellerMain">
                    <!-- <i class="fas fa-fw fa-tachometer-alt"></i> -->
                    <span>판매자 메인으로가기</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                메뉴
            </div>

            <!-- Nav Item - Member Menu -->
            <li class="nav-item">
                <a class="nav-link" href="memberMng">
                    <span>회원관리</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="salesMng">
                    <span>매출관리</span></a>
            </li>

         
            <!-- Divider -->
           <!-- 언더바 
           <hr class="sidebar-divider"> -->

            <!-- Heading -->
           

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <span>상품관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="itemRegister">상품등록</a>
                        <a class="collapse-item" href="itemMng">상품관리</a>
                        <a class="collapse-item" href="itemDelMng">배송관리</a>
                        <a class="collapse-item" href="itemRetExcMng">반품/교환관리</a>
                    </div>
                </div>
            </li>
			<li class="nav-item">
                <a class="nav-link" href="reviewMng">
                    <span>리뷰관리</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="settlementList">
                    <span>정산관리</span></a>
            </li>	
            <li class="nav-item">
                <a class="nav-link" href="questionMng">
                    <span>문의관리</span></a>
            </li>	 

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        
        </ul>
        <!-- End of Sidebar -->