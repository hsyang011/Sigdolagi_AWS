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
	<title>관리자 회원관리목록</title>
	
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
                    <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
                    <p class="mb-4">
                    	회원멤버 리스트를 관리하는 곳 입니다.
                    	<!-- <a target="_blank" href="https://datatables.net">official DataTables documentation</a>. -->
                    </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>등급</th>
                                            <th>가입일</th>
                                            <th>회원탈퇴여부</th>
                                            <th>탈퇴버튼</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>등급</th>
                                            <th>가입일</th>
                                            <th>회원탈퇴여부</th>
                                            <th>탈퇴버튼</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>TigerNixon@naver.com</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>TigerNixon@naver.com</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox@naver.com</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cedric Kelly@naver.com</td>
                                            <td>Senior Javascript Developer</td>
                                            <td>Edinburgh</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Airi Satou@naver.com</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Brielle Williamson@naver.com</td>
                                            <td>Integration Specialist</td>
                                            <td>New York</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Herrod Chandler@naver.com</td>
                                            <td>Sales Assistant</td>
                                            <td>San Francisco</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Rhona Davidson@naver.com</td>
                                            <td>Integration Specialist</td>
                                            <td>Tokyo</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Colleen Hurst@naver.com</td>
                                            <td>Javascript Developer</td>
                                            <td>San Francisco</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Sonya Frost@naver.com</td>
                                            <td>Software Engineer</td>
                                            <td>Edinburgh</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jena Gaines</td>
                                            <td>Office Manager</td>
                                            <td>London</td>
                                            <td>Nomal</td>
                                            <td>2008/12/19</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Quinn Flynn</td>
                                            <td>Support Lead</td>
                                            <td>Edinburgh</td>
                                            <td>Nomal</td>
                                            <td>2012/12/18</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Charde Marshall</td>
                                            <td>Regional Director</td>
                                            <td>San Francisco</td>
                                            <td>Nomal</td>
                                            <td>2012/12/18</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Haley Kennedy</td>
                                            <td>Senior Marketing Designer</td>
                                            <td>London</td>
                                            <td>Nomal</td>
                                            <td>2012/12/18</td>
                                            <td>N</td>
                                            <td>
                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                    <span class="text">회원탈퇴</span>
                                                </a>
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