<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>

#column_like_div {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
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
	font-family: Chosunilbo_myungjo;
}
.column_content_div { 
 	margin-top: 80px; 
 }
.tbl_column_sub_list {
	text-align: center;
	margin: auto;
}

.column_title_div {
	font-family: Chosunilbo_myungjo;
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
		if (userid == null || userid == "") {
			alert("로그인이 필요합니다.");
		} else {
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
		}
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
	
	
	$(".column_content_div").find("*").each(function() {
		var content = $(this).text();
		console.log("content: ", content);
		$(this).css("font-size", "20px")
			   .css("font-family", "Chosunilbo_myungjo");
	});
});
</script>


<div class="row div_column">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1 class="column_title_div">${columnVo.c_title}</h1>
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
		<table class="table table-borderless tbl_column_sub_list">
			<tbody>
				<c:choose>
					<c:when test="${c_rnum <= 3}">
						<c:forEach var="column_sub_list" items="${columnList}" begin="0" end="4">
							<tr>
								<c:choose>
									<c:when test="${column_sub_list.c_rnum == c_rnum }">
										<td style="background-color: #ffe6e6">
											<a href="/column/readColumn?c_bno=${column_sub_list.c_bno}" style="font-weight: bold;">
											<c:choose>
												<c:when test="${fn:length(column_sub_list.c_title) gt 30}">
													${fn:substring(column_sub_list.c_title, 0, 30)}...
												</c:when>
												<c:otherwise>
													${fn:substring(column_sub_list.c_title, 0, 30)}												
												</c:otherwise>
											</c:choose>
											</a>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<a href="/column/readColumn?c_bno=${column_sub_list.c_bno}">
												<c:choose>
													<c:when test="${fn:length(column_sub_list.c_title) gt 30}">
														${fn:substring(column_sub_list.c_title, 0, 30)}...
													</c:when>
													<c:otherwise>
														${fn:substring(column_sub_list.c_title, 0, 30)}												
													</c:otherwise>
												</c:choose>
											</a>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${c_rnum >= c_count - 2}">
						<c:forEach var="column_sub_list" items="${columnList}" begin="${c_count - 5}" end="${c_count - 1}">
							<tr>
								<c:choose>
									<c:when test="${column_sub_list.c_rnum == c_rnum }">
										<td style="background-color: #ffe6e6">
											<a href="/column/readColumn?c_bno=${column_sub_list.c_bno}" style="font-weight: bold;">
											<c:choose>
												<c:when test="${fn:length(column_sub_list.c_title) gt 30}">
													${fn:substring(column_sub_list.c_title, 0, 30)}...
												</c:when>
												<c:otherwise>
													${fn:substring(column_sub_list.c_title, 0, 30)}												
												</c:otherwise>
											</c:choose>
											</a>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<a href="/column/readColumn?c_bno=${column_sub_list.c_bno}">
											<c:choose>
												<c:when test="${fn:length(column_sub_list.c_title) gt 30}">
													${fn:substring(column_sub_list.c_title, 0, 30)}...
												</c:when>
												<c:otherwise>
													${fn:substring(column_sub_list.c_title, 0, 30)}												
												</c:otherwise>
											</c:choose>
											</a>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="column_sub_list" items="${columnList}" begin="${c_rnum - 3}" end="${c_rnum + 1}">
							<tr>
								<c:choose>
									<c:when test="${column_sub_list.c_rnum == c_rnum }">
										<td style="background-color: #ffe6e6">
											<a href="/column/readColumn?c_bno=${column_sub_list.c_bno}" style="font-weight: bold;">
											<c:choose>
												<c:when test="${fn:length(column_sub_list.c_title) gt 30}">
													${fn:substring(column_sub_list.c_title, 0, 30)}...
												</c:when>
												<c:otherwise>
													${fn:substring(column_sub_list.c_title, 0, 30)}												
												</c:otherwise>
											</c:choose>
											</a>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<a href="/column/readColumn?c_bno=${column_sub_list.c_bno}">
											<c:choose>
												<c:when test="${fn:length(column_sub_list.c_title) gt 30}">
													${fn:substring(column_sub_list.c_title, 0, 30)}...
												</c:when>
												<c:otherwise>
													${fn:substring(column_sub_list.c_title, 0, 30)}												
												</c:otherwise>
											</c:choose>
											</a>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>