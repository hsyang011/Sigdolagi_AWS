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
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/common_board.css">


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
</script>
<script>

function deleteComment(comments_idx){
    var confirmed = confirm("정말로 댓글을 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm; 
        form.method = "post";  
        form.action = "./freeboard_Comments_delete.do";
        form.submit();  
    }
}



</script>

<script>

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
        url: "./freeboard_comment.do",
        data: data,
        success: function(res) {
            console.log("댓글작성 "+res.email);
            location.reload();
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
        console.log(res.freeboard_idx);
        console.log(res.content);
        var commentHTML =
            "<tr align=\"center\">" +
            "<td>" + res.nickname + "</td>" +
            "<td>" + res.content + "</td>" +
            "<td>" + getCurrentDateTime() + "<button class=\"dele\"  onclick='deleteComment(" + res.comments_idx + ")'></button></td>" +
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
                       		<input type="hidden" name="tname"  />
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
		                             <td colspan=3>${ boardDTO.nickname }</td> <%-- 번호<td>${ boardDTO.freeboard_idx }</td>   --%> 
		                     
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
                       			<form name="commentwriteFrm" method="post" onsubmit="return validateForm(this);" action="/community/freeboard_comment.do" class="writeFrm">
                           		<legend class="skipinfo">댓글 입력</legend>
                           			<div class="cm_input">
		                                <input type="hidden" name="idx" value="${boardDTO.freeboard_idx }">
		                                <input type="hidden" name="nickname" value="${boardDTO.nickname}">
		                                <input type="hidden" name="email" value="${email}">
		                               	<p><textarea id="content" name="content" onkeyup="" rows="4" placeholder="댓글을 입력해 주세요."></textarea>
		                               	  	<button type="button" class="btns"  onclick="SaveComment();">등록</button></p>
		                             
                           			</div>
								</form>
	                       </fieldset>
	                   </div>
	                   
	                   <table class="table table-border">
	                   		<thead>
		                       	<tr>
		                           <th style="text-align: center;">작성자</th>
		                           <th style="text-align: center;">내용</th>
		                           <th style="text-align: center;">작성일</th>

		                       	</tr>
	                   		</thead>
			                 <tbody id="commentsTableBody">
							    <c:forEach items="${ CommentsLists }" var="row" varStatus="loop">    
							        <tr align="center">
							            <form name="commentsdeletefrm" action="/community/freeboard_Comments_delete.do" method="post">
							                <input type="hidden" name="comments_idx" value="${row.comments_idx}" >
							                <td>${ row.nickname }</td>
											<td name="idx" style="text-align: center; display: none;">
										    <input type="text" name="idx" value="${row.idx}">
											</td>
                                            <td>${row.content}</td>
							                <td>${ row.postdate } <button type="submit" class="dele"  onclick="deleteComment();">삭제</td>
							                <!-- <input type="button" value="삭제" onclick="deleteComment();"> -->
							            </form>
							        </tr>
							    </c:forEach> 
							</tbody>
						</table>
					</div>
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