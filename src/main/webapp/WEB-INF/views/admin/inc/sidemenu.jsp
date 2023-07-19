<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" >
               <!--  <div class="sidebar-brand-icon rotate-n-15"> -->
                <img class="logo" src="${pageContext.request.contextPath}/resources/bootstrap/img/logo.png" style="width: 70%">
                
               <!--  </div> -->
               <!--  <div class="sidebar-brand-text mx-3">판매자</div> -->
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="adminMain">
                    <!-- <i class="fas fa-fw fa-tachometer-alt"></i> -->
                    <span>관리자 메인으로가기</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                소비자
            </div>

            <!-- Nav Item - Member Menu -->
            <li class="nav-item">
                <a class="nav-link" href="cnotice">
                    <span>공지사항</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerAdmin">
                    <span>회원관리</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerLev">
                    <span>등급관리</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="cnotice">
                    <span>신고관리</span></a>
            </li>
             <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <span>혜택관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="">쿠폰관리</a>
                        <a class="collapse-item" href="">적립금관리</a>
                    </div>
                </div>
            </li>
     
            <li class="nav-item">
                <a class="nav-link" href="">
                    <span>이벤트관리</span></a>
            </li>
			
         
            <!-- Divider -->
           <!-- 언더바 
           <hr class="sidebar-divider"> -->

            <!-- Heading -->
            <div class="sidebar-heading">
                판매자
            </div>
           

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="cnotice">
                    <span>공지사항</span></a>
            </li>
			<li class="nav-item">
                <a class="nav-link" href="">
                    <span>업체관리</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="">
                    <span>정산관리</span></a>
            </li>	
            <li class="nav-item">
                <a class="nav-link" href="">
                    <span>매출관리</span></a>
            </li>	
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        
        </ul>
        <!-- End of Sidebar -->