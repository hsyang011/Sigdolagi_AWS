<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<style>
/* main 설정 */
main > * { margin: 50px 0; }
.card { padding: 0; position: relative; border: none;} /* 좌우 마진 속성 제거, 테두리 둥글게 삭제 */
.card > div { border-radius: 15px; margin: 10px; border: 1px solid lightgray; } /* 테두리 둥글게는 .card의 자식 div에 부여 */
.card a > img { border-radius: 15px 15px 0 0; }
.search_plan_img {height: 250px;}
.discount { color: #FF7A00; font-weight: bold; font-size: 1.5em;}
    /* 카테고리 타이틀 */
.shop_title{color: #999999; font-size: 0.75em; display: block;}
.plan_title{color: #999999; font-size: 0.75em; display: block;}
.card-text{ font-size: 20px;}
strike {font-size: 18px;}
.mill_title {color: #000;}

.plan_user_name{color: #333; font-size: 1em;text-align: right;}
.photo_user_name{color: #333; font-size: 1em;}
.photo_date {font-size: 0.75em;color: #999999;}

.plan_board_title {color: #000;}
.photo_board_title {color: #000;}

.thumbnail {margin: 40px 0;}
.card_product_img {position: relative;}
.cart_icon_box {border-radius:50px; width: 40px;height: 40px; position:absolute;bottom: 10px; right: 10px;}
.cart_icon_box img {border-radius:50px; width: 40px;height: 40px;background-color: #FF7A00;}
.cart_icon_box:hover img {background-color: #3058da;}

.cate_title {margin: 30px 0;}

/* 글씨 생략표시 */
.card-title{
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 90%;
}
.free_board_list{padding: 0;}
.free_board_list li {padding: 10px 0;border-bottom: 1px solid #e5e5e5;}
.free_board_list li:last-child {padding-bottom: 0;border-bottom: 0px solid #e5e5e5;}
.free_board_list li a{color: #454545;}
.free_board_list li a:hover{color: #FF7A00;}
.free_board_cont{
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 95%;
    height: 20px;
    font-size: 1em;
}


/* 지도관련 스타일 */
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:"NPSfontRegular"; font-size: 16px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:707px;}
#menu_wrap {width:100%;overflow-y:auto;background:white;z-index: 1;font-size:12px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
/* 추가된 스타일 코드 */
.search-bar {
    position: absolute;
    top: 10px;
    right: 0;
    z-index: 2;
}
.submit {
    position: absolute;
    bottom: 10px;
    right: 24%;
    z-index: 2;
}
.search-bar input:focus { border: 3px solid #FF7A00; }


/* topad */
.top_ad { height: 150px;  margin-top: 3%;justify-content: space-between; padding: 0 100px;}
.top_ad_title h2 { font-family: NPSfontRegular; font-size: 1.5em; }
.top_ad_title h2 span { font-family: NPSfontExtraBold; font-size: 1.7em; color: #FF7A00; }
.top_ad_title a input { margin-left: 10%; width: 140px; height: 40px; border: none; border-radius: 10px; 
    background-color: #FF7A00; color: white; font-family: NPSfontBold; }


/* ######################################################### */
@media screen and (min-width: 1201px) {
    .custom-col { flex: 0 0 25%; }
}
/* 모바일 환경에서 카테고리를 횡스크롤로 구현 */
@media screen and (max-width: 1200px) {
    .category { overflow: auto; white-space: nowrap; flex-wrap: nowrap; } /* 횡스크롤 구현 */
    .category::-webkit-scrollbar { display: none; } /* 크롬, 사파리, 오페라, 엣지에서 스크롤바 안보이게 처리 */
    .custom-col { flex: 0 0 25%; }
    .card * { font-size: 0.98em; }

    
}
@media screen and (max-width:993px) {
    .top_ad_title h2 { font-size: 1.3em; }
    .top_ad_title h2 span { font-size: 1.5em;}
}
@media screen and (max-width: 768px) {
    .custom-col { flex: 0 0 50%; }
    .card * { font-size: 0.95em; }
    .thumbnail {margin: 0 0;}
    .shop_title{font-size: 0.7em;}
    .plan_title{font-size: 0.7em;}
    .photo_user_name{font-size: 0.7em;}

    /* top_ad */
    .top_ad {justify-content: center; padding: 0;}
    .top_ad_icon { display: none; }
    .top_ad_title h2 { font-size: 1em; }
    .top_ad_title h2 span { font-size: 1.2em;}
    .top_ad_title a input { font-size: 0.8em; }
    
    .seach_restaurant{display: none;}
}


</style>
<script>
$(function() {
    resizeCardSize();
    // 카드 이미지를 정사각형으로 조정
    $(window).resize(function() {
        resizeCardSize();
    });

    // 창의 너비에 따라 다른 이미지 크기 선택
    if ($(window).width() <= 768) {
        $("#myplannerBtn").text("나의 플래너");
        $("#makeplannerBtn").text("만들기");
    }
});

function resizeCardSize() {
    let cardImgWidth = $(".card-img-top").width();
    $(".card-img-top").height(cardImgWidth*0.9);
}
</script>
</head>
<body>
<!-- wrapper 시작 -->
<div class="container-fluid" id="wrap">

    <!-- header, nav 추가 -->
    <%@ include file="../include/top.jsp" %>
    
    <!-- main 시작 -->
    <main>
        <div class="container">
            <!-- 통합검색 시작 -->
            <div class="seach_restaurant cate_title">
                <!-- 페이지 제목 -->
                <div class="page_title_area d-flex justify-content-between align-items-end" style="margin-bottom: 10px;">
                    <h4>'감동' 검색결과</h4>
                    <a href="#">더보기 ></a>
                </div>
                <!-- 지도 출력 시작 -->
                <div class="row" style="border-top: 2px solid #000; padding: 20px 0;">
                    <div class="col-lg-8">
                        <!-- 지도 시작 -->
                        <div class="map_wrap">
                            <!-- 장소 검색 버튼 -->
                            <div class="search-bar me-2">
                                <form onsubmit="searchPlaces(); return false;" class="d-flex align-items-center">
                                    <input type="text" id="keyword" value="종각" class="form-control rounded-4 p-2" size="15" placeholder="장소 검색" style="height: 60px; width: 240px;">
                                    <img src="../images/search_icon.png" height="30" class="rounded-pill" style="position: relative; right: 40px; cursor: pointer;" alt="">
                                </form>
                            </div>
                           
                            <!-- 지도 -->
                            <div id="map" style="width:100%;height:100%;overflow:hidden;"></div>
                        </div>
                        <!-- 지도 끝 -->
                    </div>
                    <div class="col-lg-4">
                        <div style="width: 100%;">
                            <!-- 맛집리스트 시작 -->
                            <div id="menu_wrap" class="bg_white" style="height:707px;">
                                <div class="option py-3">
                                    코코 위례점 검색결과 <span style="color: #FF7A00;">2건</span>
                                </div>
                                <hr>
                                <ul id="placesList"></ul>
                                <div id="pagination"></div>
                            </div>
                            <!-- 맛집리스트 끝 -->
                        </div>
                    </div>
                </div>
                <!-- 지도 출력 끝 -->
            </div>
            <!-- 통합검색 끝 -->

            <!-- 플래너 시작 -->
            <div class="seach_plan cate_title">
                <!-- 페이지 제목 -->
                <div class="page_title_area d-flex justify-content-between align-items-end" style="margin-bottom: 10px;">
                    <div class="d-flex align-items-end"><h4>#플래너</h4><h6 style="font-size: 0.8em; margin-left: 20px;"><b style="color: #FF7A00;">n개</b> 검색결과</h6></div> 
                    <a href="#">더보기 ></a>
                </div>
                <!-- 플래너 출력 시작 -->
                <div class="row"  style="border-top: 2px solid #000;">
                    <div class="col-sm-12">
                        <!-- #################################################################################### -->
                        <!-- .card 하위에 div태그를 각각 추가한 부분이 있으니 유의 바랍니다. -->
                        <!-- 밀키트 상품리스트 시작 -->
                        <!-- 1행 시작 -->
                        <figure class="row thumbnail">
                            <!-- 1열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/1572507524886qqw0qpSy16.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="plan_title">나혼자산다.(카테고리)</span>
                                        <h5 class="card-title"><a class="plan_board_title" href="">출발지 > 도착지</a></h5>
                                        <p class="card-text plan_user_name" style="text-align: right;">
                                            <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 1열 끝 -->
                            <!-- 2열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/2f69e05d4d598d3959fb6d8a1801ef5a.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="plan_title">나혼자여행(카테고리)</span>
                                        <h5 class="card-title"><a class="plan_board_title" href="">출발지 > 도착지</a></h5>
                                        <p class="card-text plan_user_name" style="text-align: right;">
                                            <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 2열 끝 -->
                            <!-- 3열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/1572507524886qqw0qpSy16.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="plan_title">나혼자여행(카테고리)</span>
                                        <h5 class="card-title"><a class="plan_board_title" href="">출발지 > 도착지</a></h5>
                                        <p class="card-text plan_user_name" style="text-align: right;">
                                            <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 3열 끝 -->
                            <!-- 4열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/1572507524886qqw0qpSy16.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="plan_title">나혼자여행(카테고리)</span>
                                        <h5 class="card-title"><a class="plan_board_title" href="">출발지 > 도착지</a></h5>
                                        <p class="card-text plan_user_name" style="text-align: right;">
                                            <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 4열 끝 -->
                        </figure>
                        <!-- 1행 끝 -->
                    </div>
                </div>
                <!-- 플래너 출력 끝 -->
            </div>
            <!-- 플래너 끝 -->

            <!-- 마켓 시작 -->
            <div class="seach_shop cate_title">
                <!-- 페이지 제목 -->
                <div class="page_title_area d-flex justify-content-between align-items-end" style="margin-bottom: 10px;">
                    <div class="d-flex align-items-end"><h4>#마켓</h4><h6 style="font-size: 0.8em; margin-left: 20px;"><b style="color: #FF7A00;">n개</b> 검색결과</h6></div> 
                    <a href="#">더보기 ></a>
                </div>
                <!-- 마켓 출력 시작 -->
                <div class="row"  style="border-top: 2px solid #000;">
                    <div class="col-sm-12">
                        <!-- 밀키트 상품리스트 시작 -->
                        <!-- 1행 시작 -->
                        <figure class="row thumbnail">
                            <!-- 1열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="shop_product_img card-img-top" src="../images/밀키트1.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="shop_title">가게이름뭐시기저시기</span>
                                        <h5 class="card-title"><a class="mill_title" href="">상품명 이것저것요것(2인)</a></h5>
                                        <p class="card-text"><span class="discount">27%</span> <strong>10,900원</strong> <strike>14,900원</strike></p>
                                    </div>
                                </div>
                            </div>
                            <!-- 1열 끝 -->
                            <!-- 2열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="shop_product_img card-img-top" src="../images/밀키트2.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="shop_title">가게이름뭐시기저시기</span>
                                        <h5 class="card-title"><a class="mill_title" href="">상품명 이것저것요것(2인)</a></h5>
                                        <p class="card-text"><span class="discount">27%</span> <strong>10,900원</strong> <strike>14,900원</strike></p>
                                    </div>
                                </div>
                            </div>
                            <!-- 2열 끝 -->
                            <!-- 3열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="shop_product_img card-img-top" src="../images/밀키트3.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="shop_title">가게이름뭐시기저시기</span>
                                        <h5 class="card-title"><a class="mill_title" href="">상품명 이것저것요것(2인)</a></h5>
                                        <p class="card-text"><span class="discount">27%</span> <strong>10,900원</strong> <strike>14,900원</strike></p>
                                    </div>
                                </div>
                            </div>
                            <!-- 3열 끝 -->
                            <!-- 4열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="shop_product_img card-img-top" src="../images/밀키트4.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <span class="shop_title">가게이름뭐시기저시기</span>
                                        <h5 class="card-title"><a class="mill_title" href="">상품명 이것저것요것(2인)</a></h5>
                                        <p class="card-text"><span class="discount">27%</span> <strong>10,900원</strong> <strike>14,900원</strike></p>
                                    </div>
                                </div>
                            </div>
                            <!-- 4열 끝 -->
                        </figure>
                        <!-- 1행 끝 -->
                    </div>
                </div>
                <!-- 마켓 출력 끝 -->
            </div>
            <!-- 마켓 끝 -->

            <!-- 포토게시판 시작 -->
            <div class="seach_photo cate_title">
                <!-- 페이지 제목 -->
                <div class="page_title_area d-flex justify-content-between align-items-end" style="margin-bottom: 10px;">
                    <div class="d-flex align-items-end"><h4>#포토게시판</h4><h6 style="font-size: 0.8em; margin-left: 20px;"><b style="color: #FF7A00;">n개</b> 검색결과</h6></div> 
                    <a href="#">더보기 ></a>
                </div>
                <!-- 포토 출력 시작 -->
                <div class="row"  style="border-top: 2px solid #000;">
                    <div class="col-sm-12">
                        <!-- 포토게시판 시작 -->
                        <!-- 1행 시작 -->
                        <figure class="row thumbnail">
                            <!-- 1열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/1572507524886qqw0qpSy16.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <h5 class="card-title"><a class="photo_board_title" href="">제목입니다ㅏㅏㅏㅏㅏㅏㅏffffffffffffffffffffffffffffffffffㅏ</a></h5>
                                        <p class="card-text photo_user_name justify-content-between d-flex ">
                                            <span class="photo_date">2023-12-03</span> <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 1열 끝 -->
                            <!-- 2열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/2f69e05d4d598d3959fb6d8a1801ef5a.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <h5 class="card-title"><a class="photo_board_title" href="">^^^^^^^^^^^^^^</a></h5>
                                        <p class="card-text photo_user_name justify-content-between d-flex ">
                                            <span class="photo_date">2023-12-03</span> <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 2열 끝 -->
                            <!-- 3열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/1572507524886qqw0qpSy16.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <h5 class="card-title"><a class="photo_board_title" href="">ㅁㄴㅇㅁㄴㄻㄴㄹffㅏ</a></h5>
                                        <p class="card-text photo_user_name justify-content-between d-flex ">
                                            <span class="photo_date">2023-12-03</span> <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 3열 끝 -->
                            <!-- 4열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <div class="card_product_img">
                                        <a href="">
                                            <img class="search_plan_img card-img-top" src="../images/1572507524886qqw0qpSy16.jpg" alt="Card image">
                                        </a>
                                        <div class="cart_icon_box">
                                            <img src="../images/shopping-bag3.png" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body justify-content-between">
                                        <h5 class="card-title"><a class="photo_board_title" href="">안녕</a></h5>
                                        <p class="card-text photo_user_name justify-content-between d-flex ">
                                            <span class="photo_date">2023-12-03</span> <span>작성자닉네임</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- 4열 끝 -->
                        </figure>
                        <!-- 1행 끝 -->
                    </div>
                </div>
                <!-- 플래너 출력 끝 -->
            </div>
            <!-- 포토게시판 끝 -->

            <!-- 자유게시판 시작 -->
            <div class="seach_photo cate_title">
                <!-- 페이지 제목 -->
                <div class="page_title_area d-flex justify-content-between align-items-end" style="margin-bottom: 10px;">
                    <div class="d-flex align-items-end"><h4>#자유게시판</h4><h6 style="font-size: 0.8em; margin-left: 20px;"><b style="color: #FF7A00;">n개</b> 검색결과</h6></div> 
                    <a href="#">더보기 ></a>
                </div>
                <!-- 자유게시판 출력 시작 -->
                <div class="row"  style="border-top: 2px solid #000;">
                    <div class="col-md-12">
                        <ul class="free_board_list">
                            <li>
                                <a href="">
                                    <div><h5 style="margin: 0;">제목입니다</h5></div>
                                    <div class="free_board_cont">
                                        컨텐츠 내용ㅁㅈ디ㅏ러밎ㄷ러미잗럳라ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
                                    </div>
                                </a>
                                <div style="padding-top: 3px; font-size: 0.9em;"><span style="color: #999999;">2023-12-03</span> <span>조회수 : 30</span></div>
                            </li>
                            <li>
                                <a href="">
                                    <div><h5 style="margin: 0;">제목입니다</h5></div>
                                    <div class="free_board_cont">
                                        컨텐츠 내용ㅁㅈ디ㅏ러밎ㄷ러미잗럳라ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
                                    </div>
                                </a>
                                <div style="padding-top: 3px; font-size: 0.9em;"><span style="color: #999999;">2023-12-03</span> <span>조회수 : 30</span></div>
                            </li>
                            <li>
                                <a href="">
                                    <div><h5 style="margin: 0;">제목입니다</h5></div>
                                    <div class="free_board_cont">
                                        컨텐츠 내용ㅁㅈ디ㅏ러밎ㄷ러미잗럳라ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
                                    </div>
                                </a>
                                <div style="padding-top: 3px; font-size: 0.9em;"><span style="color: #999999;">2023-12-03</span> <span>조회수 : 30</span></div>
                            </li>
                            <li>
                                <a href="">
                                    <div><h5 style="margin: 0;">제목입니다</h5></div>
                                    <div class="free_board_cont">
                                        컨텐츠 내용ㅁㅈ디ㅏ러밎ㄷ러미잗럳라ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
                                    </div>
                                </a>
                                <div style="padding-top: 3px; font-size: 0.9em;"><span style="color: #999999;">2023-12-03</span> <span>조회수 : 30</span></div>
                            </li>
                            <li>
                                <a href="">
                                    <div><h5 style="margin: 0;">제목입니다</h5></div>
                                    <div class="free_board_cont">
                                        컨텐츠 내용ㅁㅈ디ㅏ러밎ㄷ러미잗럳라ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
                                    </div>
                                </a>
                                <div style="padding-top: 3px; font-size: 0.9em;"><span style="color: #999999;">2023-12-03</span> <span>조회수 : 30</span></div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 자유게시판 출력 끝 -->
            </div>
            <!-- 자유게시판 끝 -->
        </div>


        <!-- top ad start -->
        <div class="container-fluid" style="background-color: #FEEADB">
            <div class="container">
                <div class="top_ad d-flex align-items-center">
                    <div class="top_ad_title">
                        <h2>나만의 <span>플래너</span> 를 만들어보세요!</h2>
                        <a href="#"><input type="button" value="플래너 바로가기"></a>
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
        </div>
        <!-- top ad and -->
    </main>
    
    <!-- main 끝 -->
    
    <!-- footer 추가 -->
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!-- wrapper 끝 -->
</body>
</html>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58c1517c26a147b5119aacb8ce4f7d5c&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        console.log(data[0]);
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="d-flex justify-content-between align-items-center"><div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>