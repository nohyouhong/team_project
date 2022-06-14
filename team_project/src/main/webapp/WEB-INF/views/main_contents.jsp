<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>

<style>
.top-recipe {
	margin-bottom: 50px;
}
.top-recipe-item {
	margin-top: 80px;
}
.top_column_title {
	font-family: jua;
	font-size: 30px;
}
.top_column_content {
	font-family: jua;
	font-size: 18px;
}
.sub_column_title {
	font-family: jua;
	font-size: 25px;
}
.sub_column_content {
	font-family: jua;
	font-size: 15px;
}
</style>
<body>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="carousel slide" id="carousel-392965">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-392965" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-392965"></li>
					<li data-slide-to="2" data-target="#carousel-392965"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First"
							src="/resources/main_catagory/custom_images/11.jpg" />
						<div class="carousel-caption">
							<h4>사이트 안내 사진</h4>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second"
							src="/resources/main_catagory/custom_images/10.jpg" />
						<div class="carousel-caption">
							<h4>오늘의 추천 레시피</h4>
							<p>일단 잡솨봐</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third"
							src="/resources/main_catagory/custom_images/9.jpg" />
						<div class="carousel-caption">
							<h4>포인트샵</h4>
							<p>일단 사자</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carousel-392965"
					data-slide="prev"><span class="carousel-control-prev-icon"></span>
					<span class="sr-only">Previous</span></a> <a
					class="carousel-control-next" href="#carousel-392965"
					data-slide="next"><span class="carousel-control-next-icon"></span>
					<span class="sr-only">Next</span></a>
			</div>

			<!-- ##### Catagory Area Start ##### -->
		    <div class="post-catagory section-padding-100-0 mb-70">
		        <div class="container">
		            <div class="row justify-content-center">
		                
		                <!-- Single Post Catagory -->
		                <div class="col-12 col-md-6 col-lg-4">
		                    <div class="single-post-catagory mb-30">
		                        <img src="/resources/main_catagory/custom_images/korean3.jpg" alt="" class="single-post-img">
		                        <!-- Content -->
		                        <div class="catagory-content-bg">
		                            <div class="catagory-content">
		                                <a href="#" class="post-title">Korean food</a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		
		                <!-- Single Post Catagory -->
		                <div class="col-12 col-md-6 col-lg-4">
		                    <div class="single-post-catagory mb-30">
		                        <img src="/resources/main_catagory/custom_images/chinese4.jpg" alt="" class="single-post-img">
		                        <!-- Content -->
		                        <div class="catagory-content-bg">
		                            <div class="catagory-content">
		                                <a href="#" class="post-title">Chinese food</a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		
		                <!-- Single Post Catagory -->
		                <div class="col-12 col-md-6 col-lg-4">
		                    <div class="single-post-catagory mb-30">
		                        <img src="/resources/main_catagory/custom_images/western10.jpg" alt="" class="single-post-img">
		                        <!-- Content -->
		                        <div class="catagory-content-bg">
		                            <div class="catagory-content">
		                                <a href="#" class="post-title">Western food</a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- ##### Catagory Area End ##### -->

	<!-- Top Recipe Section Begin -->
	<section class="top-recipe spad">
		<div class="container po-relative">
			<div class="row">
				<div class="col-lg-6">
					<div class="top-recipe-item large-item">
						<div>
							<a href="/column/readColumn?c_bno=${topColumnVo.c_bno}">
								<img src="/column/displayImage?column_image=C:/boardattach/${topColumnVo.c_picture}" class="main_column_big_img">	
							</a>
						</div>
						<div class="top-recipe-text">
							<a href="/column/readColumn?c_bno=${topColumnVo.c_bno}">
								<c:choose>
									<c:when test="${fn:length(topColumnVo.c_title) gt 33}">
										<h4 class="top_column_title">${fn:substring(topColumnVo.c_title, 0, 18)}...</h4>												
									</c:when>
									<c:otherwise>
										<h4 class="top_column_title">${topColumnVo.c_title}</h4>												
									</c:otherwise>
								</c:choose>
								<p class="top_column_content">${fn:substring(topColumnVo.c_content, 0, 180) }...</p>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6" style="align-content: center">
					<c:forEach items="${subColumnList}" var="subColumnVo">
						<div class="top-recipe-item">
							<div class="row">
								<div class="col-sm-4">
									<div>
										<a href="/column/readColumn?c_bno=${subColumnVo.c_bno}">
											<img src="/column/displayImage?column_image=C:/boardattach/${subColumnVo.c_picture}" class="main_column_small_img">	
										</a>
									</div>
								</div>
								<div class="col-sm-8">
									<div class="top-recipe-text">
										<a href="/column/readColumn?c_bno=${subColumnVo.c_bno}">
											<c:choose>
												<c:when test="${fn:length(subColumnVo.c_title) gt 18}">
													<h4 class="sub_column_title">${fn:substring(subColumnVo.c_title, 0, 18)}...</h4>												
												</c:when>
												<c:otherwise>
													<h4 class="sub_column_title">${subColumnVo.c_title}</h4>												
												</c:otherwise>
											</c:choose>
											<p class="sub_column_content">${fn:substring(subColumnVo.c_content, 0, 100)}...</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div>
				<a href="/column/column_list" style="float: right;">more</a>
			</div>
		</div>
	</section>
	
	</div>
		<div class="col-md-2"></div>
	</div>

<%@ include file="/WEB-INF/views/include/main_footer.jsp" %>
