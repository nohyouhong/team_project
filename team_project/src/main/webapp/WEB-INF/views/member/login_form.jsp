<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/login_join/login_join.css" type="text/css">

<style>
.window{
	margin-top:100px;
	margin-bottom:30px;
	height: auto;
	width:100%;
}
#login_top{
	margin-top:100px;
}
#login_bottom {
	margin-bottom:220px;
}
.findLoginInfo {
	margin-top: 20px;
	display: flex;
	justify-content: flex-end;
}
</style>
	<div class="container-fluid window">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div id="login_top"></div>
				<form role="form" id="login_form" action="/member/login_run" method="post">
					<div class="form-group">
						<label for="userid" id="idlabel">아이디</label> 
						<input type="text" class="form-control" id="userid" name="userid"/>
					</div>
					<div class="form-group">
						<label for="userpw" id="pwlabel">비밀번호</label> 
						<input type="password" class="form-control" id="userpw" name="userpw"/>
					</div>
					
					<div class="checkbox">
						<label id="chklabel"> <input type="checkbox" id="checkid"/> 아이디 저장</label>
					</div>
					<br>
					<div id="subdiv">
						<button type="submit" class="btn btn-outline-danger">로그인</button>
						<a class="btn  btn-outline-secondary" href="/member/join_form">회원가입</a>
					</div>
					<div class="findLoginInfo">
						<a href="/member/find_id_form" class="searchclass">아이디 찾기</a>
						<a href="/member/find_pw_form" class="searchclass">비밀번호 찾기</a>
					</div>
				</form>
				<div id="login_bottom"></div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>