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
</style>

<div class="row div_column">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h3>칼럼 목록</h3>
		<a class="btn btn-primary" id="insertColumn" href="/column/column_form">칼럼 작성</a>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th></th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="columnVo" items="${columnList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td><a href="/column/readColumn?c_bno=${columnVo.c_bno}">${columnVo.c_title}</a></td>
						<td><img src=></td>
						<td>${columnVo.c_regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>


<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>