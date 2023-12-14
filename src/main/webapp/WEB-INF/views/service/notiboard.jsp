<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식도라기 - 공지사항</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/98401b861d.js" crossorigin="anonymous"></script>
<!-- 전역 설정 css 링크  -->
<link rel="stylesheet" href="../css/common_board.css">
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
.catemenu li{border-bottom: 3px solid #999999;  padding:10px; margin-right: 10px;}
/* .catemenu li:first-child{margin-right: 10px;} */
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

/* ######################################################### */
/* 12/01 수정사항 - 한서 */
@media screen and (min-width: 1201px) {
    .custom-col { flex: 0 0 25%; }
}
/* 모바일 환경에서 카테고리를 횡스크롤로 구현 */
@media screen and (max-width: 1200px) {
    .category { overflow: auto; white-space: nowrap; flex-wrap: nowrap; } /* 횡스크롤 구현 */
    .category::-webkit-scrollbar { display: none; } /* 크롬, 사파리, 오페라, 엣지에서 스크롤바 안보이게 처리 */
    .custom-col { flex: 0 0 25%; }
    .meal_seach_bar { width: 100%; } /* 모바일에선 검색창의 길이를 100%로 처리 */
    
}
@media screen and (max-width: 768px) {
    .custom-col { flex: 0 0 50%; }
    .mealk_cate {font-size: 0.8em;}/* 밀키트 카테고리 사이즈 */
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
                <h4>무엇이든 물어보세요</h4>
                <div id="info_title" class="d-flex">
                    <h2>고객센터</h2>
                </div>
            </div>
            <img id="page_icon" src="../images/asd.png">
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
                          <a class="nav-link" href="#">고객센터</a>
                        </li>
                    </ul>
                </div>
                <!-- 네비로케이션 끝 -->
                <!-- 헤더제목 -->
                <ul class="catemenu d-flex">
                    <li class="on"><a href="../service/notiboard.do">공지사항</a></li>
                    <li><a href="../service/inquiryboard.do">1:1문의하기</a></li>
                    <li><a href="../service/faq.do">자주묻는질문</a></li>
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
        <div class="shop_board container  mt-5" >

        <!-- 글쓰기 버튼 -->
        <!--  <div class="container">
            <div class="row" style=" display: inline;
            float: right; margin-top: -80px;">
                <div class="col-sm-12" >
                    <div class="write_btn" style="float: left;">
                        <button type="button" class="btn rounded-pill" onclick="location.href='./notiboard_write.do';" >글쓰기</button>
                        </button>
                    </div>
                </div>
            </div>
        </div>      -->
        <!-- 문의 폼 -->
        <!-- 테이블 -->
        <div class="container">
            <div class="table_wrap" id="table_wrap">
            <table class="table table-border">
                <thead>
	                <tr style="text-align: center;" >
	                    <th scope="col">번호</th>
	                    <th scope="col" style="width: 60%;">제목</th>
	                    <th scope="col">작성자</th>
	                    <th scope="col">작성일</th>
	                    <th scope="col">조회</th>
	                </tr>
                </thead>
                <tbody>
              	<tr>
                	<c:choose>
                		<c:when test="${ empty lists }">
						<tr>
							<td colspan="5" align="center"> 등록된 게시물이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ lists }" var="post" varStatus="loop">
							<tr align="center">
							<td>
							<!-- 게시물의 갯수, 페이지 번호, 페이지 사이즈를 통해 가상 번호를 계산해서 출력한다.  -->
							${ maps.totalCount - (((maps.pageNum-1) * maps.pageSize) + loop.index)}
							</td>
							<td scope="row"><a href="./notiboard_view.do?noticeboard_idx=${ post.noticeboard_idx }">${ post.title }</td>

							<td>${ post.nickname }</td>
							<td>${ post.postdate }</td>
							<td>${ post.visitcount }</td>		
							</tr> 
						</c:forEach>
					</c:otherwise>
					</c:choose>
			
                </tbody>
            </table>
            </div>
        </div>
        <div class="text-center">${pagingImg}</div>

      
        <!-- 게시판 검색 -->
        <form method="get" class="search_table">  
            <table class="table" width="100%" >
            <tr>
                <td align="center">
                    <select name="searchField_list" class="searchField_list"> 
                        <option value="title">제목</option> 
                        <option value="content" >내용</option>
                    </select>
                    <input type="text" name="searchWord_list" class="searchWord_list" />
                    <input type="submit" value="검색하기" class="btn2 "/>
                </td>
            </tr>   
            </table>
        </form>

        </div>
    </div>
    </main>









    </div>
    <!-- main 끝 -->
    
    <!-- footer 추가 -->
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!-- wrapper 끝 -->
</body>
</html>