<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<!-- 포토보드 전용 css 링크  -->
<link rel="stylesheet" href="../css/photoboard.css">
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
    .btn2 { display: none; }
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
    .btn2 { display: none; }
}
</style>
<script>
$(function() {
	$("#btn2").click(() => {
		location.href = "./photoboard_write.do";
	});
});
</script>
<style>
  .custom-col { flex: 0 0 25%; } 
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
                <h4>자유롭게 소통해보세요</h4>
                <div id="info_title" class="d-flex">
                    <h2>커뮤니티</h2>
                </div>
            </div>
            <img id="page_icon" src="../images/com.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 --> 
    <main>
        <div class="container">
            <div class="content_header_head">
                <a href="">
                    <span class="category_first_home">
                        홈
                    </span>
                </a>
                
                <a href="">
                    <span class="category_right">
                        >
                    </span>
                </a>
                <a href="">
                    <span class="category_first_community">
                        커뮤니티
                    </span>
                </a>
            </div>
            <!-- 커뮤니티 카테고리 -->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12" style="height: 30px;">
                        <ul class="categorymenu" style="float: left;">
                            <li><a href="./freeboard_list.do" id="1:1">자유게시판</a></li>
                            <li><a href="./photoboard_list.do" id="photoboardtext">사진게시판</a></li>
                            
                        </ul>
                    </div>
                </div>
            </div>
            </div>
            <!-- 글쓰기 버튼 -->
            <!-- 관리자만 글 쓸 수 있어야함 -->
            <div class="container">
                <div class="row" style=" float: right;">
                    <div class="col-sm-12" style="">
                        <div class="write_btn" style="float: left;">
                            <button type="button" class="btn rounded-0" style="margin-bottom: 40px; margin-top:-40px; margin-right: 20px;" id="btn2" 
                            onclick="location.href='./photoboard_write.do';">글쓰기</button>
                            
                        </div>
                    </div>
                </div>
            </div>
            
            
            <!-- 테이블 -->
            <div class="container">
            <div class="table_wrap" id="table_wrap">
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
							                    <a href="./photoboard_view.do?idx=${ entry.idx }">
							                        <img class="card-img-top" src="../uploads/${entry.sfile}" alt="이미지" style="width: 100%; height: 200px; object-fit: cover;">
							                    </a>
							                    <div class="card-body">
							                        <h4 class="card-title" style="font-size: 18px; text-align: left;">
							                            ${entry.nickname} <!-- 파일 이름 -->
							                        </h4>
							                        <p class="card-text" style="text-align: left;">
							                            ${ entry.title }
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
                
             
              <!-- 모바일 테이블 -->
             <table class="table table-border" id="mobiletable">
               
               		<tr style="text-align: center;" >
                        <td scope="col" style="width: 50%;">
                       	<c:choose>
                        <c:when test="${empty photolists}">
                            <tr>
                                <td colspan="1" align="center">등록된 게시물이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>	
                            <div class="row">
							    <c:forEach items="${photolists}" var="entry">
							        <div class="col-md-6">
							            <figure class="thumbnail">
							                <div class="card col custom-col" style="padding-right: 20px; border: none;">
							                    <a href="./photoboard_view.do?idx=${ entry.idx }">
							                        <img class="card-img-top" src="../uploads/${entry.sfile}" alt="이미지" style="width: 100%; height: 200px; object-fit: cover;">
							                    </a>
							                    <div class="card-body">
							                        <h4 class="card-title" style="font-size: 18px; text-align: left;">
							                            ${entry.nickname} <!-- 파일 이름 -->
							                        </h4>
							                        <p class="card-text" style="text-align: left;">
							                            ${ entry.title }
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
            </div>
        </div>


    <!-- 리스트 버튼 -->
    <div class="text-center">${pagingImg}</div>
    


    <!-- 게시판 검색 -->
    <form method="get" class="search_table" action="">  
        <table class="table"width="100%"  >
        <tr>
            <td align="center">
                <select name="searchField" class="searchField_list"> 
                    <option value="title">제목</option> 
                    <option value="content" >내용</option>
                </select>
                <input type="text" name="searchKeyword" class="searchWord_list" style="width: 300px;" />
                <input type="submit" value="검색하기" class="btn2 "/>
            </td>
        </tr>   
        </table>
    </form>
    </main>
</div>


 
    <!— main 끝 —>
    
    <!— footer 시작 —>
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!— wrapper 끝 —>
</body>
</html>