<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/common_board.css">
<style>
    

</style>
<script>
$(function() {
	$("#writeBtn").click(() => {
		location.href = "./freeboard_write.do";
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
                          <a class="nav-link" href="#">커뮤니티</a>
                        </li>
                    </ul>
                </div>
                <!-- 네비로케이션 끝 -->
                <!-- 헤더제목 -->
                <ul class="catemenu d-flex">
                    <li class="on"><a href="./freeboard_list.do">자유게시판</a></li>
                    <li><a href="./photoboard_list.do">사진게시판</a></li>
                </ul>
            </div>
            <!-- 컨텐츠 헤더 끝 -->
        <div class="shop_board container  mt-5" >

        <!-- 글쓰기 버튼 -->
        <div class="container">
            <div class="row" style=" display: inline;
            float: right; margin-top: -80px;">
                <div class="col-sm-12" >
                    <div class="write_btn" style="float: left;">
                        <button type="button" id="writeBtn" class="btn rounded-pill" onclick="location.href='./freeboard_write.do';" >글쓰기</button>
                    </div>
                </div>
            </div>
        </div>    
        <!-- 문의 폼 -->
        <!-- 테이블 -->
     
     
     
		  
        <div class="container" id="cont_wrap">
            <div class="table_wrap" id="table_wrap">
            <table class="table table-border">
                <thead>
                <tr style="text-align: center;" >

                    <th scope="col">번호</th>
                    <th scope="col" style="width: 60%;">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회</th>
                </tr>
                </thead>
                <tbody>
                	<tr>
                	<c:choose>
                		<c:when test="${ empty lists }">
						<tr>
							<td colspan="5" align="center"> 등록된 게시물이 없습니다.</td>
						</tr>
						</c:when>
					<c:otherwise>
						<c:forEach items="${ lists }" var="post" varStatus="loop">
							<tr align="center">
							<td>
							<!-- 게시물의 갯수, 페이지 번호, 페이지 사이즈를 통해 가상 번호를 계산해서 출력한다.  -->
							${ maps.totalCount - (((maps.pageNum-1) * maps.pageSize) + loop.index)}
							</td>
							<td scope="row"><a href="./freeboard_view.do?freeboard_idx=${ post.freeboard_idx }">${ post.title }</td>

							<td>${ post.nickname }</td>
							<td>${ post.postdate }</td>
							<td>${ post.visitcount }</td>		
							</tr> 
						</c:forEach>
					</c:otherwise>
					</c:choose>
			
                </tbody>
            </table>
            </div>
        </div>

         <div class="text-center">${pagingImg}</div>
     
      

        <!-- 게시판 검색 -->
        <form method="get" class="search_table">  
            <table class="table" width="100%" >
            <tr>
                <td align="center">
                    <select name="searchField" class="searchField"> 
                        <option value="title">제목</option> 
                        <option value="nickname">작성자</option>
                    </select>
                    <input type="text" name="searchKeyword" class="searchKeyword" />
                    <input type="submit" value="검색하기" class="btn2 "/>
                </td>
            </tr>   
            </table>
        </form>

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