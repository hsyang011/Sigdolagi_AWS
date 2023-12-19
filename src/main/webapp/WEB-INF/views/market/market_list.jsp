<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %> <!-- 숫자의 3자릿수마다 콤마를 찍어주기 위한 jstl 추가 -->
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/market_list.css" />
<script>
/* 장바구니에 상품 추가 */
function addToCart(idx, name) {
	var prod_idx = idx;
	var prod_count = 1;
	var prod_name = name;
	var data = {
		prod_idx: prod_idx,
		prod_count: prod_count,
		prod_name: prod_name
    };
	
	$.ajax({
        type: "POST",
        url: "./addToCart.do",
        data: data,
        success: function(response) {
            if (confirm('장바구니에 추가되었습니다.\n장바구니 페이지로 이동하시겠습니까?')) {
            	location.href = "./cart.do";
            }
        },
        error: function(error) {
            alert('장바구니 추가 실패');
        }
    });
}

$(function() {
	if (<%= request.getParameter("category")!=null && request.getParameter("category").equals("특산품") %>) {
        $("#mealkit").removeClass('on');
        // 클릭한 li에 'on' 클래스 추가
        $("#specialty").addClass('on');
	}
});
</script>
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
                          <a class="nav-link" href="../main/main.do">홈</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="./market_list.do">마켓</a>
                        </li>
                    </ul>
                </div>
                <!-- 네비로케이션 끝 -->
                <!-- 헤더제목 -->
                <ul class="catemenu d-flex">
                    <li class="on" id="mealkit"><a href="./market_list.do?category=밀키트">밀키트</a></li>
                    <li id="specialty"><a href="./market_list.do?category=특산품">특산품</a></li>
                </ul>
                <!-- <ul class="nav my-3 category mt-4">
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill on">#전체</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#한식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#일식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#중식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#양식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#기타</button></li>
                </ul> -->
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
                    <span class="">전체 <strong style="color: #FF7A00;">${list.size()}</strong>개의 상품이 있습니다.</span>
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
                <figure class="row thumbnail">
                <!-- 리스트만큼 반복 -->
		       	<c:forEach items="${list}" var="row" varStatus="loop">
		           <div class="card custom-col" style="cursor: pointer;">
		               <div>
		                   <div class="card_product_img">
	                           <img class="shop_product_img card-img-top" onclick="location.href='./market_view.do?prod_idx=${row.prod_idx}';" src="../images/products/${row.img1}">
		                       <div class="cart_icon_box">
		                           <img src="../images/shopping-bag3.png" onclick="addToCart(${row.prod_idx}, '${row.prod_name}');" alt="">
		                       </div>
		                   </div>
		                   <div class="card-body justify-content-between">
		                       <span class="shop_title">${row.seller}</span>
		                       <h5 class="card-title"><a class="mill_title" href="./market_view.do?prod_idx=${row.prod_idx}">${row.prod_name}</a></h5>
		                       <c:choose>
			                       <c:when test="${row.prod_sale eq 0}">
				                       <p class="card-text"><strong><fmt:formatNumber value="${row.prod_price}" pattern="#,###" /></strong></p>
			                       </c:when>
			                       <c:otherwise>
            						   <c:set var="sale" value="${(row.prod_sale/row.prod_price)*100}"/>
				                       <p class="card-text"><span class="discount">${Math.round(sale)}%</span> <strong><fmt:formatNumber value="${row.prod_price-row.prod_sale}" pattern="#,###" /></strong> <strike><fmt:formatNumber value="${row.prod_price}" pattern="#,###" /></strike></p>
			                       </c:otherwise>
		                       </c:choose>
		                   </div>
		               </div>
		           </div>
		       	</c:forEach>
                </figure>
                <!-- 밀키트 상품리스트 끝 -->

            </div>
            <!-- 페이지네이션 -->
            <!-- <ul class="pagination justify-content-center" style="margin: 80px 0;">
                <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul> -->
            <div class="text-center">${pagingImg}</div>
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