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
    $('#idChk').html('<b style="font-size: 14px; color: yellowgreen">[아이디를 입력해주세요]');
    
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
		            } else {
		            	$(this).css('background-color', 'pink');
			            $('#idChk').html('<b style=" color: red">[사용중인 아이디입니다.]</b>');
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
    if(pwInput != '' && pwInputCheck != ''){
    	$(this).css('background-color', 'pink');
    	$('#pwSameChk').html('<b style=" color: red">[비밀번호를 한번 더 입력해주세요]');
    }
//     $("#join_form").submit();
    
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
				<form id="join_form" role="form" action="/member/" method="post">
					<div class="form-group" id="profileImg">
						<img class="joinImage" id="joinImg" src="/resources/login_join/images/join.png">
						<input class="joinImageFile" type="file" id="file" name="file"
							style="display: none;">
					</div>
					<p class="help-block" id="filecomment">프로필 사진을 등록해주세요.</p>
					<div class="form-group">
						<label for="userid" id="useridlabel">아이디</label> 
						<input type="text" class="form-control" name="userid" id="userid" placeholder="숫자와 영어로 4~10글자"/>
						<div id="checkdiv">
							<button type="button" class="btn btn-outline-secondary" id="overlapIdCheckBtn">아이디 중복확인</button>
							<span id="idChk"></span>
						</div>
					</div>

					<div class="form-group">
						<label for="userpw" id="userpw">비밀번호</label> 
						<input type="password" class="form-control" name="userpw" id="userpwInput" placeholder="영어와 숫자를 포함해서 6~14글자"/>
						<span id="pwChk"></span>
					</div>

					<div class="form-group">
						<label for="userpw2" id="userpw2">비밀번호 확인</label> 
						<input type="password" class="form-control" id="userpwInputCheck" placeholder="위의 비밀번호와 일치하게 작성"/>
						<span id="pwSameChk"></span>
					</div>

					<div class="form-group">
						<label for="username" id="username">이름</label> 
						<input type="text" class="form-control" name="username" />
					</div>

					<div class="form-group">
						<label for="email" id="email">이메일</label> 
						<input type="email" class="form-control" name="email" />
					</div>

					<div class="form-group">
						<label for="gender" id="gender">성별</label>
						<div id="genderRadio">
						<input type="radio" class="gender" name="gender" value="M" /><p id="genderMan">남</p> 
						<input type="radio" class="gender" name="gender" value="F" /><p id="genderWoman">여</p>
						</div> 
					</div>
						<button type="button" class="btn btn-outline-danger">가입하기</button>
				</form>
			</div>
			<div id="join_bottom"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>