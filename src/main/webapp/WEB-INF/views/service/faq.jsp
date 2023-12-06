<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식도라기 - 자유게시판</title>
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
<script>
    window.onload=function(){
      market();
    };
    function market(){
        document.getElementById('accordionExample_etc').hidden=true;
        document.getElementById('accordionExample_market').hidden=false;
    }
    function etc(){
        document.getElementById('accordionExample_market').hidden=true;
        document.getElementById('accordionExample_etc').hidden=false;
    }
</script>
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


/*faq 설정*/
.faq_searchWord_list{padding-left: 5px;}
.faq_list {width: 100%; text-align: center; display: flex; justify-content: center;}
.faq {padding: 0;}
.faq li {width: 295px; padding: 10px; background-color: #FF7A00; font-size: 1.2em; }
.faq li:last-child {margin-left: 5px;}
.faq li a {color: white;}
.search_btn {border: 1px solid #ffffff; line-height: 10px; height: 54px; background-color: #FF7A00; font-family: 'NPSfontRegular'; padding: 8px;}


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

@media screen and (min-width:300px) and (max-width:480px) {
    .foot_logo{ display: none; }
    #mobile_navbar { font-size: 0.60em; }
    /* #footer-nav li a { font-size: 0.5em; } */
    #footer-nav li { margin: 0; }
    .container-fluid { line-height: 1.3; }
    #row_footer{ text-align: center;}
    #img_footer_icon{  display: none;}
    .catemenu li {font-size: 18px;}
 
    #write_frm_table tr:first-child {width: 100%;}
    .table { font-size: 12px; /* 테이블 내 글자 크기를 줄임 */}
    .table thead th,.table tbody td { white-space: nowrap; /* 테이블 셀 내의 글자가 줄지 않고 잘리지 않도록 함 */ }
    #table_wrap table tbody tr td { padding-left: 0;padding-right: 0;}
    .searchWord_list{height: 40px; border: 1px solid #FF7A00; font-family: 'NPSfontRegular'; }
    .searchField_list{ height: 40px;  border: 1px solid #FF7A00;font-family: 'NPSfontRegular';}
    #free_write_frm_table tr td{padding-left: 0; padding-right: 0; }
    #free_write_frm_table tr td:first-child {font-size: 15px; padding: 5px 10px;}
    .faq_searchWord_list{padding-left: 5px;  height: 50px; width: 60%;  border: 1px solid #FF7A00;font-family: 'NPSfontRegular';}
    .btn_td button{margin: 0 5px 5px 0; border-radius: 20px;  padding: 0px 10px 0 10px; height: 30px; font-size: 15px;}
    .faq li {width: 159px; padding: 10px; background-color: #FF7A00; font-size: 1em; }
    .accordion-body strong {font-size: 15px;}
    .accordion-body {font-size: 13px;}
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
                    <li><a href="../service/inquiryboard.do">1:1문의하기</a></li>
                    <li class="on"><a href="../service/faq.do">자주묻는질문</a></li>
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
            <form method="get" class="search_table">  
                <table class="table" width="100%" >
                <tr>
                    <td align="center">
                        <input type="text" name="searchWord_list" class="faq_searchWord_list" placeholder="질문 키워드를 입력해주세요" />
                        <input type="submit" value="검색하기" class="search_btn "/>
                    </td>
                </tr>   
                </table>
            </form>
            <!-- 컨텐츠 헤더 끝 -->
            <div class="container" >
                <div class="faq_list" >
                    <ul class="faq d-flex">
                        <li onclick="market()">마켓문의</li>
                        <li onclick="etc()">기타문의</li>
                    </ul>
                </div>
            </div>

            <!-- 마켓문의 -->
            <div class="accordion" id="accordionExample_market">
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    상품을 교환/반품하고 싶어요
                    </button>
                  </h2>
                  <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample_market">
                    <div class="accordion-body">
                      <strong>교환 및 반품은 미사용 제품에 한하여 가능하며 유통기한이 지나지 않은 물품에 한하여 가능합니다. </strong> <br> 마켓 문의하기 또는 식도라기 1:1문의에 등록해주시면 빠른 답변드리겠습니다. <br> 상품 회수 후 검수 단계에서 문제가 발견되면 고객님께 연락을 드릴 수 있습니다. <br> 교환은 구매 상품과 동일한 상품으로만 가능합니다. <br> 다른 상품과 교환을 원하시는 고객님은 반품 후 재구매 해주시길 바랍니다. <br>단순 변심으로 반품을 진행하는 경우 배송비가 부여됩니다.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    교환/반품 신청을 철회하고 싶어요
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample_market">
                    <div class="accordion-body">
                      <strong>교환/반품 신청 철회</strong><br> 교환, 반품 접수되기 전에 철회 사유와 함께 마켓 문의하기 또는 식도라기 1:1문의에 등록해주시면 빠른 답변드리겠습니다.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    주문 취소 후 환불은 언제되나요?
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample_market">
                    <div class="accordion-body">
                      <strong>취소 후 환불</strong> <br> 취소 후 환불은 각 은행의 사정에 따라 약 3~4일 정도로 예상되며 자세한 사항은 거래 은행에 문의해주시기 바랍니다.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapsefore">
                        취소내역은 어디서 확인하나요?
                    </button>
                  </h2>
                  <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample_market">
                    <div class="accordion-body">
                      <strong>마이페이지 -> 주문관리 </strong> <br> 마이페이지 주문관리에서 취소내역을 확인할 수 있습니다. 
                    </div>
                  </div>
                </div>
              </div>

            <!-- 기타문의 -->
            <div class="accordion " id="accordionExample_etc">
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne_two" aria-expanded="true" aria-controls="collapseOne">
                    아이디/비밀번호 찾기는 어떻게 하나요?
                    </button>
                  </h2>
                  <div id="collapseOne_two" class="accordion-collapse collapse show" data-bs-parent="#accordionExample_etc">
                    <div class="accordion-body">
                      <strong>로그인 화면 하단에 아이디/비밀번호 찾기 버튼</strong> <br> 본인인증을 진행한 후 아이디/비밀번호 찾기가 가능합니다.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo_two" aria-expanded="false" aria-controls="collapseTwo">
                    회원탈퇴는 어떻게 하나요?
                    </button>
                  </h2>
                  <div id="collapseTwo_two" class="accordion-collapse collapse" data-bs-parent="#accordionExample_etc">
                    <div class="accordion-body">
                      <strong>마이페이지 -> 회원탈퇴</strong> <br> 비밀번호로 본인인증을 진행한 후 회원탈퇴 여부를 묻습니다. 탈퇴 후 복구는 불가능하니 신중하게 결정해주세요.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree_two" aria-expanded="false" aria-controls="collapseThree">
                    회원탈퇴한 아이디를 복구해주세요
                    </button>
                  </h2>
                  <div id="collapseThree_two" class="accordion-collapse collapse" data-bs-parent="#accordionExample_etc">
                    <div class="accordion-body">
                      <strong>탈퇴한 아이디는 복구가 불가합니다.</strong> <br>회원탈퇴 시 시스템상 회원정보 및 서비스 이용 기록 등이 지체 없이 모두 삭제되므로 어떠한 경우에도 탈퇴된 아이디는 복구가 불가능합니다.
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour_two" aria-expanded="false" aria-controls="collapsefore">
                        개인정보 수정은 어디서 하나요?
                    </button>
                  </h2>
                  <div id="collapseFour_two" class="accordion-collapse collapse" data-bs-parent="#accordionExample_etc">
                    <div class="accordion-body">
                      <strong>마이페이지 -> 나의정보수정</strong> <br> 비밀번호로 본인인증을 진행한 후 개인정보수정이 가능합니다.
                    </div>
                  </div>
            
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