<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file = "../include/global_head.jsp" %>
<!-- 전역 설정 css 링크  -->
<link rel="stylesheet" href="../css/mypage_.css">
<style>
</style>
<script>
    $(document).ready(function() {


    // 카드 이미지를 정사각형으로 조정
    $(window).resize(function() {

        if ($(window).width() <= 700) {
            $("#myplannerBtn").text("나의 플래너");
            $("#makeplannerBtn").text("만들기");
            }
    });

    // 창의 너비에 따라 다른 이미지 크기 선택
 

         // 클릭 이벤트에 대한 토글 적용
    $(".myplannershow").click(function() {
    // 플래너 토글 표시하고 다른 요소 숨김
    $(".planner").toggle();
    $(".freeboard, .photoboard, .food, .mealkit").hide();

    // 다른 메뉴 아이템에 대한 스타일 초기화
    $("#showmenu a").not(this).css({
        "color": "",
        "border-bottom": "",
        "padding-bottom": ""
    });

    // 클릭한 메뉴 아이템에 대한 스타일 적용
    /*$(this).css({
        "color": "orange",
        "border-bottom": "2px solid orange",
        "padding-bottom": "20px" // 필요한 만큼 패딩을 조절하세요
    });*/
    });

    // 마우스 리브 이벤트 (필요에 따라 추가로 수정 가능)
    $("#showmenu a:eq(0)").mouseleave(function() {
    // 플래너 표시
    $("#planner").show();

    // 클릭한 메뉴 아이템에 대한 스타일 초기화
    $(this).css({
        "color": "",
        "border-bottom": "",
        "padding-bottom": ""
    });
    });

    
    
    
    //호버
    $(".myplannershow").hover(function() {
    $(this).css({
        "color": "orange",
        "border-bottom": "2px solid orange",
        "padding-bottom": "8px" // 필요한 만큼 패딩을 조절하세요
    });
    
    }, function() {
        // 호버가 해제될 때 border와 글자 색상, 패딩을 초기 상태로 리셋하려면 이 함수를 추가하세요
        $(this).css({
            "color": "", // 초기 글자 색상으로 리셋 (비워두거나 원하는 값으로 설정)
            "border-bottom": "initial",
            "padding-bottom": "" // 초기 패딩으로 리셋 (비워두거나 원하는 값으로 설정)
        });
    });



    // 게시판 메뉴 호버 이벤트에 대한 토글 적용
    $(".myboardshow").click(function() {
    // 게시판 메뉴 토글 표시하고 다른 요소 숨김
    $(".freeboard, .photoboard, .mywritefreeboard, .mywritephotoboard").toggle();
    $(".planner, .food, mealkit").hide();

    // 다른 메뉴 아이템에 대한 스타일 초기화
    $("#showmenu a").not(this).css({
        "color": "",
        "border-bottom": "",
        "padding-bottom": ""
    });

  
    });
    //호버
    $(".myboardshow").hover(function() {
    $(this).css({
        "color": "orange",
        "border-bottom": "2px solid orange",
        "padding-bottom": "8px" // 필요한 만큼 패딩을 조절하세요
    });
    }, function() {
        // 호버가 해제될 때 border와 글자 색상, 패딩을 초기 상태로 리셋하려면 이 함수를 추가하세요
        $(this).css({
            "color": "", // 초기 글자 색상으로 리셋 (비워두거나 원하는 값으로 설정)
            "border-bottom": "initial",
            "padding-bottom": "" // 초기 패딩으로 리셋 (비워두거나 원하는 값으로 설정)
        });
    });


    // 마우스 리브 이벤트 (필요에 따라 추가로 수정 가능)
    $("").mouseleave(function() {
    // 자유게시판, 사진게시판 표시
    $("#freeboard, #photoboard").show();

    // 클릭한 메뉴 아이템에 대한 스타일 초기화
  
  /*  $(this).css({
        "color": "",
        "border-bottom": "",
        "padding-bottom": ""
    }); */
    });
            // 맛집 메뉴 호버 이벤트에 대한 토글 적용
    $(".foodshow").click(function() {
    // 맛집 메뉴 토글 표시하고 다른 요소 숨김
    $(".food").toggle();
    $(".planner, .freeboard, .photoboard, .mealkit").hide();

    // 다른 메뉴 아이템에 대한 스타일 초기화
    $("#showmenu a").not(this).css({
    "color": "",
    "border-bottom": "",
    "padding-bottom": ""
    });

    });

    //호버
    $(".foodshow").hover(function() {
    $(this).css({
        "color": "orange",
        "border-bottom": "2px solid orange",
        "padding-bottom": "8px" // 필요한 만큼 패딩을 조절하세요
    });
    }, function() {
        // 호버가 해제될 때 border와 글자 색상, 패딩을 초기 상태로 리셋하려면 이 함수를 추가하세요
        $(this).css({
            "color": "", // 초기 글자 색상으로 리셋 (비워두거나 원하는 값으로 설정)
            "border-bottom": "initial",
            "padding-bottom": "" // 초기 패딩으로 리셋 (비워두거나 원하는 값으로 설정)
        });
    });


    // 마우스 리브 이벤트 (필요에 따라 추가로 수정 가능)
    $("showmenu a:eq(2)").mouseleave(function() {
    // 맛집 메뉴 표시
    $("#food").show();

    // 클릭한 메뉴 아이템에 대한 스타일 초기화
    $(this).css({
        "color": "",
        "border-bottom": "",
        "padding-bottom": ""
    });
    });


        // 밀키트 메뉴 호버 이벤트에 대한 토글 적용
    $(".mealkitshow").click(function() {
    // 밀키트 메뉴 토글 표시하고 다른 요소 숨김
    $(".mealkit").toggle();
    $(".planner, .freeboard, .photoboard, .food").hide();

    // 다른 메뉴 아이템에 대한 스타일 초기화
    $("#showmenu a").not(this).css({
        "color": "",
        "border-bottom": "",
        "padding-bottom": ""
    });

   
    });
        

    //호버
    $(".mealkitshow").hover(function() {
    $(this).css({
        "color": "orange",
        "border-bottom": "2px solid orange",
        "padding-bottom": "8px" // 필요한 만큼 패딩을 조절하세요
    });
    }, function() {
        // 호버가 해제될 때 border와 글자 색상, 패딩을 초기 상태로 리셋하려면 이 함수를 추가하세요
        $(this).css({
            "color": "", // 초기 글자 색상으로 리셋 (비워두거나 원하는 값으로 설정)
            "border-bottom": "initial",
            "padding-bottom": "" // 초기 패딩으로 리셋 (비워두거나 원하는 값으로 설정)
        });
    });


    // 마우스 리브 이벤트 (필요에 따라 추가로 수정 가능)
    $("#showmenu a:eq(3)").mouseleave(function() {
    // 밀키트 메뉴 표시
    $("#mealkit").show();

    // 클릭한 메뉴 아이템에 대한 스타일 초기화
    $(this).css({
        "color": "",
        "border-bottom": "",
        "padding-bottom": ""
    });
    });
 });

  </script>
</head>
<body>
<!-- wrapper 시작 -->
<div class="container-fluid" id="wrap">
    <!-- header, nav 시작 -->
    <%@ include file="../include/top.jsp" %>
    
    <!-- 배너 시작 -->
    <div id="banner" class="mt-3">
        <div id="banner_contents" class="container d-flex align-items-center">
            <div id="info">
                <h4>나만 불 수 있는</h4>
                <div id="info_title" class="d-flex">
                    <h2>마이페이지</h2>
                </div>
            </div>
            <img id="page_icon" src="../images/calandar.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <div class="container" id="pccontainer" >
            <div class="row"><!-- row-->
                <div class="col-2 ml-7" id="col2"><!-- col3시작-->
                    <!-- 첫 번째 열 -->
                    <br><br><br><br>
                    <div id="left"><!-- 좌측메뉴-->
                        <div id="profile"><img src="../images/logo.png" alt=""></div>
                        <div id="leftname">회원이름</div>
                        <div id="leftreft" class="">
                        <div id="myactivity">
                            <a href="/member/mypage.do">나의 활동관리</a>
                        </div><br><br>
                        <div id="myinfomanage">
                            <a href="../member/myinfo.do">나의 정보관리</a>
                        </div><br><br>
                        <div id="myorder">
                            <a href="../member/myordermanage.do"> 나의주문관리</a>
                        </div>
                        </div><!-- leftreft -->
                    </div> <!-- left메뉴끝 -->
                </div>
                <div id="col_hate" style="padding-left: 100px;">
                    <div class="d-flex">
                        <div id="myactivityR" style="width: 150px; "> <a href="./mypage.html">나의 활동관리</a>
                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div id="myinfoR" style="width: 200px; "> <a href="./myinfo.html">나의 정보관리</a>
                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div id="myorderR" style="width: 200px; "> <a href="./myordermanage.html">나의 주문관리</a>
                        </div>
                     </div>
                    <br><br>
                    <div id="showmenu" class="showmenu"><!--showmenu시작 -->
                        <a href="javascript:void(0);" class="myplannershow">#나의 플래너</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" class="myboardshow">#나의 게시판</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" class="foodshow">#맛집</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" class="mealkitshow">#밀키트</a>
                    </div><!-- show메뉴 끝 -->
                    <div id="showmenu" class="mobileshowmenu"><!--showmenu시작 -->
                        <a href="javascript:void(0);" class="myplannershow">#나의 플래너</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" class="myboardshow">#나의 게시판</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" class="foodshow">#맛집</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" class="mealkitshow">#밀키트</a>
                    </div><!-- show메뉴 끝 -->
                    <br><br>
                    <div class="container">
                      
                    <div class="planner" style="text-align: center;">
                        <br><br>
                        <div style="float: left;">#내가 쓴 플래너</div>
                        <br><br>
                        <figure class="row thumbnail">
                            <!-- 1열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 1열 끝 -->
                            <!-- 2열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 2열 끝 -->
                            <!-- 3열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 3열 끝 -->
                        </figure>
                        <div style="float: left;">♥플래너</div>
                        <br><br>
                        <figure class="row thumbnail">
                            <!-- 1열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 1열 끝 -->
                            <!-- 2열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 2열 끝 -->
                            <!-- 3열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 3열 끝 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                        </figure>
                    </div><!-- 플래너 끝 -->
                    <!--게시판 시작 -->
                    <br><br>
                    <div class="freeboard" style=" display: none;">

                        #내가 쓴 자유 게시판
                        <br> <br> <br> <br>
                          <!-- 테이블 -->
                        <div class="container" id="cont_wrap">
                            <div class="table_wrap" id="table_wrap">
                            <table class="table table-border"">
                                <colgroup>
                                    <col width="25%"/>
                                    <col width="25%"/>
                                    <col width="25%"/>
                                    <col width="25%" />
                                </colgroup>
                                
                                <thead>
                                <tr style="text-align: center;" >
                                    <th scope="col" style="font-size: 1em; " id="freebum">번호</th>
                                    <th scope="col"  id="freetitle" >제목</th>
                                    <th scope="col" >작성일</th>
                                    <th scope="col"  id="">조회</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td id="table_title">집</td>
                                    <td>@mdo</td>
                                    <td>33</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>최고</td>
                                    <td>@fat</td>
                                    <td>4</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Larry the Bird</td>
                                    <td>@twitter</td>
                                    <td>5</td>
                                </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                
                
                        <!-- 리스트 버튼 -->
                        <div class="container d-flex justify-content-center mb-5">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <div class="list_btn">
                                        <button type="button" class="btn"> &lt; </button>
                                        <button type="button" class="btn" id="btn1"> 1 </button>
                                        <button type="button" class="btn" id="btn1"> 2 </button>
                                        <button type="button" class="btn" id="btn1"> 3 </button>
                                        <button type="button" class="btn"> &gt; </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                      <!-- 나의 포토게시판 시작 -->
                      <div class="photoboard" style="text-align: center; display: none;">
                        <div style="float: left; ">#내가 쓴 포토게시판</div>
                        <br><br>
                        <table class="table table-border" id="pctable">
	                    <tr style="text-align: center;" >
	                        <td scope="col" style="width: 25%;">
		                       	<c:choose>
			                        <c:when test="${empty photolists}">
			                            <tr>
			                                <td colspan="1" align="center">등록된 게시물이 없습니다.</td>
		                            	</tr>
		                        	</c:when>
		                        	<c:otherwise>	
			                            <div class="row">
										    <c:forEach items="${photolists}" var="entry">
										        <div class="col-md-3">
										            <figure class="thumbnail">
										                <div class="card col custom-col" style="padding-right: 20px; border: none;">
										                    <a href="../community/photoboard_view.do?idx=${ entry.idx }">
										                        <img class="card-img-top" src="../uploads/${entry.sfile}" alt="이미지" style="width: 100%; height: 200px; object-fit: cover;">
									                    	</a>
									                    	
									                    	
										                    <div class="card-body">
										                        <h4 class="card-title" style="font-size: 18px; text-align: left;">
										                            ${entry.title} <!-- 파일 이름 -->
										                        </h4>
										                        <p class="card-text" style="text-align: left;">
										                            ${ entry.content }
										                        </p>
										                    </div>
									                	</div>
									            	</figure>
									        	</div>
									    	</c:forEach>
										</div>
	                        		</c:otherwise>
	                    		</c:choose>
	                    	</td>
		                </tr>
		            </table>

                       <!-- 리스트 버튼 -->
                     	<div class="text-center">${pagingImg}</div>
                        <!-- 포토끝 -->
                      <!-- 맛집 -->
                     
                      </div>
                      
                      <!-- 내가 쓴 문의  -->
                      
                      <div class="photoboard" style="text-align: center; display: none;" >
                        <br><br>
                        <div style="float: left;">#내가 쓴 문의</div>
                       
                        <br><br>
                        
                        	 <div class="container" id="cont_wrap">
					            <div class="table_wrap" id="table_wrap">
					            <table class="table table-border">
					                <thead>
					                <tr style="text-align: center;" >
					
					
					                    <th scope="col">번호</th>
					                    <th scope="col" style="width: 20%;">제목</th>
					                    <th scope="col">분류</th>
					                    <th scope="col">작성자</th>
					                    <th scope="col">작성일</th>
					                </tr>
					                </thead>
					                <tbody>
					                	<tr>
					                	<c:choose>
					                		<c:when test="${ empty inquirylists }">
											<tr>
												<td colspan="5" align="center"> 등록된 게시물이 없습니다.</td>
											</tr>
											</c:when>
										<c:otherwise>
											<c:forEach items="${ inquirylists }" var="post" varStatus="loop">
												<tr align="center">
												<td>
												<!-- 게시물의 갯수, 페이지 번호, 페이지 사이즈를 통해 가상 번호를 계산해서 출력한다.  -->
												${ inquirymaps.totalCount - (((inquirymaps.pageNum-1) * inquirymaps.pageSize) + loop.index)}
												</td>
												<%-- <td scope="row"><a href="./freeboard_view.do?freeboard_idx=${ post.freeboard_idx }">${ post.title }</td> --%>
												<td>${ post.title }</td>
												<td>${ post.category }</td>
												<td>${ post.nickname }</td>
												<td>${ post.regidate }</td>
												</tr> 
											</c:forEach>
										</c:otherwise>
										</c:choose>
								
					                </tbody>
					            </table>
					            </div>
					        </div>
                        <div class="text-center">${pagingImg}</div>
                        
                      </div>
                      
                      
                      <!-- 내가 쓴 문의 끝   -->
                      
                      
                      <!-- 맛집 시작 -->
                      <div class="food" style="text-align: center; display: none;" >
                        <br><br>
                        <div style="float: left;"> ♥맛집</div>
                       
                        <br><br>
                        <figure class="row thumbnail">
                            <!-- 1열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 1열 끝 -->
                            <!-- 2열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 2열 끝 -->
                            <!-- 3열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 3열 끝 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                        </figure>
                      </div>
                      <!-- 맛집끝 -->
                      <div class="mealkit" style="text-align: center; display: none;">
                        <br><br>
                        <div style="float: left">♥밀키트</div>
                        
                        <br><br>
                        <figure class="row thumbnail">
                            <!-- 1열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 1열 끝 -->
                            <!-- 2열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 2열 끝 -->
                            <!-- 3열 시작 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 3열 끝 -->
                            <div class="card custom-col">
                                <div>
                                    <img class="card-img-top" src="http://placehold.it/200x200" height="250" alt="Card image">
                                    <div class="card-body">
                                        <h4 class="card-title" style="font-size: 18px;">2023년 12월 출발</h4>
                                        <p class="card-text">2일간</p>
                                    </div>
                                </div>
                            </div>
                        </figure>
                      </div>
                   
                    </div>
                </div> <!-- col-10 끝 --> 
            </div>


        <div id="footerArea">
            <br><br><br><br><br>
        </div>
    </div>

   
    

    </main>
    <!-- main 끝 -->

    <!-- 푸터 광고 -->
    <div id="banner2" class="mt-3">
        <div id="banner2_contents" class="container d-flex align-items-center">
            <div id="info" style="width: auto;">
                <h3 style="color: brown; font-family: 'NPSfontExtraBold';">카카오페이로</h2>
                
                <div id="info_title" class="d-flex">
                    <h5 style="color: black;">더욱 다양하게 즐겨보세요</h5>
                </div>
            </div>
            <img id="page_icon" src="../images/pay.png">
        </div>
    </div>
    <!-- 배너 끝 -->

    <!-- footer 시작 -->
   <%@include file="../include/footer.jsp"%>
</div>
<!-- wrapper 끝 -->
</body>
</html>