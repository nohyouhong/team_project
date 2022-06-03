<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.window{
	margin-top:100px;
	margin-bottom:30px;
}
</style>
	<div class="container-fluid window">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form role="form" action="/member/login_run" method="post">
					
					<div class="form-group">
						<label for="userid">아이디</label> 
						<input type="text" class="form-control" id="userid" name="userid"/>
					</div>
					
					<div class="form-group">
						<label for="userpw">비밀번호</label> 
						<input type="password" class="form-control" id="userpw" name="userpw"/>
					</div>
					
					<div class="checkbox">
						<label> <input type="checkbox" id="checkid"/>아이디 저장</label>
					</div>
					
					<button type="submit" class="btn btn-primary">로그인</button>
					<a class="btn btn-success" href="/member/join_form">회원가입</a>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>