<%@page import="com.edu.springboot.community.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>식도라기 - 상세보기</title>
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

</style>

<script>
function deletePost(freeboard_idx){
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "post";  
        form.action = "./freeboard_delete.do";
        form.submit();  
    }
}

// 댓글 길이 카운팅
function countingLength(content) {
    if (content.value.length > 300) {
        alert('댓글을 300자 이하로 입력해 주세요.');
        content.value = content.value.substring(0, 300);
        content.focus();
    }
    document.getElementById('counter').innerText = content.value.length + '/300자';
}


// 댓글 저장
function saveComment() {
	 var content = $('#content').val();
     var email = $('#email').val();
   /*  const content = document.getElementById('content');
    isValid(content, '댓글');

    const comment_id = [[ ${post.comment_id} ]]; */
    const params = {
        content : content,
        email : email
    }

    $.ajax({
        url : `/posts/${freeboard_idx}/comments`,
        type : 'post',
        contentType : 'application/json; charset=utf-8',
        dataType : 'json',
        data : JSON.stringify(params),
        async : false,
        success : function (response) {
            console.log(response);
        },
        error : function (request, status, error) {
            console.log(error)
        }
    })
}

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
                <h4>자유롭게 소통하세요</h4>
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

                <!-- 문의 폼 -->
                <div class="container">
                    <div class="freeboard_write_frm" >
                        <!-- 게시판 들어가는 부분 (시작) -->
                        <form name="writeFrm" method="post" onsubmit="return validateForm(this);" action="../community/freeboard_view.do" class="writeFrm">
                          <input type="hidden" name="freeboard_idx" value="${ boardDTO.freeboard_idx }" />
                            <input type="hidden" name="email"  />
                            <input type="hidden" name="nickname" />	
                            <table class="table table-bordered" id="free_write_frm_table" width="100%" >
                               <colgroup>
                                   <col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" />
                                   
                                </colgroup>
	                         <tr> 
	                             <td>작성일</td> <td>${ boardDTO.postdate }</td>
	                             <td>조회수</td> <td>${ boardDTO.visitcount }</td>
	                         </tr>
	                                <tr>
	                             <td>작성자</td>
	                             <td colspan=3>${ nickname1 }</td> <%-- 번호<td>${ boardDTO.freeboard_idx }</td>   --%> 
	                     
	                         </tr>
	                         <tr>
	                             <td>제목</td>
	                             <td colspan="3">${ boardDTO.title }</td>
	                         </tr>
	                                <tr>
	                             <td>내용</td>
	                             <td colspan="3" height="100">
	                                ${ boardDTO.content }              
	                             </td>
	                         </tr>
                       
                                <tr>
                                    <td colspan="4" align="center" class="btn_td">
                                        <button type="button" class="writeFrm_edit" onclick="location.href='./freeboard_edit.do?freeboard_idx=${boardDTO.freeboard_idx }';">수정하기</button>
                                        <form id="deleteForm" action="./community/freeboard_delete.do" method="post">

                                          	<input type="hidden" name="freeboard_idx" value="${param.freeboard_idx }"  />
                                			<button type="button" class="writeFrm_reset"  onclick="deletePost(${boardDTO.freeboard_idx});">삭제하기</button>
								       	</form>

                                        <button type="button" class="writeFrm_list" onclick="location.href='./freeboard_list.do';">목록 보기</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        
                        <!--/* 댓글 작성 */-->

                   <div class="cm_write" style="width:100%">
                       <fieldset>
                        <form name="writeFrm" method="post" onsubmit="return validateForm(this);" action="/community/freeboard_comment.do" class="writeFrm">
                           <legend class="skipinfo">댓글 입력</legend>
                           <div class="cm_input">
                               <p><textarea id="content" name="content" onkeyup="countingLength(this);"  style="width:100%" rows="4" placeholder="댓글을 입력해 주세요."></textarea></p>
                               <span><button type="button" class="btns" onclick="saveComment();">등록</button> <i id="counter">0/300자</i></span>
                           </div>
                           </form>
                       </fieldset>
                   </div>
                      <c:forEach items="${ CommentsLists }" var="row" varStatus="loop">    
                             <tr align="center">
                                 <td>${ row.email }</td> 
                                 <td>${ row.freeboard_idx }</td> 
                                  <td>${ row.content }</td> 
                                 <td>${ row.postdate }</td> 
                                 <td>${ row.comment_idx }</td> 
                                 <form action="./hitsplus.do?idx=${ row.idx }" method="post">
                                    <td><button>좋아요</button>${ row.hits }</td>
                                 </form>
                                <br />
                             </tr>
                          </c:forEach> 

					

                 
                  
                  </div>
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