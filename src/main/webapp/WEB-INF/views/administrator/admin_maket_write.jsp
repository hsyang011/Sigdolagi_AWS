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
	<title>관리자 상품등록</title>
	
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
		if (form.ofile.value == ""){
			alert("첨부파일은 필수 입력입니다.");
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
                    <h1 class="h3 mb-4 text-gray-800">상품 등록하기</h1>

                    <h1 class="mt-4">상품 등록하기</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                        <!-- onsubmit="return validateForm(this)" -->
                        
                            <form name="maketWriteForm" method="post" enctype="multipart/form-data" 
									action="/administrator/admin_maket_write.do" >
                            	<div class="mb-3 mt-3">
                                    <label for="category" class="form-label">분류</label>
                                    <select name="category" id="category">
                                    	<option value="mealkit">밀키트</option>
                                    	<option value="specialty">특산품</option>
                                    </select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <label for="sub_cate" class="form-label">소분류</label>
                                    <select name="sub_cate" id="sub_cate">
                                    	<option value="한식">한식</option>
                                    	<option value="일식">일식</option>
                                    	<option value="중식">중식</option>
                                    	<option value="양식">양식</option>
                                    	<option value="기타">기타</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="seller" class="form-label">판매처</label> <input
                                        type="text" class="form-control" id="seller" name="seller"
                                        value="">
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="title" class="form-label">상품명</label> <input
                                        type="text" class="form-control" id="prod_name" name="prod_name"
                                        value="">
                                </div>
                                <div class="mb-3 mt-3">
	                                <div class="row">
		                                <div class="col-2">
		                                    <label for="prod_price" class="form-label">상품원가</label> 
		                                    <input type="text" class="form-control" id="prod_price" name="prod_price"
		                                        value="" placeholder="원">
	                                    </div>
	                                    <div class="col-2">
		                                    <label for="prod_sale" class="form-label">할인할금액</label> 
		                                    <input type="text" class="form-control" id="prod_sale" name="prod_sale"
		                                        value="" placeholder="원">
	                                	</div>
	                                	<div class="col-2">
		                                    <label for="inventory" class="form-label">재고</label> 
		                                    <input type="text" class="form-control" id="inventory" name="inventory"
		                                        value="" placeholder="개">
	                                	</div>
	                                </div>
                                </div>
                                <div class="mb-3">
                                    <label for="prod_detail" class="form-label">상세내용</label>
                                    <!-- <textarea class="form-control" cols="30" rows="10" id="prod_detail" name="prod_detail"></textarea> -->
                                	<input type="file" id="prod_detail" name="prod_detail_o"/>
                                	
                                </div>
                                
                                <div class="mb-3">
                                    <label for="thumbnail" class="form-label">상품이미지</label> 
                                    <input type="file" id="imgs" name="imgs" multiple/><br />
                                    <!-- 상품이미지1 <input type="file" id="img1_o" name="img1_o" /><br />
                                    상품이미지2 <input type="file" id="img2_o" name="img2_o" /><br />
                                    상품이미지3 <input type="file" id="img3_o" name="img3_o" /><br />
                                    상품이미지4 <input type="file" id="img4_o" name="img4_o" /><br />
                                    상품이미지5 <input type="file" id="img5_o" name="img5_o" /><br /> -->
                                </div>
                                
                                <a href="admin_maket_list.do" class="btn btn-outline-secondary">목록</a>
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