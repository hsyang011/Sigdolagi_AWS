<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file = "../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/myinfo.css">
<style>

</style>
</head>
<body>
<!-- wrapper 시작 -->  <!-- nav 시작 -->
<div class="container-fluid" id="wrap">
    <!-- header 시작 --> <!-- nav 시작 -->
    <%@ include file="../include/top.jsp" %>
    
    <!-- header 끝 -->
    <!-- nav 시작 -->
    <!-- mobile 내비게이션 시작 -->
   
    <!-- mobile 내비게이션 끝 -->
    <!-- 배너 시작 -->
    <div id="banner" class="mt-3">
        <div id="banner_contents" class="container d-flex align-items-center">
            <div id="info">
                <h4>나만 볼 수 있는</h4>
                <div id="info_title" class="d-flex">
                    <h2>나의정보관리</h2>
                </div>
            </div>
            <img id="page_icon" src="../images/calandar.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <div class="container">
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
                <div class="col-10" id="col10" style="padding-left: 100px;">
                    <div class="d-flex">
                        <div id="myactivityR" style="width: 200px; "> <a href="./mypage_.html">나의 활동관리</a>
                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div id="myinfoR" style="width: 150px; "> <a href="./myinfo.html">나의 정보관리</a>
                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div id="myorderR" style="width: 200px; "> <a href="./myordermanage.html">나의 주문관리</a>
                        </div>
                     </div>
                    
                    <!-- 체크 영역 -->
                    <div class="container">
                        <form action="../member/myinfoEdit.do">
                            <div class="check_pw" style="margin-top: 30%; background-color: #F6D5BC; width: 500px; height: 170px; border-radius: 20px; padding: 20px;">
                                <div class="title">
                                    <h3 style="font-size: 1.0em; font-family: NPSfontBold;">회원인증</h3>
                                    <div class="title_line" style="border-bottom: 3px solid #FFA24D; width: 85px; border-radius: 32px;"></div>
                                </div>
                                <div class="check_frm" style="display: flex; justify-content: space-between; margin-top: 10%; align-items: center;">
                                    <input type="text" class="input_pw" placeholder="비밀번호입력" style="width: 200px; height: 40px; border: none; border-radius: 32px; padding-left: 15px; outline: none;">
                                    <input type="submit" value="인증하기" style="border: none; background-color: #FFA24D; border-radius: 10px; color: white; width: 100px; height: 40px;">
                                </div>
                            </div>
                        </form>
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