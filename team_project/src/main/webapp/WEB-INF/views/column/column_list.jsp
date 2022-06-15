<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>
#insertColumn {
	background-color: rgb(248, 56, 1);
}

.insertColumn {
	float: right;
	margin-bottom: 20px;
}

.div_column {
	margin-top: 50px;
}

.img_column_list {
	width: 150px;
	height: 150px;
}

.single_column_post {
	justify-content: flex-start;
	width: 100%;
}

.column_title_pic {
	width: 300px;
	height: 280px;
}

.column_img {
	width: 250px;
	height: 200px;
	border-radius: 10px;
}

.column_title {
	font-size: 30px;
	font-weight: bold;
	font-family: Chosunilbo_myungjo;
}

.column_regdate {
	font-size: 15px;
	font-weight: 600;
	font-family: Chosunilbo_myungjo;
}

.column_contents {
	width: 650px;
	height: auto;
	margin-top: 15px;
	font-size: 18px;
	font-family: Chosunilbo_myungjo;
}

.page-item {
	width: 40px;
}

</style>
<div class="row div_column" id="div_column_list">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="column_list_area" id="column_list_area">
			
			<div class="insertColumn">
				<c:if test="${loginVo.m_code == 101}">
					<a class="btn btn-primary" id="insertColumn" href="/column/column_create_form">칼럼 작성</a>
				</c:if>
			</div>
			
			<c:forEach items="${columnList}" var="columnVo">
				<!-- Single Blog Post -->
				<div class="single_column_post d-flex">
					<!-- Blog Thumbnail -->
					<div class="column_title_pic">
						<img class="column_img" src="/column/displayImage?column_image=//192.168.0.110/boardattach/${columnVo.c_picture}" alt="">
					</div>
					<!-- Blog Content -->
					<div class="column_content">
						<a href="/column/readColumn?c_bno=${columnVo.c_bno}" class="column_title">
						<c:choose>
							<c:when test="${fn:length(columnVo.c_title) gt 25}">
								${fn:substring(columnVo.c_title, 0, 25)}...
							</c:when>
							<c:otherwise>
								${columnVo.c_title}
							</c:otherwise>
						</c:choose>
						</a>
						<div class="column_regdate">
							${columnVo.c_regdate}
						</div>
						<a href="/column/readColumn?c_bno=${columnVo.c_bno}">
							<p class="column_contents">${fn:substring(columnVo.c_content, 0, 150)}...</p>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${pagingDto.startPage != 1}">
				<li class="page-item">
					<a class="page-link" href="/column/column_list?page=${pagingDto.startPage -1}">이전</a>
				</li>
			</c:if>
			<c:forEach var="v" begin="${pagingDto.startPage}" end="${pagingDto.endPage}">
				<li class="page-item">
					<a class="page-link" href="/column/column_list?page=${v}">${v}</a>
				</li>
			</c:forEach>
			<c:if test="${pagingDto.endPage != pagingDto.totalPage}">
				<li class="page-item">
					<a class="page-link" href="/column/column_list?page=${pagingDto.endPage + 1}">다음</a>
				</li>
			</c:if>
			</ul>
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- ##### Treading Post Area Start ##### -->


<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>