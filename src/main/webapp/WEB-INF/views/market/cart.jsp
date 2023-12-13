<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> <!-- split을 사용하기 위한 jstl 추가 -->
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> <!-- 숫자의 3자릿수마다 콤마를 찍어주기 위한 jstl 추가 -->
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
<script>
function marketOrder() {
	var paymentAmount = $("#paymentAmount").text().trim().replace(",", "");
	var allPrice = $("#allPrice").text().trim().replace(",", "");
	var deliveryPrice = $("#deliveryPrice").text().trim().replace(",", "");
	document.paymentFrm.payment.value = paymentAmount;
	document.paymentFrm.allPrice.value = allPrice;
	document.paymentFrm.delivery.value = deliveryPrice;
	document.paymentFrm.submit();
}
$(function() {
	// 문서 로드가 완료되면 배송비 여부를 검증하여 반영
    updateCartInfo();
	/* 전체 체크를 눌렀을 때 전체 체크 및 전체 체크 해제 */
	$("#check-1").change(() => {
		if($("#check-1").is(":checked")) {
			/* 전체 체크 */
            let checkArr = document.getElementsByClassName("prod_check");
            for (let i=0; i<checkArr.length; i++) {
            	checkArr[i].checked = true;
            }
        } else {
            /* 전체 체크해제 */
            let checkArr = document.getElementsByClassName("prod_check");
            for (let i=0; i<checkArr.length; i++) {
            	checkArr[i].checked = false;
            }
        }
	});
	
	/* 체크를 모두 눌렀을 때 전체 체크 버튼에 활성화 */
	$(".prod_check").change(() => {
        let checkArr = document.getElementsByClassName("prod_check");
        for (let i=0; i<checkArr.length; i++) {
        	if (checkArr[i].checked == false) {
                document.getElementById("check-1").checked = false;
	        	return;
        	}
        }
        document.getElementById("check-1").checked = true;
	});
	
	/* 상품 수량 변경을 할 때마다 ajax로 요청하여 DB에 실시간 반영 */
	$(".product_quantity").change((e) => {
		var data = {
			prod_idx: $(e.target).next().val(),
			prod_count: $(e.target).val()
	    };
		console.log($(e.target).val());
		
		$.ajax({
	        type: "POST",
	        url: "./updateToCart.do",
	        data: data,
	        success: function(res) {
	            console.log("수량변경 성공" + res.prod_totprice);
	            /* 상품 총 가격에 반영한다. */
	        	$(e.target).parent().parent().find(".product_price").html(res.prod_totprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	            /* 상품 총 가격에 반영한다. */
	            updateCartInfo();
	        },
	        error: function(err) {
        		console.log("수량변경 실패");
	        }
		});
	});
	
	/* x를 누르면 해당 상품을 제거 */
	$(".deleteProd").click((e) => {
		var data = { prod_idx: $(e.target).next().val() };
		$.ajax({
	        type: "POST",
	        url: "./deleteToCart.do",
	        data: data,
	        success: function(res) {
	    		// 엘리먼트 제거
	    		$(e.target).parent().parent().remove();
	            /* 상품 총 가격에 반영한다. */
	            updateCartInfo();
	        },
	        error: function(err) {
        		console.log("상품삭제 실패");
	        }
		});
	});
});

function updateCartInfo() {
    // 모든 가격 정보를 불러온다.
    let priceArr = document.getElementsByClassName("product_price");
    let sum = 0;
    for (let i=0; i<priceArr.length; i++) {
    	let price = parseInt(priceArr[i].innerHTML.replace(",", ""));
    	sum += price;
    }
    console.log("총 가격 : " + sum);
    $(".allPrice").html(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    // 40000원 이상이면 무료배송
    if (sum < 40000) { 
	    $(".payment").html((sum+3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	    $(".delivery_price").html("3,000");
    } else {
	    $(".payment").html((sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	    $(".delivery_price").html("0");
    }
}
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
            <img id="page_icon" src="../images/gift2.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <div class="container">
        	<form action="./order.do" method="post" name="paymentFrm">
        		<input type="hidden" name="allPrice" />
        		<input type="hidden" name="payment" />
        		<input type="hidden" name="delivery" />
        	</form>
            <div class="row">
                <!-- 장바구니 내역 시작 -->
                <div class="shopping_cart_list col-lg-9 ">
                    <!-- 페이지 제목 -->
                    <div class="page_title_area">
                        <h2>장바구니</h2>
                    </div>
                    <div class="cart_list_area">
                        <!-- 장바구니리스트 시작 -->
                        <div class="cart_list">
                            <table width="100%">
                                <colgroup>
                                    <col width="10%"><col width="60%"><col width="10%"><col width="17%"><col width="3%"> 
                                </colgroup>
                                <tbody>
                                	<!-- 장바구니에 담긴 품목을 중첩 반복 -->
		       						<c:forEach items="${map}" var="row" varStatus="loop">
		       							<c:forEach items="${row.value}" var="col">
		                                    <tr class="cart_product">
		                                        <td class="product_img">
		                                            <img src="../images/products/${col.prod_thumbnail}.jpg" alt="" >
		                                        </td>
		                                        <td class="product_title">
		                                            <div><span class="shop_title">${col.seller}</span></div>
		                                            <div>${col.prod_name}</div>
		                                            <div>
		                                            	<span class="product_title_price">
		                                            		<!-- 콤마를 찍어주기위한 formatNumber를 사용, #,### 규칙으로 콤마를 찍어준다. -->
		                                            		<fmt:formatNumber value="${col.prod_price-col.prod_sale}" pattern="#,###" />
		                                            	</span>원
		                                            </div>
		                                        </td>
		                                        <td>
		                                        	<!-- ":"로 split해서 1번 인덱스(상품 수량)의 값을 가져온다. (짱대가리 굴림) -->
													<c:set var="cnt" value="${fn:split(row.key, ':')}" />
		                                            <input style="width: 100%" class="product_quantity" type="number" name="" id="" value="${cnt[1]}">
		                                            <input type="hidden" value="${col.prod_idx}" />
		                                        </td>
		                                        <td>
		                                        	<!-- 상품수량 * 상품가격 -->
													<span id="price"><c:set var="price" value="${cnt[1] * (col.prod_price-col.prod_sale)}" /></span>
													<c:set var="allPrice" value="${allPrice+price}" />
		                                            <p class="product_price_area text-end">
		                                            	<span class="product_price">
	                                            			<fmt:formatNumber value="${price}" pattern="#,###" />
		                                            	</span>원
	                                            	</p>
		                                        </td>
		                                        <td>
		                                            <img src="../images/cross-wish-ico.png" alt="" class="deleteProd" style="cursor: pointer;">
		                                            <input type="hidden" value="${col.prod_idx}" />
		                                        </td>
		                                    </tr>
		       							</c:forEach>
                                	</c:forEach>
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
                                    <span>상품가격 </span><span style="font-weight: bold; font-size: 1.2em;" class="allPrice">
                                   		<fmt:formatNumber value="${allPrice}" pattern="#,###" />
                                    </span>원
                                    <span class="plus">
                                        <img src="../images/plus-icon.png" alt="">
                                    </span>
                                    <span>배송비</span>
                                    <span class="delivery_price"> 3,000</span>원
                                    <span class="equal">
                                        <img src="../images/equal-icon.png" alt="">
                                    </span>
                                    <span class="All_price payment">
                                   		<fmt:formatNumber value="${allPrice+3000}" pattern="#,###" />
									</span>원
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
                                    <td class="text-end">
                                    	<span class="payment_info_price allPrice" id="allPrice">
                                   			<fmt:formatNumber value="${allPrice}" pattern="#,###" />
										</span>원
									</td>
                                </tr>
                                <tr>
                                    <td class="payment_info_txt">할인금액</td>
                                    <td class="text-end"><span class="payment_info_price">0</span>원</td>
                                </tr>
                                <tr>
                                    <td class="payment_info_txt">배송비</td>
                                    <td class="text-end"><span class="payment_info_price delivery_price" id="deliveryPrice">3,000</span>원</td>
                                </tr>
                                <tr class="payment_info_total_line">
                                    <td class="payment_info_txt lete_sp_1">총 결제예정금액</td>
                                    <td class="text-end">
                                    	<span class="payment_info_total_price payment" id="paymentAmount">
                                   			<fmt:formatNumber value="${allPrice+3000}" pattern="#,###" />
                                    	</span>원
                                    </td>
                                </tr>
                            </table>
                            <div class="order_button">
                                <button type="button" class="" onclick="marketOrder();">주문하기</button>
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