<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<style>
    /* 장바구니 내역입니다. */
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
    
    #remove_btn{ cursor: pointer;}

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

    /* sticky 속성 C10Float3번교안참고*/
    div.sticky{
        position: -webkit-sticky;
        position: sticky;
        top: 130px;
    }
    
    /* 자간설정 */
    .late_sp_2 {letter-spacing: -1px;}

    /* pc environment */
@media screen and (min-width:1201px) {
    
}

/* mobile environment */
/* 화면크기 최대 1200px까지 */
@media screen and (max-width:1200px) {
    .payment_info_txt {font-size: 0.8em;}
    .payment_info_price {font-weight: bold; font-size: 1.1em;}
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
                <!-- 장바구니 내역 시작 -->
                <div class="shopping_cart_list col-lg-9 ">
                    <!-- 페이지 제목 -->
                    <div class="page_title_area">
                        <h2>장바구니</h2>
                    </div>
                    <div class="cart_list_area">
                        <!-- 체크박스, 체크삭제 -->
                        <div class="cart-option d-flex justify-content-between">
                            <!-- 전체해제,전체선택 -->
                            <div class="custom_checkbox">
                                <input type="checkbox" id="check-1" class="checkbox checkboxGroup" name="checkAll">
                                <label for="check-1" class="renewal-cart-label">전체해제</label>
                            </div>
                            <!-- 전체삭제, 선택삭제 -->
                            <div class="cart_delete">
                                <button type="button" class="btn_cart_delete delete _All">
                                    <span>전체삭제</span>
                                </button>
                                <button type="button" class="btn_cart_delete delete_select">
                                    <span>선택삭제</span>
                                </button>
                            </div>
                        </div>
                        <!-- 장바구니리스트 시작 -->
                        <div class="cart_list">
                            <table width="100%">
                                <colgroup>
                                    <col width="3%"><col width="10%"><col width="58%"><col width="4%"><col width="17%"><col width="3%"> 
                                </colgroup>
                                <tbody>
                                    <!-- 1번리스트 시작 -->
                                    <tr class="cart_product">
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td class="product_img">
                                            <img src="../images/밀키트1.jpg" alt="" >
                                        </td>
                                        <td class="product_title">
                                            <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                            <div>상품명 이것저것요것(2인)</div>
                                            <div><span class="product_title_price">10,900</span>원</div>
                                        </td>
                                        <td>
                                            <input class="product_quantity" type="number" name="" id="" value="1">
                                        </td>
                                        <td>
                                            <p class="product_price_area"><span class="product_price">140,900</span>원</p>
                                        </td>
                                        <td>
                                            <img id="remove_btn" src="../images/cross-wish-ico.png" alt="">
                                        </td>
                                    </tr>
                                    <!-- 1번리스트 끝 -->
                                    <!-- 2번리스트 시작 -->
                                    <tr class="cart_product">
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td class="product_img">
                                            <img src="../images/밀키트2.jpg" alt="" >
                                        </td>
                                        <td class="product_title">
                                            <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                            <div>상품명 이것저것요것(2인)</div>
                                            <div><span class="product_title_price">10,900</span>원</div>
                                        </td>
                                        <td>
                                            <input class="product_quantity" type="number" name="" id="" value="1">
                                        </td>
                                        <td>
                                            <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                        </td>
                                        <td>
                                            <img id="remove_btn" src="../images/cross-wish-ico.png" alt="">
                                        </td>
                                    </tr>
                                    <!-- 2번리스트 끝 -->
                                    <!-- 3번리스트 시작 -->
                                    <tr class="cart_product">
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td class="product_img">
                                            <img src="../images/밀키트3.jpg" alt="" >
                                        </td>
                                        <td class="product_title">
                                            <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                            <div>상품명 이것저것요것(2인)</div>
                                            <div><span class="product_title_price">10,900</span>원</div>
                                        </td>
                                        <td>
                                            <input class="product_quantity" type="number" name="" id="" value="1">
                                        </td>
                                        <td>
                                            <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                        </td>
                                        <td>
                                            <img id="remove_btn" src="../images/cross-wish-ico.png" alt="">
                                        </td>
                                    </tr>
                                    <!-- 3번리스트 끝 -->
                                    <!-- 4번리스트 시작 -->
                                    <tr class="cart_product">
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td class="product_img">
                                            <img src="../images/밀키트4.jpg" alt="" >
                                        </td>
                                        <td class="product_title">
                                            <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                            <div>상품명 이것저것요것(2인)</div>
                                            <div><span class="product_title_price">10,900</span>원</div>
                                        </td>
                                        <td>
                                            <input class="product_quantity" type="number" name="" id="" value="1">
                                        </td>
                                        <td>
                                            <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                        </td>
                                        <td>
                                            <img id="remove_btn" src="../images/cross-wish-ico.png" alt="">
                                        </td>
                                    </tr>
                                    <!-- 4번리스트 끝 -->
                                    <!-- 5번리스트 시작 -->
                                    <tr class="cart_product">
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td class="product_img">
                                            <img src="../images/밀키트1.jpg" alt="" >
                                        </td>
                                        <td class="product_title">
                                            <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                            <div>상품명 이것저것요것(2인)</div>
                                            <div><span class="product_title_price">10,900</span>원</div>
                                        </td>
                                        <td>
                                            <input class="product_quantity" type="number" name="" id="" value="1">
                                        </td>
                                        <td>
                                            <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                        </td>
                                        <td>
                                            <img id="remove_btn" src="../images/cross-wish-ico.png" alt="">
                                        </td>
                                    </tr>
                                    <!-- 5번리스트 끝 -->
                                    <!-- 6번리스트 시작 -->
                                    <tr class="cart_product">
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td class="product_img">
                                            <img src="../images/밀키트2.jpg" alt="" >
                                        </td>
                                        <td class="product_title">
                                            <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                            <div>상품명 이것저것요것(2인)</div>
                                            <div><span class="product_title_price">10,900</span>원</div>
                                        </td>
                                        <td>
                                            <input class="product_quantity" type="number" name="" id="" value="1">
                                        </td>
                                        <td>
                                            <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                        </td>
                                        <td>
                                            <img id="remove_btn" src="../images/cross-wish-ico.png" alt="">
                                        </td>
                                    </tr>
                                    <!-- 6번리스트 끝 -->
                                    <!-- 7번리스트 시작 -->
                                    <tr class="cart_product">
                                        <td><input type="checkbox" name="" id=""></td>
                                        <td class="product_img">
                                            <img src="../images/밀키트3.jpg" alt="" >
                                        </td>
                                        <td class="product_title">
                                            <div><span class="shop_title">가게이름뭐시기저시기</span></div>
                                            <div>상품명 이것저것요것(2인)</div>
                                            <div><span class="product_title_price">10,900</span>원</div>
                                        </td>
                                        <td>
                                            <input class="product_quantity" type="number" name="" id="" value="1">
                                        </td>
                                        <td>
                                            <p class="product_price_area"><span class="product_price">10,900</span>원</p>
                                        </td>
                                        <td>
                                            <img id="remove_btn" src="../images/cross-wish-ico.png" alt="">
                                        </td>
                                    </tr>
                                    <!-- 7번리스트 끝 -->
                                    
                                </tbody>
                            </table>
                        </div>
                        <!-- 전체금액, 배송비안내박스 -->
                        <div class="bottom_price_box d-flex justify-content-between">
                            <!-- 왼쪽 -->
                            <div class="bottom_box_left">
                                <p>배송비 <strong>3,000</strong>원</p>
                                <span>40,000원 이상 무료배송</span>
                            </div>
                            <!-- 오른쪽 -->
                            <div class="bottom_box_right">
                                <p class="" style="line-height: 40px;" >
                                    <span>상품가격 </span><span class="product_price"> 00,000</span>원
                                    <span class="plus">
                                        <img src="../images/plus-icon.png" alt="">
                                    </span>
                                    <span>배송비</span>
                                    <span class="delivery_price"> 3,000</span>원
                                    <span class="equal">
                                        <img src="../images/equal-icon.png" alt="">
                                    </span>
                                    <span class="All_price">18,900</span>원
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 장바구니 내역 끝 -->
                <!-- 결제박스 시작 -->
                <div class="col-lg-3">
                    <div class="payment-info-box-order sticky">
                        <h4>결제 예정 금액</h4>
                        <div class="payment-info-box">
                            <table>
                                <tr>
                                    <td class="payment_info_txt">상품금액</td>
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
                            </table>
                            <div class="order_button">
                                <button type="" class="">주문하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 결제박스 끝  -->
             </div>
        </div>
    </main>
    <!-- main 끝 -->
    
    <!-- footer 시작 -->
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!-- wrapper 끝 -->
</body>
</html>