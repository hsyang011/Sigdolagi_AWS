<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<style>
.card { padding: 0; position: relative; border: none;} /* 좌우 마진 속성 제거, 테두리 둥글게 삭제 */
.card > div { border-radius: 15px; margin: 10px; border: 1px solid lightgray; } /* 테두리 둥글게는 .card의 자식 div에 부여 */
.card a > img { border-radius: 15px 15px 0 0; }
.card_product_img {position: relative;}
.cart_icon_box {border-radius:50px; width: 40px;height: 40px; position:absolute;bottom: 10px; right: 10px;}
.cart_icon_box img {border-radius:50px; width: 40px;height: 40px;background-color: #FF7A00;}
.cart_icon_box:hover img {background-color: #3058da;}
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
<script>
$(function() {
	$("#cartBtn").click(() => {
		location.href = "./cart.do";
	});
	$("#paymentBtn").click(() => {
		location.href = "./payment.do";
	});
});
</script>
</head>
<body>
<!-- wrapper 시작 -->
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
            <img id="page_icon" src="../images/planner_icon.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <div class="container">
            <!-- 상품 정보 시작 -->
            <div class="row">
                <div class="col-5">
                    <img src="../images/IMG1689kUc236018989_330_330.jpg" width="100%" alt="">
                    <div class="row">
                        <div class="col">
                            <img src="../images/IMG1689kUc236018989_330_330.jpg" width="100%" alt="">
                        </div>
                        <div class="col">
                            <img src="../images/IMG1689kUc236018989_330_330.jpg" width="100%" alt="">
                        </div>
                        <div class="col">
                            <img src="../images/IMG1689kUc236018989_330_330.jpg" width="100%" alt="">
                        </div>
                        <div class="col">
                            <img src="../images/IMG1689kUc236018989_330_330.jpg" width="100%" alt="">
                        </div>
                        <div class="col">
                            <img src="../images/IMG1689kUc236018989_330_330.jpg" width="100%" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-7" style="padding-left: 60px;">
                    <div class="d-flex justify-content-between mb-3">
                        <span class="text-secondary">식도라기</span>
                        <span>공유아이콘</span>
                    </div>
                    <h4>저당 얼큰 만두전골(2인)</h4>
                    <div class="d-flex mb-3">
                        <span class="me-2">★★★★☆</span>
                        <span class="me-2">4.6</span>
                        <span class="me-2">|</span>
                        <span class="me-2 text-secondary">31</span>
                    </div>
                    <div class="d-flex mb-3">
                        <h4 class="me-2" style="color: #FF7A00;">26%</h4>
                        <h4 class="me-2">16,900원</h4>
                        <h4 class="me-2 text-secondary" style="text-decoration: line-through;">20,900원</h4>
                    </div>
                    <div class="d-flex justify-content-between p-4 rounded-4 mb-2" style="background-color: lightgray;">
                        <h4>카카오페이 결제 시 1% 추가 적립</h4>
                        <p>혜택 확인 →</p>
                    </div>
                    <div class="d-flex justify-content-between align-items-center p-4 rounded-4 mb-5" style="background-color: lightgray;">
                        <div>
                            <h4>택배 배송 안내</h4>
                            <h6>주문과 동시에 생산하여 다음날 우리집 식탁까지 배송되어요</h6>
                        </div>
                        <p>배송 안내 →</p>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <span>배송비</span>
                        </div>
                        <div class="col-10 d-flex justify-content-between">
                            <table class="table">
                                <tr>
                                    <th>3,000원</th>
                                    <td class="text-secondary">40,000원 이상 구매 시 무료 배송</td>
                                </tr>
                                <tr>
                                    <th><button class="btn" style="background-color: #FF7A00; color: white;">택배배송</button></th>
                                    <td>
                                        <p>
                                            오전 8시까지 결제 완료 시, 배송 희망일 당일 수령 <br>
                                            전국/제주도 및 섬지역은 배송 불가 <br>
                                            배송 불가 지역 주문 시 자동 취소될 수 있습니다. <br>
                                            5만원 이상 무료 배송 / 5만원 미만 배송비 3,000원
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            <div>↑</div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-end rounded-4 p-4 mb-5" style="background-color: lightgray;">
                        <div>
                            <h4>저당 얼큰 만두전골(2인)</h4>
                            <input type="number" value="1" class="form-control rounded-pill text-center">
                        </div>
                        <h4>16,900원</h4>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between">
                            <p>구매 예정 금액</p>
                            <h2 style="color: #FF7A00;">5,900원</h2>
                        </div>
                        <button id="cartBtn" class="btn btn-outline-dark mb-3" style="width: 100%; height: 50px;">장바구니</button>
                        <button id="paymentBtn" class="btn" style="width: 100%; height: 50px; background-color: #FF7A00; color: white;">바로 구매</button>
                    </div>
                </div>
            </div>
            <!-- 상품 정보 끝 -->
            <!-- 추천 상품 시작 -->
            <div class="mt-5">
                <h2>고객님을 위한 추천 상품</h2>
                <hr>
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
            <!-- 추천상품 끝 -->
            <!-- 상품 상세정보 시작 -->
            <div>
                <ul class="head_nav nav justify-content-center mt-5 mb-3 py-3" style="position: sticky; position: -webkit-sticky; top: 115px; background-color: white;">
                    <li class="nav-item"><a class="nav-link" href="#detail_info">상세 정보</a></li>
                    <li class="nav-item"><a class="nav-link" href="#basic_info">기본 정보</a></li>
                    <li class="nav-item"><a class="nav-link" href="#product_notice">배송/교환/반품 안내</a></li>
                    <li class="nav-item"><a class="nav-link" href="#product_review">상품 리뷰 33</a></li>
                    <li class="nav-item"><a class="nav-link" href="#product_inquiry">상품 문의 2</a></li>
                </ul>
                <hr>
                <!-- 상세 정보 시작 -->
                <div class="mt-5">
                    <img src="../images/product_detail.jpg" style="width: 100%;" id="#detail_info" alt="">
                </div>
                <!-- 상세 정보 끝 -->
                <!-- 기본 정보 시작 -->
                <div id="basic_info" class="mt-5">
                    <table class="table table-stripe">
                        <tr>
                            <th>식품의유형</th>
                            <td>상세페이지 참조</td>
                            <th>중량</th>
                            <td>상세페이지 참조</td>
                        </tr>
                        <tr>
                            <th>유통기한(품질유지기한)</th>
                            <td>제조일로부터 6개월</td>
                            <th>배송가능지역</th>
                            <td>전국배송(섬지역제외, 제주지역 별도문의)</td>
                        </tr>
                        <tr>
                            <th>원재료명 및 함량</th>
                            <td>상세페이지 참조</td>
                            <th>배송 방법</th>
                            <td>택배</td>
                        </tr>
                        <tr>
                            <th>유전자재조합식품여부</th>
                            <td>상세페이지 참조</td>
                            <th>수입식품문구</th>
                            <td>해당사항 없음</td>
                        </tr>
                        <tr>
                            <th>영양성분</th>
                            <td>해당사항 없음</td>
                            <th>영유아식 또는 체중조절식품 등에 해당하는 경우</th>
                            <td>해당사항 없음</td>
                        </tr>
                        <tr>
                            <th>생산자(제조사)</th>
                            <td>주식회사 식도라기</td>
                            <th>소비자상담번호</th>
                            <td>식도라기 고객센터 (1588-0000)</td>
                        </tr>
                        <tr>
                            <th>생산자 소재지</th>
                            <td>서울특별시 종로구 관철동 대왕빌딩 9층 906호</td>
                            <th>주의사항</th>
                            <td>상세페이지 참조</td>
                        </tr>
                    </table>
                </div>
                <!-- 기본 정보 끝 -->
                <!-- 배송/교환/반품 안내 시작 -->
                <div id="product_notice">
                    <img src="../images/delivery_info.jpg" style="width: 100%;" alt="배송/교환/반품 안내">
                </div>
                <!-- 배송/교환/반품 안내 끝 -->
                <!-- 상품 리뷰 시작 -->
                <div id="product_review" class="my-5">
                    <div class="d-flex justify-content-between">
                        <p>상품리뷰 <span style="color: #FF7A00;">1건</span></p>
                        <button class="btn btn-outline-dark px-5 rounded-pill">상품 리뷰쓰기</button>
                    </div>
                    <table class="table table-border text-center">
                        <tr>
                            <th>번호</th>
                            <th style="width: 60%;">한줄리뷰</th>
                            <th>작성자</th>
                            <th>등록일</th>
                        </tr>
                        <tr>
                            <th>1</th>
                            <td>만두가 맛있어요</td>
                            <td>홍길동</td>
                            <td>2023/11/24</td>
                        </tr>
                    </table>
                </div>
                <!-- 상품 리뷰 끝 -->
                <!-- 상품 문의 시작 -->
                <div id="product_inquiry" class="my-5">
                    <div class="d-flex justify-content-between">
                        <p>상품리뷰 <span style="color: #FF7A00;">1건</span></p>
                        <button class="btn btn-outline-dark px-5 rounded-pill">상품 문의하기</button>
                    </div>
                    <table class="table table-border text-center">
                        <tr>
                            <th>번호</th>
                            <th style="width: 60%;">문의 내용</th>
                            <th>작성자</th>
                            <th>등록일</th>
                        </tr>
                        <tr>
                            <th>1</th>
                            <td>배송하는데 얼마 걸리나요?</td>
                            <td>김유신</td>
                            <td>2023/11/24</td>
                        </tr>
                    </table>
                </div>
                <!-- 상품 문의 끝 -->
            </div>
        </div>
    </main>
    <!-- main 끝 -->
    
	<!-- footer 추가 -->
	<%@ include file="../include/footer.jsp" %>

</div>
<!-- wrapper 끝 -->
</body>
</html>