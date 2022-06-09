<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>레시피 제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${recipeBoardList }" var="recipeBoardVo" >
						<tr>
							<td>${recipeBoardVo.r_bno }</td>
							<td><a href="/recipeboard/read?r_bno=${recipeBoardVo.r_bno }">${recipeBoardVo.r_title }</a></td>
							<td>${recipeBoardVo.userid }</td>
							<td>${recipeBoardVo.r_regdate }</td>
							<td>${recipeBoardVo.r_viewcnt }</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>