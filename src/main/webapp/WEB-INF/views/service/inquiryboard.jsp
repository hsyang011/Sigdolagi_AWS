<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식도라기 - 1:1문의하기</title>
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
                    <li><a href="../service/notiboard.do">공지사항</a></li>
                    <li class="on"><a href="../service/inquiryboard.do">1:1문의하기</a></li>
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

                <!-- 문의 폼 -->
                <div class="container">
                    <div class="freeboard_write_frm">
                        <!-- 게시판 들어가는 부분 (시작) -->
                        <form name="writeFrm" method="post" onsubmit="return validateForm(this);" class="writeFrm" action="/community/inquiryboard_write.do">
                            <input type="hidden" name="tname"  />
                            <form>
                            <table class="table table-bordered" id="write_frm_table" width="90%">
                                <tr>
                                    <td>문의유형</td>
                                    <td>
                                        <select name="category" id="category" class="rounded-pill" style="width: 150px; height: 30px;">
                                            <option value="선택해주세요" selected style="text-align: center;">선택해주세요.</option>
                                            <option value="플래너" style="text-align: center;">플래너</option>
                                            <option value="마켓" style="text-align: center;">마켓</option>
                                            <option value="기타" style="text-align: center;">기타</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td>
                                        <input type="text" name="email" id="email" value="${email}" style="width: 95%;" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td>닉네임</td>
                                    <td>
                                        <input type="text" name="nickname" id="nickname" value="${nickname}" style="width: 95%;" />
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>제목</td>
                                    <td>
                                        <input type="text" name="title" style="width: 95%;" />
                                    </td>
                                </tr>
            
                                <tr>
                                    <td>내용</td>
                                    <td>
                                        <textarea name="content" style="width: 95%; height: 300px;"></textarea>
                                    </td>
                                </tr>
                                <!-- <tr>
                                    <td>답변등록 알림</td>
                                    <td>
                                        <input type="checkbox" name="inq_sms" id="sms알림">sms
                                        <input type="text" name="cel1" size="3"> -
                                        <input type="text" name="cel2_1" size="4" title="전화번호"> -
                                        <input type="text" name="cel2_2" size="4">
                                    </td>
                                </tr> -->
                                <tr>
                                    <td colspan="2" align="center" class="btn_td">
                                        <button type="submit" class="writeFrm_end">작성 완료</button>
                                        <button type="reset" class="writeFrm_reset">다시 입력</button>
                                        <button type="button" class="writeFrm_list" onclick="">목록 보기</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
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