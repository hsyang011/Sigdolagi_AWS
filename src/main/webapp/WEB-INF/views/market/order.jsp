<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<style>
/* 장바구니 내역 */
.cart-option{margin-top: 20px; margin-bottom: 15px;}
.cart_list>table {border-top: 2px solid #000;}
.cart_product{border-bottom: 1px solid #dfdfdf;}
.product_img{padding: 10px;}
.product_img img{width: 100px;}
.product_title{padding-left: 10px;}
.product_title div{margin: 2px 0;}
.shop_title{font-size: 0.75em; color: #777777;}
.product_title_price{font-family: 'NPSfontBold';}
.product_quantity {width: 60px; text-align: center; color: #303030; padding-left: 15px;}
.product_price_area{padding-top: 12px;text-align: center;}
.product_price{font-weight: bold; font-size: 1.2em;}
/* 결제수단 버튼 */
.payment-method { background-color: #FF7A00; color: white; width: 100%; }
#payment-method { justify-content: space-between; margin-top: 20px; }

/* 주문자 정보 */
#order_input tr th { width: 30%; }

/* 전체삭제, 선책삭제 버튼 */
.btn_cart_delete {border: 0px; background: #fff;margin-left: 10px;}

/* 하단 전체금액, 배송비안내박스 */
.bottom_price_box{border: 1px solid #f7f7f7; padding: 20px 10px 0px 10px; background: #f4f4f4; margin-bottom: 100px;}
.bottom_box_left p {font-size: 0.8em;margin-bottom: 0;}
.bottom_box_left span {color: #777777; font-size: 0.9em;}
.product_price {font-weight: bold;}
.plus {margin-top: -5px;}
.equal{margin-top: -5px;}
.All_price {font-size: 1.2em;font-weight: bold;}

/* 결제 예정 금액 박스 */
.payment-info-box-order {border: 1px solid #888;border-radius: 30px; padding: 20px;background-color: #fff;}
.payment-info-box-order h4{margin-top: 20px;}
.payment-info-box table {margin: 20px 0; width: 100%;}
.payment-info-box table tr td {padding: 15px 0;}
.payment_info_txt {font-size: 0.9em;}
.payment_info_price {font-weight: bold; font-size: 1.2em;}
.payment_info_total_price {font-weight: bold; font-size: 1.3em; color: #FF7A00;}
.payment_info_total_line {border-top: 1px solid #dfdfdf;}
.order_button {margin-bottom: 20px;}
.order_button button{width: 100%; background: #FF7A00; height: 50px; border-radius: 10px; border: 0px;}

/* sticky 속성 */
div.sticky{
    position: -webkit-sticky;
    position: sticky;
    top: 130px;
}

/* 자간설정 */
.late_sp_2 {letter-spacing: -1px;}

/* pc environment */
@media screen and (min-width:1201px) {
    /* 포인트 */
    #point > * { margin: 0 5px; }
}

/* mobile environment */
/* 화면크기 최대 1200px까지 */
@media screen and (max-width:1200px) {
    .payment_info_txt {font-size: 0.8em;}
    .payment_info_price {font-weight: bold; font-size: 1.1em;}
    #point > * { margin: 0 3px; }
}
/* 화면크기 최대 768px까지 */
@media screen and (max-width:768px) {
    .product_price_area{font-size: 0.8em;}
    .product_price{font-weight: bold; font-size: 1.2em;}
    .product_quantity {width: 35px; padding-left: 10px;}
    .bottom_box_left span {color: #777777; font-size: 0.75em;}
    .bottom_box_right {font-size: 0.8em;}
    .product_price {font-size: 1.1em;}
    .All_price {font-size: 1.1em;}
}

/* 화면크기 최소641px 부터 1120px까지 */
@media screen and (min-width: 641px) and (max-width:1120px) {

}

/* 화면크기 최소 481px 부터 최대 660px까지 */
@media screen and (min-width: 481px) and (max-width: 660px) {

}
/* 화면크기 최소 300px 부터 최대 480px까지 */
@media screen and (min-width:300px) and (max-width:480px) {
    .product_img img{ width: 50px;}
}

</style>
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
            <img id="page_icon" src="../images/gift2.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <div class="container">
            <div class="row">
                <!-- 결제 폼 시작 -->
                <div class="shopping_cart_list col-md-9 mb-5">
                    <!-- 페이지 제목 -->
                    <div class="page_title_area">
                        <h2>주문자</h2>
                    </div>
                    <!-- 주문자 정보 -->
                    <div class="cart_list_area">
                        <div class="p-4" style="border-top: 1px solid black; border-bottom: 1px solid lightgray;">
                            <span class="me-5">아무개</span><span class="me-5">01012345678</span><span>dummy@gmail.com</span>
                        </div>
                    </div>
                    <!-- 페이지 제목 -->
                    <div class="page_title_area d-flex align-items-center mt-5">
                        <h2>배송지 정보</h2>
                        <div class="custom_checkbox mx-4">
                            <input type="checkbox" id="check-1" class="checkbox checkboxGroup" name="member_info_check">
                            <label for="check-1" class="renewal-cart-label">회원정보와 동일</label>
                        </div>
                    </div>
                    <!-- 배송지 정보 -->
                    <form action="">
                    <table class="table" id="order_input" style="border-top: 1px solid black;">
                        <tr>
                            <th style="width: 15%;">받는 분</th>
                            <td><input type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><input type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td><input type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <th>배송 메세지</th>
                            <td><input type="text" class="form-control"></td>
                        </tr>
                    </table>
                    </form>
                    <!-- 페이지 제목 -->
                    <div class="page_title_area d-flex align-items-center mt-5">
                        <h2>주문상품 <span style="color: #FF7A00;">2개</span></h2>
                    </div>
                    <!-- 장바구니리스트 시작 -->
                    <div class="cart_list">
                        <table width="100%">
                            <colgroup>
                                <col width="10%"><col width="60%"><col width="10%"><col width="14%">
                            </colgroup>
                            <!-- 1번리스트 시작 -->
                            <tr class="cart_product">
                                <td class="product_img">
                                    <img src="../images/밀키트1.jpg" alt="" >
                                </td>
                                <td class="product_title">
                                    <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                    <div>상품명 이것저것요것(2인)</div>
                                    <div><span class="product_title_price">10,900</span>원</div>
                                </td>
                                <td>
                                    <input class="product_quantity" type="number" readonly name="" id="" value="1">
                                </td>
                                <td>
                                    <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                </td>
                            </tr>
                            <!-- 1번리스트 끝 -->
                            <!-- 2번리스트 시작 -->
                            <tr class="cart_product">
                                <td class="product_img">
                                    <img src="../images/밀키트2.jpg" alt="" >
                                </td>
                                <td class="product_title">
                                    <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                    <div>상품명 이것저것요것(2인)</div>
                                    <div><span class="product_title_price">10,900</span>원</div>
                                </td>
                                <td>
                                    <input class="product_quantity" type="number" readonly name="" id="" value="1">
                                </td>
                                <td>
                                    <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                </td>
                            </tr>
                            <!-- 2번리스트 끝 -->
                        </table>
                    </div>
                    <!-- 장바구니 리스트 끝 -->
                    <!-- 페이지 제목 -->
                    <div class="page_title_area d-flex align-items-center mt-5">
                        <h2>포인트 사용</h2>
                    </div>
                    <!-- 포인트 사용 시작 -->
                    <div style="border-top: 1px solid black;">
                        <div class="d-flex mt-3 align-items-center" id="point">
                            <span>포인트 사용</span>
                            <span style="color: #FF7A00;">0P</span>
                            <input type="text" class="form-control" style="width: 40%;" placeholder="입력">
                            <button class="btn rounded-4" style="background-color: #FF7A00; color: white;">전액사용</button>
                        </div>
                    </div>
                    <!-- 포인트 사용 끝 -->
                    <!-- 페이지 제목 -->
                    <div class="page_title_area d-flex align-items-center mt-5">
                        <h2>결제 방법</h2>
                        <div class="custom_checkbox mx-4">
                            <input type="checkbox" id="check-1" class="checkbox checkboxGroup" name="member_info_check">
                            <label for="check-1" class="renewal-cart-label">이 결제 수단을 다음에도 사용</label>
                        </div>
                    </div>
                    <!-- 결제 방법 시작 -->
                    <div style="border-top: 1px solid black;">
                        <div class="row" id="payment-method">
                            <div class="col"><button class="btn py-3 rounded-4 payment-method">카카오페이</button></div>
                            <div class="col"><button class="btn py-3 rounded-4 payment-method">네이버페이</button></div>
                            <div class="col"><button class="btn py-3 rounded-4 payment-method">신용카드</button></div>
                        </div>
                    </div>
                    <!-- 결제 방법 끝 -->
                </div>
                <!-- 결제 폼 끝 -->
                <!-- 결제박스 시작 -->
                <div class="col-lg-3">
                    <div class="payment-info-box-order sticky">
                        <h4>결제 예정 금액</h4>
                        <div class="payment-info-box">
                            <table>
                                <tr>
                                    <td class="payment_info_txt" style="width: 50%;">상품금액</td>
                                    <td class="text-end"><span class="payment_info_price">36,700</span>원</td>
                                </tr>
                                <tr>
                                    <td class="payment_info_txt">할인금액</td>
                                    <td class="text-end"><span class="payment_info_price">0</span>원</td>
                                </tr>
                                <tr>
                                    <td class="payment_info_txt">배송비</td>
                                    <td class="text-end"><span class="payment_info_price">3,000</span>원</td>
                                </tr>
                                <tr class="payment_info_total_line">
                                    <td class="payment_info_txt lete_sp_1">총 결제예정금액</td>
                                    <td class="text-end"><span class="payment_info_total_price">39,700</span>원</td>
                                </tr>
                                <tr class="payment_info_total_line">
                                    <td class="payment_info_txt">처리위탁 및 3자 제공 동의</td>
                                    <td class="text-end"><a href="#" style="font-size: 0.75em;">내용보기 →</a></td>
                                </tr>
                                <tr>
                                    <td class="payment_info_txt">결제 대행 서비스 이용 동의</td>
                                    <td class="text-end"><a href="#" style="font-size: 0.75em;">내용보기 →</a></td>
                                </tr>
                            </table>
                            <table>
                                <tr class="payment_info_total_line">
                                    <td class="payment_info_txt lete_sp_1" style="width: 10%;">
                                        <input type="checkbox" class="form-check-input">
                                    </td>
                                    <td>구매조건 및 이용약관에 동의하며, 결제를 진행합니다.</td>
                                </tr>
                            </table>
                            <div class="order_button">
                                <button type="" class="" style="color: white;">주문하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 결제박스 끝  -->
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