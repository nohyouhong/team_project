<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>


<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h3>칼럼 목록</h3>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>대표 이미지</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>TB - Monthly</td>
					<td>01/04/2012</td>
					<td>Default</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>


<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>