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
}
</style>
<script>
$(document).ready(function(){
	
		
});
</script>
<div class="container-fluid window">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>비밀번호 재설정</h3>
			<hr>
			<p>아래의 내용을 빠짐없이 입력해주세요</p>
			<form class="findPwFrm" action="find_pw_run" method="post">
				<div class="findPwDiv">
					<div class="form-group">
						<label for="userid">아이디</label>
						<input type="text" class="form-control" name="userid"/>
					</div>
					<div class="form-group">
						<label for="username">이름</label>
						<input type="text" class="form-control" name="username"/>
					</div>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="text" class="form-control" name="email"/>
					</div>
					<div class="form-group">
						<button class="btn btn-danger"type="submit">비밀번호 재설정</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>