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
</style>
<script>
function CommentSend(){
	let frm = document.commentwriteFrm;
	console.log(frm.content.value);
    let data = {
    		
    	idx : frm.idx.value,
    	nickname : frm.nickname.value,
    	content : frm.content.value,
    	email : frm.email.value,
    	starRating : frm.starRating.value
    	
    };
    //alert("댓글작성 "); // 여기에 alert 추가
    console.log(data);
    
   // /restaurant/restaurant_comment.do
    $.ajax({
        type: "post",
        url: "./restaurant_comment.do",
        data: data,
        success: function(res) {
            console.log("댓글작성 "+res.email);
            console.log("댓글 작성 후 서버 응답 데이터:");
            console.log(res);
            // 댓글 작성 성공 후 페이지 새로고침
            //location.reload();
            displayComment(res);
           	
        },
        error: function() {
            console.log("요청실패");
        }
    }); 
}
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

function SaveReview(){
	let frm = document.reviewFrm;
	console.log(frm.content.value);
    let data = {
    		
   		idx : frm.idx.value,
    	nickname : frm.nickname.value,
    	content : frm.content.value,
    	email : frm.email.value
    };
    //alert("댓글작성 "); // 여기에 alert 추가
    console.log(data);
    
    
    $.ajax({
        type: "post",
        url: "./restaurant/restaurant_review.do",
        data: data,
        success: function(res) {
            console.log("댓글작성 "+res.email);
            displayComment(res);
        },
        error: function() {
            console.log("요청실패");
        }
    }); 
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
               		<c:set value="1" var="cnt"></c:set>
			    	<c:choose>
				        <c:when test="${empty restaurantList}">
				            <div align="center">등록된 게시물이 없습니다.</div>
				        </c:when> 
			        <c:otherwise>
		            <c:forEach items="${restaurantList}" var="entry" varStatus="loop">
		                <c:if test="${entry.category eq '한식'}">
		                
		                	<c:if test="${cnt eq 6 }" var="result">
                            	<c:set value="0" var="cnt"></c:set>
                            </c:if>
                            <c:if test="${not result }">
                            	<c:set value="${cnt + 1}" var="cnt"></c:set>
                            </c:if>
		                    <div class="card custom-col">
		                        <div>
		                            <div class="card_product_img">
		                                <button style="border: none;" data-bs-toggle="modal" class="viewBtn" data-bs-target="#restaurant_view">
		                                   	<img class="shop_product_img card-img-top" src="../images/korea${randomNumbers[cnt]}.jpg" alt="Card image" style="min-height: 290px; max-height: 290px;" >
		                                </button>
		                                
		                                <div class="cart_icon_box">
		                                    <img class="p-1" src="../images/favor_icon.png" alt="">
		                                </div>
		                            </div>
		                            <div class="card-body text-center">
		                                <h5 class="card-title"><a class="mill_title" href="./restaurant_view.do?restaurant_idx=${ entry.restaurant_idx }">${entry.name}</a></h5>
		                                <p><span style="color: #f19d07;">★</span>4.8</p>
		                               <%--  <h5 class="card-title"><a class="mill_title" href="">${entry.name}</a></h5>
		                                <p><span style="color: #f19d07;">★4.8점</span>${cnt}번째사진</p> 
		                                 <p><span style="color: #f19d07;">index</span>${entry.restaurant_idx}</p>--%>
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
               		<c:set value="1" var="cnt"></c:set>
			    	<c:choose>
				        <c:when test="${empty restaurantList}">
				            <div align="center">등록된 게시물이 없습니다.</div>
				        </c:when> 
			        <c:otherwise>
		            <c:forEach items="${restaurantList}" var="entry" varStatus="loop">
		                <c:if test="${entry.category eq '일식'}">
		                	<c:if test="${cnt eq 6 }" var="result">
                            	<c:set value="0" var="cnt"></c:set>
                            </c:if>
                            <c:if test="${not result }">
                            	<c:set value="${cnt + 1}" var="cnt"></c:set>
                            </c:if>
		                    <div class="card custom-col">
		                        <div>
		                            <div class="card_product_img">
		                                <button style="border: none;"  class="viewBtn"  type="submit" action="../restaurant/restaurantView.do">
		                                    <img class="shop_product_img card-img-top" src="../images/japan${randomNumbers[cnt]}.jpg" alt="Card image" style="min-height: 290px; max-height: 290px;">
		                                </button>
		                                
		                                <div class="cart_icon_box">
		                                    <img class="p-1" src="../images/favor_icon.png" alt="">
		                                </div>
		                            </div>
		                            <div class="card-body text-center">
		                                <h5 class="card-title"><a class="mill_title"  href="./restaurant_view.do?restaurant_idx=${ entry.restaurant_idx }">${entry.name}</a></h5>
		                                <p><span style="color: #f19d07;">★4.8점</span></p>
		                          <!--        <p><span style="color: #f19d07;">index</span></p> -->
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
		                	 <c:if test="${cnt eq 6 }" var="result">
                            	<c:set value="0" var="cnt"></c:set>
                            </c:if>
                            <c:if test="${not result }">
                            	<c:set value="${cnt + 1}" var="cnt"></c:set>
                            </c:if>
		                    <div class="card custom-col">
		                        <div>
		                            <div class="card_product_img"> 
		                                <button style="border: none;" data-bs-toggle="modal" class="viewBtn" data-bs-target="#restaurant_view">
		                                    <img class="shop_product_img card-img-top" src="../images/china${randomNumbers[cnt]}.jpg" alt="Card image" style="min-height: 290px; max-height: 290px;">
		                                </button>
		                                <div class="cart_icon_box">
		                                    <img class="p-1" src="../images/favor_icon.png" alt="">
		                                </div>
		                            </div>
		                            <div class="card-body text-center">
		                                <h5 class="card-title"><a class="mill_title"  href="./restaurant_view.do?restaurant_idx=${ entry.restaurant_idx }">${entry.name}</a></h5>
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

</div>
<!-- wrapper 끝 -->
</body>
</html>