<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>

<style>
.column_content {
	padding: 16px 24px;
    border: 1px solid #D6D6D6;
    border-radius: 4px;
}
</style>

<script>
$(function(){
	$("#column_picture").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	$("#column_picture").on("drop", function(e){
		
})
</script>

<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/board/createRun" method="post" id="frmCreate">
				
				<div class="form-group">
					<label for="title"> 칼럼 제목 </label> 
					<input type="text" class="form-control" id="title" name="title"/>
				</div>
				
				<div class="form-group">
					<label for="content"> 칼럼 내용 </label> 
					<textarea class="form-control" id="content" name="content"></textarea>
				</div>
				
				<div>
					<label for="file">첨부 파일을 드래그 &amp; 드롭하세요.</label>
					<div id="fileDrop"></div>
				</div>
				
				<!-- 업로드 항목 템플릿(클론해서 사용) -->
				<div class="divUploaded" style="display:none;">
					<img src="/resources/images/default.png" height="100"><br>
					<span>default.png</span>
					<a class="a_delete" href="#">&times;</a>
				</div>
				
				<!-- 업로드한 파일들 -->
				<div id="uploadedList">
					
				</div>
				<div style="clear:both;">
					<button type="submit" class="btn btn-primary">작성 완료</button>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp"%>