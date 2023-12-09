<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식도라기</title>
<!-- Boot -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Icon -->
<script src="https://kit.fontawesome.com/98401b861d.js" crossorigin="anonymous"></script>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- 전역설정 CSS -->
<!-- <link rel="stylesheet" href="/css/common.css"> -->
<style>
/* font 설정 */
@font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
@font-face {
    font-family: 'NPSfontExtraBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontExtraBold.woff2') format('woff2');
    font-weight: 800;
    font-style: normal;
}
@font-face {
    font-family: 'NPSfontRegular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontRegular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

/* global 설정 */
* { margin: 0; padding: 0; }
li{ list-style: none; }
a{ text-decoration: none; color: gray; }
a:hover { color: #FF7A00; }
.container-fluid{ padding-left: 0; padding-right: 0; padding: 0;line-height:20px; }

/* header 설정 */
.navbar{ margin: 0; }
.topmenu{ margin-top: 10px; padding: 0; float: right; }
.topmenu li{ display: inline-block; text-align: center; font-size: 14px; padding: 0 5px; }
.topmenu a:hover{ color: #000; font-weight: bold; }
#myinfo { max-width: 60%; }
#m_link li { margin: 20px 0; }
#btn_more { position: absolute; top: 10px; right: 10px; transform: scale(0.7) }
#header_box { height: 30px; }

/* nav 설정 */
#logo { width: 20%; text-align: center; line-height: 100px; } 
.main_nav{ border-bottom: 3px solid #FF7A00; background-color: white; z-index: 1000; }
.head_nav a{ font-size: 1.2em; color: #000; font-family: 'NPSfontBold';}
.head_nav a:hover{ color: #FF7A00; font-weight: bold;}
.top_logo { width: 100%; line-height: 100px; min-width: 100px; max-width: 220px;}
/* mobile_navbar 설정 */
#mobile_navbar { position: -webkit-sticky; position: sticky; top: 0; padding: 5px 10px; background-color: white; z-index: 1000; }

/* search form 설정 */
.seach_bar{ border: 3px solid #FF7A00; border-radius: 30px; background-color: white; padding: 5px; margin: 0px 20px; width: 33%;}
.form-control:focus { border-color: initial; box-shadow: none; }
#btn_more:hover { border: 3px solid #FF7A00; box-shadow: none; }
.seach_bar input::placeholder{ font-family: 'NPSfontRegular'; text-align: center;}
.seach_bar input{ border: 0px solid white; width: 100%; height: 25px; }
.seach_bar button{ border: 0px solid white; background-color: white; border-radius: 50px;}
.seach_bar i { color: #FF7A00; margin-right: 5px;}

/* banner 설정 */
#banner { height: 240px; background-color: #FFA24D }
#banner * { font-family: "NPSfontRegular";  color: white; }
#banner h4 { font-size: 1.5em; }
#banner h2 { font-family: "NPSfontExtraBold"; font-size: 3em; }
#banner_contents { padding: 30px 130px; }
#banner #page_icon { float: right; height: 200px; }

/* main 설정 */
main > * { margin: 50px 0; font-family: "NPSfontRegular"; }

/* footer 설정 */
footer { border-top:3px solid #FF7A00; background-color: white;padding-top: 0; }
#footer-nav li { margin: 0 45px; }
#footer-nav li a { font-size: 0.75em; }
#footer-nav ul { padding-left: 0; }
.foot_nav { font-size: 0.75em; text-align: center; }
.foot_nav li { padding: 0 30px; }
.foot_logo { max-width: 320px;text-align: center; }
.foot_logo img{ width: 60%; }
.foot_info_box { background-color: white;}
.foot_info p { font-size: 0.75em; width: 100% }
.foot_icon { padding: 0; }
.foot_icon img { width: 30px; }
.foot_icon li {  margin-right: 10px; }
.foot_icon_text { text-align: right; font-family: 'NPSfontExtraBold'; }
.foot_icon_text span{ color: #FF7A00; }

/* pc environment */
@media screen and (min-width:1201px) {
    #mobile_slider { display: none; }
    #mobile_navbar { display: none; }
    #banner_contents { justify-content: space-between; }
    #sticky_top { position: -webkit-sticky; position: sticky; top: -2px; }
}

/* mobile environment */
/* 화면크기 최대 1200px까지 */
@media screen and (max-width:1200px) {
    #logo {
        width: 100%; /* 로고 너비를 100%로 설정하여 가로 중앙에 배치 */
        text-align: center;
        height: 50px;
        position: relative;
        top: -30px;
    }
    #logo a img { width: 20%; margin-left: 20px; } /* 로고 위치 조정 */
    .seach_bar{ width: 100%; margin: 0 5px; }
    #mobile_navbar ul li { margin: 0 auto; }
    header { display: none; } /* header는 안보이게 처리 */
    #pc_navbar { display: none; }
    .main_nav{ border-bottom: none; background-color: white; }
    #mobile_navbar { border-bottom: 3px solid #FF7A00; padding: 10px; }

    #banner { height: 160px; }
    #banner #page_icon { display: none; }
    #banner_contents { justify-content: center; padding: 30px; height: 160px; }
    #banner_contents #info_title { justify-content: center; }
    #banner h4 { font-size: 1em; }
    #banner h2 { font-size: 1.5em; }
}
/* 화면크기 최대 768px까지 */
@media screen and (max-width:768px) {
    .foot_logo { display: none;}
    #mobile_navbar { font-size: 0.65em; }
    #img_footer_logo{ display: none; }
    #img_footer_icon{ display: none; }
    .seach_bar input::placeholder{ font-size: 0.8em; }
}

/* 화면크기 최소641px 부터 1120px까지 */
@media screen and (min-width: 641px) and (max-width:1120px) {
    .container-fluid { line-height:25px;}
    #footer-nav li { margin: 0 20px; }
    .foot_logo{ display: none;}
    #row_footer{ width: 100%;text-align: center;}
    #img_footer_icon{ display: none;}
}

/* 화면크기 최소 481px 부터 최대 660px까지 */
@media screen and (min-width: 481px) and (max-width: 660px) {
    .foot_logo{ display: none; }
    #footer-nav li { margin: 0 10px; }
    .container-fluid { line-height: 1.3; }
    #row_footer{ text-align: center;}
    #img_footer_icon{  display: none;}
}

@media screen and (max-width:480px) {
    .foot_logo{ display: none; }
    /* #footer-nav li a { font-size: 0.5em; } */
    #footer-nav li { margin: 0 5px; }
    .container-fluid { line-height: 1.3; }
    #row_footer{ text-align: center;}
    #img_footer_icon{  display: none;}
}
</style>