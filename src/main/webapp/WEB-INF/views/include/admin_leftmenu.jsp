<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사이드바 왼쪽 -->
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../administrator/admin_main.do">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">식도라기<sup>Admin</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - 회원관리 -->
    <li class="nav-item active">
        <a class="nav-link" href="../administrator/adminMemberList.do">
            <i class="fas fa-fw fa-user"></i>
            <span>회원관리</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider" />

    <!-- Heading -->
    <div class="sidebar-heading">
        게시판관리
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCommu"
            aria-expanded="true" aria-controls="collapseCommu">
            <i class="fas fa-fw fa-comment"></i>
            <span>커뮤니티관리</span>
        </a>
        <div id="collapseCommu" class="collapse" aria-labelledby="headingCommu" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">게시판작성,수정,삭제:</h6>
                <a class="collapse-item" href="../administrator/admin_free_list.do">자유게시판</a>
                <a class="collapse-item" href="../administrator/admin_photo_list.do">사진게시판</a>
            </div>
        </div>
    </li>
    <!-- Nav Item - Pages 플래너관리 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePlanner"
            aria-expanded="true" aria-controls="collapsePlanner">
            <i class="fas fa-fw fa-route"></i>
            <span>플래너관리</span>
        </a>
        <div id="collapsePlanner" class="collapse" aria-labelledby="headingPlanner" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">플래너게시판:</h6>
                <a class="collapse-item" href="../administrator/admin_planner_list.do">플래너게시판</a>
                <a class="collapse-item" href="../administrator/admin_AD_list.do">플래너광고</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCustService"
            aria-expanded="true" aria-controls="collapseCustService">
            <i class="fas fa-fw fa-headset"></i>
            <span>고객센터관리</span>
        </a>
        <div id="collapseCustService" class="collapse" aria-labelledby="headingCustService"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">고객센터게시판:</h6>
                <!-- <a class="collapse-item" href="../administrator/admin_notice_list.do">FAQ관리</a> -->
                <a class="collapse-item" href="../administrator/admin_notice_list.do">공지사항</a>
                <a class="collapse-item" href="../administrator/admin_inquiry_list.do">1:1문의관리</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        쇼핑몰관리
    </div>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMaket"
            aria-expanded="true" aria-controls="collapseMaket">
            <i class="fas fa-fw fa-gift"></i>
            <span>마켓관리</span>
        </a>
        <div id="collapseMaket" class="collapse" aria-labelledby="headingMaket"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">쇼핑몰관리하기:</h6>
                <a class="collapse-item" href="../administrator/admin_maket_list.do">상품관리</a>
                <a class="collapse-item" href="../administrator/admin_order_list.do">주문현황</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <!-- <hr class="sidebar-divider">
    
    <li class="nav-item">
        <a class="nav-link" href="../administrator/FCMSender.do">
            <i class="fas fa-fw fa-house-user"></i>
            <span>푸쉬보내기</span></a>
    </li> -->
    
    <!-- Divider -->
    <hr class="sidebar-divider">
    
    <li class="nav-item">
        <a class="nav-link" href="../main/main.do">
            <i class="fas fa-fw fa-house-user"></i>
            <span>메인으로</span></a>
    </li>

    <!-- Heading -->
    <!-- <div class="sidebar-heading">
        문의사항
    </div> -->

    <!-- Nav Item - Pages Collapse Menu -->
    <!-- <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="fas fa-fw fa-comments"></i>
            <span>문의확인</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">문의확인하기:</h6>
                <a class="collapse-item" href="register.html">1:1문의관리</a>
                <a class="collapse-item" href="forgot-password.html">광고/제휴문의확인</a>
                <div class="collapse-divider"></div>
                <h6 class="collapse-header">Other Pages:</h6>
                <a class="collapse-item" href="404.html">404 Page</a>
                <a class="collapse-item" href="blank.html">Blank Page</a>
            </div>
        </div>
    </li> -->

    <!-- Nav Item - Tables -->
    <!-- <li class="nav-item">
        <a class="nav-link" href="tables.html">
            <i class="fas fa-fw fa-table"></i>
            <span>Tables</span></a>
    </li> -->

    <!-- Divider -->
    <!-- <hr class="sidebar-divider d-none d-md-block"> -->

    <!-- Sidebar 토글버튼 -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>
<!-- End of Sidebar -->
<!-- 사이드바 끝 -->
