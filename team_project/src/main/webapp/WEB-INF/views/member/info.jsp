<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<%@include file="/WEB-INF/views/include/mypage_header.jsp" %>
<style>
.window{
	margin-top:100px;
	margin-bottom:30px;
	text-align: left;
}
</style>
<div class="row">
	<div class="col-md-12 window">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${memberVo.userid }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${memberVo.username }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memberVo.email }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${memberVo.regdate }</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>${memberVo.m_point }</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<%@include file="/WEB-INF/views/include/mypage_footer.jsp" %>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>