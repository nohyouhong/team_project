<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>


<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">


<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/board/createRun" method="post" id="frmCreate">
				
				<div class="form-group">
					<label for="title"> 칼럼 제목 </label> 
					<input type="text" class="form-control" id="c_title" name="c_title"/>
				</div>
				
				<div class="form-group">
					<label for="content"> 칼럼 내용 </label> 
					<textarea class="summernote" id="c_content" name="c_content"></textarea>
				</div>
				<script>
				$(".summernote").summernote({
					height: 450,
					lang: "ko-KR"
				});
				</script>
				
				<div style="clear:both;">
					<button type="submit" class="btn btn-primary">작성 완료</button>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp"%>