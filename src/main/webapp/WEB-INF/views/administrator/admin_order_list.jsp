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
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
	if(confirm("취소하시겠습니까?")){
		frm.idx.value = idx;
		frm.action = "/administrator/admin_order_list.do";
		frm.method = "post";
		frm.submit();
	}
}

function orderPreUpdate(idx){
	let frm = document.frm;
	if(confirm("배송중으로 변경 하시겠습니까?")){
		$.ajax({
			type : 'post', //전송방식 (form태그의 method)
			url : '../administrator/FCMSender.do', //요청Url
			data : { 
				token : 'dmcLQMmcSAi6xOfCk0Lwko:APA91bGpTaYT_jfzE163Cv96SHc6zTUVIXIrEmvLgk2oJ2XjXzKlDMujRB-gq1gKqwhteclB9hOagb-101uUPPncqhdA5_cTAP4ct_fJVkssh37bWiOyW9Ae7T9UUg-gQFB8OqlpBVtD' ,
				title : '배송시작메세지',
				body : '배송이 시작 되었습니다 조금만기다려주세요'
			}, //파라미터 (객체형태로 넘기는)
			success : function(res){
				console.log("성공"+res);
				alert("배송시작 알림을 전송했습니다.");
				frm.idx.value = idx;
				frm.action = "/administrator/admin_order_preUpdate.do";
				frm.method = "post";
				frm.submit();
			}, //성공시 호출할 콜백함수
			error : errCallBack //실패시 호출할 콜백함수
		});
		function errCallBack(errData){
	    	console.log(errData.status+":"+errData.statusText);
	    }
	}
}
function orderDeliUpdate(idx){
	let frm = document.frm;
	if(confirm("배송완료로 변경 하시겠습니까?")){
		$.ajax({
			type : 'post', //전송방식 (form태그의 method)
			url : '../administrator/FCMSender.do', //요청Url
			data : { 
				token : 'dmcLQMmcSAi6xOfCk0Lwko:APA91bGpTaYT_jfzE163Cv96SHc6zTUVIXIrEmvLgk2oJ2XjXzKlDMujRB-gq1gKqwhteclB9hOagb-101uUPPncqhdA5_cTAP4ct_fJVkssh37bWiOyW9Ae7T9UUg-gQFB8OqlpBVtD' ,
				title : '배송완료메세지',
				body : '배송이 완료 되었습니다 확인부탁드려요'
			}, //파라미터 (객체형태로 넘기는)
			success : function(res){
				console.log("성공"+res);
				alert("배송시작 알림을 전송했습니다.");
				frm.idx.value = idx;
				frm.action = "/administrator/admin_order_deliUpdate.do";
				frm.method = "post";
				frm.submit();
			}, //성공시 호출할 콜백함수
			error : errCallBack //실패시 호출할 콜백함수
		});
		function errCallBack(errData){
	    	console.log(errData.status+":"+errData.statusText);
	    }
	}
	
}

</script>
<script type="text/javascript">

/* $(function(){
 $('#mbtn').click(function(){
 	var idx = $('#mbtn').val;
 	console.log(idx);
 });
}); */

    function orderModal(order_idx){
    	console.log("order_idx=", order_idx );
    	$.ajax({
    		type : 'get', //전송방식 (form태그의 method)
			url : '../administrator/order_modal_list.do', //요청Url
			data : { order_idx : order_idx }, //파라미터 (객체형태로 넘기는)
			contentType : "text/html;charset:utf-8", //컨텐츠타입
			dataType : "json", //콜백데이터의 타입(형식)
			success : sucCallBack, //성공시 호출할 콜백함수
			error : errCallBack //실패시 호출할 콜백함수
    	});
    }
    function sucCallBack(resData){
    	/*콜백받은 데이터를 각각의 td태그에 삽입한다. 콜백 데이터는
    	JSON 객체이므로 즉시 파싱한 후 적용할 수 있다. */
    	console.log("resData=", resData);
    	console.log("resData[0]=", resData[0]);
    	let tableData = "";
    	$('#td1').html(resData[0].order_idx);
    	$('#td2').html(resData[0].payment_date);
    	$('#td3').html(resData[0].name);
    	$('#td4').html(resData[0].phone);
    	$('#td5').html(resData[0].zipcode);
    	$('#td6').html(resData[0].point);
    	$('#td7').html(resData[0].addr1 +" - "+ resData[0].addr2);
    	$('#td8').html(resData[0].message);
    	
    	$(resData).each(function(index, data){
    		tableData += ""
    		+"<tr>"
    		+"	<td colspan='3' style='text-align: center;'>"
    		+"		<a href='../market/market_view.do?prod_idx="+data.prod_idx+"'>"+data.prod_name+"</a></td>"
    		+"	<td>"+data.prod_count+"개</td>"
    		+"</tr>";
    	});
    	//앞에서 만든 <tr>태그를 table에 적용한다. 
    	$('#show_data').html(tableData);
    }
    function errCallBack(errData){
    	console.log(errData.status+":"+errData.statusText);
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
                                            	<a id="mbtn" href="javascript:void(0)" data-toggle="modal" 
                                            		data-target="#orderNumModal" onclick="orderModal('${row.order_idx }');">
                                            		${row.order_idx }
                                            	</a>
                                            </td>
                                            <td>${row.name }(${row.email })</td>
                                            <td>${row.payment_date }</td>
                                            <td><span>${row.payment }</span> 원</td>
                                            <td><input type="hidden" value="${row.state }"/> 
                                            	<c:choose>
	                                            	<c:when test="${row.state eq ('prepare') }">
		                                            	<a href="javascript:orderPreUpdate('${row.order_idx }')" 
		                                                	class="btn btn-primary btn-icon-split">
		                                                    <span class="text">상품준비중</span>
		                                                </a>
	                                            	</c:when>
	                                            	<c:when test="${row.state eq ('delivery') }">
		                                            	<a href="javascript:orderDeliUpdate('${row.order_idx }')" 
		                                                	class="btn btn-warning btn-icon-split">
		                                                    <span class="text">배송중</span>
		                                                </a>
	                                            	</c:when>
	                                            	<c:when test="${row.state eq ('success') }">
		                                            	<a href="javascript:void(0)" 
		                                                	class="btn btn-success btn-icon-split">
		                                                    <span class="text">배송완료</span>
		                                                </a>
	                                            	</c:when>
	                                            	<c:otherwise>
		                                            	<a href="javascript:void(0)" 
		                                                	class="btn disabled btn-secondary btn-icon-split">
		                                                    <span class="text">주문취소</span>
		                                                </a>
	                                            	</c:otherwise>
	                                            </c:choose>
                                            </td>
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
	                <!-- <h5 class="modal-title" id="exampleModalLabel">주문번호 :</h5> -->
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
                                        <td id="td1"></td>
                                        <th>주문일자</th>
                                        <td id="td2"></td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td id="td3"></td>
                                        <th>연락처</th>
                                        <td id="td4"></td>
                                   	</tr>	
                                    <tr>    
                                        <th>우편번호</th>
                                        <td id="td5"></td>
                                        <th>포인트 사용</th>
                                        <td id="td6"></td>
                                   </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td colspan="3" id="td7"></td>
                                    </tr>
                                    <tr>
                                        <th>배송메세지</th>
                                        <td colspan="3" id="td8"></td>
                                    </tr>
                                    
                                    <tr>
                                    	<th colspan="4" style="text-align: center;">주문상품</th>
                                    </tr>
                                    <!-- <tr>
                                    	<td colspan="3" style="text-align: center;">
                                    		<a href="">상품명 ㅁ잗러미잗러미ㅏㅈㄷ러맞ㄷㄹ0000</a>
                                    	</td>
                                    	<td>2개</td>
                                    </tr> -->
                                    <tbody id="show_data"></tbody>
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