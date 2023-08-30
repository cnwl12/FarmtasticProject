<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" >
               <!--  <div class="sidebar-brand-icon rotate-n-15"> -->
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
                <a class="nav-link" href="blogMng">
                    <span>제철팜관리</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customerAdmin">
                    <span>회원관리</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="questionAdmin">
                    <span>회원문의</span></a>
            </li>
             <!-- Nav Item - Pages Collapse Menu -->
          
         
            <!-- Divider -->
           <!-- 언더바 
           <hr class="sidebar-divider"> -->

            <!-- Heading -->
            <div class="sidebar-heading">
                판매자
            </div>
      
			<li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <span>업체관리</span></a>
                     <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    	<div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="sellerAdmin">업체관리</a>
                        <a class="collapse-item" href="sellerAdmin">업체미승인관리</a>
             
                        
                      </div>  
                     </div> 
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="adminItemList">
                    <span>상품관리</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="settlement">
                    <span>정산관리</span></a>
            </li>
            
             <div class="sidebar-heading">
                매출관리
            </div>
             <li class="nav-item">
                <a class="nav-link"  href="sales">
                    <span>월매출관리</span></a>
            </li>
              <li class="nav-item">
                <a class="nav-link" href="totalSales">
                    <span>총매출관리</span></a>
            </li>
         
 
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        
        </ul>
        <!-- End of Sidebar -->