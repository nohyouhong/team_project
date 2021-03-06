<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/customer_center/customer_center.css" type="text/css">
<link rel="stylesheet" href="/resources/customer_center/ask.css" type="text/css">

<script src="/resources/js/myscript.js"></script>
<script>
$(function(){
	$("#fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	$("#fileDrop").on("drop", function(e){
		e.preventDefault();
		var file = e.originalEvent.dataTransfer.files;
		$.each(file, function(){
			var formData = new FormData();
			formData.append("file", this);
			var url = "/customer/uploadFile";
			$.ajax({
				"processData" : false,
				"contentType" : false,
				"url"         : url,
				"method"      : "post",
				"data"        : formData,
				"success"     : function(rData){
					var cloneDiv = $(".divUploaded").eq(0).clone();
					var filename = getFilename(rData);
					cloneDiv.find("span").text(filename);
					cloneDiv.attr("data-filename", rData);
					cloneDiv.find("a.a_delete").attr("data-filename", rData);
					if(isImage(filename)){
						cloneDiv.find("img").attr("src","/customer/displayImage?filename=" + rData);
					}
					$("#uploadedList").append(cloneDiv).show();
					cloneDiv.appendTo($("#fileDrop")).show();
					
				}
			});
		});
	});
	$("#fileDrop").on("click",".a_delete",function(e){
		e.preventDefault();
		var that = $(this);
		var filename = that.attr("data-filename");
		console.log("filename: "+filename);
		var url = "/customer/deleteFile";
		var sData = {
				"filename" : filename
		}
		$.get(url, sData, function(rData){
			if(rData == "true"){
				that.parent().remove();
			}
		});
	});
	$("#frmCreate").submit(function(){
		var divs = $("#fileDrop .a_delete");
		divs.each(function(i){
			var filename = $(this).attr("data-filename");
			var inputHtml = "<input type = 'hidden' name ='files' value='"+ filename +"'>";
			$("#frmCreate").prepend(inputHtml);
		});
	});
	$("#submitBtn").click(function(){
		if($("#a_title").val() == ""){
			alert("?????? ????????? ??????????????????");
		}else if($("#a_content").val() == ""){
			alert("?????? ????????? ??????????????????");
		}else{
			$("#frmCreate").submit();
		}
	});
});
</script>

<div class="row">
	<div class="col-md-12" id="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-3">
						<div class="cus-info">
							<a href="/customer/customer_center">
							<img id="cus_img2" src="/resources/customer_center/images/QnA.png" alt="?????????????????????">
							</a>
						</div>	
					</div>
					<div class="col-md-9">
						<form role="form" method="post" action="/ask/ask_run" id="frmCreate">
						<input type="hidden" value="${loginVo.userid}" name="writer">
						<span id="notice_top">1:1 ?????? ?????????</span>
						<hr>
							<div class="form-group inq">
								<b>?????? ??????</b><input type="text" class="form-control" name="a_title" id="a_title"/>
							</div>
							<div class="form-group inq">
								<b>?????? ??????</b><textarea class="form-control" name="a_content" rows="20" id="a_content"></textarea>
							</div>
							<!--file upload -->
							<div>
								<h5>????????? ????????? ????????? &amp; ???????????????.</h5>
								<div id="fileDrop"></div>
							</div>
							<div class="divUploaded">
								<img src="/resources/customer_center/images/default.png" height="50">
								<span>default.png</span>
								<a href="#" class="a_delete">&times;</a>
							</div>
							<div id="uploadedList"></div>
							<div id="ask_submit">
								<button type="button" class="btn btn-outline-warning" id="submitBtn">????????????</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>