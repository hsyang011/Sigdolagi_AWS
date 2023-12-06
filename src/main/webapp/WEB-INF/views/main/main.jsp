<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/main.css" />
</head>
<body>
    <div class="container-fluid" id="wrap">
        <!-- header 시작 -->
        <header class="container">
            <div class="header_content">
                <div class="logo">
                    <a href="" >
                        <img src="../images/logo.png">
                    </a>
                </div>
                <div class="search_bar">
                    <form action="../search/search_result.do" method="get">
                        <input type="text" placeholder="무엇을 검색해볼까요?">
                        <button class="search_icon">
                            <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                        </button>
                    </form>
                </div>
                <div class="header_list">
                    <ul>
	                    <%-- 세션에 로그인 정보가 없는 경우 --%>
						<c:if test="${empty sessionEmail}">
						    <li><a href="../member/login.do">로그인</a></li>
						</c:if>
                        
                        
                        <c:if test="${not empty sessionEmail}">
                        <li><a href="../member/logout.do">로그아웃</a></li>
					    
						</c:if>
                        
                        
                        <li><a href="../member/regist.do">회원가입</a></li>
                        <li><a href="#">마이페이지</a></li>
                    </ul>
                </div>
            </div>    
        </header>
        <!-- header 끝 -->
        
        <!-- nav 시작 -->
        <nav class="container">
            <div class="nav_content">
                <ul>
                    <li><a href="../planner/planner_list.do">플래너</a></li>
                    <li><a href="#">맛집탐방</a></li>
                    <li><a href="../market/market_list.do">마켓</a></li>
                    <li><a href="../community/freeboard_list.do">커뮤니티</a></li>
                    <li><a href="../service/notiboard.do">고객센터</a></li>
                </ul>
            </div>
        </nav>
        <!-- nav 끝 -->
        <div class="line"></div>
        <!-- main 시작 -->
        <main class="container-fluid" style="height: 3600px;">
            <!-- top slide start -->
            <div class="container-fluid">
                <div class="top_slide">
                    <!-- Carousel -->
                    <div id="demo" class="carousel slide" data-bs-ride="carousel">
    
                        <!-- Indicators/dots -->
                        <div class="carousel-indicators">
                        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                        </div>
                        
                        <!-- The slideshow/carousel -->
                        <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="http://via.placeholder.com/1920x550" style="width:100%;">
                        </div>
                        <div class="carousel-item">
                            <img src="http://via.placeholder.com/1920x550" style="width:100%;">
                        </div>
                        <div class="carousel-item">
                            <img src="http://via.placeholder.com/1920x550" style="width:100%;">
                        </div>
                        </div>
                        
                        <!-- Left and right controls/icons -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                </div>
            </div>
            <!-- top slide end -->

            <!-- top ad start -->
            <div class="container-fluid">
                <div class="top_ad">
                    <div class="top_ad_title">
                        <h2>나만의 <span>플래너</span> 를 만들어보세요!</h2>
                        <a href="../planner/planner_map.do"><input type="button" value="플래너 바로가기"></a>
                    </div>
                    <div class="top_ad_icon">
                        <i>
                            <!-- 피그마에서 아이콘 가져옴 ㅎ -->
                            <svg width="129" height="129" viewBox="0 0 129 129" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M13.4375 102.125V37.625H115.562V102.125C115.562 108.038 110.725 112.875 104.812 112.875H24.1875C18.275 112.875 13.4375 108.038 13.4375 102.125Z" fill="white"/>
                                <path d="M115.562 26.875V43H13.4375V26.875C13.4375 20.9625 18.275 16.125 24.1875 16.125H104.812C110.725 16.125 115.562 20.9625 115.562 26.875Z" fill="#FF7A00"/>
                                <path d="M88.6875 34.9375C93.1403 34.9375 96.75 31.3278 96.75 26.875C96.75 22.4222 93.1403 18.8125 88.6875 18.8125C84.2347 18.8125 80.625 22.4222 80.625 26.875C80.625 31.3278 84.2347 34.9375 88.6875 34.9375Z" fill="#B71C1C"/>
                                <path d="M40.3125 34.9375C44.7653 34.9375 48.375 31.3278 48.375 26.875C48.375 22.4222 44.7653 18.8125 40.3125 18.8125C35.8597 18.8125 32.25 22.4222 32.25 26.875C32.25 31.3278 35.8597 34.9375 40.3125 34.9375Z" fill="#B71C1C"/>
                                <path d="M88.6875 8.0625C85.7313 8.0625 83.3125 10.4812 83.3125 13.4375V26.875C83.3125 29.8312 85.7313 32.25 88.6875 32.25C91.6438 32.25 94.0625 29.8312 94.0625 26.875V13.4375C94.0625 10.4812 91.6438 8.0625 88.6875 8.0625ZM40.3125 8.0625C37.3563 8.0625 34.9375 10.4812 34.9375 13.4375V26.875C34.9375 29.8312 37.3563 32.25 40.3125 32.25C43.2688 32.25 45.6875 29.8312 45.6875 26.875V13.4375C45.6875 10.4812 43.2688 8.0625 40.3125 8.0625ZM34.9375 56.4375H51.0625V72.5625H34.9375V56.4375ZM56.4375 56.4375H72.5625V72.5625H56.4375V56.4375ZM77.9375 56.4375H94.0625V72.5625H77.9375V56.4375ZM34.9375 77.9375H51.0625V94.0625H34.9375V77.9375ZM56.4375 77.9375H72.5625V94.0625H56.4375V77.9375Z" fill="#D9D9D9"/>
                                <path d="M77.9375 77.9375H94.0625V94.0625H77.9375V77.9375Z" fill="#F44336"/>
                                <g clip-path="url(#clip0_304_782)">
                                <path d="M74.2954 102.579L105.415 71.4673L119.971 86.027L88.8502 117.139L74.2954 102.579Z" fill="#FFCE31"/>
                                <path d="M126.366 66.9342L124.512 65.0803C120.999 61.5677 115.34 61.5677 111.73 65.0803L105.388 71.4225L120.023 86.0582L126.366 79.716C129.878 76.2035 129.878 70.4467 126.366 66.9342Z" fill="#ED4C5C"/>
                                <path d="M101.467 75.4327L105.468 71.4303L120.025 85.988L116.025 89.9894L101.467 75.4327Z" fill="#93A2AA"/>
                                <path d="M102.985 76.9499L106.986 72.9485L118.44 84.4014L114.437 88.4019L102.985 76.9499Z" fill="#C7D3D8"/>
                                <path d="M74.2626 102.548L67.9204 119.135L72.3111 123.526L88.8983 117.184L74.2626 102.548Z" fill="#FED0AC"/>
                                <path d="M66.8467 122.062C65.9686 124.404 67.1394 125.477 69.4812 124.599L77.482 121.574L69.969 114.061L66.8467 122.062Z" fill="#333333"/>
                                <path d="M74.2524 102.621L101.436 75.4375L106.266 80.2673L79.0822 107.451L74.2524 102.621Z" fill="#FFDF85"/>
                                <path d="M84.0234 112.346L111.207 85.1625L116.037 89.9923L88.8532 117.176L84.0234 112.346Z" fill="#FF8736"/>
                                </g>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M54.5587 45.313C55.1665 45.6734 55.6064 46.2602 55.7817 46.9447C55.9571 47.6292 55.8536 48.3552 55.4939 48.9635L43.9668 68.431C43.6064 69.0387 43.0195 69.4786 42.335 69.6539C41.6506 69.8293 40.9245 69.7258 40.3163 69.3661L33.8271 65.5238C33.2454 65.151 32.8311 64.567 32.6715 63.8949C32.5119 63.2227 32.6194 62.5148 32.9714 61.9203C33.3234 61.3259 33.8924 60.8913 34.5585 60.708C35.2246 60.5248 35.9359 60.6073 36.5424 60.9381L40.7387 63.4228L50.9083 46.2482C51.2686 45.6404 51.8555 45.2005 52.54 45.0252C53.2244 44.8498 53.9505 44.9533 54.5587 45.313Z" fill="#FF0000"/>
                                <defs>
                                <clipPath id="clip0_304_782">
                                <rect width="62.4459" height="62.4459" fill="white" transform="translate(66.5542 62.4459)"/>
                                </clipPath>
                                </defs>
                            </svg>
                        </i>
                    </div>
                </div>
            </div>
            <!-- top ad and -->

            <!-- main content start -->

            <div class="container-fluid">

                <!-- 플래너 시작 -->
                <div class="container">
                    <div class="main_plan_title">
                        <h2><span>#</span> 플래너</h2>
                        <div class="plan_line"></div>
                    </div>
                    <div class="main_plan">
                        <div class="main_plan_list">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
                

                <!-- 맛집탐방 -->
                <div class="container">
                    <div class="main_sic_title">
                        <h2><span>#</span> 맛집탐방</h2>
                        <div class="sic_line"></div>
                    </div>
                    <div class="main_sic">
                        <div class="main_sic_list">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>     
                </div>
                <!-- 맛집탐방 끝 -->

                <!-- 중간광고 -->
                <div class="container-fluid">
                    <div class="mid_ad">
                        <h2><span>카카오페이</span> 로 간편하게 결제!</h2>
                        <a href="#">
                            <svg width="153" height="70" viewBox="0 0 153 70" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_303_583)">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M5.8335 33.5417C5.8335 19.3754 19.4135 8.75 35.0002 8.75C50.5868 8.75 64.1668 19.3754 64.1668 33.5417C64.1668 47.7079 50.5868 58.3333 35.0002 58.3333C33.4689 58.3333 31.961 58.2342 30.491 58.0417L22.0327 63.6767C21.5527 63.9963 20.9888 64.1665 20.4121 64.1658C19.8355 64.1651 19.272 63.9934 18.7929 63.6726C18.3137 63.3517 17.9405 62.896 17.7203 62.363C17.5 61.8301 17.4427 61.2438 17.5556 60.6783L18.8535 54.2004C11.1652 49.8458 5.8335 42.3412 5.8335 33.5417ZM29.1668 20.4167C29.9404 20.4167 30.6822 20.724 31.2292 21.2709C31.7762 21.8179 32.0835 22.5598 32.0835 23.3333V43.75C32.0835 44.5235 31.7762 45.2654 31.2292 45.8124C30.6822 46.3594 29.9404 46.6667 29.1668 46.6667C28.3933 46.6667 27.6514 46.3594 27.1044 45.8124C26.5575 45.2654 26.2502 44.5235 26.2502 43.75V23.3333C26.2502 22.5598 26.5575 21.8179 27.1044 21.2709C27.6514 20.724 28.3933 20.4167 29.1668 20.4167ZM32.0835 36.4583C32.0835 35.8137 32.2964 35.1692 32.7252 34.6354L38.5585 27.3437C39.0506 26.7675 39.7476 26.4053 40.502 26.334C41.2564 26.2627 42.009 26.4878 42.6004 26.9616C43.1917 27.4355 43.5754 28.1209 43.6703 28.8727C43.7651 29.6245 43.5636 30.3837 43.1085 30.9896L38.7335 36.4583L43.1085 41.9271C43.3622 42.2242 43.5536 42.5692 43.6714 42.9417C43.7892 43.3143 43.8309 43.7066 43.7942 44.0956C43.7574 44.4845 43.6429 44.8621 43.4573 45.206C43.2718 45.5498 43.0191 45.8529 42.7143 46.0972C42.4094 46.3415 42.0585 46.522 41.6825 46.6281C41.3065 46.7342 40.913 46.7637 40.5254 46.7148C40.1378 46.6659 39.7639 46.5396 39.4261 46.3435C39.0882 46.1473 38.7932 45.8853 38.5585 45.5729L32.7252 38.2812C32.3099 37.7644 32.0835 37.1213 32.0835 36.4583Z" fill="black"/>
                                </g>
                                <path d="M74.865 49.545C73.185 49.545 72.03 48.565 72.03 46.99V23.4C72.03 20.915 73.01 19.795 75.67 19.795H83.23C90.055 19.795 94.08 23.47 94.08 29.035C94.08 34.6 90.055 38.345 83.23 38.345H77.77V46.99C77.77 48.565 76.65 49.545 75.005 49.545H74.865ZM77.77 33.235H83.265C86.52 33.235 88.34 31.73 88.34 29.035C88.34 26.41 86.52 24.905 83.265 24.905H78.12C77.805 24.905 77.77 24.905 77.77 25.325V33.235ZM106.537 49.65C104.612 49.65 102.897 49.195 101.392 48.25C98.347 46.43 96.527 43 96.527 38.94C96.527 36.91 96.947 35.09 97.822 33.445C99.537 30.19 102.722 28.23 106.537 28.23C108.602 28.23 110.352 28.79 111.857 29.945C112.242 29.07 113.222 28.405 114.517 28.405H114.692C116.337 28.405 117.492 29.42 117.492 30.96V46.99C117.492 48.53 116.337 49.51 114.692 49.51H114.517C113.222 49.51 112.172 48.88 111.857 47.935C110.352 49.09 108.602 49.65 106.537 49.65ZM102.267 38.975C102.267 42.335 104.192 44.575 106.992 44.575C109.792 44.575 111.752 42.335 111.752 38.975C111.752 35.615 109.792 33.305 106.992 33.305C104.192 33.305 102.267 35.58 102.267 38.975ZM125.266 56.965C123.446 56.965 121.591 56.265 120.331 54.76C119.876 54.235 119.666 53.71 119.666 53.115C119.666 52.45 119.946 51.855 120.541 51.26C121.066 50.735 121.696 50.455 122.431 50.455C123.096 50.455 123.691 50.7 124.146 51.155C124.811 51.82 125.091 51.925 125.546 51.925C126.421 51.925 126.876 50.525 128.031 47.69L120.576 32.185C120.401 31.8 120.296 31.415 120.296 30.995C120.296 29.91 121.031 29.035 122.256 28.58C122.641 28.475 122.991 28.405 123.236 28.405C124.391 28.405 125.441 29.175 125.896 30.19L130.761 40.97L135.136 30.26C135.556 29.175 136.606 28.405 137.831 28.405C138.216 28.405 138.566 28.475 138.916 28.615C140.141 29.07 140.771 29.945 140.771 31.03C140.771 31.45 140.701 31.835 140.526 32.185L133.561 48.67C132.686 50.735 131.916 52.31 131.216 53.465C129.816 55.74 128.031 56.965 125.266 56.965Z" fill="black"/>
                                <defs>
                                <clipPath id="clip0_303_583">
                                <rect width="70" height="70" fill="white"/>
                                </clipPath>
                                </defs>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- 맛집 -->
                <div class="container">
                    <div class="main_food_title">
                        <h2><span>#</span> 맛집</h2>
                        <div class="food_line"></div>
                    </div>
                    <div class="main_food">
                        <div class="main_food_list">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>     
                </div>
                <!-- 맛집 끝 -->

                <!-- 마켓 시작 -->
                <div class="container">
                    <div class="main_market_title">
                        <h2><span>#</span> 마켓</h2>
                        <div class="market_line"></div>
                    </div>
                    <div class="main_market">
                        <div class="main_market_list">
                            <div class="swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="card" style="width:250px">
                                            <img class="card-img-top" src="../images/스크린샷 2023-11-29 224515.png" alt="Card image" style="width:100%">
                                            <div class="card-body">
                                            <h4 class="card-title">John Doe</h4>
                                            <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>     
                </div>
                <!-- 마켓 끝 -->

                <!-- 아래광고 -->
                <div class="container-fluid">
                    <div class="bottom_ad">
                        <h2>우리집을 <span>맛집</span> 으로 만들어보세요!</h2>
                        <a href=""><input type="button" value="마켓 둘러보기"></a>
                    </div>
                </div>
            </div>
            <!-- Swiper JS -->
            <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

            <!-- Initialize Swiper -->
            <script>
                var swiper = new Swiper(".mySwiper", {
                slidesPerView: 2,
                spaceBetween: 10,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                
                breakpoints: {
                    640: {
                    slidesPerView: 2,
                    spaceBetween: 20,
                    },
                    768: {
                    slidesPerView: 4,
                    spaceBetween: 40,
                    },
                    // 1024: {
                    //   slidesPerView: 5,
                    //   spaceBetween: 50,
                    // },
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                });
            </script>
            <!-- main content end -->
        </main>
        <!-- main 끝 -->

        <!-- footer 추가 -->
		<%@ include file="../include/footer.jsp" %>        

    </div>
</body>
</html>