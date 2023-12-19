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
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/common_board.css">
<style>

/* 화면크기 최소 481px 부터 최대 660px까지 */
@media screen and (min-width: 481px) and (max-width: 662px) {
    .foot_logo{ display: none; }
    #footer-nav li { margin: 0 10px; }
    .container-fluid { line-height: 1.3; }
    #row_footer{ text-align: center;}
    #img_footer_icon{  display: none;}
    .table { font-size: 12px;}
    .table thead th,.table tbody td { white-space: nowrap;}
    #table_wrap table {width: auto;}
     #content {width: 100%;}
     .cm_input textarea {width: 90%;}
    .cm_input .btns {width: 100%; height: 50px; margin-bottom: 2px; background-color:  #FF7A00; border:none;}
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
    #content {width: 100%;}
    .cm_input textarea {width: 90%;}
    .cm_input .btns {width: 100%; height: 50px; margin-bottom: 2px; background-color:  #FF7A00; border:none;}
    .searchWord_list{height: 40px; border: 1px solid #FF7A00; font-family: 'NPSfontRegular'; }
    .searchField_list{ height: 40px;  border: 1px solid #FF7A00;font-family: 'NPSfontRegular';}
    #free_write_frm_table tr td{padding-left: 0; padding-right: 0; }
    #free_write_frm_table tr td:first-child {font-size: 15px; padding: 5px 10px;}
    .faq_searchWord_list{  height: 50px; width: 60%;  border: 1px solid #FF7A00;font-family: 'NPSfontRegular';}
    .btn_td button{margin: 0 5px 5px 0; border-radius: 20px;  padding: 0px 10px 0 10px; height: 30px; font-size: 15px;}
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
                <!-- 
                <ul class="nav my-3 category mt-4">
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
                        <form name="writeFrm" method="post" onsubmit="return validateForm(this);" class="writeFrm" action="./inquiryboard_write.do">
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