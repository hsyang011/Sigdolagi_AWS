<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
</head>
<style>
    /* main 설정 */
    .card { padding: 0; border: none; cursor: pointer; }
    .card > div { border-radius: 15px; margin: 10px; border: 1px solid lightgray; } /* 테두리 둥글게는 .card의 자식 div에 부여 */
    .card-img-top { border-radius: 15px 15px 0 0; }
    .card-body { background-color: white; border-radius: 15px; }
    .card_bg { background-color: #FFF1E5; }

    /*main nav_location 설정*/
    .nav_location { margin: 15px auto; }
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

    /* 식도락 여행 설정 */
    #sigdolagi_trip { background-color: #FFF1E5; padding: 10px 0; }
    #sigdolagi_trip a { color: black; }

    /* ######################################################### */
    /* 12/01 수정사항 - 한서 */
    @media screen and (min-width: 1201px) {
        .custom-col { flex: 0 0 25%; }
        .thumbnail { margin-bottom: 60px; }
        .card-body { display: flex; justify-content: space-between; }
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
        .category .btn { font-size: 0.8em; }
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
    
   	$("#myplannerBtn").click(() => {
   		location.href = "../member/mypage.do";
   	});
    $("#makeplannerBtn").click(() => {
    	location.href = "./planner_map.do";
    });
    
    // 카테고리를 눌렀을 때 ajax요청
    $(".cate").click((e) => {
    	let cate = $(e.target).text();
    	
   		$.ajax({
   	        type: "POST",
   	        url: "./sortPlannerByCate.do",
   	        data: {cate: cate},
   	        success: function(res) {
   	            console.log("정렬 성공", res[0]);
   	            let str = '';
   	            for (let i=0; i<res.length; i++) {   	            	
	   	            str += '<div class="card custom-col">';
		            str +=     '<div style="cursor: pointer;" onclick="location.href=\'./planner_view.do?planner_idx='+res[i].planner_idx+'\';">';
			        str +=         '<img class="card-img-top" src="../uploads/'+res[i].sfile+'" height="250" alt="Card image">';
			        str +=         '<div class="card-body">';
		        	str +=             '<h5 class="card-title">'+res[i].plan_start+' > '+res[i].plan_end+'</h5>';
			        str +=             '<p class="card-text">'+res[i].nickname+'</p>';
			        str +=         '</div>';
			        str +=     '</div>';
			        str += '</div>';
   	            }
            	
            	$("#otherPlanners").html(str);
   	        },
   	        error: function(err) {
   	    		console.log("정렬 실패");
   	        }
   		});
    });
});

function resizeCardSize() {
    let cardImgWidth = $(".card-img-top").width();
    $(".card-img-top").height(cardImgWidth);
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
                <h4>나만의 맛집 탐험 플래너를 만들어 보세요!</h4>
                <div id="info_title" class="d-flex">
                    <h2>플래너</h2>
                    <button class="btn rounded-4 ms-3 px-3" style="background-color: #333333;" id="myplannerBtn">나의 플래너 보러가기</button>
                    <button class="btn rounded-4 ms-3 px-3" style="background-color: #333333;" id="makeplannerBtn">플래너 만들기</button>
                </div>
            </div>
            <img id="page_icon" src="../images/planner_icon.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <!-- 네비로케이션 -->
        <div class="container nav_location">
             <ul class="nav_locat nav">
                 <li class="nav-item">
                   <a class="nav-link" href="#">홈</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" href="#">플래너</a>
                 </li>
             </ul>
         </div>
         <!-- 네비로케이션 끝 -->
        <!-- 식도락 여행 시작 -->
        <article id="sigdolagi_trip" style="margin-top: 15px;">
            <div class="container">
                <div class="d-flex align-items-center justify-content-between">
                    <h4 style="font-family: 'NPSfontBold';">식도락 여행</h4>
                    <a href="#">더보기 ></a>
                </div>
                <!-- 식도략 여행 썸네일 리스트 시작 -->
                <!-- 1행 시작 -->
                <figure class="row thumbnail">
                    <!-- 1열 시작 -->
                    <div class="card custom-col card_bg">
                        <div>
                            <img class="card-img-top" src="../images/1572507524886qqw0qpSy16.jpg" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">커피를 즐기세요!</h5>
                                <p class="card-text">강릉시</p>
                            </div>
                        </div>
                    </div>
                    <!-- 1열 끝 -->
                    <!-- 2열 시작 -->
                    <div class="card custom-col card_bg">
                        <div>
                            <img class="card-img-top" src="../images/1572507528895QeeKZ94w4s.jpg" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">천지연 폭포의 아름다움!</h5>
                                <p class="card-text">서귀포시</p>
                            </div>
                        </div>
                    </div>
                    <!-- 2열 끝 -->
                    <!-- 3열 시작 -->
                    <div class="card custom-col card_bg">
                        <div>
                            <img class="card-img-top" src="../images/1576040661397F0AFLiH3DC.JPG" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">송도밤바다의 아름다움!</h5>
                                <p class="card-text">송도</p>
                            </div>
                        </div>
                    </div>
                    <!-- 3열 끝 -->
                    <!-- 4열 시작 -->
                    <div class="card custom-col card_bg">
                        <div>
                            <img class="card-img-top" src="../images/1576040664317UklvFY678H.JPG" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">전주의 맛집 탐방!</h5>
                                <p class="card-text">전주시</p>
                            </div>
                        </div>
                    </div>
                    <!-- 4열 끝 -->
                </figure>
                <!-- 1행 끝 -->
            </div>
        </article>
        <!-- 식도략 여행 끝 -->
        <!-- 플래너 시작 -->
        <article>
            <div class="container">
                <h4>준비중인 여행자들의 플래너</h4>
                <ul class="nav my-3 category">
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">최신</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">아이들과</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">커플/신혼</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">부모님과</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">남자혼자</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">여자혼자</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">여자끼리</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">남자끼리</button></li>
                    <li class="nav-item me-3"><button type="button" class="btn rounded-pill cate" style="background-color: #FFA24D; color: white;">남녀함께</button></li>
                </ul>
                <!-- 준비중인 여행자들의 플래너 썸네일 리스트 시작 -->
                <!-- 리스트 반복 시작 -->
                <figure class="row thumbnail" id="otherPlanners">
                <c:forEach items="${plannerList}" var="row" varStatus="loop">                
                    <div class="card custom-col">
                        <div style="cursor: pointer;" onclick="location.href='./planner_view.do?planner_idx=${row.planner_idx}';">
                            <img class="card-img-top" src="../uploads/${row.sfile}" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title">${row.plan_start} > ${row.plan_end}</h5>
                                <p class="card-text">${row.nickname}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </figure>
                <!-- 리스트 반복 끝 -->
                <!-- 준비중인 여행자들의 플래너 썸네일 리스트 끝 -->
            </article>
            <!-- 플래너 끝 -->
        </div>
    </main>
    <!-- main 끝 -->
    
    <!-- footer 추가 -->
	<%@ include file="../include/footer.jsp" %>    

</div>
<!-- wrapper 끝 -->
</body>
</html>