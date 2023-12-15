<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../include/global_head.jsp" %>
<link rel="stylesheet" href="../css/member.css">
<script type="text/javascript">

</script>

<!-- // 이메일 발송    -->
<script type="text/javascript">
var code = '';

function emailSend(frm){
    let data = {
        email: frm.email1.value+'@'+frm.email2.value	
    };
    alert("email 로 인증코드 발송했습니다"); // 여기에 alert 추가
    
    $.ajax({
        type: "post",
        url: "./emailSendProcess.do",
        data: data,
        success: function(res) {
            console.log("해당 이메일로 인증번호를 발송했습니다.\n인증코드:"+res);
            code = res;
        },
        error: function() {
            console.log("요청실패");
        }
    });
}





function checkVerification() {
    //var userInput = prompt("이메일로 받은 인증번호를 입력하세요.");
	
    
    // 서버에서 받은 값 (예: JSP나 서블릿에서 request.getAttribute로 설정한 값)
    var serverValue = code;

    var verifynum = $("#verifynum").val();
   	
    if (verifynum === serverValue) {
        alert("인증 성공!");
    } else {
        alert("인증 실패. 다시 시도해주세요.");
    }
}







/* 아이디 중복확인 */
function checkaaa(frm) {
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
            <img id="page_icon" src="../images/mdi_register-outline.png">
        </div>
    </div>
    <!-- 배너 끝 -->
    <!-- main 시작 -->
    <main>
        <div class="container">
            <div class="memberPage_title">
                <h2>회원가입</h2>
                <div class="bottom_line"></div>
            </div>
        </div>
        <div class="container">	
            <div class="member_main">

                <div class="memberFrm">
                    <form method="post" action="../member/registProcess.do" name="joinForm" 
                    onsubmit="return formValidate(this);">
                        <div class="input_id align-items-center">
                            <h4>이메일</h4>
                            <input type="text" name="email1" class="email_id">@
                            <input type="text" name="email2" class="domain">
                            <button type="button" class="btn rounded-4" style="background-color: #FF7A00; color: white;" onclick="emailSend(this.form);"  >전송</button>
                            
                        </div>
            
                        <div class="input_email">
                            <input type="text" class="verifynum" id="verifynum" name="verifynum" placeholder="인증번호.">
                            <button type="button" id="emailnumber" name="emailnumber" onclick="checkVerification()" style="background-color: #FF7A00; color: white;">인증하기</button>
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
                                    <input type="text" class="add0" name="zipcode" placeholder="우편번호">
                                    <button onclick="postOpen(event)" >주소찾기</button>
                                 
                                    <input type="text" class="add1" name="addr1" ><br>
                                    <input type="text" class="add2" name="addr2" placeholder="상세주소">
                                </div>
                            </div>
                        </div>
                        <div class="email_radio">
                            <h4>이메일 수신 여부</h4>
                           <input type="radio" name="mailing"id="y_email" value="1">&nbsp;수신동의
                          <input type="radio" name="mailing"id="n_email" value="0">&nbsp;수신거부 
                            
                        </div>
                        <div class="sms_radio">
                            <h4>sms 수신 여부</h4>
                            <input type="radio" name="sms" value="1" id="y_sms">&nbsp;수신동의
                            <input type="radio" name="sms" value="0" id="n_sms">&nbsp;수신거부 
                            
                            
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