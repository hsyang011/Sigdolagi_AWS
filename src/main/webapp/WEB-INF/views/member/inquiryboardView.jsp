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

function deleteComment(comments_idx){
    var confirmed = confirm("정말로 댓글을 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm; 
        form.method = "post";  
        form.action = "./inquiryboard_Comments_delete.do";
        form.submit();  
    }
}


function SaveComment(){
	let frm = document.commentwriteFrm;
	console.log(frm.content.value);
    let data = {
    		
   		idx : frm.idx.value,
    	nickname : frm.nickname.value,
    	content : frm.content.value,
    	email : frm.email.value
    };
    //alert("댓글작성 "); // 여기에 alert 추가
    console.log(data);
    
    
    $.ajax({
        type: "post",
        url: "./inquiryboard_comment.do",
        data: data,
        success: function(res) {
            console.log("댓글작성 "+res.email);
            displayComment(res);
            content.value="";
        },
        error: function() {
            console.log("요청실패");
        }
    }); 
}

// 현재 날짜와 시간을 얻기 위한 함수
function getCurrentDateTime() {
    var now = new Date();

    // 날짜 및 시간을 원하는 형식으로 포맷팅
    var formattedDateTime = now.getFullYear() + '-' +
        padNumber(now.getMonth() + 1) + '-' +
        padNumber(now.getDate()) + ' ' +
        padNumber(now.getHours()) + ':' +
        padNumber(now.getMinutes()) + ':' +
        padNumber(now.getSeconds());

    return formattedDateTime;
}

// 숫자를 두 자리로 패딩하는 함수
function padNumber(number) {
    return (number < 10 ? '0' : '') + number;
}

// 댓글을 화면에 추가하는 함수
function displayComment(res) {
    // 받은 댓글 데이터를 이용하여 화면에 추가하는 로직을 작성
    console.log(res.email);
    console.log(res.inquiryboard_idx);
    console.log(res.content);
    /* var commentHTML =
        "<tr align=\"center\">" +
        "<td>" + res.nickname + "</td>" +
        "<td>" + res.content + "</td>" +
        "<td>" + getCurrentDateTime() + "<button class=\"dele\"  onclick='deleteComment(" + res.comments_idx + ")'></button></td>" +
        "</tr>"; */
    var commentHTML =
        "<tr align=\"left\">" +
        "	<td>" + res.content + "</td>" +
        "</tr>"+
        "<tr align=\"right\">" +
        "	<td>" + getCurrentDateTime() + "<button class=\"dele\"  onclick='deleteComment(" + res.comments_idx + ")'></button></td>" +
        "</tr>";
    // 화면에 댓글 추가
    $("#commentsTableBody").append(commentHTML);
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
            </div>
            <!-- 컨텐츠 헤더 끝 -->
            <div class="shop_board container  mt-5" >
                <!-- 문의 폼 -->
                <div class="container">
                    <div class="freeboard_write_frm">
                        <!-- 게시판 들어가는 부분 (시작) -->
                        <form name="writeFrm" method="post" onsubmit="return validateForm(this);" class="writeFrm" action="./inquiryboard_write.do">
                            <input type="hidden" name="tname"  />
                            <input type="hidden" name="inquiryboard_idx" value="${ inquiryDTO.inquiryboard_idx }" />
                            <input type="hidden" name="email"  />
                            <input type="hidden" name="nickname" />
                            <table class="table table-bordered" id="write_frm_table" width="90%">
                            <colgroup><col width="20%"><col width="30%"><col width="20%"><col width="30%"></colgroup>
                                <tr>
                                    <td>문의유형</td>
                                    <td>
                                        <%-- <input type="text" value="${inquiryDTO.category}" readonly> --%>
                                        ${inquiryDTO.category}
                                    </td>
                                    <td>작성일</td>
                                    <td>${inquiryDTO.postdate}</td>
                                </tr>
                                        <input type="hidden" name="email" id="email" value="${email}" style="width: 95%;" />
                                        <input type="hidden" name="nickname" id="nickname" value="${nickname}" style="width: 95%;" />
                                <!-- <tr>
                                    <td>이메일</td>
                                    <td>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>닉네임</td>
                                    <td>
                                    </td>
                                </tr> -->
                                
                                <tr>
                                    <td>제목</td>
                                    <td colspan="4">
                                        <%-- <input type="text" name="title" value="${inquiryDTO.title}" style="width: 95%;" readonly /> --%>
                                    	${inquiryDTO.title}
                                    </td>
                                </tr>
            
                                <tr>
                                    <td>내용</td>
                                    <td colspan="4" style="height: 300px;">
                                       <%--  <textarea name="content"  style="width: 95%; height: 300px;" readonly>${inquiryDTO.content}</textarea> --%>
                                        ${inquiryDTO.content}
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center" class="btn_td">
                                        <button type="button" class="writeFrm_list"  onclick="location.href='./mypage.do'">목록 보기</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        
                        <!-- 관리자로 로그인할 때 -->
	            		<s:authorize access="hasRole('ADMIN')">
                        <!--/* 댓글 작성 */-->
						<div class="cm_write" style="width:100%">
                       		<fieldset>
                       			<form name="commentwriteFrm" method="post" onsubmit="return validateForm(this);" action="/service/inquiryboard_comment.do" class="writeFrm">
                           		<legend class="skipinfo">답변 입력</legend>
                           			<div class="cm_input">
		                                <input type="hidden" name="idx" value="${inquiryDTO.inquiryboard_idx }">
		                                <input type="hidden" name="nickname" value="${inquiryDTO.nickname}">
		                                <input type="hidden" name="email" value="${email}">
		                               	<p><textarea id="content" name="content" onkeyup="" rows="4" placeholder="답변을 입력해 주세요."></textarea>
		                               	  	<button type="button" class="btns"  onclick="SaveComment();">등록</button></p>
		                             
                           			</div>
								</form>
	                       </fieldset>
	                   	</div>
	                   	</s:authorize>
	                   	
                        <!-- 댓글 리스트 -->
               			<table class="table table-border">
	                   		<thead>
		                       	<!-- <tr>
		                           <th style="text-align: center;">작성자</th>
		                           <th style="text-align: center;">내용</th>
		                           <th style="text-align: center;">작성일</th>	
		                           <th style="text-align: center;"></th>	
		                       	</tr> -->
	                   		</thead>
		                 	<tbody id="commentsTableBody">
							    <c:forEach items="${ CommentsLists }" var="row" varStatus="loop">    
						            <form name="commentsdeletefrm" action="/service/inquiryboard_Comments_delete.do" method="post">
							        	<tr align="left">
							                <input type="hidden" name="comments_idx" value="${row.comments_idx}" >
							                <%-- <td>${ row.nickname }</td>
											<td name="idx" style="text-align: center; display: none;">
										    	<input type="text" name="idx" value="${row.idx}">
											</td> --%>
                                            <td style="height: 30px">${row.content}</td>
							                <!-- <input type="button" value="삭제" onclick="deleteComment();"> -->
							        	</tr>
							        	<tr align="right">
							                <td>${ row.postdate } <button type="submit" class="dele"  onclick="deleteComment();">삭제</td>
							        	</tr>
						            </form>
							    </c:forEach> 
							</tbody>
						 </table>
                        
                        
                        
                        
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