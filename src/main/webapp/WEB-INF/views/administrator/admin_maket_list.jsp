<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>관리자 상품관리목록</title>
	
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
                    <h1 class="h3 mb-2 text-gray-800">상품목록</h1>
                    <p class="mb-4">
                    	상품목록 관리하는 곳 입니다.
                    	<!-- <a target="_blank" href="https://datatables.net">official DataTables documentation</a>. -->
                    </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="text-align: right;">
                            <a class="btn btn-primary float-end" href="../administrator/admin_maket_write.do">
                                <i class="fas fa-edit"></i> 글 작성
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                <colgroup>
	                                	<col width="5%" /><col width="8%" /><col width="8%" /><col width="25%" /><col width="10%" />
	                                	<col width="8%" /><col width="10%" /><col width="7%" /><col width="10%" /><col width="10%" />
	                                </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>글분류</th>
                                            <th>소분류</th>
                                            <th>상품명</th>
                                            <th>상품가격</th>
                                            <th>할인율</th>
                                            <th>판매자</th>
                                            <th>재고</th>
                                            <th>등록일</th>
                                            <th>상품이미지</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>분류(밀키트,특산품)</th>
                                            <th>세부카테고리</th>
                                            <th>상품명</th>
                                            <th>상품가격</th>
                                            <th>할인율</th>
                                            <th>판매자</th>
                                            <th>재고</th>
                                            <th>등록일</th>
                                            <th>상품이미지</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td><a href="">밥볶아먹는 떡볶이(2인)</a></td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb1.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td><a href="">밥볶아먹는 떡볶이(2인)</a></td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb2.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb3.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb4.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb5.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb6.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb7.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb8.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb9.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb10.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>11</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb11.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>12</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb12.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>13</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb13.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>14</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb14.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>15</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb15.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>16</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb16.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>17</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb17.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>18</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb18.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>19</td>
                                            <td>특산품</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb19.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>20</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb20.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>21</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb21.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>22</td>
                                            <td>밀키트</td>
                                            <td>한식</td>
                                            <td>밥볶아먹는 떡볶이(2인)</td>
                                            <td><span>5,500</span> 원</td>
                                            <td><span>30</span> %</td>
                                            <td>마이셰프</td>
                                            <td>300</td>
                                            <td>2011/04/25</td>
                                            <td>
                                                <img src="../images/products/thumb22.jpg" alt="" width="100px">
                                            </td>
                                        </tr>
                                       
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