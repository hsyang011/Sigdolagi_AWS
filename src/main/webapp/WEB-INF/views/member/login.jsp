<%--@page import="utils.CookieManager"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<!-- CSS -->
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
<!-- wrapper 시작 -->
<div class="container-fluid" id="wrap">

	<!-- header, nav 추가 -->
	<%@ include file="../include/top.jsp" %>
	
    <!-- main 시작 -->
    <div class="container-fluid" style="height: 1000px;" id="content-wrap"> <!-- style 속성은 제거합니다. -->
        
        <!-- 배너 -->
        <!-- <div class="banner">
            <div class="title-wrap">
                <div class="banner_title">
                    <div class="container">
                        <div class="first_title">
                            식도라기 회원이라면..
                        </div>
                        <div class="second_title">
                            로그인
                        </div>
                        <img src="../images/loginBannerIcon.png" class="img_banner" >
                    </div>
                </div>
            </div>
        </div> -->

        <div id="banner" class="mt-3">
            <div id="banner_contents" class="container d-flex align-items-center">
                <div id="info">
                    <h4>식도라기 회원이라면..</h4>
                    <div id="info_title" class="d-flex">
                        <h2>로그인</h2>
                    </div>
                </div>
                <img id="page_icon" src="../images/loginBannerIcon.png">
            </div>
        </div>


        <!-- 로그인 폼 -->
       	<form action="../member/loginprocess1.do" method="post">
        <div class="container">
           <div class="login">
               	<div class="loginFrm">
               	
               	<c:choose>
               		<c:when test="${not empty email }">
               			로그인 성공
               		</c:when>
               		<c:otherwise>
	               		 <div class="loginInput">
	                      <input type="text" class="id" value="<%--=CookieManager.readCookie(request,"SavedEmail")--%>" name="email" placeholder="이메일"> 
	                        <br>
	                        <input type="password" class="pw" name="password"  placeholder="비밀번호">
	                    </div>
	                    <div class="submitFrm">
	                        <input type="submit" class="submitBtn" value="로그인">
	                        
	                        
	                        <c:if test="${not empty loginErrorMessage}">
						    	<div style="color: red;">${loginErrorMessage}</div>
							</c:if>
	                        
	                    </div>
               		</c:otherwise>
               	</c:choose>
              	
                   
                   
                </div>
           </div>
        </div>

        <!-- 저장, 찾기 -->
        <div class="container">
            <div class="login_sub">
                <div class="login_sub_list">
                    <div class="saveId_btn">
                        <label for="savedEmail">
                            <input type="checkbox" name="savedEmail" value="1" id="savedEmail" <%--=CookieManager.readCookie(request, "ischecked")--%>> 이메일 저장
                        </label>
                    </div>
                    <div class="find_id">
                        <a href="../member/findIdpw.do">아이디/비밀번호 찾기 ></a>
                    </div>
                    <div class="join">
                        <a href="../member/regist.do">회원가입 ></a>
                    </div>
                </div>
            </div>
        </div>
         </form>

        <div class="container">
            <div class="loginAD">
                <a href="#">
                    <div class="kaPay_ad">
                        <div class="kaPay_title">
                            <span>카카오톡</span> 으로 로그인
                        </div>
                        <div class="kaPay_Icon">
                            <i><img src="../images/free-icon-kakao-talk-2111466.png"></i>
                        </div>
                    </div>
                </a>
                <a href="#">
                    <div class="plan_ad">
                        <div class="plan_title">
                            나만의 <span>플래너</span> 작성!
                        </div>
                        <div class="plan_btn">
                            <button type="button">
                                작성하기
                            </button>
                        </div>
                    </div>
                </a>
                <a href="#">
                    <div class="market_ad">
                        <div class="market_title">
                            우리집을 <span>맛집</span> 으로!
                        </div>
                        <div class="market_btn">
                            <button type="button">
                                마켓보기
                            </button>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        
    </div>
    <!-- main 끝 -->
    
    <!-- footer 추가 -->
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!-- wrapper 끝 -->
</body>
</html>