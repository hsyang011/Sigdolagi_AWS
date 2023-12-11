<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- 스프링 시큐리티 전용 태그 -->
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!-- header 시작 -->
<header class="container">
    <div class="row">
        <div class="col-sm-12" style="height: 30px;">
            <ul class="topmenu" style="float: right;">
            
                <!-- 로그인 정보가 없는 경우 -->
                <s:authorize access="isAnonymous()">
				    <li><a href="../member/login.do">로그인</a></li>
                	<li><a href="../member/regist.do">회원가입</a></li>
                </s:authorize>
	            
	            <!-- 관리자로 로그인할 때 -->
	            <s:authorize access="hasRole('ADMIN')">	            
               		<li><a href="../administrator/admin_main.do">관리자</a></li>
	            </s:authorize>
	            
	            <!-- 로그인 했을 때 -->
                <s:authorize access="isAuthenticated()">
                	<li><a href="../member/logout.do">로그아웃</a></li>
                	<li><a href="../member/mypage.do">마이페이지</a></li>
                </s:authorize>
            </ul>
        </div>
    </div>
</header>
<!-- header 끝 -->
<!-- nav 시작 -->
<nav class="main_nav container-fluid sticky-xl-top" style="z-index: 1000;">
    <div class="navbar navbar-expand-xl">
        <div class="container">
            <!-- 로고 -->
            <div id="logo">
                <a class="navbar-brand" href="../main/main.do">
                    <img class="top_logo" src="../images/logo.png" alt="">
                </a>  
            </div>
            
            <!-- 검색 form -->
            <div class="seach_bar">
                <form class="d-flex">
                    <input class="form-control rounded-pill me-2" type="text" placeholder="무엇을 검색해볼까요?">
                    <button class="" type="button" >
                        <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                    </button>
                </form>
            </div>
            <!-- mobile-offcanvas sidebar -->
            <div id="mobile_slider">
                <div class="offcanvas offcanvas-end" id="myinfo">
                    <div class="offcanvas-header">
                        <h1 class="offcanvas-title">닉네임</h1>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
                    </div>
                    <div class="offcanvas-body">
                        <img src="http://via.placeholder.com/100x100" alt="프로필이미지">
                        <div id="m_link" class="my-3">
                            <li><a href="../member/login.do">로그인</a></li>
                            <li><a href="../member/regist.do">회원가입</a></li>
                            <li><a href="#">마이페이지</a></li>
                        </div>
                    </div>
                </div>
                <!-- Button to open the offcanvas sidebar -->
                <button id="btn_more" class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#myinfo" style="position: absolute; top: 10px; right: 10px; transform: scale(0.7)">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <!-- 내비게이션 링크 -->
            <div class="navbar-collapse justify-content-center" id="pc_navbar">
                <ul class="head_nav nav">
                    <li class="nav-item"><a class="nav-link" href="../planner/planner_list.do">플래너</a></li>
                    <li class="nav-item"><a class="nav-link" href="../restaurant/restaurant_list.do">맛집탐방</a></li>
                    <li class="nav-item"><a class="nav-link" href="../market/market_list.do">마켓</a></li>
                    <li class="nav-item"><a class="nav-link" href="../community/freeboard_list.do">커뮤니티</a></li>
                    <li class="nav-item"><a class="nav-link" href="../service/notiboard.do">고객센터</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- nav 끝 -->

<!-- mobile 내비게이션 시작 -->
<div class="navbar-collapse justify-content-center" style="position: -webkit-sticky; position: sticky; top: 0px; padding: 5px 10px;  background-color: white; z-index: 1000;" id="mobile_navbar">
    <ul class="head_nav nav">
        <li class="nav-item"><a class="nav-link" href="../planner/planner_list.do">플래너</a></li>
        <li class="nav-item"><a class="nav-link" href="../restaurant/restaurant_list.do">맛집탐방</a></li>
        <li class="nav-item"><a class="nav-link" href="../market/market_list.do">마켓</a></li>
        <li class="nav-item"><a class="nav-link" href="../community/freeboard_list.do">커뮤니티</a></li>
        <li class="nav-item"><a class="nav-link" href="../service/notiboard.do">고객센터</a></li>
    </ul>
</div>

<!-- mobile 내비게이션 끝 -->