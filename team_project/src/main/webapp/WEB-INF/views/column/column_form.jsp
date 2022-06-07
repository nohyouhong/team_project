<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/column/column_run" method="post" id="frmColumn">
				
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
					minHeight: null,
		        	maxHeight: null,
		        	focus: true,
					lang: "ko-KR", 
					//콜백 함수
		            callbacks: { 
		            	onImageUpload : function(files, editor, welEditable) {
				            // 파일 업로드(다중업로드를 위해 반복문 사용)
				            for (var i = files.length - 1; i >= 0; i--) {
				            uploadColumnImageFile(files[i], this);
				    		}
		            	}
		            }
				});
		        
				function uploadColumnImageFile(file, el) {
					data = new FormData();
					data.append("file", file);
					$.ajax({
						data : data,
						type : "POST",
						url : "uploadSummernoteImageFile",
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false,
						success : function(data) {
							$(el).summernote('editor.insertImage', data.url);
						}
					});
				}
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