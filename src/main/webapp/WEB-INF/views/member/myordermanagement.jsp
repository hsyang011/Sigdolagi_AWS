<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file = "../include/global_head.jsp" %>
<!-- 전역 설정 css 링크  -->
<link rel="stylesheet" href="../css/myorder.css">
<script>
$(function() {
	$(".detail_head").hide();
	$(".detail_body").hide();

    $(".orderSummary").click(function(e) {
    	$(e.target).parent().css("background-color", "lightyellow");
        var details = $(this).nextUntil('.orderSummary');
        details.toggle();
    });
});

function showDetails(e) {
	
}
</script>
</head>
<body>
<!-- wrapper 시작 -->
<div class="container-fluid" id="wrap">
    <!-- header 시작 --><!-- nav 시작 -->
    <%@ include file="../include/top.jsp" %>
    <!-- 배너 시작 -->
    <div id="banner" class="mt-3">
        <div id="banner_contents" class="container d-flex align-items-center">
            <div id="info">
                <h4> 나만 볼 수 있는</h4>
                <div id="info_title" class="d-flex">
                    <h2>주문관리페이지</h2>
                </div>
            </div>
            <img id="page_icon" src="../images/calandar.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <div class="container">
            <div class="row"><!-- row-->
                <div class="col-2 ml-7" id="col2"><!-- col3시작-->
                    <!-- 첫 번째 열 -->
                    <br><br><br><br>
                    <div id="left" style="width: 100%;"><!-- 좌측메뉴-->
                        <div id="profile"><img src="../images/logo.png" alt=""></div>
                        <div id="leftname">회원이름</div>
                        <div id="leftreft" class="">
                        <div id="myactivity">
                            <a href="/member/mypage.do">나의 활동관리</a>
                        </div><br><br>
                        <div id="myinfomanage">
                            <a href="../member/myinfo.do">나의 정보관리</a>
                        
                        
                        </div><br><br>
                        
                        <div id="myorder">
                            <a href="../member/myordermanage.do"> 나의주문관리</a>
                        </div>
                        
                        
                        
                        
                        </div><!-- leftreft -->
                    </div> <!-- left메뉴끝 -->
                </div>
                <div class="col-10" style="padding-left: 100px;" id="col10">
                        <div class="d-flex">
                          <div id="myactivityR" style="width: 200px; "> <a href="./mypage_.html">나의활동관리</a>
                          </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <div id="myinfoR" style="width: 200px; "> <a href="./myinfo.html">나의정보관리</a>
                          </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <div id="myorderR" style="width: 150px; position: relative; right: 50px;"> <a href="./myordermanage.html">나의주문관리</a>
                          </div>
                        </div>
                        <br><br><br>
                        <div class="d-flex justify-content-between">
                            <h2 id="myorderTaxt" style="padding-left: 10px; border-bottom: 3px solid orange; padding-bottom: 10px; width: 200px; ">나의주문배송</h2>
                            <br><br>
                            <div>
                                <select name="" id="ordertime">
                                <option value="">1개월</option>
                                <option value="">2개월</option>
                                <option value="">3개월</option>
                                </select>
                            </div>
                        </div>
                    <br><br><br>
                    <!-- 테이블 -->
                        <div class="table_wrap" id="table_wrap">
                        <table class="table table-hover" style="cursor: pointer;">
                              <colgroup>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%" />
                              </colgroup>
                            <thead>
                            <tr style="text-align: center;" >
                                <th scope="col">주문일자</th>
                                <th scope="col" style="">상품명</th>
                                <th scope="col">결제금액</th>
                                <th scope="col">결제방식</th>
                            </tr>
                            </thead>
                            <c:forEach items="${myOrderList}" var="row" varStatus="loop">
                            <tbody onclick="showDetails(event)">
                            <tr class="text-center orderSummary">
                                <th scope="row">${row.payment_date}</th>
                                <td id="table_title">${orderMap[row.order_idx][0].prod_name} 외 ${orderMap[row.order_idx].size()-1}건</td>
                                <td><fmt:formatNumber value="${row.payment}" pattern="#,###" />원</td>
                                <td>${row.payment_method}</td>
                            </tr>
                            <tr class="detail_head" style="text-align: center;">
                                <th scope="col">번호</th>
                                <th scope="col" style="">상품명</th>
                                <th scope="col">상품 수량</th>
                                <th scope="col">가격</th>
                            </tr>
                           		<c:forEach items="${orderMap[row.order_idx]}" var="col" varStatus="loop_2">
	                            <tr class="text-center detail_body">
	                            	<th scope="row">${loop_2.count}</th>
	                                <td id="table_title">${col.prod_name}</td>
	                                <td>${col.prod_count}</td>
	                                <td><fmt:formatNumber value="${col.prod_totprice}" pattern="#,###" />원</td>
	                            </tr>
	                            </c:forEach>
                            </tbody>
                            </c:forEach>
                        </table>
                        </div>


                  <!-- 페이징 --> 
                
                  <br><br><br><br>

                   <!-- 포인트 --> 
                  <div class="d-flex justify-content-between">
                    <h2 id="mypointText" style="padding-left: 10px; border-bottom: 3px solid orange; padding-bottom: 10px; width: 200px; ">포인트 내역</h2>
                    <br><br>
                        <select name="" id="ordertime">
                        <option value="">1개월</option>
                        <option value="">2개월</option>
                        <option value="">3개월</option>
                        </select>
                  </div>
                <br><br>
                  

                <div class="d-flex">
                  <div id="pointbox">
                    <h3 style="font-size: 1.0em;">나의 포인트</h3>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <h1 style=" border-bottom: 2px solid white;  display: inline-block; font-size: 1.2em ;">1828</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <h3 style="font-size: 1.0em;">점</h3>
                  </div> 
                 
                </div><!-- 디 플렉스 끝 -->
                <br><br><br>
                <!-- 테이블 -->
                <!-- 테이블 -->
                <div class="table_wrap" id="table_wrap">
                  <table class="table table-border">
                      
                      <thead>
                      <tr style="text-align: center;" >
                          <th scope="col" style="width: 20%;">번호</th>
                          <th scope="col" style="width: 20%;">제목</th>
                          <th scope="col" style="width: 20%;">작성자</th>
                          <th scope="col" style="width: 20%;">작성일</th>
                          <th scope="col" style="width: 20%;">조회</th>
                      </tr>
                      </thead>
                      <tbody>
                      <tr>
                          <th scope="row">1</th>
                          <td id="table_title">집</td>
                          <td>Otto</td>
                          <td>@mdo</td>
                          <td>33</td>
                      </tr>
                      <tr>
                          <th scope="row">2</th>
                          <td>최고</td>
                          <td>Thornton</td>
                          <td>@fat</td>
                          <td>4</td>
                      </tr>
                      <tr>
                          <th scope="row">3</th>
                          <td>Larry the Bird</td>
                          <td>Larry the Bird</td>
                          <td>@twitter</td>
                          <td>5</td>
                      </tr>
                      </tbody>
                  </table>
                  </div>



                      <!-- 페이징 -->
                      <br><br>
                      <div class="container d-flex justify-content-center">
                        <div class="row">
                            <div class="col-12 d-flex justify-content-center">
                                <div class="list_btn">
                                    <button type="button" class="btn"> &lt; </button>
                                    <button type="button" class="btn" id="btn1"> 1 </button>
                                    <button type="button" class="btn" id="btn1"> 2 </button>
                                    <button type="button" class="btn" id="btn1"> 3 </button>
                                    <button type="button" class="btn"> &gt; </button>
                                </div>
                            </div>
                        </div>
                      </div>

                </div>
                </div> <!-- col-10 끝 --> 
            </div>
        <div id="footerArea">
            <br><br><br><br><br>
        </div>
    </div>
    </main>
    <!-- main 끝 -->

    <!-- 푸터 광고 -->
    <div id="banner2" class="mt-3">
        <div id="banner2_contents" class="container d-flex align-items-center">
            <div id="info" style="width: auto;">
                <h3 style="color: brown; font-family: 'NPSfontExtraBold';">카카오페이로</h2>
                
                <div id="info_title" class="d-flex">
                    <h5 style="color: black;">더욱 다양하게 즐겨보세요</h5>
                </div>
            </div>
            <img id="page_icon" src="../images/pay.png">
        </div>
    </div>
    <!-- 배너 끝 -->
	
	

	
	<%@include file="../include/footer.jsp"%>
    <!-- footer 시작 -->
   
    <!-- footer 끝 -->
</div>
<!-- wrapper 끝 -->
</body>
</html>