<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.5/proj4.js"></script>


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
    .mobile_ver { display: none; }
}
/* 모바일 환경에서 카테고리를 횡스크롤로 구현 */
@media screen and (max-width: 1200px) {
    .category, .thumbnail { overflow: auto; white-space: nowrap; flex-wrap: nowrap; } /* 횡스크롤 구현 */
    .category::-webkit-scrollbar, .thumbnail::-webkit-scrollbar { display: none; } /* 크롬, 사파리, 오페라, 엣지에서 스크롤바 안보이게 처리 */
    .custom-col { flex: 0 0 25%; }
    .meal_seach_bar { width: 100%; } /* 모바일에선 검색창의 길이를 100%로 처리 */
    .card * { font-size: 0.98em; }
    .pc_ver { display: none; }
}
@media screen and (max-width: 768px) {
    .custom-col { flex: 0 0 50%; }
    .mealk_cate {font-size: 0.8em;}/* 밀키트 카테고리 사이즈 */
    .catemenu li a { font-size: 0.75em; } 
    .card * { font-size: 0.95em; }
    .thumbnail {margin: 0 0;}
    .moreBtn { font-size: 0.75em; }
    .pc_ver { display: none; }
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


//SaveReview
function SaveReview(){
	let frm = document.reviewFrm;
	console.log(frm.content.value);
    /* let data = {
    	idx : frm.idx.value,
    	nickname : frm.nickname.value,
    	content : frm.content.value,
    	email : frm.email.value,
    	starRating : frm.starRating.value,
    	ofile : frm.ofile.files[0]
    };  */
    let formData = new FormData();
    formData.append('idx', frm.idx.value);
    formData.append('nickname', frm.nickname.value);
    formData.append('content', frm.content.value);
    formData.append('email', frm.email.value);
    formData.append('starRating', frm.starRating.value);
    formData.append('ofile', frm.ofile.files[0]);
    //alert("댓글작성 "); // 여기에 alert 추가
    //console.log(data);
    
    $.ajax({
        type: "post",
        url: "./restaurant_comment.do",
        //data: data,
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
          
        success: function(res) {
            console.log("댓글작성 "+res.email);
            console.log("댓글 작성 후 서버 응답 데이터:");
            console.log(res);
            // 댓글 작성 성공 후 페이지 새로고침
            location.reload();
            displayComment(res);
           	
        },
        error: function() {
            console.log("요청실패");
        }
    }); 
}

///
</script>

<script>
    // 현재 날짜와 시간을 얻기 위한 함수
    function getCurrentDateTime() {
        var now = new Date();
		
        
        // 날짜 및 시간을 원하는 형식으로 포맷팅
        var formattedDateTime = now.getFullYear() + '-' +
            padNumber(now.getMonth() + 1) + '-' +
            padNumber(now.getDate()) + ' ' +
            padNumber(now.getHours()) + ':' +
            padNumber(now.getMinutes()) + ':' +
            padNumber(now.getSeconds());

        return formattedDateTime;
    }

    // 숫자를 두 자리로 패딩하는 함수
    function padNumber(number) {
        return (number < 10 ? '0' : '') + number;
    }

    // 댓글을 화면에 추가하는 함수
    function displayComment(res) {
        // 받은 댓글 데이터를 이용하여 화면에 추가하는 로직을 작성
        console.log(res.email);
        console.log(res.idx);
        console.log(res.content);
        var commentHTML =
            "<tr align=\"center\">" +
            "<td>" + res.nickname + "</td>" +
            "<td>" + res.idx + "</td>" +
            "<td name=\"comments_idx\">" + res.comments_idx + "</td>" +
            "<td>" + res.content + "</td>" +
            "<td>" + getCurrentDateTime() + "</td>" +
            "<td>" + res.comments_idx + "</td>" +
            "<td>" + res.starRating + "</td>" +
            "<td><button onclick='deleteComment(" + res.comments_idx + ")'>삭제</button></td>" +
            "</tr>";
        // 화면에 댓글 추가
        $("#commentsTableBody").append(commentHTML);
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
                  <!--  <ul class="nav my-3 category mt-4">
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill on">#전체</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#한식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#일식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#중식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#양식</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#고깃집</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#호프</button></li>
                    <li class="nav-item me-3"><button type="button" class="mealk_cate btn rounded-pill">#기타</button></li>
                </ul> -->
            </div>
            <!-- 컨텐츠 헤더 끝 -->
            <div class="shop_board container  mt-5">
    <!-- 컨테이너 안쪽 컨텐츠 -->
        </div>
      <div class="container">
          <div id="restaurant_view">
              <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                      <!-- Modal Header -->
                      <div class="content-header">
                          <div id="map" class="pc_ver" style="width:100%;height:350px;"></div>
                          <img src="../images/${param.cnt}.jpg" class="mobile_ver mb-2" style="width:100%;" />
                      </div>
                      <!-- Modal body -->
                      <div class="content-body">
                      <input type="hidden" name="idx" value="${RestaurantDTO.restaurant_idx }">   
                        <input type="hidden" name="lot_address" value="${RestaurantDTO.road_address }">   
                          <h3 style="font-weight: bold;">${ restaurantDTO.name }</h3>
                          <div class="d-flex align-items-center justify-content-between">
                              <div>
                                  <div class="my-3">
                                      <span style="color: #f19d07;" class="me-1">★</span>
                                      <span class="me-1">평균별점 ${RateAveRound}  </span>
                                      <a href="#review">${CommentsLists.size()}개의 리뷰 &gt;</a>
                                  </div>
                                  <div>${restaurantDTO.lot_address }</div>
                              </div>
                              <button class="btn rounded-pill" style="background-color: #FF7A00; color: white;">플래너에 추가 +</button>
                          </div>
                      </div>
                      <!-- Modal footer -->
                      <div class="content-footer">
                          <div id="review" class="my-5"  style="width: 100%;">
                              <p>리뷰 <span style="color: #FF7A00;">${CommentsLists.size()}건</span></p>
                              <div class="d-flex justify-content-between">
                                 <div class="cm_input" style="width:100%">
		                        	  	<form name="reviewFrm" method="post" enctype="multipart/form-data"  onsubmit="return validateForm(this);"
			                        	     action="/restaurant/restaurant_review.do" class="reviewFrm" >
				                            <input type="hidden" name="idx" value="${restaurantDTO.restaurant_idx }">
				                            <%-- <input type="hidden" name="nickname" value="${boardDTO.nickname}"> --%>
				                           	<p ><textarea id="content" name="content" onkeyup="" rows="4" placeholder="리뷰를 입력해주세요."  style="width: 100%;"></textarea>
	                                      	<!-- 파일첨부
	                                            <input type="file" id="ofile" name="ofile" onchange="readURL(this)">
	                                         -->
				                           	<input type="hidden" name="nickname" value="${nickname}">
	                                        <input type="hidden" name="email" value="${email}">
	                                       <!--  ★별점 <input style="width: 30px;" id="starRating" name="starRating" value="5"> -->
	                                        ★별점 <select id="starRating" name="starRating">
											    <option value="1">1</option>
											    <option value="2">2</option>
											    <option value="3">3</option>
											    <option value="4">4</option>
											    <option value="5">5</option>
											</select>
	                                        <input type="file" id="ofile" name="ofile">
				                       	    <button type="button" class="btn btn-outline-dark px-5 rounded-pill" onclick="SaveReview();">매장 리뷰쓰기</button></p>
		                     			</form>
		                     		</div>
      
                              </div>
                              <!-- 테이블 -->
                              <!-- 테이블 -->
		                        <c:forEach items="${CommentsLists}" var="row" varStatus="loop">
		                        <div id="commentsTableBody">
		                        <table class="table table-border">
		                            <tr>
		                                <td style="width: 85%;">
		                                    <div>
		                                        <p style="color: #FF7A00;">★${row.starRating}</p>
		                                        <p>${row.nickname} | ${row.postdate}</p>
		                                        <p>${row.content}</p>
		                                    </div>
		                                </td>
		                                <td id="table_title" style="width: 15%; text-align: right;">
		                                    <img src="../uploads/${row.sfile}" width="120" alt="">
		                                </td>
		                            </tr>
		                        </table>
		                        </div>
		                        </c:forEach>
                              <table class="table table-border">
                              </table>
                          </div>
                          <button type="button" class="btn rounded-pill" style="background-color: #FF7A00; color: white;" onclick="location.href='./restaurant_list.do';" data-bs-dismiss="modal">돌아가기</button>
                      </div>
                  </div>
              </div>
          </div>
          </div>

  

            </div>

    

    </main>
    <!-- main 끝 -->
   
    <!-- 맛집 상세보기를 위한 모달창 끝 -->
    <!-- footer 추가 -->
    <%@ include file="../include/footer.jsp" %>


   


</div>
<!-- wrapper 끝 -->
<!-- 마커를 표시하는 JavaScript 코드 -->

<!-- services 라이브러리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.5/proj4.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58c1517c26a147b5119aacb8ce4f7d5c&libraries=services"></script>
<script>

// 변환하려는 좌표 체계의 정의를 입력합니다.
var projBessel = '+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs';
var projWGS84 = '+proj=longlat +datum=WGS84 +no_defs';

// restaurantDTO에서 x_point와 y_point 값을 가져옵니다.
var x = ${restaurantDTO.x_point};
var y = ${restaurantDTO.y_point};

// 좌표 체계를 변환합니다. Bessel 좌표를 WGS84로 변환합니다.
var coords = proj4(projBessel, projWGS84, [x, y]);

// Kakao Maps API를 사용하여 지도를 생성합니다.
var mapContainer = document.getElementById('map'); // 지도를 표시할 div 요소의 id를 지정합니다.
var mapOption = {
  center: new kakao.maps.LatLng(coords[1], coords[0]), // 변환된 좌표를 중심으로 지도를 생성합니다.
  level: 3 // 지도의 확대 레벨을 설정합니다.
};

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${restaurantDTO.road_address}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${restaurantDTO.name}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>
</body>
</html>