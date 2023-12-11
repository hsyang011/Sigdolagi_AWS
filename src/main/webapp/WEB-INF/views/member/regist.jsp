<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript">
function emailSend(frm){
	let data = {
		email: frm.email1.value+'@'+frm.email2.value	
	};
	
	$.ajax({
		type: "post",
		url: "./emailSendProcess.do",
		data: data,
		success: function() {
			console.log("해당 이메일로 인증번호를 발송했습니다.");
		},
		error: function() {
			console.log("요청실패");
		}
	});
	
	
/* 	alert("이메일 전송하기");
	
	$.ajax({
		url : "../emailSendProcess.do",
		type : "post",
		
		success : function(){
			alert("전송성공했음");
		}
		error : function(){ */
//			alert("전송실패");
//		}
	//
//	});
	
	
	
}
/* 아이디 중복확인 */
function checkaaa(frm) {
	
	
		alert('hello world!');
	
	    if (frm.nickname.value == ''){
	        alert("아이디를 닉네임입력후 중복확인 해주세요.");
	        frm.nickname.focus();
	        
	    } else{
	        //아이디 중복확인 창을 띄울때 입력한 아이디를 쿼리스트링으로 
	        //넘겨준다. 
	        window.open('../member/doubleckeck.do?nickname='+frm.nickname.value, 
	            'check', 
	            'width=500,height=300');
	        
	        frm.nickname.readOnly = true;
	        //입력한 아이디를 수정할 수 없도록 속성을 추가한다. 
	    }
	    
	    
}
	





function formValidate(frm) {
	
	
	


}	
</script>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function postOpen(e) {
		e.preventDefault();
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	var frm = document.joinForm;
	        	frm.zipcode.value = data.zonecode;
	        	frm.addr1.value = data.address;
	        	frm.addr2.focus();
	        }
	    }).open();
	}
</script>







</head>
<body>

<!-- header, nav 추가 -->
	

<!-- wrapper 시작 -->
<div class="container-fluid" id="wrap">

	<!-- header, nav 추가했어용 -->
	<%@ include file="../include/top.jsp" %>
	
    <!-- 배너 시작 -->
    <div id="banner" class="mt-3">
        <div id="banner_contents" class="container d-flex align-items-center">
            <div id="info">
                <h4>식도라기와 함께해요!</h4>
                <div id="info_title" class="d-flex">
                    <h2>회원가입</h2>
                </div>
            </div>
            <img id="page_icon" src="images/mdi_register-outline.svg">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main style="height: 1100px;">
        <div class="container">
            <div class="memberPage_title">
                <h2>회원가입</h2>
                <div class="bottom_line"></div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="member_main">
                <div class="side_ad">
                    <!-- 광고에 넣는 글을 최대한 피그마에서 만든 것 처럼 만들고 싶었던 나의 노력..ㅎ -->
                    <div class="side_1">나만의</div>
                    <div class="side_2"><span>맛집</span>을</div>
                    <div class="side_3"><span>플래너</span>로 만들어</div>
                    <div class="side_4">모두와</div>
                    <div class="side_5">공유해보세요!</div>

                    <div class="side_icon">
                        <i>
                            <!-- 피그마에서 아이콘 가져옴 ㅎ -->
                            <svg width="129" height="129" viewBox="0 0 129 129" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M13.4375 102.125V37.625H115.562V102.125C115.562 108.038 110.725 112.875 104.812 112.875H24.1875C18.275 112.875 13.4375 108.038 13.4375 102.125Z" fill="white"/>
                                <path d="M115.562 26.875V43H13.4375V26.875C13.4375 20.9625 18.275 16.125 24.1875 16.125H104.812C110.725 16.125 115.562 20.9625 115.562 26.875Z" fill="#FF7A00"/>
                                <path d="M88.6875 34.9375C93.1403 34.9375 96.75 31.3278 96.75 26.875C96.75 22.4222 93.1403 18.8125 88.6875 18.8125C84.2347 18.8125 80.625 22.4222 80.625 26.875C80.625 31.3278 84.2347 34.9375 88.6875 34.9375Z" fill="#B71C1C"/>
                                <path d="M40.3125 34.9375C44.7653 34.9375 48.375 31.3278 48.375 26.875C48.375 22.4222 44.7653 18.8125 40.3125 18.8125C35.8597 18.8125 32.25 22.4222 32.25 26.875C32.25 31.3278 35.8597 34.9375 40.3125 34.9375Z" fill="#B71C1C"/>
                                <path d="M88.6875 8.0625C85.7313 8.0625 83.3125 10.4812 83.3125 13.4375V26.875C83.3125 29.8312 85.7313 32.25 88.6875 32.25C91.6438 32.25 94.0625 29.8312 94.0625 26.875V13.4375C94.0625 10.4812 91.6438 8.0625 88.6875 8.0625ZM40.3125 8.0625C37.3563 8.0625 34.9375 10.4812 34.9375 13.4375V26.875C34.9375 29.8312 37.3563 32.25 40.3125 32.25C43.2688 32.25 45.6875 29.8312 45.6875 26.875V13.4375C45.6875 10.4812 43.2688 8.0625 40.3125 8.0625ZM34.9375 56.4375H51.0625V72.5625H34.9375V56.4375ZM56.4375 56.4375H72.5625V72.5625H56.4375V56.4375ZM77.9375 56.4375H94.0625V72.5625H77.9375V56.4375ZM34.9375 77.9375H51.0625V94.0625H34.9375V77.9375ZM56.4375 77.9375H72.5625V94.0625H56.4375V77.9375Z" fill="#D9D9D9"/>
                                <path d="M77.9375 77.9375H94.0625V94.0625H77.9375V77.9375Z" fill="#F44336"/>
                                <g clip-path="url(#clip0_304_782)">
                                    <path d="M74.2954 102.579L105.415 71.4673L119.971 86.027L88.8502 117.139L74.2954 102.579Z" fill="#FFCE31"/>
                                    <path d="M126.366 66.9342L124.512 65.0803C120.999 61.5677 115.34 61.5677 111.73 65.0803L105.388 71.4225L120.023 86.0582L126.366 79.716C129.878 76.2035 129.878 70.4467 126.366 66.9342Z" fill="#ED4C5C"/>
                                    <path d="M101.467 75.4327L105.468 71.4303L120.025 85.988L116.025 89.9894L101.467 75.4327Z" fill="#93A2AA"/>
                                    <path d="M102.985 76.9499L106.986 72.9485L118.44 84.4014L114.437 88.4019L102.985 76.9499Z" fill="#C7D3D8"/>
                                    <path d="M74.2626 102.548L67.9204 119.135L72.3111 123.526L88.8983 117.184L74.2626 102.548Z" fill="#FED0AC"/>
                                    <path d="M66.8467 122.062C65.9686 124.404 67.1394 125.477 69.4812 124.599L77.482 121.574L69.969 114.061L66.8467 122.062Z" fill="#333333"/>
                                    <path d="M74.2524 102.621L101.436 75.4375L106.266 80.2673L79.0822 107.451L74.2524 102.621Z" fill="#FFDF85"/>
                                    <path d="M84.0234 112.346L111.207 85.1625L116.037 89.9923L88.8532 117.176L84.0234 112.346Z" fill="#FF8736"/>
                                </g>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M54.5587 45.313C55.1665 45.6734 55.6064 46.2602 55.7817 46.9447C55.9571 47.6292 55.8536 48.3552 55.4939 48.9635L43.9668 68.431C43.6064 69.0387 43.0195 69.4786 42.335 69.6539C41.6506 69.8293 40.9245 69.7258 40.3163 69.3661L33.8271 65.5238C33.2454 65.151 32.8311 64.567 32.6715 63.8949C32.5119 63.2227 32.6194 62.5148 32.9714 61.9203C33.3234 61.3259 33.8924 60.8913 34.5585 60.708C35.2246 60.5248 35.9359 60.6073 36.5424 60.9381L40.7387 63.4228L50.9083 46.2482C51.2686 45.6404 51.8555 45.2005 52.54 45.0252C53.2244 44.8498 53.9505 44.9533 54.5587 45.313Z" fill="#FF0000"/>
                                <defs>
                                    <clipPath id="clip0_304_782">
                                        <rect width="62.4459" height="62.4459" fill="white" transform="translate(66.5542 62.4459)"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </i>
                    </div>

                    <div class="go_planner">
                        <button class="go_planBtn" type="button">플래너 작성하기</button>
                    </div>
                </div>
                <div class="memberFrm">
                    <form method="post" action="../member/registProcess.do" name="joinForm" 
                    onsubmit="return formValidate(this);">
                        <div class="input_id align-items-center">
                            <h4>이메일</h4>
                            <input type="text" name="email1" class="email_id">@
                            <input type="text" name="email2" class="domain">
                            <button type="button" class="btn rounded-4" style="background-color: #FF7A00; color: white;" onclick="emailSend(this.form);"  >전송하기</button>
                            
                        </div>
                        <div class="input_nickname">
                            <h4></h4><h4></h4>
                           
                            
                        </div>
                        <div class="input_nickname">
                            <h4></h4><h4></h4>
                            <input type="text" class="verifynum" name="verifynum" placeholder="인증번호.">
                            <button type="button" >인증하기</button>
                        </div>
                        <div class="input_name">
                            <h4>이름</h4>
                            <input type="text" class="name" name="name">
                        </div>
                        <div class="input_nickname">
                            <h4>닉네임</h4>
                            <input type="text" class="nickname" name="nickname" placeholder="8자 이상은 불가합니다.">
                            <button type="button"  onclick="checkaaa(this.form);">중복확인</button>
                        </div>
                        <div class="input_pw">
                            <h4>비밀번호</h4>
                            <input type="password" name="password" class="pw" placeholder="숫자와 영어를 포함한 4~15자 이내만 가능합니다.">
                        </div>
                        <div class="input_pw2">
                            <h4>비밀번호 확인</h4>
                            <input type="password" name="password2" class="pw2">
                        </div>
                        <div class="input_phone">
                            <h4>연락처</h4>
                            <input type="text" name="tel1" maxlength="3" onkeyup="focusMove(this, 'tel2', 3);"  class="phone1">&nbsp;-&nbsp;
                            <input type="text" name="tel2" maxlength="4" onkeyup="focusMove(this, 'tel3', 4);" class="phone2">&nbsp;-&nbsp;
                            <input type="text" name="tel3" maxlength="4"  class="phone3">
                        </div>
                        <div class="input_address">
                            <div class="input_searchadd">
                                <h4>주소</h4>
                                
                                <div style="margin-bottom: 0;">
                                    <input type="text" class="add2" name="zipcode" placeholder="우편번호">
                                    <button onclick="postOpen(event)" >주소찾기</button>
                                 
                                    <input type="text" class="add1" name="addr1" style="width: 90%; margin-top: 20px;"><br>
                                    <input type="text" class="add2" name="addr2" style="width: 90%;" placeholder="상세주소">
                                </div>
                            </div>
                        </div>
                        <div class="email_radio">
                            <h4>이메일 수신 여부</h4>
                           <input type="radio" name="mailing" value="1">&nbsp;수신동의
                          <input type="radio" name="mailing" value="0">&nbsp;수신거부 
                            
                        </div>
                        <div class="sms_radio">
                            <h4>sms 수신 여부</h4>
                            <input type="radio" name="sms" value="1">&nbsp;수신동의
                            <input type="radio" name="sms" value="0">&nbsp;수신거부 
                            
                            
                        </div>
                   
	                    <div class="member_subBtn">
	                        <input type="button" value="취소하기">
	                        <input type="submit" value="가입하기">
	                    </div>
                     </form>
                </div>
            </div>
        </div>
    </main>
    <!-- main 끝 -->
    <%@ include file="../include/footer.jsp" %>
    </div>
<!-- wrapper 끝 -->
</body>
</html>




<!-- footer 추가 -->
<%-- 	<%@ include file="../include/footer.jsp" %>
	<!-- header, nav 추가 -->
	<%@ include file="../include/top.jsp" %>
	<%@ include file="../include/global_head.jsp" %> --%>