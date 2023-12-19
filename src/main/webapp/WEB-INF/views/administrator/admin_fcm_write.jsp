<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>푸시 보내기</title>
	
    <!-- Custom fonts for this template -->
    <link href="../bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="../bootstrap/css/sb-admin-2.min.css" rel="stylesheet" />

    <!-- Custom styles for this page -->
    <link href="../bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
	
<script type="text/javascript">
function validateForm(form){
	if (form.title.value == ""){
		alert("제목을 입력하세요.");
		form.title.focus();
		return false;
	}
}
</script>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<!-- 사이드메뉴 추가 -->
        <%@ include file="../include/admin_leftmenu.jsp" %>

        <!-- 메인 Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- 탑네비 추가 -->
                <%@ include file="../include/admin_topnav.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <!-- <h1 class="h3 mb-4 text-gray-800">상품 등록하기</h1> -->

                    <h1 class="mt-4">푸시 보내기</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                        <style>
						input{width: 500px;}
						textarea{width: 500px; height: 50px;}
						img{max-width: 500px;}
						</style>
                        <!-- onsubmit="return validateForm(this)" -->
                            <form name="FCMsend" method="post" action="../administrator/FCMSender.do" >
                                <div class="mb-3 mt-3">
                                    <textarea name="token" placeholder="토큰"
                                    	>dKpwlAqJTO2r_Fl3KGnUuv:APA91bH_zvv0LN7ezABIGL9Hl2austfH896hlKQ57XXGLcWQeEHFAOiQgkCx1FNjllp4KqtdSRi7nCUMnvd7oIGFYXYqC0UwLuuFwkoauMn9IRUaNUJkOgJpi8mIZ2weqhSlIYpynv6b</textarea><br />
								    <input type="text" name="title" placeholder="타이틀"/> <br/>
								    <textarea name="body" placeholder="알림메세지"></textarea><br/>
								    <input type="text" name="image" placeholder="이미지경로" value=""><br/>
								    <input type="text" name="add_data" placeholder="추가데이터"/><br/>
								    <input type="submit" value="보내기">
                                </div>
                                <div class="mb-3">
                                    <label for="content" class="form-label">전송결과</label>
                                    토큰 : ${messageDTO.token } <br />
								    타이틀 : ${messageDTO.title } <br />
								    이미지 : <img src="${messageDTO.image } "/> <br />
								    메세지 : ${messageDTO.body } <br />
								    추가데이터 : ${messageDTO.add_data } <br />
								    전송결과 : ${result } <br />
                                </div>
                                <!-- 
                                <a href="admin_notice_list.do" class="btn btn-outline-secondary">목록</a>
                                <button type="submit" class="btn btn-outline-primary">작성완료</button> -->
                            </form>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

			<!-- footer 추가 -->
            <%@ include file="../include/admin_footer.jsp" %>

        </div>
        <!-- 메인 Wrapper 끝 -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- madal,scroll button 추가 -->
    <%@ include file="../include/admin_modal.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <script src="../bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="../bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../bootstrap/js/demo/datatables-demo.js"></script>

</body>
</html>