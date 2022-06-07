<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form">
				<div class="form-group">
					<label for="title">레시피 제목</label> 
					<input type="text" class="form-control" id="title" name="title"/>
				</div>
				
				<div class="form-group">
					<label for="title">요리소개</label> 
					<input type="text" class="form-control" id="title" name="title"/>
				</div>

				<div class="form-group">
					<label for="title">작성자</label> 
					<input type="text" class="form-control" id="title" name="title"/>
				</div>
				
				<button type="submit" class="btn btn-primary">작성하기</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>