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
	<title>관리자 주문현황목록</title>
	
    <!-- Custom fonts for this template -->
    <link href="../bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="../bootstrap/css/sb-admin-2.min.css" rel="stylesheet" />

    <!-- Custom styles for this page -->
    <link href="../bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
</head>
<script>
function listDelete(idx){
	let frm = document.frm;
	if(confirm("삭제하시겠습니까?")){
		frm.idx.value = idx;
		frm.action = "/administrator/adminOrderDelete.do";
		frm.method = "post";
		frm.submit();
	}
}

</script>
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
                    <h1 class="h3 mb-2 text-gray-800">주문현황</h1>
                    <p class="mb-4">
                    	주문현황목록 관리하는 곳 입니다.
                    </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="text-align: right;"></div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<form name="frm">
                            		<input type="hidden" name="idx"/>
                            	</form>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                <colgroup>
	                                	<col width="10%" /><col width="15%" /><col width="10%" /><col width="15%" /><col width="10%" />
	                                	<col width="10%" />
	                                </colgroup>
                                    <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>닉네임(구매자 아이디)</th>
                                            <th>주문일자</th>
                                            <th>총결제금액</th>
                                            <th>주문 상태</th>
                                            <th>취소버튼</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>닉네임(구매자 아이디)</th>
                                            <th>주문일자</th>
                                            <th>총결제금액</th>
                                            <th>주문 상태</th>
                                            <th>취소버튼</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${adminOrderSelect }" var="row" varStatus="loop">
                                        <tr>
                                            <td style="text-align: center;">
                                            	<a href="#" data-toggle="modal" data-target="#orderNumModal">
                                            		${row.order_idx }
                                            	</a>
                                            </td>
                                            <td>${row.nickname }(${row.email })</td>
                                            <td>${row.payment_date }</td>
                                            <td><span>${row.payment }</span> 원</td>
                                            <td>상품준비중</td>
                                            <td>
                                                <a href="javascript:listDelete('${row.order_idx }')" class="btn btn-danger btn-icon-split">
                                                    <span class="text">취소</span>
                                                </a>
                                            </td>
                                        </tr>
                                        </c:forEach>	
                                       
                                    </tbody>
                                </table>
                            </div>
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
    
    <!-- 주문번호 모달창-->
	<div class="modal fade" id="orderNumModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	    aria-hidden="true">
	    <div class="modal-dialog modal-lg" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">주문번호 :</h5>
	                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">×</span>
	                </button>
	            </div>
	            <div class="modal-body">
	            	<!-- 카드시작 -->
					<div class="card mb-4">
                       <!--  <div class="card-header">
                            <a class="btn btn-primary float-end" href="register"> <i class="fas fa-table me-1"></i>
                                <i class="fas fa-edit"></i> 글 작성
                            </a>
                        </div> -->
                        <div class="card-body">
                            <table class="table table-hover table-bordered" style="width: 100%; text-align: center;">
                            	<colgroup><col width="20%"><col width="30%"><col width="20%"><col width="30%"></colgroup>
                                <tbody>
                                    <tr>
                                        <th>주문번호</th>
                                        <td> </td>
                                        <th>주문일자</th>
                                        <td> </td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td> </td>
                                        <th>연락처</th>
                                        <td> </td>
                                   	</tr>	
                                    <tr>    
                                        <th>우편번호</th>
                                        <td> </td>
                                        <th>포인트 사용</th>
                                        <td> </td>
                                   </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td colspan="3"> </td>
                                    </tr>
                                    <tr>
                                        <th>배송메세지</th>
                                        <td colspan="3"> </td>
                                    </tr>
                                    
                                    <tr>
                                    	<th colspan="4" style="text-align: center;">주문상품</th>
                                    </tr>
                                    <c:forEach items="${boards}" var="board">
                                        <tr>
                                            <td>
												<img src="../images/products/thumb1.jpg" alt="" width="50px" height="50px">
											</td>
                                            <td><a href="get?bno=${board.bno} ">상품번호</a></td>
                                            <td><span>2</span>개</td>
                                            <td>총합계: <span>11,000</span>원</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 테이블끝 -->
				</div>
	            <div class="modal-footer">
	                <button class="btn btn-secondary" type="button" data-dismiss="modal">나가기</button>
	                <!-- <a class="btn btn-primary" href="../main/main.do">Logout</a> -->
	            </div>
	        </div>
	    </div>
	</div>
    

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