<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>
#insertColumn {
	float: right;
	margin-bottom: 20px;
	background-color: rgb(248,56,1);
}
.div_column {
	margin-top: 50px;
}
.col-md-2 {
	background-color: rgb(240, 240, 240);
}
.img_column_list {
	width: 150px;
	height: 150px;
}
.td_column_content {
	float: left;
}
</style>
<div class="row div_column" id="div_column_list">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h3>칼럼 목록</h3>
		<c:if test="${loginVo.m_code == 101}">
			<a class="btn btn-primary" id="insertColumn" href="/column/column_create_form">칼럼 작성</a>
		</c:if>
		<table class="tbl_column_list">
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th></th> -->
<!-- 					<th></th> -->
<!-- 					<th>작성일</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
			<tbody>
				<c:forEach var="columnVo" items="${columnList}" varStatus="status">
					<tr>
						<td><a href="/column/readColumn?c_bno=${columnVo.c_bno}"><img class="img_column_list" src="/column/displayImage?column_image=C:/boardattach/${columnVo.c_picture}"></a></td>
						<td>
							<table class="td_column_list">
								<tr>
									<td>${columnVo.c_title}</td>
								</tr>
								<tr>
									<td class="tbl_column_content">${fn:substring(columnVo.c_content, 0, 150)}...<br>
										${columnVo.c_regdate}</td>
								</tr>
								<tr>
								</tr>
							</table>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>


<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>