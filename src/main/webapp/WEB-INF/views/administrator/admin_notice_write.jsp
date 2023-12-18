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
	<title>공지사항 작성</title>
	
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
                    <h1 class="mt-4">공지사항 작성하기</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                        <!-- onsubmit="return validateForm(this)" -->
                        
                            <form name="noticeWriteForm" method="post" enctype="multipart/form-data" 
									action="/administrator/admin_notice_write.do" >
                            	<!-- <div class="mb-3 mt-3">
                                    <label for="category" class="form-label">분류</label>
                                    <select name="category" id="category">
                                    	<option value="mealkit">밀키트</option>
                                    	<option value="specialty">특산품</option>
                                    </select>
                                </div> -->
                                <div class="mb-3 mt-3">
                                    <label for="title" class="form-label">제목</label> 
                                    <input type="text" class="form-control" id="title" name="title"
                                        value="">
                                     <input type="hidden" name="email" value="${email}"/>
                                     <input type="hidden" name="nickname" value="${nickname }"/>
                                </div>
                                <div class="mb-3">
                                    <label for="content" class="form-label">상세내용</label>
                                    <textarea class="form-control" cols="40" rows="10" id="content" name="content"></textarea>
                                	<!-- <input type="file" id="content" name="content"/><br /> -->
                                </div>
                                
                                <a href="admin_notice_list.do" class="btn btn-outline-secondary">목록</a>
                                <button type="submit" class="btn btn-outline-primary">작성완료</button>
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