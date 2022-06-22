<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>
<link rel="stylesheet" href="/resources/user_info/user_info.css" type="text/css">
<script>
$(document).ready(function(){
	const getPwCheck = RegExp(/^[a-zA-Z0-9]{6,14}$/);
	
	var isPushed = "true";
	var isPushed2 = "true";
	var isPushed3 = "true";
	var isPushed4 = "true";
	
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
	    	isPushed="true";
	    }else{
	    	$(this).css('background-color', 'pink');
	    	$('#pwSameChk').html('<b style=" color: red">[비밀번호가 일치하지 않습니다]');
	    	isPushed="false";
	    }
    });
	
	if(${memberVo.gender == 'M'}){
		$("#M").attr("checked", "checked");
	}else{
		$("#F").attr("checked", "checked");
	}
	$("#modify_userBtn").click(function(){
		$(this).fadeOut();
		$("#modify_userRun").fadeIn();
		$("#userpwInput").val("").attr("disabled",false);
		$("#userpwInputCheck").val("").attr("disabled",false);
		$("#nicknameInput").attr("disabled",false);
		$("#cellphoneInput2").attr("disabled",false);
		$("#cellphoneInput3").attr("disabled",false);
		$("#emailIdInput").attr("disabled",false);
		
		$("#userpwNow").attr("name","userpw");
		$("#email3").show();
		$("#pwChg").show();
	});
	
	$("#nicknameInput").blur(function(){
		$("#overlapNickCheckBtn").show();
		inPushed4="false";
		$(this).css('background-color', 'white');
     	$('#nickChk').html('<b style=" color: yellowgreen">[닉네임 중복체크 해주세요]');
			$("#overlapNickCheckBtn").click(function(){
				
				var nickname = $("#nicknameInput").val();
				var sData = {
						"nickname" : nickname
				};
				var url = "/member/checkNick";
				$.post(url, sData, function(rData){
					console.log(rData);
					if(rData != 1){
						$(this).css('background-color', 'aliceblue');
			            $('#nickChk').html('<b style=" color: #75daff">[사용가능한 닉네임입니다.]</b>');
			            isPushed3 = "true";
		            } else {
		            	$(this).css('background-color', 'pink');
			            $('#nickChk').html('<b style=" color: red">[사용중인 닉네임입니다.]</b>');
			            isPushed3="false";
		            };
				});
			});
	});
	
	$("#cellphoneInput2").blur(function(){
		isPushed2 = "false";
		$("#overlapPhoneCheckBtn").show();
		phoneNum();
	});
	
	$("#cellphoneInput3").blur(function(){
		isPushed2 = "false";
		$("#overlapPhoneCheckBtn").show();
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
					if(rData != 1){
						$(this).css('background-color', 'aliceblue');
			            $('#phoneChk').html('<b style=" color: #75daff">[사용가능한 번호입니다.]</b>');
			            isPushed2="true";
		            } else {
		            	$(this).css('background-color', 'pink');
			            $('#phoneChk').html('<b style=" color: red">[사용중인 번호입니다.]</b>');
			            isPushed2="false";
		            };
				});
			});
		}
	}
	$('#nickname').keyup(function() {
        if($(this).val() === '' ) {
           $(this).css('background-color', 'pink');
           $('#nickChk').html('<b style=" color: red">[닉네임은 필수값입니다.]</b>');
        }
    });
	
	$("#email3").change(function(){
		if($(this).val()==9){
			$("#emailAdInput").removeAttr("disabled");
		}else{
			$("#emailAdInput").val($("#email3").val());
			$("#emailAdInput").attr("disabled", true);
		}
    });
	
	$("#emailIdInput").blur(function(){
		email();
	});
	$("#email3").change(function(){
		email();
	});
	
	function email(){
		const email = $("#emailIdInput").val();
		const middle = $("#emailB").text();
		const address = $("#emailAdInput").val();
		if(email != "" && address != "") {
			$("#totalemail").val(email+middle+address);
			isPushed4 = "true";
		}else if(email == ""){
			isPushed4 = "false";
		}
	};
	
	$("#pwChg").click(function(){
		$(".pwChgInput").show();
		$("#userpwNow").val("");
		$("#userpwNow").attr("name","");
		$("#hiddenpwd").attr("name","");
		$("#userpwInput").attr("name","userpw");
		$("#userpwNow").attr("disabled", false);
		$(this).hide();
	});
	
	$("#userpwNow").blur(function(){
		var userpw = ${memberVo.userpw};
		if($("#userpwNow").val() != userpw){
			$('#NowPwChk').html('<b style="color: red">[현재 비밀번호와 일치하지 않습니다.]</b>');
		}else{
			$('#NowPwChk').html('<b style="color: yellowgreen">[현재 비밀번호와 일치합니다.]</b>');
		}
	});
	
	$("#modify_userRun").click(function(){
		var userpw = ${memberVo.userpw};
		if(isPushed == "false"){
			$('#joinBtnSpan').html('<b style="color: red">[수정된 비밀번호를 입력해주세요.]</b>');
		}else if(isPushed2 == "false"){
			$('#joinBtnSpan').html('<b style="color: red">[폰번호를 확인해주세요.]</b>');
		}else if(isPushed3 == "false"){
			$('#joinBtnSpan').html('<b style="color: red">[닉네임을 확인해주세요.]</b>');
		}else if(isPushed4 == "false"){
			$('#joinBtnSpan').html('<b style="color: red">[이메일을 입력해주세요.]</b>');
		}else if($("#userpwNow").val() != userpw){
			$('#joinBtnSpan').html('<b style="color: red">[현재 비밀번호를 확인해주세요.]</b>');
		}else{
			$("#info-form").submit();
		}

		console.log("userid: " + $("#userid").val());
		console.log("userpw: " + $("#userpwNow").val());
		console.log("username: " + $("#usernameInput").val());
		console.log("nickname: " + $("#nicknameInput").val());
		console.log("cellphone: " + $("#totalPhoneNum").val());
		console.log("email: " + $("#totalemail").val());
	});
	
});
</script>
<div class="container-fluid window">
	<div class="row">
			<div class="col-md-12 myjoinForm">
				<form id="info-form" role="form" action="/member/member_modify" method="post">
					<div class="join-form">
						<label for="userid" id="useridlabel">아이디</label> 
						<input type="hidden"  name="userid" value="${memberVo.userid}">
						<input type="text" class="form-control"id="userid" value="${memberVo.userid}" disabled="disabled"/>
					</div>
					<div class="join-form">
						<label for="userpw" id="userpw">현재 비밀번호</label>
						<input type="hidden" name="userpw" value="${memberVo.userpw}" id="hiddenpwd">
						<input type="password" class="form-control" id="userpwNow" value="${memberVo.userpw}" disabled/>
						<span id="NowPwChk"></span>
					</div>
					<button type="button" class="btn btn-outline-secondary" id="pwChg">비밀번호 변경하기</button>
					<div class="join-form pwChgInput">
						<label for="userpw" id="userpw">비밀번호</label> 
						<input type="password" class="form-control" id="userpwInput" />
						<span id="pwChk"></span>
					</div>
					<div class="join-form pwChgInput">
						<label for="userpw2" id="userpw2">비밀번호 확인</label> 
						<input type="password" class="form-control" id="userpwInputCheck" />
						<span id="pwSameChk"></span>
					</div>
					<div id="name_nick">
						<div class="join-form">
							<label for="username" id="username">이름</label> 
							<input type="hidden" name="username" value="${memberVo.username}">
							<input type="text" class="form-control" id="usernameInput" value="${memberVo.username}" disabled/>
						</div>
						<div class="join-form">
							<label for="nickname" id="nickname">닉네임</label> 
							<input type="text" class="form-control" name="nickname" id="nicknameInput" value="${memberVo.nickname}" disabled/>
							<div id="checknic">
								<button type="button" class="btn btn-outline-secondary" id="overlapNickCheckBtn">닉네임 중복확인</button><br>
								<span id="nickChk"></span>
							</div>
						</div>
					</div>
						<label for="cellphone" id="cellphone">폰번호</label> <br>
					<div class="join-form" id="phonediv">
						<div id="cellphonediv">
							<input type="hidden" name="cellphone" id="totalPhoneNum" value="${memberVo.cellphone}">
							<input type="text" class="form-control" id="cellphoneInput1" value="010" disabled/>-
							<input type="text" class="form-control" id="cellphoneInput2" value="${fn:substring(memberVo.cellphone, 3, 7)}" disabled/>-
							<input type="text" class="form-control" id="cellphoneInput3" value="${fn:substring(memberVo.cellphone, 7, 12)}" disabled/>
						</div>
						<button type="button" class="btn btn-outline-secondary" id="overlapPhoneCheckBtn">폰번호 중복확인</button>
						<span id="phoneChk"></span>
					</div>
					<div class="join-form">
						<label for="email" id="email">이메일</label> 
						<div id="emailDiv">
							<input type="hidden" name="email" id="totalemail" value="${memberVo.email}">
							<input type="text" class="form-control" id="emailIdInput" value="${fn:substringBefore(memberVo.email,'@')}" disabled/><span id="emailB">@</span>
							<input type="text" class="form-control" id="emailAdInput" value="${fn:substringAfter(memberVo.email,'@')}" disabled/>
							<select id="email3">
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
						<input type="hidden" name="gender" value="${memberVo.gender}">
						<input type="radio" class="gender" id="M" value="M" disabled/><p id="genderMan">남</p> 
						<input type="radio" class="gender" id="F" value="F" disabled/><p id="genderWoman">여</p>
						</div> 
					</div>
						<button type="button" class="btn btn-outline-danger" id="modify_userBtn">정보수정</button>
						<button type="button" class="btn btn-outline-primary" id="modify_userRun">정보수정완료</button>
						<span id="joinBtnSpan"></span>
				</form>
			</div>
			<div id="join_bottom"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>