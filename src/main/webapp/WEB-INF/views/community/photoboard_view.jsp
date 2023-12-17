<%@ page import="java.security.Principal" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>식도라기 - 글쓰기</title>
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
        /* 메인 스타일 */
        .nav_locat {
            font-family: 'NPSfontRegular';
            margin-left: -10px;
        }

        .nav_locat li a {
            color: #FF7A00;
        }

        .nav_locat li a:hover {
            color: #484848;
        }

        .nav_locat li:first-child::before {
            content: " ";
        }

        .nav_locat li::before {
            content: ">";
            float: left;
            color: #ccc;
            margin-top: 9px;
            margin-left: -3px;
        }

        .catemenu {
            font-size: 1.6em;
            padding: 0;
            margin: 20px 0;
        }

        .catemenu li {
            border-bottom: 3px solid #999999;
            padding: 10px;
            margin-right: 10px;
        }

        .catemenu a {
            color: gray;
            padding-bottom: 5px;
        }

        .catemenu .on {
            border-bottom: 3px solid #FF7A00;
        }

        .mealk_cate {
            background-color: #dadada;
            color: white;
        }

        .category .on {
            background-color: #FF7A00;
            color: white;
        }

        .meal_seach_bar {
            border: 3px solid #FF7A00;
            border-radius: 30px;
            background-color: white;
            padding: 5px;
            margin: 50px auto;
            width: 40%;
        }

        .meal_seach_bar input {
            border: 0px solid white;
            width: 100%;
            height: 40px;
        }

        .meal_seach_bar input::placeholder {
            font-family: 'NPSfontRegular';
            text-align: center;
            margin-left: -75px;
        }

        .meal_seach_bar button {
            border: 0px solid white;
            background-color: white;
            border-radius: 50px;
        }

        .meal_seach_bar i {
            color: #FF7A00;
            margin-right: 5px;
            width: 60px;
        }

        main > * {
            margin: 50px 0;
        }

        /* 12/01 수정사항 - 한서 */
        @media screen and (min-width: 1201px) {
            .custom-col {
                flex: 0 0 25%;
            }
        }

        /* 모바일 환경에서 카테고리를 횡스크롤로 구현 */
        @media screen and (max-width: 1200px) {
            .category {
                overflow: auto;
                white-space: nowrap;
                flex-wrap: nowrap;
            }

            .category::-webkit-scrollbar {
                display: none;
            }

            .custom-col {
                flex: 0 0 25%;
            }

            .meal_seach_bar {
                width: 100%;
            }
        }

        @media screen and (max-width: 768px) {
            .custom-col {
                flex: 0 0 50%;
            }

            .mealk_cate {
                font-size: 0.8em;
            }
        }
    </style>


<script>

function deletePost(photoboard_idx){
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;      
        form.method = "post";  
        form.action = "./photoboard_delete.do";
        form.submit();  
    }
}




function commentDelete(comments_idx){
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {http://localhost:8586/community/photoboard_view.do?idx=191
        var form = document.deleteForm;      
        form.method = "post";  
        form.action = "./photoboardcommnt_delete.do";
        form.submit();  
    }
}


function CommentSend(){
	let frm = document.commentwriteFrm;
	console.log(frm.content.value);
    let data = {
    		
    	idx : frm.idx.value,
    	nickname : frm.nickname.value,
    	content : frm.content.value,
    	email : frm.email.value,
    	starRating : frm.starRating.value
    	
    };
    //alert("댓글작성 "); // 여기에 alert 추가
    console.log(data);
    
    
    $.ajax({
        type: "post",
        url: "./photoboard_comment.do",
        data: data,
        success: function(res) {
            console.log("댓글작성 "+res.email);
            console.log("댓글 작성 후 서버 응답 데이터:");
            console.log(res);
            // 댓글 작성 성공 후 페이지 새로고침
            location.reload();
            displayComment(res);
           	
        },
        error: function() {
            console.log("요청실패");
        }
    }); 
}
</script>

<script>
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
        console.log(res.idx);
        console.log(res.content);
        var commentHTML =
            "<tr align=\"center\">" +
            "<td>" + res.nickname + "</td>" +
            "<td>" + res.idx + "</td>" +
            "<td name=\"comments_idx\">" + res.comments_idx + "</td>" +
            "<td>" + res.content + "</td>" +
            "<td>" + getCurrentDateTime() + "</td>" +
            "<td>" + res.comments_idx + "</td>" +
            "<td>" + res.starRating + "</td>" +
            "<td><button onclick='deleteComment(" + res.comments_idx + ")'>삭제</button></td>" +
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

        <br><br><br>
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
                        <li><a href="./freeboard_list.do">자유게시판</a></li>
                        <li class="on"><a href="./photoboard_list.do">사진게시판</a></li>
                    </ul>
                </div>
                <!-- 컨텐츠 헤더 끝 -->
                <div class="board_write container mt-5">
                    <!-- 글쓰기 폼 -->
                    <div class="container">
                        <div class="freeboard_write_frm">
                            <!-- 게시판 들어가는 부분 (시작) -->
                            <form name="writeFrm" method="post" onsubmit="return validateForm(this);" class="writeFrm" enctype="multipart/form-data">
                                <input type="hidden" name="tname"  />
                                <input type="hidden" name="idx" value="${photoBoardDTO.idx }" />
                                <table class="table table-bordered" id="free_write_frm_table" width="100%" >
                                  <colgroup>
                                   		<col width="20%" /><col width="30%" /><col width="20%" /><col width="30%" />
                                	</colgroup>
                                   	<tr> 
		                             	<td>작성일</td> <td>${ photoBoardDTO.postdate }</td>
		                             	<td>조회수</td> <td>${ photoBoardDTO.visitcount }</td>
									</tr>
									<tr>
		                             	<td>작성자</td>
		                             	<td colspan=3>${ photoBoardDTO.nickname }</td>  
									</tr>
                                    <tr>
                                        <td>제목</td>
                                        <td colspan="3">${photoBoardDTO.title}</td>
                                    </tr>
                                    <tr>
                                        <td>내용</td>
                                        <td colspan="3">
                                            <img width="30%"  class="card-img-top" src="../uploads/${photoBoardDTO.sfile}" alt="이미지">
                                            <textarea id="" name="content" readonly>${photoBoardDTO.content}</textarea>
                                        </td>
                                    </tr>
                                    
                                    
                                    <tr>
                                        <td colspan="4"  align="center" class="btn_td">
                                            <button type="button" class="writeFrm_edit" onclick="location.href='./photoboard_edit.do?idx=${photoBoardDTO.idx }';">수정하기</button>
                                            <button type="button" class="writeFrm_reset"  onclick="deletePost();">삭제하기</button>
                                            <button type="button" class="writeFrm_list" onclick="location.href='./photoboard_list.do'">목록 보기</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
							
							
                            <div class="cm_write" style="width:100%">
                                <fieldset>
                                    <form name="commentwriteFrm" method="post"  action="/community/photoboard_comment.do" class="writeFrm">
                                        <legend class="skipinfo">댓글 입력</legend>
                                        <div class="cm_input">
                                            <input type="text" name="idx" value="${photoBoardDTO.idx }">
                                            <input type="text" name="nickname" value="${nickname}">
                                            <input type="text" name="email" value="${email}">
                                            <p><textarea id="content" name="content" onkeyup=""  style="width:100%" rows="4" placeholder="댓글을 입력해 주세요."></textarea></p>
                                            ★별점 <input style="width: 30px;" id="starRating" name="starRating" value="5">
                                            <span><button type="button" class="" onclick="CommentSend();">등록</button> <i id="counter">0/300자</i></span>
                                        </div>
                                    </form>
                                </fieldset>
                            </div>
                            
		
                            <table class="table table-border">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;">Nickname</th>
                                         <!-- <th style="text-align: center;">Comments Index</th> 
                                         <th style="text-align: center;">Photo Index</th>  -->
                                        <th style="text-align: center;">Content</th>
                                        <th style="text-align: center;">Post Date</th>
                                        <th style="text-align: center;"> 별점★ </th>
                                    </tr>
                                </thead>
                                <form id="commentDelete" name="deleteForm" action="/community/photoboardcommnt_delete.do" method="post">
                                <tbody id="commentsTableBody">
                                    <!-- Existing comments will be added here dynamically -->
                                    <c:forEach items="${CommentsLists}" var="row" varStatus="loop">
                                        <tr align="center">
                                            <td>${row.nickname}</td>
                                            <td name="comments_idx" style="text-align: center; display: none;">
										    <input type="text" name="comments_idx" value="${row.comments_idx}">
											</td>
											<td name="idx" style="text-align: center; display: none;">
										    <input type="text" name="idx" value="${row.idx}">
											</td>
                                            <td>${row.content}</td>
                                            <td>${row.postdate} &nbsp;&nbsp;&nbsp;&nbsp;
                                			<button type="button" class="writeFrm_reset"  onclick="commentDelete();">삭제하기</button>
                                       		<td>★${row.starRating} &nbsp;&nbsp;&nbsp;&nbsp;
                                        </tr>
                                    </c:forEach>
                                </tbody>
                      			</form>
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
