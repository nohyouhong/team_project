<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<style>
.findPwDiv {
	border:medium ridge rgb(255,227,219);
	border-radius:5px;
	box-shadow: 10px 5px 5px rgb(255,227,219);
	padding:15px 10px 25px 10px;
	font-family: jua;
	width: 600px;
	margin: 0 auto;
}
</style>
<script>
$(document).ready(function(){
	$("#getVerifCode").on("click", function(e){
		e.preventDefault();
		var userid = $("#userid").val();
		var username = $("#username").val();
		var email = $("#email").val();
		var url = "/member/chk_find_pw";
		var sData = {
				"userid" : userid, 
				"username" : username, 
				"email" : email
		}
		$.post(url, sData, function(rData) {
			console.log("rData: ", rData)
			if (rData != "fail") {
				$(".verif_code_div").show();
				$(".compl_find_pw").show();
				$("#getVerifCode").hide();
				$(".rdKey").val(rData);
			} else if (rData == "fail") {
				alert("입력한 정보와 일치하는 회원 정보가 없습니다.");
			}
		}); // $.post
	}); // getVerifCode
	
	$(".compl_find_pw").on("click", function(e){
		e.preventDefault();
		var rdKey = $(".rdKey").val();
		var verif_code = $(".verif_code").val();
		if (rdKey == verif_code) {
			$("#findPwFrm").submit();
		} else {
			alert("인증번호를 확인해주세요.")
		}
	});
		
}); // script
</script>
<div class="container-fluid window">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h3>비밀번호 재설정</h3>
			<hr>
			<p>아래의 내용을 빠짐없이 입력해주세요</p>
			<form id="findPwFrm" action="/member/find_pw_run" method="post">
				<input type="hidden" class="rdKey" name="rdKey" value="">
				<div class="findPwDiv">
					<div class="form-group">
						<label for="userid">아이디</label>
						<input type="text" class="form-control" name="userid" id="userid"/>
					</div>
					<div class="form-group">
						<label for="username">이름</label>
						<input type="text" class="form-control" name="username" id="username"/>
					</div>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="text" class="form-control" name="email" id="email"/>
					</div>
					<div class="form-group verif_code_div" style="display: none;">
						<label for="verif_code">인증번호</label>
						<input type="text" class="form-control verif_code" name="verif_code" placeholder="이메일을 확인해주세요"/>
					</div>
					<div class="form-group">
						<a href="#" class="btn btn-danger" id="getVerifCode">인증번호 받기</a>
						<button class="btn btn-success compl_find_pw" type="submit" style="display: none;">인증번호 확인</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>