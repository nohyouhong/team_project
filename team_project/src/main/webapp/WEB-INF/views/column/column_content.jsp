<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>

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
#column_manage_btn_div {
	float: right;	
}
.div_column {
	margin-top: 50px;
	margin-bottom: 50px;
}
.column_regdate {
	font-size: 18px;
}
 .column_content_div { 
 	font-size: 25px; 
 } 
</style>

<script>

$(document).ready(function(){
	var is_column_like = "false"
	var c_bno = $(".fa-thumbs-up").attr("data-c_bno");
	
	// 좋아요 - 하트
	$(".fa-thumbs-up").click(function() {
		var userid = "${loginVo.userid}"
		var url = "/column/column_like";
		var sendData = {
			"c_bno" : c_bno, 
			"userid" : userid
		};
		var thumbs_up = $(this);
		$.post(url, sendData, function(rData) {
			console.log("rData: " + rData);
			console.log("is_column_like: " + is_column_like);
	 		var span = $("#column_like_span");
			if (rData == "success") {
				if (is_column_like == "true") {
					thumbs_up.css("color", "black");
					span.css("color", "black");
			 		span.text(parseInt(span.text().trim()) - 1);
			 		is_column_like = "false";										
				} else {
					thumbs_up.css("color", "rgb(248,56,1)");
					span.css("color", "rgb(248,56,1)");
			 		span.text(parseInt(span.text().trim()) + 1);
			 		is_column_like = "true";
				}
			};
		});
	});
	var sData = {
			"c_bno" : c_bno, 
			"userid" : "${loginVo.userid}"
	}
	console.log("sData: ", sData);
	$.get("/column/is_column_like", sData, function(receivedData){
//	 	console.log(receivedData);
		is_column_like = receivedData;
		if(receivedData == "true") {
			$(".fa-thumbs-up").css("color", "rgb(248,56,1)");
		} else {
			$(".fa-thumbs-up").css("color", "black");			
		}
	});
	
	$(".column_content_div").children("p").css("font-size", "20px");
});
</script>


<div class="row div_column">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1>${columnVo.c_title}</h1>
		<p class="column_regdate">${columnVo.c_regdate}</p>
		<div class="column_content_div">${columnVo.c_content}</div>
		<c:if test="${loginVo.m_code == 101}">
			<div id="column_manage_btn_div">
				<a href="/column/column_modify_form?c_bno=${columnVo.c_bno}" class="btn btn-info">수정</a>
				<a href="/column/column_delete?c_bno=${columnVo.c_bno}" class="btn btn-danger">삭제</a>
			</div>
		</c:if>
		<div id="column_like_div">
			<i class="fa-regular fa-thumbs-up" data-c_bno="${columnVo.c_bno}"></i>
			<span id="column_like_span">${columnVo.c_likecnt}</span>
		</div>
		<table class="table">
			<tbody>
				<c:forEach var="columnvo" items="${columnList}" begin="${columnvo.c_bno}" end="${columnvo.c_bno + 5}">
					<tr>
						<td>${columnvo.c_bno}</td>
						<td><a href="/column/readColumn?c_bno=${columnvo.c_bno}">${columnvo.c_title}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>