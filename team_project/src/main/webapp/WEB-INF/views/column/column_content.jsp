<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>
#column_content_div {
	margin-bottom: 100px;
}

#column_like_div {
	text-align: center;
}

.fa-thumbs-up { 
	font-size: 50px;
	cursor:pointer;
	margin-right: 10px;
}

#column_like_span {
	font-size: 50px;
}
</style>

<script>
$(document).ready(function(){
	
	// 좋아요 - 하트
	$(".fa-thumbs-up").click(function() {
		var c_bno = $(this).attr("data-c_bno");
		var url = "/column/column_like";
		var sendData = {
			"c_bno" : c_bno
		};
		var thumbs_up = $(this);
		$.post(url, sendData, function(rData) {
			console.log("rData: " + rData);
// 	 		var span = $("#column_like_span");
// 			if (rData == "success") {
// 				if (is_like == "true") {
// 					thumbs_up.css("color", "black");
// 					span.css("color", "black");
// 			 		span.text(parseInt(span.text().trim()) - 1);
// 			 		is_like = "false";										
// 				} else {
// 					thumbs_up.css("color", "rgb(248,56,1)");
// 					span.css("color", "rgb(248,56,1)");
// 			 		span.text(parseInt(span.text().trim()) + 1);
// 			 		is_like = "true";
// 				}
// 			};
		});
	});
});
</script>

<%-- ${columnVo} --%>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8" id="column_content_div">
		<h3>${columnVo.c_title}</h3>
		${columnVo.c_content}
		<div id="column_like_div">
			<i class="fa-regular fa-thumbs-up" data-c_bno="${columnVo.c_bno}"></i>
			<span id="column_like_span">0</span>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>