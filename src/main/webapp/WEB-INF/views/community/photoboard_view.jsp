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


function CommentSend(){
	let frm = document.commentwriteFrm;
	console.log(frm.content.value);
    let data = {
    		
    	photoboard_idx : frm.photoboard_idx.value,
    	email : frm.email.value,
    	content : frm.content.value
    };
    //alert("댓글작성 "); // 여기에 alert 추가
    console.log(data);
    
    
    $.ajax({
        type: "post",
        url: "./photoboard_comment.do",
        data: data,
        success: function(res) {
            console.log("댓글작성 "+res.email);
            displayComment(res);
        },
        error: function() {
            console.log("요청실패");
        }
    }); 
}
</script>


    
<script>
   // 댓글을 화면에 추가하는 함수
   function displayComment(res) {
	   // 받은 댓글 데이터를 이용하여 화면에 추가하는 로직을 작성
	   console.log(res.email);
	   console.log(res.photoboard_idx);
	   console.log(res.content);
	   var commentHTML = 
	       "<tr align=\"center\">" +
	           "<td>" + res.email + "</td>" +
	           "<td>" + res.photoboard_idx + "</td>" +
	           "<td>" + res.content + "</td>" +
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
                                <input type="hidden" name="photoboard_idx" value="${photoBoardDTO.photoboard_idx }" />
                                <table class="table table-bordered" id="free_write_frm_table" width="100%" >
                                    <tr>
                                        <td>제목</td>
                                        <td>${photoBoardDTO.title}</td>
                                    </tr>
                                    <tr>
                                        <td>내용</td>
                                        <td>
                                            <img width="30%"  class="card-img-top" src="../uploads/${photoBoardDTO.sfile}" alt="이미지">
                                            <textarea id="" name="content" readonly>${photoBoardDTO.content}</textarea>
                                        </td>
                                    </tr>
                                    
                                    
                                    <tr>
                                        <td colspan="2" align="center" class="btn_td">
                                            <button type="button" class="writeFrm_edit" onclick="location.href='./photoboard_edit.do?photoboard_idx=${photoBoardDTO.photoboard_idx }';">수정하기</button>
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
                                            <input type="text" name="photoboard_idx" value="${photoBoardDTO.photoboard_idx }">
                                            <input type="text" name="email" value="이메일">
                                            <p><textarea id="content" name="content" onkeyup=""  style="width:100%" rows="4" placeholder="댓글을 입력해 주세요."></textarea></p>
                                            <span><button type="button" class="btns" onclick="CommentSend();">등록</button> <i id="counter">0/300자</i></span>
                                        </div>
                                    </form>
                                </fieldset>
                            </div>

							
							



                            <table class="table table-border">
                                <thead>
                                    <tr>
                                        <th>Email</th>
                                        <th>Comments Index</th>
                                        <th>Content</th>
                                        <th>Post Date</th>
                                    </tr>
                                </thead>
                                <tbody id="commentsTableBody">
                                    <!-- Existing comments will be added here dynamically -->
                                    <c:forEach items="${CommentsLists}" var="row" varStatus="loop">
                                        <tr align="center">
                                            <td>${row.email}</td>
                                            <td>${row.comments_idx}</td>
                                            <td>${row.content}</td>
                                            <td>${row.postdate}</td>
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
