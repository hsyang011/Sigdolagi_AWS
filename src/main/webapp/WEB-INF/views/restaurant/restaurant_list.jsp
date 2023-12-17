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
.card a > img, .card button > img { border-radius: 15px 15px 0 0; }
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
.card p { margin: 0; }
#restaurant_view * { font-family: "NPSfontRegular"; }

/* ######################################################### */
/* 12/01 수정사항 - 한서 */
@media screen and (min-width: 1201px) {
    .custom-col { flex: 0 0 25%; }
}
/* 모바일 환경에서 카테고리를 횡스크롤로 구현 */
@media screen and (max-width: 1200px) {
    .category, .thumbnail { overflow: auto; white-space: nowrap; flex-wrap: nowrap; } /* 횡스크롤 구현 */
    .category::-webkit-scrollbar, .thumbnail::-webkit-scrollbar { display: none; } /* 크롬, 사파리, 오페라, 엣지에서 스크롤바 안보이게 처리 */
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
    .moreBtn { font-size: 0.75em; }
}

/* 25% */


.card.custom-col {
    flex: 0 0 25%;
    margin-right: 10px;
}


</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function() {
    $("#setAddr").click((e) => { 
        new daum.Postcode({
            oncomplete: function(data) {
                $("#addr").text(data.address);
                $(e.target).text("재설정");
            }
        }).open();
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
                <h4>사용자들이 뽑은 맛집을 둘러보세요!</h4>
                <div id="info_title" class="d-flex">
                    <h2>맛집탐방</h2>
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
                          <a class="nav-link" href="#">맛집탐방</a>
                        </li>
                    </ul>
                </div>
                <!-- 네비로케이션 끝 -->
                <ul class="nav my-3 category mt-4">
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill on">#전체</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#한식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#일식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#중식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#양식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#고깃집</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#호프</button></li>
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
                    <div>
                        <span id="addr">내 근처 맛집을 추천받고 싶다면 주소를 설정해주세요.</span>
                        <button class="btn rounded-pill" id="setAddr" style="background-color: #FF7A00; color: white; font-size: 0.75em;">주소설정</button>
                    </div>
                    <!-- ################################################################################ -->
                    <!-- 모바일에서 정렬이 안맞아서 input의 길이를 줄였고, rounded-pill속성을 부여하여 둥글게 처리 -->
                    <select name="" id="" class="rounded-pill" style="width: 120px; height: 30px;">
                        <option value="" selected style="text-align: center;">인기순</option>
                        <option value="" style="text-align: center;">가까운순</option>
                    </select>
                </div>
                <hr style="border: 1px solid #000; margin-bottom: 30px;">
                <!-- 전체 게시물 갯수 셀렉트 끝 -->

                <!-- #################################################################################### -->
                <!-- .card 하위에 div태그를 각각 추가한 부분이 있으니 유의 바랍니다. -->
                <!-- 한식 -->
                <div class="d-flex justify-content-between">
                    <h2>#한식</h2>
                    <button class="btn rounded-pill moreBtn" style="background-color: #FF7A00; color: white;">자세히 보기 ></button>
                </div>
                <!-- 한식 리스트 시작 -->
                <!-- 1행 시작 -->
               	<div style="display: flex; overflow-x: auto;">
			    	<c:choose>
				        <c:when test="${empty restaurantList}">
				            <div align="center">등록된 게시물이 없습니다.</div>
				        </c:when> 
			        <c:otherwise>
		            <c:forEach items="${restaurantList}" var="entry">
		                <c:if test="${entry.category eq '한식'}">
		                    <div class="card custom-col">
		                        <div>
		                            <div class="card_product_img">
		                                <button style="border: none;" data-bs-toggle="modal" class="viewBtn" data-bs-target="#restaurant_view">
		                                    <img class="shop_product_img card-img-top" src="../images/Korea${randomNum}.jpeg" alt="Card image">
		                                </button>
		                                <div class="cart_icon_box">
		                                    <img class="p-1" src="../images/favor_icon.png" alt="">
		                                </div>
		                            </div>
		                            <div class="card-body text-center">
		                                <h5 class="card-title"><a class="mill_title" href="">${entry.name}</a></h5>
		                                <p><span style="color: #f19d07;">★</span>4.8</p>
		                            </div>
		                        </div>
		                    </div>
		                </c:if>
		            </c:forEach>
			        </c:otherwise>
			    </c:choose>
				</div>
                <!-- 1행 끝 -->
                <!-- 한식 리스트 끝 -->
                <!-- 일식 -->
                <div class="d-flex justify-content-between">
                    <h2>#일식</h2>
                    <button class="btn rounded-pill moreBtn" style="background-color: #FF7A00; color: white;">자세히 보기 ></button>
                </div>
                <!-- 일식 리스트 시작 -->
                <!-- 2행 시작 -->
                <div style="display: flex; overflow-x: auto;">
			    	<c:choose>
				        <c:when test="${empty restaurantList}">
				            <div align="center">등록된 게시물이 없습니다.</div>
				        </c:when> 
			        <c:otherwise>
		            <c:forEach items="${restaurantList}" var="entry">
		                <c:if test="${entry.category eq  '일식'}">
		                    <div class="card custom-col">
		                        <div>
		                            <div class="card_product_img">
		                                <button style="border: none;" data-bs-toggle="modal" class="viewBtn" data-bs-target="#restaurant_view">
		                                    <img class="shop_product_img card-img-top" src="../images/750_750_20210307074729929_photo_2c2906c7be9f.jpg" alt="Card image">
		                                </button>
		                                <div class="cart_icon_box">
		                                    <img class="p-1" src="../images/favor_icon.png" alt="">
		                                </div>
		                            </div>
		                            <div class="card-body text-center">
		                                <h5 class="card-title"><a class="mill_title" href="">${entry.name}</a></h5>
		                                <p><span style="color: #f19d07;">★</span>4.8</p>
		                            </div>
		                        </div>
		                    </div>
		                </c:if>
		            </c:forEach>
			        </c:otherwise>
			    </c:choose>
				</div>
                <!-- 2행 끝 -->
                <!-- 일식 리스트 끝 -->
                <!-- 중식 -->
                <div class="d-flex justify-content-between">
                    <h2>#중식</h2>
                    <button class="btn rounded-pill moreBtn" style="background-color: #FF7A00; color: white;">자세히 보기 ></button>
                </div>
                <!-- 중식 리스트 시작 -->
                <!-- 3행 시작 -->
                <div style="display: flex; overflow-x: auto;">
			    	<c:choose>
				        <c:when test="${empty restaurantList}">
				            <div align="center">등록된 게시물이 없습니다.</div>
				        </c:when> 
			        <c:otherwise>
		            <c:forEach items="${restaurantList}" var="entry">
		                <c:if test="${entry.category eq '중국식'}">
		                    <div class="card custom-col">
		                        <div>
		                            <div class="card_product_img">
		                                <button style="border: none;" data-bs-toggle="modal" class="viewBtn" data-bs-target="#restaurant_view">
		                                    <img class="shop_product_img card-img-top" src="../images/750_750_20210307074729929_photo_2c2906c7be9f.jpg" alt="Card image">
		                                </button>
		                                <div class="cart_icon_box">
		                                    <img class="p-1" src="../images/favor_icon.png" alt="">
		                                </div>
		                            </div>
		                            <div class="card-body text-center">
		                                <h5 class="card-title"><a class="mill_title" href="">${entry.name}</a></h5>
		                                <p><span style="color: #f19d07;">★</span>4.8</p>
		                            </div>
		                        </div>
		                    </div>
		                </c:if>
		            </c:forEach>
			        </c:otherwise>
			    </c:choose>
				</div>
                <!-- 3행 끝 -->
                <!-- 중식 리스트 끝 -->

            </div>

        <!-- 컨테이너 안쪽 컨텐츠 -->
        </div>



    </main>
    <!-- main 끝 -->
    
    <!-- footer 추가 -->
    <%@ include file="../include/footer.jsp" %>




    <!-- 맛집 상세보기를 위한 모달창 시작 -->
    <div class="modal" id="restaurant_view">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <div id="map" style="width:100%;height:350px;"></div>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <h3 style="font-weight: bold;">농협목우촌 목우촌족발</h3>
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <div class="my-3">
                                <span style="color: #f19d07;" class="me-1">★</span>
                                <span class="me-1">4.9</span>
                                <a href="#review">리뷰 175개 ></a>
                            </div>
                            <div>경기도 하남시 위례동 위례포례샤인 7201동</div>
                        </div>
                        <button class="btn rounded-pill" style="background-color: #FF7A00; color: white;">플래너에 추가 +</button>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <div id="review" class="my-5" style="width: 100%;">
                        <div class="d-flex justify-content-between">
                            <p>리뷰 <span style="color: #FF7A00;">3건</span></p>
                            <button class="btn btn-outline-dark px-5 rounded-pill">매장 리뷰쓰기</button>
                        </div>
                        <!-- 테이블 -->
                        <table class="table table-border">
                            <tr>
                                <td style="width: 85%;">
                                    <div>
                                        <p style="color: #FF7A00;">★★★★☆</p>
                                        <p>작성자 | 2023.12.04</p>
                                        <p>바삭바삭 식감으로 맛있게 먹었습니다.</p>
                                    </div>
                                </td>
                                <td id="table_title" style="width: 15%; text-align: right;">
                                    <img src="../images/01100110101010102_2186962.png" width="120" alt="">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 85%;">
                                    <div>
                                        <p style="color: #FF7A00;">★★★★☆</p>
                                        <p>작성자 | 2023.12.04</p>
                                        <p>바삭바삭 식감으로 맛있게 먹었습니다.</p>
                                    </div>
                                </td>
                                <td id="table_title" style="width: 15%; text-align: right;">
                                    <img src="../images/01100110101010102_2186962.png" width="120" alt="">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 85%;">
                                    <div>
                                        <p style="color: #FF7A00;">★★★★☆</p>
                                        <p>작성자 | 2023.12.04</p>
                                        <p>바삭바삭 식감으로 맛있게 먹었습니다.</p>
                                    </div>
                                </td>
                                <td id="table_title" style="width: 15%; text-align: right;">
                                    <img src="../images/01100110101010102_2186962.png" width="120" alt="">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <button type="button" class="btn rounded-pill" style="background-color: #FF7A00; color: white;" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 맛집 상세보기를 위한 모달창 끝 -->


</div>
<!-- wrapper 끝 -->
<!-- 마커를 표시하는 JavaScript 코드 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58c1517c26a147b5119aacb8ce4f7d5c"></script>
<script>
$(".viewBtn").click(() => {
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
    // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);    
});
</script>
</body>
</html>