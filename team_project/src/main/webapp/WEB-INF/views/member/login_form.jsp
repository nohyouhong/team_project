<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">												
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">												
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>												
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>												
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>												
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form role="form">
					
					<div class="form-group">
						<label for="userid">아이디</label> <input
							type="text" class="form-control" id="userid" name="userid"/>
					</div>
					
					<div class="form-group">
						<label for="userpw">비밀번호</label> <input
							type="password" class="form-control" id="userpw" name="userpw"/>
					</div>
					
					<div class="checkbox">
						<label> <input type="checkbox" />아이디 저장</label>
					</div>
					
					<button type="submit" class="btn btn-primary">로그인</button>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>
</html>