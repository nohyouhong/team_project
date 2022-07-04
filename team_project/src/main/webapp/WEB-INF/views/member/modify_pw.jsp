<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<style>
.modiPwDiv {
	border:medium ridge rgb(255,227,219);
	border-radius:5px;
	box-shadow: 10px 5px 5px rgb(255,227,219);
	padding:15px 10px 25px 10px;
	font-family: jua;
	width: 600px;
	margin: 0 auto;
}
#userpw, #chk_userpw{
	font-family:"Poppins", sans-serif;
	font-size:12px;
}
</style>
<script>
$(document).ready(function(){
	
	$('#chk_userpw').keyup(function(){
	    if($(this).val() == $('#userpw').val()){
	    	$(this).css('background-color', 'white');
	    	$('#pwChk').html('<b style=" color: green">[비밀번호가 일치합니다]');
	    } else {
	    	$(this).css('background-color', 'pink');
	    	$('#pwChk').html('<b style=" color: red">[비밀번호가 일치하지 않습니다]');
	    }
    });	
	
	$("#modi_pw_btn").click(function(e){
		e.preventDefault();
		var userpw = $("#userpw").val();
		var chk_userpw = $("#chk_userpw").val();
		if (userpw != chk_userpw) {
			alert("비밀번호 확인을 비밀번호와 일치하게 입력해주세요");
		} else {
			$("#modiPwFrm").submit();
		}
	}); // modi_pw_btn
		
}); // script
</script>
<div class="container-fluid window">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h3>비밀번호 재설정</h3>
			<hr>
			<p>변경할 비밀번호를 입력해주세요.</p>
			<form id="modiPwFrm" action="modi_pw_run" method="post">
				<input type="hidden" class="userid" name="userid" value="${memberVo.userid}">
				<input type="hidden" class="username" name="username" value="${memberVo.username}">
				<input type="hidden" class="email" name="email" value="${memberVo.email}">
				
				<div class="modiPwDiv">
					<div class="form-group">
						<label>새로운 비밀번호</label>
						<input type="password" class="form-control" name="userpw" id="userpw" placeholder="영어와 숫자를 포함해서 6~14글자"/>
					</div>
					<div class="form-group">
						<label>새로운 비밀번호 확인</label>
						<input type="password" class="form-control" id="chk_userpw" placeholder="위의 비밀번호와 일치하게 작성"/>
						<span id="pwChk"></span>
					</div>
					<div class="form-group">
						<button class="btn btn-danger" id="modi_pw_btn">비밀번호 재설정 완료</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>