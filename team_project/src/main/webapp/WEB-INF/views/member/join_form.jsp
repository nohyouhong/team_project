<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">												
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">												
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>												
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>												
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>												
<style>
.gender{
	margin-left: 20px; 
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<form role="form">
					<div class="form-group">
						<label for="userid">아이디</label> 
						<input type="text" class="form-control" id="userid" name="userid"/>
					</div>
				
					<div class="form-group">
						<label for="userpw">비밀번호</label> 
						<input type="password" class="form-control" id="userpw" name="userpw"/>
					</div>
				
					<div class="form-group">
						<label for="userpw2">비밀번호 확인</label> 
						<input type="password" class="form-control" id="userpw2"/>
					</div>
				
					<div class="form-group">
						<label for="username">이름</label> 
						<input type="text" class="form-control" id="username" name="username"/>
					</div>
				
					<div class="form-group">
						<label for="email">이메일</label> 
						<input type="email" class="form-control" id="email" name="email"/>
					</div>
					
					<div class="form-group">
						<label for="gender">성별</label><br>
						<input type="radio" class="gender" name="gender" value="M"/>남
						<input type="radio" class="gender" name="gender" value="F"/>여
					</div>
					
					<div class="form-group">
						<label for="exampleInputFile">프로필 사진</label> 
						<input type="file" class="form-control-file" id="file" name="file"/>
						<p class="help-block">프로필 사진을 등록해주세요.</p>
					</div>
					
					<button type="submit" class="btn btn-primary">가입하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>