<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>
#insertColumn {
	float: right;
	margin-bottom: 20px;
	background-color: rgb(248, 56, 1);
}

.col-md-2 {
	background-color: rgb(240, 240, 240);
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
}

.column_list_area {

}

.column_title_pic {
	width: 330px;
	height: 310px;
}

.column_img {
	width: 250px;
	height: 200px;
}

.column_content {
	width: 650px;
	height: auto;
}

.column_title {
	font-size: 30px;
	font-weight: bold;
}

.column_regdate {
	font-size: 15px;
}

.column_contents {
	font-size: 20px;
	}

</style>
<div class="row div_column" id="div_column_list">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="column_list_area" id="column_list_area">
		
			<h4>Column List</h4>
			<c:if test="${loginVo.m_code == 101}">
				<a class="btn btn-primary" id="insertColumn" href="/column/column_create_form">칼럼 작성</a>
			</c:if>
			
			<c:forEach items="${columnList}" var="columnVo">
				<!-- Single Blog Post -->
				<div class="single_column_post d-flex">
					<!-- Blog Thumbnail -->
					<div class="column_title_pic">
						<img class="column_img" src="/column/displayImage?column_image=C:/boardattach/${columnVo.c_picture}" alt="">
					</div>
					<!-- Blog Content -->
					<div class="column_content">
						<a href="/column/readColumn?c_bno=${columnVo.c_bno}" class="column_title">${columnVo.c_title}</a>
						<div class="column_meta">
							${columnVo.c_regdate}
						</div>
						<a href="/column/readColumn?c_bno=${columnVo.c_bno}" class="column_regdate">
							<p class="column_contents">${fn:substring(columnVo.c_content, 0, 150)}...</p>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- ##### Treading Post Area Start ##### -->


<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>