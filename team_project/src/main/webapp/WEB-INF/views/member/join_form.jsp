<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<script>
$(document).ready(function(){
	const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,10}$/);
	const getPwCheck = RegExp(/^[a-zA-Z0-9]{6,14}$/);
    const getNameCheck = RegExp(/^[가-힣]+$/);
    $('#idChk').html('<b style=" color: yellowgreen">[아이디를 입력해주세요]');
    $('#pwChk').html('<b style=" color: yellowgreen">[비밀번호를 입력해주세요]</b>');
    $('#pwSameChk').html('<b style=" color: yellowgreen">[비밀번호를 한번 더 입력해주세요]');
    $('#phoneChk').html('<b style=" color: yellowgreen">[번호를 입력해주세요]');
    var isPushed = "false";
    var isPushed2 = "false";
    var isPushed3 = "false";
    
    $('#userid').keyup(function() {
        if($(this).val() === '' ) {
           $(this).css('background-color', 'pink');
           $('#idChk').html('<b style=" color: red">[아이디는 필수값입니다.]</b>');
   		}else if(!getIdCheck.test($(this).val())) {
            $(this).css('background-color', 'pink');
            $('#idChk').html('<b style=" color: red">[영문자, 숫자조합 4-10로 쓰세요]</b>');
        }else{
        	$(this).css('background-color', 'white');
        	$('#idChk').html('<b style=" color: yellowgreen">[아이디 중복체크 해주세요]');
			$("#overlapIdCheckBtn").click(function(){
				var userid = $("#userid").val();
				var sData = {
						"userid" : userid
				};
				var url = "/member/checkId";
				$.post(url, sData, function(rData){
					if(rData != 1){
						$(this).css('background-color', 'aliceblue');
			            $('#idChk').html('<b style=" color: #75daff">[사용가능한 아이디입니다.]</b>');
			            isPushed="true";
		            } else {
		            	$(this).css('background-color', 'pink');
			            $('#idChk').html('<b style=" color: red">[사용중인 아이디입니다.]</b>');
		            };
				});
			});
        }
    });
    
    $('#nickname').keyup(function() {
        if($(this).val() === '' ) {
           $(this).css('background-color', 'pink');
           $('#nickChk').html('<b style=" color: red">[닉네임은 필수값입니다.]</b>');
   		}else{
        	$(this).css('background-color', 'white');
        	$('#nickChk').html('<b style=" color: yellowgreen">[닉네임 중복체크 해주세요]');
			$("#overlapNickCheckBtn").click(function(){
				var nickname = $("#nickname").val();
				var sData = {
						"nickname" : nickname
				};
				var url = "/member/checkNick";
				$.post(url, sData, function(rData){
					console.log(rData);
					if(rData != 1){
						$(this).css('background-color', 'aliceblue');
			            $('#nickChk').html('<b style=" color: #75daff">[사용가능한 닉네임입니다.]</b>');
			            isPushed3="true";
		            } else {
		            	$(this).css('background-color', 'pink');
			            $('#nickChk').html('<b style=" color: red">[사용중인 닉네임입니다.]</b>');
		            };
				});
			});
        }
    });
    
    $('#userpwInput').keyup(function(){
    	if($(this).val() === '' ) {
            $(this).css('background-color', 'pink');
            $('#pwChk').html('<b style=" color: red">[비밀번호는 필수값입니다.]</b>');
    	}else if(!getPwCheck.test($(this).val())) {
            $(this).css('background-color', 'pink');
            $('#pwChk').html('<b style=" color: red">[영문자, 숫자조합 6-14로 쓰세요]</b>');
        }else{
        	$(this).css('background-color', 'white');
        	$('#pwChk').html('');
        }
    });
    
    $('#userpwInputCheck').keyup(function(){
	    if($(this).val() == $('#userpwInput').val()){
	    	$(this).css('background-color', 'white');
	    	$('#pwSameChk').html('<b style=" color: green">[비밀번호가 일치합니다]');
	    }else{
	    	$(this).css('background-color', 'pink');
	    	$('#pwSameChk').html('<b style=" color: red">[비밀번호가 일치하지 않습니다]');
	    }
    });
    
    $('#cellphoneInput2').keyup(function() {
        if($(this).val() === '' ) {
           $(this).css('background-color', 'pink');
           $('#phoneChk').html('<b style=" color: red">[휴대폰 번호는 필수값입니다.]</b>');
   		}
    });
    
    $('#cellphoneInput3').keyup(function() {
        if($(this).val() === '' ) {
           $(this).css('background-color', 'pink');
           $('#phoneChk').html('<b style=" color: red">[휴대폰 번호는 필수값입니다.]</b>');
   		}else{
        	$(this).css('background-color', 'white');
        	$('#phoneChk').html('<b style=" color: yellowgreen">[휴대폰 번호 중복체크를 해주세요]');
        }
    });
    
	$("#profileImg").on("click", ".joinImage", function() {
		var inputFile = $(this).parent().find("input");
		inputFile.trigger("click");
		var file = inputFile.val();
	});
	$("#profileImg").on("change", ".joinImageFile", function() {
		var inputImg = $(this).parent().find("img");
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				inputImg.attr("src", e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
			$("#filecomment").hide();
		}
	});
	
	
	
	$("#userid").keyup(function(){
		console.log("아이디 변경중");
		isPushed = "false";
	});
	
	$("nickname").keyup(function(){
		console.log("닉네임 변경중");
		isPushed3 = "false";
	});
	
	$("#emailIdInput").blur(function(){
		email();
	});
	$("#emailAdInput").blur(function(){
		email();
	});
	
	function email(){
		var email = $("#emailIdInput").val();
		var middle = $("#emailB").text();
		var address = $("#emailAdInput").val();
		if(email != "" && address != "") {
			$("#totalemail").val(email+middle+address);
		}
	};
	
	$("#email3").change(function(){
		if($(this).val()==9){
			$("#emailAdInput").removeAttr("disabled");
			$("#emailAdInput").val("");
		}else{
			$("#emailAdInput").val($("#email3").val());
			$("#emailAdInput").attr("disabled", true);
		}
		email();
    });
	
	$("#cellphoneInput2").keyup(function(){
		isPushed2 = "false";
	});
	
	$("#cellphoneInput3").keyup(function(){
		isPushed2 = "false";
	});
	
	$("#cellphoneInput2").blur(function(){
		phoneNum();
	});
	
	$("#cellphoneInput3").blur(function(){
		phoneNum();
	});

	function phoneNum(){
		const phoneNum1 = $("#cellphoneInput1").val();
		const phoneNum2 = $("#cellphoneInput2").val();
		const phoneNum3 = $("#cellphoneInput3").val();
		if(phoneNum2 != "" && phoneNum3 != ""){
			$("#totalPhoneNum").val(phoneNum1+phoneNum2+phoneNum3);
			$("#overlapPhoneCheckBtn").click(function(){
				var cellphone = $("#totalPhoneNum").val();
				var sData = {
						"cellphone" : cellphone
				};
				var url = "/member/checkPhoneNum";
				$.post(url, sData, function(rData){
					console.log("rData: "+rData);
					if(rData == 1){
		            	$(this).css('background-color', 'pink');
			            $('#phoneChk').html('<b style=" color: red">[사용중인 번호입니다.]</b>');
		            } else {
						$(this).css('background-color', 'aliceblue');
			            $('#phoneChk').html('<b style=" color: #75daff">[사용가능한 번호입니다.]</b>');
			            isPushed2="true";
		            };
				});
			});
			console.log($("#totalPhoneNum").val());
		}
	}
	
	
	
	$("#joinBtn").click(function(){
		if($("#userid").val() ==""){
			alert("ID를 입력해주세요");
			$("#userid").focus();
		}else if($("#userpwInput").val() == ""){
			alert("비밀번호를 입력해주세요");
			$("#userpwInput").focus();
		}else if($("#userpwInput").val() != $("#userpwInputCheck").val()){
			alert("비밀번호 확인을 비밀번호와 일치하게 입력해주세요");
			$("#userpwInputCheck").val('').focus();
		}else if($("#usernameInput").val() == ""){
			alert("이름을 입력해주세요");
			$("#usernameInput").focus();
		}else if($("#emailIdInput").val() == ""){
			alert("이메일을 입력해주세요");
			$("#emailIdInput").focus();
		}else if($("#emailAdInput").val() == ""){
			alert("이메일 주소를 선택하거나 직접입력을 통해 입력해주세요");
		}else if($('input[name=gender]:checked').val() == ""){
			alert("성별을 선택해주세요");
		}else if($("#totalPhoneNum").val() == ""){
			alert("휴대폰 번호를 입력해주세요")
		}else if(isPushed == "false"){
			$("#userid").val("").focus;
			alert("아이디를 확인하세요");
		}else if(isPushed2 == "false"){
			alert("폰번호를 확인하세요")
		}else if(isPushed3 == "false"){
			alert("닉네임를 확인하세요")
		}else{
			$("#join_form").submit();
			console.log($("#totalemail").val());
		}
	});
		
});
</script>
<div class="container-fluid window">
	<div class="row">
			<div class="col-md-12 myjoinForm">
				<div id="joinTitle">
					<form id="joinTitleForm">
						<img class="joinImage" id="writeImg" src="/resources/login_join/images/jointitle.png">
					</form>
				</div>
				<form id="join_form" role="form" action="/member/join_run" method="post">
					<div class="form-group" id="profileImg">
						<img class="joinImage" id="joinImg" src="/resources/login_join/images/join.png">
						<input class="joinImageFile" type="file" id="file" name="file"
							style="display: none;">
					</div>
					<p class="help-block" id="filecomment">프로필 사진을 등록해주세요.</p>
					<div class="join-form">
						<label for="userid" id="useridlabel">아이디</label> 
						<input type="text" class="form-control" name="userid" id="userid" placeholder="숫자와 영어로 4~10글자"/>
						<div id="checkdiv">
							<button type="button" class="btn btn-outline-secondary" id="overlapIdCheckBtn">아이디 중복확인</button>
							<span id="idChk"></span>
						</div>
					</div>

					<div class="join-form">
						<label for="userpw" id="userpw">비밀번호</label> 
						<input type="password" class="form-control" name="userpw" id="userpwInput" placeholder="영어와 숫자를 포함해서 6~14글자"/>
						<span id="pwChk"></span>
					</div>

					<div class="join-form">
						<label for="userpw2" id="userpw2">비밀번호 확인</label> 
						<input type="password" class="form-control" id="userpwInputCheck" placeholder="위의 비밀번호와 일치하게 작성"/>
						<span id="pwSameChk"></span>
					</div>

					<div class="join-form">
						<div id="name_nick">
							<label for="username" id="username">이름</label> <br>
							<input type="text" class="form-control" name="username" id="usernameInput"/>
						
							<label for="nick" id="nicklabel">닉네임</label> <br>
							<input type="text" class="form-control" name="nickname" id="nickname" /><br>
							<div id="checknic">
								<button type="button" class="btn btn-outline-secondary" id="overlapNickCheckBtn">닉네임 중복확인</button><br>
								<span id="nickChk"></span>
							</div>
						</div>
					</div>
					<div class="join-form">
						<label for="cellphone" id="cellphone">폰번호</label> 
						<div id="cellphonediv">
							<input type="hidden" name="cellphone" id="totalPhoneNum">
							<input type="text" class="form-control" id="cellphoneInput1" value="010" disabled/>-
							<input type="text" class="form-control" id="cellphoneInput2"/>-
							<input type="text" class="form-control" id="cellphoneInput3"/>
						</div>
						<button type="button" class="btn btn-outline-secondary" id="overlapPhoneCheckBtn">폰번호 중복확인</button>
						<span id="phoneChk"></span>
					</div>
					<div class="join-form">
						<label for="email" id="email">이메일</label> 
						<div id="emailDiv">
							<input type="hidden" name="email" id="totalemail">
							<input type="text" class="form-control" name="email1" id="emailIdInput" /><span id="emailB">@</span>
							<input type="text" class="form-control" name="email2" id="emailAdInput" disabled/>
							<select name="email3" id="email3">
								<option value=''>메일 선택</option>
								<option value='9'>직접 입력하기</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
					</div>

					<div class="join-form">
						<label for="gender" id="gender">성별</label>
						<div id="genderRadio">
						<input type="radio" class="gender" name="gender" value="M" /><p id="genderMan">남</p> 
						<input type="radio" class="gender" name="gender" value="F" /><p id="genderWoman">여</p>
						</div> 
					</div>
						<button type="button" class="btn btn-outline-danger" id="joinBtn">가입하기</button>
						<span id="joinBtnSpan"></span>
				</form>
			</div>
			<div id="join_bottom"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>