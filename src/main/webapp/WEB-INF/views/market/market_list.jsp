<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<style>
/*main nav_location 설정*/
.nav_locat {font-family: 'NPSfontRegular'; margin-left: -10px;}
.nav_locat li a{color: #FF7A00;}
.nav_locat li a:hover{color: #484848;}
.nav_locat li:first-child::before {            /* 첫번째 list에 적용 */
    content: " ";
}
.nav_locat li::before {   /* 두번째 list 앞에 적용 */
  content: ">";
  float: left;
  color: #ccc;
  margin-top: 9px;
  margin-left: -3px;
}

/* 쇼핑몰 카테고리 */
.catemenu {font-size: 1.6em; padding: 0; margin: 20px 0;}
.catemenu li{border-bottom: 3px solid #999999;  padding:10px;}
.catemenu li:first-child{margin-right: 10px;}
.catemenu a{color:gray;  padding-bottom: 5px;}
.catemenu .on {border-bottom: 3px solid #FF7A00;}

.mealk_cate {background-color: #dadada; color: white;}
.category .on {background-color: #FF7A00; color: white;}

 /* main seach바 */
.meal_seach_bar { border: 3px solid #FF7A00; border-radius: 30px; background-color: white; padding: 5px; margin: 50px auto; width: 40%;}
.meal_seach_bar input{ border: 0px solid white; width: 100%; height: 40px; }
.meal_seach_bar input::placeholder{ font-family: 'NPSfontRegular'; text-align: center; margin-left: -75px; } /* 검색하기 텍스트 중앙 정렬 맞추기 위해 margin-left로 맞춤 */
.meal_seach_bar button{ border: 0px solid white; background-color: white; border-radius: 50px;}
.meal_seach_bar i { color: #FF7A00; margin-right: 5px; width: 60px;}

/* main 설정 */
main > * { margin: 50px 0; }
.card { padding: 0; position: relative; border: none;} /* 좌우 마진 속성 제거, 테두리 둥글게 삭제 */
.card > div { border-radius: 15px; margin: 10px; border: 1px solid lightgray; } /* 테두리 둥글게는 .card의 자식 div에 부여 */
.card a > img { border-radius: 15px 15px 0 0; }
.discount { color: #FF7A00; font-weight: bold; font-size: 1.5em;}
.shop_title{color: #999999; font-size: 14px; display: block;}
.card-text{ font-size: 20px;}
strike {font-size: 18px;}
.mill_title {color: #000;}
.thumbnail {margin: 40px 0;}
.card_product_img {position: relative;}
.cart_icon_box {border-radius:50px; width: 40px;height: 40px; position:absolute;bottom: 10px; right: 10px;}
.cart_icon_box img {border-radius:50px; width: 40px;height: 40px;background-color: #FF7A00;}
.cart_icon_box:hover img {background-color: #3058da;}

/* ######################################################### */
/* 12/01 수정사항 - 한서 */
@media screen and (min-width: 1201px) {
    .custom-col { flex: 0 0 25%; }
}
/* 모바일 환경에서 카테고리를 횡스크롤로 구현 */
@media screen and (max-width: 1200px) {
    .category { overflow: auto; white-space: nowrap; flex-wrap: nowrap; } /* 횡스크롤 구현 */
    .category::-webkit-scrollbar { display: none; } /* 크롬, 사파리, 오페라, 엣지에서 스크롤바 안보이게 처리 */
    .custom-col { flex: 0 0 25%; }
    .meal_seach_bar { width: 100%; } /* 모바일에선 검색창의 길이를 100%로 처리 */
    .card * { font-size: 0.98em; }
}
@media screen and (max-width: 768px) {
    .custom-col { flex: 0 0 50%; }
    .mealk_cate {font-size: 0.8em;}/* 밀키트 카테고리 사이즈 */
    .catemenu li a { font-size: 0.75em; } 
    .card * { font-size: 0.95em; }
    .thumbnail {margin: 0 0;}
}

</style>
</head>
<body>
<!-- wrapper 시작 -->
<!-- 커밋테스트용 주석이에요 신경쓰지 마세용 -->
<div class="container-fluid" id="wrap">

    <!-- header, nav 추가 -->
    <%@ include file="../include/top.jsp" %>    
    
    <!-- 배너 시작 -->
    <div id="banner" class="mt-3">
        <div id="banner_contents" class="container d-flex align-items-center">
            <div id="info">
                <h4>외식보다 저렴, 건강한 식사</h4>
                <div id="info_title" class="d-flex">
                    <h2>마켓</h2>
                </div>
            </div>
            <img id="page_icon" src="../images/gift2.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <!-- 컨테이너 안쪽 컨텐츠 -->
        <div class="container mt-3">
            <!-- 컨텐츠 헤더 -->
            <div class="top_title">
               <!-- 네비로케이션 -->
               <div class="nav_location">
                    <ul class="nav_locat nav">
                        <li class="nav-item">
                          <a class="nav-link" href="#">홈</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#">마켓</a>
                        </li>
                    </ul>
                </div>
                <!-- 네비로케이션 끝 -->
                <!-- 헤더제목 -->
                <ul class="catemenu d-flex">
                    <li class="on"><a href="#">밀키트</a></li>
                    <li><a href="#">특산품</a></li>
                </ul>
                <ul class="nav my-3 category mt-4">
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill on">#전체</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#한식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#일식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#중식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#양식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#기타</button></li>
                </ul>
            </div>
            <!-- 컨텐츠 헤더 끝 -->
            <div class="shop_board container  mt-5">

                <!-- 검색창 -->
                <div class="meal_seach_bar">
                    <form class="d-flex">
                        <input id="meal_seach" class="form-control rounded-pill me-2" type="text" placeholder="검색하기">
                        <button class="" type="button" >
                            <i class="fa-solid fa-magnifying-glass fa-xl"></i>
                        </button>
                    </form>
                </div>
                <!-- 검색창 끝 -->

                <!-- 전체 게시물 갯수 셀렉트 끝 -->
                <div class="select_box d-flex justify-content-between">
                    <span class="">전체 <strong style="color: #FF7A00;">33</strong>개의 상품이 있습니다.</span>
                    <!-- ################################################################################ -->
                    <!-- 모바일에서 정렬이 안맞아서 input의 길이를 줄였고, rounded-pill속성을 부여하여 둥글게 처리 -->
                    <select name="" id="" class="rounded-pill" style="width: 120px; height: 30px;">
                        <option value="" selected style="text-align: center;">추천순</option>
                        <option value="" style="text-align: center;">가격낮은순</option>
                        <option value="" style="text-align: center;">가격높은순</option>
                    </select>
                </div>
                <hr style="border: 1px solid #000; margin-bottom: 30px;">
                <!-- 전체 게시물 갯수 셀렉트 끝 -->

                <!-- #################################################################################### -->
                <!-- .card 하위에 div태그를 각각 추가한 부분이 있으니 유의 바랍니다. -->
                <!-- 밀키트 상품리스트 시작 -->
                <!-- 1행 시작 -->
                <figure class="row thumbnail">
                    <!-- 1열 시작 -->
                    <div class="card custom-col">
                        <div>
                            <div class="card_product_img">
                                <a href="./market_view.do">
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
                <!-- 2행 시작 -->
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
                <!-- 2행 끝 -->
                <!-- 3행 시작 -->
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
                <!-- 3행 끝 -->
                <!-- 4행 시작 -->
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
                <!-- 4행 끝 -->
                
                <!-- 밀키트 상품리스트 끝 -->

            </div>
            <!-- 페이지네이션 -->
            <ul class="pagination justify-content-center" style="margin: 80px 0;">
                <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
            <!-- 페이지네이션 -->

        <!-- 컨테이너 안쪽 컨텐츠 -->
        </div>



    </main>
    <!-- main 끝 -->
    
    <!-- footer 추가 -->
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!-- wrapper 끝 -->
</body>
</html>