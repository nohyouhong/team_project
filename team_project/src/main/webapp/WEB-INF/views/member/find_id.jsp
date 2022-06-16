<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">
<script>
$(document).ready(function(){
	
		
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>아이디 찾기</h3>
			<hr>
			<p>아이디를 찾는 방법을 선택해주세요</p>
			<div>
				<input type="radio" name="selectMethod" value="email" checked>가입시 등록한 이메일로 찾기
				<div class="form-group">
					<label for="username">이름</label>
					<input type="text" class="form-control" name="username"/>
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="email" class="form-control" name="email"/>
				</div>
				<hr>
				<input type="radio" name="selectMethod" value="cellphone">가입시 등록한 휴대폰번호로 찾기
				<div class="form-group">
					<label for="username">이름</label>
					<input type="text" class="form-control" name="username"/>
				</div>
				<div class="form-group">
					<label for="cellphone">휴대폰 번호</label>
					<input type="text" class="form-control" name="cellphone"/>
				</div>
			</div>
			<div>
				
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>