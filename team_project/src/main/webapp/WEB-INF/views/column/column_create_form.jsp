<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp"%>

<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
function isImage(filename) {
	// 확장자 체크 - png, jpg, gif
	var dotIndex = filename.lastIndexOf(".");
	var extName = filename.substring(dotIndex + 1);
	var ext = extName.toLowerCase();
	if (ext == "png" || ext == "jpg" || ext == "gif") {
		return true;
	} else {
		return false;
	};
};

function uploadColumnImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadColumnImage",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(rData) {
			console.log("rData: ", rData)
			$(el).summernote('editor.insertImage', rData);
			var index = rData.indexOf(":");
			console.log("index: " + index);
			var filename = rData.substring(49);
			console.log("filename: ", filename);
			var html = "<input type='hidden' name='pictures' value=" + filename + ">"
			$("#frmColumn").prepend(html);
			
		}
	});
}

</script>
	<div class="row div_column">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="/column/column_create_run" method="post" id="frmColumn">
				<input type="hidden" name="userid" value="${loginVo.userid}">
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
					toolbar: [
// 					    ['style', ['style']],
					    ['font', ['bold', 'italic', 'underline', 'clear']],
					    ['fontname', ['fontname']],
					    ['color', ['color']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['table', ['table']],
					    ['insert', ['link', 'picture', 'hr']],
					    ['help', ['help']]
					  ], 
					//콜백 함수
		            callbacks: { 
		            	onImageUpload : function(files, editor, welEditable) {
				            // 파일 업로드(다중업로드를 위해 반복문 사용)
				            for (var i = files.length - 1; i >= 0; i--) {
				            	console.log('image upload:', files[i].name);
				            	if (files[i].size > 1024*1024*5) {
				        			alert("5mb미만의 이미지를 넣어주세요");
				            	} else {
				            		if (isImage(files[i].name)){
				            			console.log(isImage(files[i].name))
					            		uploadColumnImageFile(files[i], this);				            			
				            		}
				            	}
				    		}
		            	}
		            }
				});
				</script>								
				<button type="submit" class="btn btn-primary">작성 완료</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp"%>