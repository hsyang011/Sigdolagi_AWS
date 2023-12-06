<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- head 추가 -->
<%@ include file="../include/global_head.jsp" %>
<!-- 포토보드 전용 css 링크  -->
<link rel="stylesheet" href="../css/photoboard.css">
<script>
$(function() {
	$("#btn2").click(() => {
		location.href = "./photoboard_write.do";
	});
});
</script>
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
                            <li><a href="./photoboard_list.do" id="photoboardtext">포토게시판</a></li>
                            
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
                            <button type="button" class="btn rounded-0" style="margin-bottom: 40px; margin-top:-40px; margin-right: 20px;" id="btn2">글쓰기</button>
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
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                      </tr>
                      <tr style="text-align: center;" >
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                      </tr>
                      <tr style="text-align: center;" >
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                      </tr>
              </table>
              <!-- 모바일 테이블 -->
              <table class="table table-border" id="mobiletable">
                
               
                    <tr style="text-align: center;" >
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                      </tr>

                      <tr style="text-align: center;" >
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                        <td scope="col" style="width: 25%;">
                            <figure class="row thumbnail">
                                <!-- 1열 시작 -->
                                <div class="card col" style="padding-right: 20px; border: none;"> <!-- 오른쪽 패딩 추가, 테두리 없앰 -->
                                    <img class="card-img-top" src="http://placehold.it/200x200" alt="이미지" alt="Card image">
                                    <div class="card-body ">
                                        <h4 class="card-title" style="font-size: 18px; text-align: left;">게시판타이틀</h4>
                                        <p class="card-text" style="text-align: left;">닉네임</p>
                                    </div>
                                </div>
                                <!-- 1열 끝 -->
                            </figure>
                        </td>
                      </tr>
            
              </table>
            </div>
        </div>


    <!-- 리스트 버튼 -->
    <div class="container d-flex justify-content-center">
        <div class="row">
            <div class="col-12 d-flex justify-content-between" style="margin: 0 85px;">
                <div class="list_btn">
                    <button type="button" class="btn"> &lt; </button>
                    <button type="button" class="btn" id="btn1"> 1 </button>
                    <button type="button" class="btn" id="btn1"> 2 </button>
                    <button type="button" class="btn" id="btn1"> 3 </button>
                    <button type="button" class="btn"> &gt; </button>
                </div>
            </div>
        </div>
    </div>
    


    <!-- 게시판 검색 -->
    <form method="get" class="search_table">  
        <table class="table"width="100%"  >
        <tr>
            <td align="center">
                <select name="searchField_list" class="searchField_list"> 
                    <option value="title">제목</option> 
                    <option value="content" >내용</option>
                </select>
                <input type="text" name="searchWord_list" class="searchWord_list" style="width: 300px;" />
                <input type="submit" value="검색하기" class="btn2 "/>
            </td>
        </tr>   
        </table>
    </form>
    </main>
</div>


 
    <!-- main 끝 -->
    
    <!-- footer 시작 -->
    <%@ include file="../include/footer.jsp" %>
    
</div>
<!-- wrapper 끝 -->
</body>
</html>