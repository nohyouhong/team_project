<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form">
				<h3>레시피 등록</h3>
				
				<div class="form-group">
					<label for="title">레시피 제목</label> 
					<input type="text" class="form-control" id="title" name="title"/>
				</div>
				<div class="form-group">
					<label for="title">요리 소개</label> 
					<input type="text" class="form-control" id="title" name="title"/>
				</div>
				<div class="form-group">
					<label for="title">카테고리</label> 
					<select name="종류">
						<option>종류별</option>
					</select>
					<input type="" class="form-control" id="title" name="title"/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputFile"> File input </label> <input
						type="file" class="form-control-file" id="exampleInputFile" />
					<p class="help-block">Example block-level help text here.</p>
				</div>
		
				<button type="submit" class="btn btn-primary">저장</button>
			</form>
			<img alt="Bootstrap Image Preview"
				src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>