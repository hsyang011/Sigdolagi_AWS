<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디/비번 찾기</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/98401b861d.js" crossorigin="anonymous"></script>
<!-- 전역 설정 css 링크  -->
<link rel="stylesheet" href="../css/find_idpw.css">
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
                <h4>아이디와 비번이 생각나지 않나요?</h4>
                <div id="info_title" class="d-flex">
                    <h2>아이디/비번 찾기</h2>
                </div>
            </div>
            <i id="page_icon">
                <svg width="195" height="195" viewBox="0 0 195 195" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M89.375 97.5C80.4375 97.5 72.7865 94.3177 66.4219 87.9531C60.0573 81.5885 56.875 73.9375 56.875 65C56.875 56.0625 60.0573 48.4115 66.4219 42.0469C72.7865 35.6823 80.4375 32.5 89.375 32.5C98.3125 32.5 105.964 35.6823 112.328 42.0469C118.693 48.4115 121.875 56.0625 121.875 65C121.875 73.9375 118.693 81.5885 112.328 87.9531C105.964 94.3177 98.3125 97.5 89.375 97.5ZM89.375 81.25C93.8438 81.25 97.6706 79.6602 100.856 76.4806C104.041 73.301 105.63 69.4742 105.625 65C105.625 60.5312 104.035 56.7071 100.856 53.5275C97.676 50.3479 93.8492 48.7554 89.375 48.75C84.9062 48.75 81.0821 50.3425 77.9025 53.5275C74.7229 56.7125 73.1304 60.5367 73.125 65C73.125 69.4688 74.7175 73.2956 77.9025 76.4806C81.0875 79.6656 84.9117 81.2554 89.375 81.25ZM179.563 190.938L153.562 164.937C150.719 166.562 147.672 167.917 144.422 169C141.172 170.083 137.719 170.625 134.062 170.625C123.906 170.625 115.275 167.072 108.168 159.965C101.061 152.858 97.5054 144.224 97.5 134.062C97.5 123.906 101.056 115.275 108.168 108.168C115.28 101.061 123.912 97.5054 134.062 97.5C144.219 97.5 152.853 101.056 159.965 108.168C167.077 115.28 170.63 123.912 170.625 134.062C170.625 137.719 170.083 141.172 169 144.422C167.917 147.672 166.562 150.719 164.937 153.562L190.938 179.563L179.563 190.938ZM134.062 154.375C139.75 154.375 144.557 152.411 148.484 148.484C152.411 144.557 154.375 139.75 154.375 134.062C154.375 128.375 152.411 123.568 148.484 119.641C144.557 115.714 139.75 113.75 134.062 113.75C128.375 113.75 123.568 115.714 119.641 119.641C115.714 123.568 113.75 128.375 113.75 134.062C113.75 139.75 115.714 144.557 119.641 148.484C123.568 152.411 128.375 154.375 134.062 154.375ZM24.375 162.5V139.953C24.375 135.349 25.526 131.083 27.8281 127.156C30.1302 123.229 33.3125 120.25 37.375 118.219C44.2812 114.698 52.0677 111.719 60.7344 109.281C69.401 106.844 79.0156 105.625 89.5781 105.625C87.9531 108.063 86.5638 110.671 85.41 113.449C84.2563 116.228 83.3435 119.104 82.6719 122.078C74.5469 122.755 67.3021 124.145 60.9375 126.246C54.5729 128.348 49.224 130.547 44.8906 132.844C43.5365 133.521 42.4883 134.504 41.7463 135.793C41.0042 137.082 40.6304 138.469 40.625 139.953V146.25H82.6719C83.349 149.229 84.2644 152.073 85.4181 154.781C86.5719 157.49 87.9585 160.062 89.5781 162.5H24.375Z" fill="white"/>
                </svg>
            </i>
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>

        <div class="container" style="height: 2000px;">
            <div class="find_idpw">
                <div class="find_id">
                    <div class="find_id_title">
                        <h2>아이디 찾기</h2>
                        <div class="title_line"></div>
                    </div>
                    <form action="" method="post">
                        <div class="find_id_frm">
                            <h4>연락처</h4>
                            <input type="text" class="input_phone1" maxlength="3">&nbsp;-
                            <input type="text" class="input_phone2" maxlength="4">&nbsp;-
                            <input type="text" class="input_phone3" maxlength="4">
                        </div>
                        <div class="find_sub_btn">
                            <input type="submit" value="아이디 찾기">
                        </div>
                    </form>
                </div>
                <div class="find_pw">
                    <div class="find_pw_title">
                        <h2>비밀번호 찾기</h2>
                        <div class="title_line2"></div>
                    </div>
                    <form action="" method="post">
                        <div class="find_pw_frm">
                            <h4>아이디</h4>
                            <input type="text" class="input_id2">
                            <h4 style="margin-top: 3%;">연락처</h4>
                            <input type="text" class="input_phone1" maxlength="3">&nbsp;-
                            <input type="text" class="input_phone2" maxlength="4">&nbsp;-
                            <input type="text" class="input_phone3" maxlength="4">
                        </div>
                        <div class="find_sub_btn2">
                            <input type="submit" value="비밀번호 찾기">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </main>
    <!-- main 끝 -->
    
    <!-- footer 추가 -->
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!-- wrapper 끝 -->
</body>
</html>