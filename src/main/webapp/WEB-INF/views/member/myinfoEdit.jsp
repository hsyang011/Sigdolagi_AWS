<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file = "../include/global_head.jsp" %>
<!-- 전역 설정 css 링크  -->
<link rel="stylesheet" href="../css/myinfoEdit.css">


<style>
 


    </style>
</head>
<body>

    

</style>
<script>


  </script>
</head>
<body>
<!-- wrapper 시작 -->
<div class="container-fluid" id="wrap">
    <!-- header 시작 --> <!-- nav 시작 -->
    <%@ include file="../include/top.jsp" %>
   
    <!-- nav 끝 -->
    <!-- mobile 내비게이션 시작 -->
  
    <!-- mobile 내비게이션 끝 -->
    <!-- 배너 시작 -->
    <div id="banner" class="mt-3">
        <div id="banner_contents" class="container d-flex align-items-center">
            <div id="info">
                <h4>나만 불 수 있는</h4>
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
                        <div id="leftname">${leftname}님</div>
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
                <div class="col-10" style="padding-left: 100px;" id="col10" >
                    <div class="d-flex">
                        <div id="myactivityR" style="width: 200px; "> <a href="/member/mypage.do">나의 활동관리</a>
                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div id="myinfoR" style="width: 200px; position: relative; right: 20px; "> <a href="../member/myinfo.do">나의 정보관리</a>
                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div id="myorderR" style="width: 150px; "> <a href="../member/myordermanage.do">나의 주문관리</a>
                        </div>
                    </div>
                    <br><br><br>
                    <h2 id="editText" style="padding-left: 10px; border-bottom: 3px solid orange; padding-bottom: 10px; width: 200px; ">회원정보수정</h2>
                    <br><br>

                    <!-- 테이블만들기 -->
                    <form action="">
                        <div id="editAreaBox">
                            <div id="editArea">
                            <table id="infotable">
                              <tr>
                                <td style="margin-bottom: 10px;">아이디 :</td>
                                <td style="margin-bottom: 10px;"><input type="text" value="${memberDTO.email}" id="id" placeholder=""readonly></td>
                            </tr>
                                    
                                <tr>
                                    <td style="margin-bottom: 10px;">비밀번호</td>
                                    <td style="margin-bottom: 10px;"><input type="text" id="passchecktext" placeholder="비밀번호는 4~6자리입니다.."></td>
                                    <tr>
                                      <td>비밀번호확인 : </td>
                                      <td><input type="password" id="pass2" ></td>
                                </tr>
                                <tr>
                                  <td>이름:</td>
                                  <td>
                                      <input type="text" id="name" value="${memberDTO.name}" style="padding-right: 20px;" readonly>
                                  </td>
                                </tr>
                                <tr>
                                  <td>닉네임:</td>
                                  <td>
                                      <input type="text" id="nickname" value="${memberDTO.nickname }" style="padding-right: 20px;">
                                      <button id="doublecheck" style="margin-left: 20px; text-align: center;">중복확인</button>
                                  </td>
                                </tr>
                                <tr id="pctall">
                                  <td> 연락처 :</td>
                                   <td><input type="text" id="tel1" value="${tel1}" style="width: 100px;"><span id="hypoon1"  style="padding-left: 20px; font-size: 30px;">-</span><input type="text" id="tel2" value="${tel2}" style="width: 100px; margin-left: 20px; " ><span id="hypoon2" style="padding-left: 20px; font-size: 30px;">-</span><input type="text" id="tel3" value="${tel3}" style="width: 100px; margin-left: 20px;" ></td>
                                	<%-- <input type="text" id="nickname" name="nickname" value="${memberDTO.phone }" style="padding-right: 20px;"> --%>
                                </tr>
                                </tr>
                                  <td> 주소 : </td>
                                  <td> 
                                    <input type="text" id="addr1"  value="${memberDTO.zipcode }" style="margin-bottom: 40px; margin-right: 50px; width: 200px;"  placeholder="우편번호"> 
                                    <button  id="addrsearch">주소찾기</button>
                                    <input type="text" id="addr2" value="${memberDTO.addr1 }" style="margin-bottom: 40px;" >
                                    <input type="text" id="addr3" value="${memberDTO.addr2 }" placeholder="상세주소" >
                                  </td>
                                </tr>
                                <tr>
                                    <td> 이메일 수신 여부 :</td>
                                    <td class>
                                       <div style="display: flex; align-items: center;" > 
                                            <label><input class="custom-radio" type="radio" name="emailradio" value="수신동의" style="margin-left: 20px;"> 수신동의</label>
                                            <label><input class="custom-radio" type="radio" name="emailradio" value="수신거부"> 수신거부</label></td>
                                        </div>  
                                    </tr>
                                <tr>
                                  <td>  SMS 수신 여부 :</td>
                                  <td><label><input class="custom-radio" type="radio" name="smsradio" value="수신동의" style="margin-left: 20px;"> 수신동의</label>
                                    <label><input class="custom-radio" type="radio" name="smsradio" value="수신거부"> 수신거부</label></td>
                                </tr>
                                </table>
                                        
                                      
                                       
                                        <br><br>
                                        <br><br>
                                       
                                        <br><br>
                                        
                                        <br><br>
                                        
                                        <br><br>
                                     
                                       
                                        <br><br>
                                       
                                      
                                        <br><br>
                                      
                                        
                                     </div><!-- editArea끝 -->
                                 </div><!-- editBox끝 -->
                                 <div id="buttonArea"  class="d-flex">
                                 <input type="reset" value="취소하기" id="cancelbutton" />
                                 <button id="changebutton">변경하기</button>
                                </div>
                                </form> 

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
	<%@include file="../include/footer.jsp"%>
</div>
<!-- wrapper 끝 -->
</body>
</html>