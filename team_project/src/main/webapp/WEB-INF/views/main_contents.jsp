<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>sample template</title>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="main_catagory/style.css" type="text/css">
    <link rel="stylesheet" href="main_column/css/style.css" type="text/css">
    <link rel="stylesheet" href="ho_main_customstyle.css" type="text/css">
    

</head>

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
							src="main_catagory/custom_images/11.jpg" />
						<div class="carousel-caption">
							<h4>사이트 안내 사진</h4>
							<p></p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second"
							src="main_catagory/custom_images/10.jpg" />
						<div class="carousel-caption">
							<h4>오늘의 추천 레시피</h4>
							<p>일단 잡솨봐</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third"
							src="main_catagory/custom_images/9.jpg" />
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
		                        <img src="main_catagory/custom_images/korean3.jpg" alt="" class="single-post-img">
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
		                        <img src="main_catagory/custom_images/chinese4.jpg" alt="" class="single-post-img">
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
		                        <img src="main_catagory/custom_images/western10.jpg" alt="" class="single-post-img">
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
							<img src="main_column/custom_images/recipe-1.jpg" class="main_column_big_img">	
						</div>
						<div class="top-recipe-text">
							<a href="#">
								<h4>One Pot Weeknight Lasagna Soup Recipe</h4>
							</a>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6" style="align-content: center">
					<div class="top-recipe-item">
						<div class="row">
							<div class="col-sm-4">
								<div>
									<img src="main_column/custom_images/recipe-2.jpg" class="main_column_small_img">	
								</div>
							</div>
							<div class="col-sm-8">
								<div class="top-recipe-text">
									<a href="#">
										<h4>One Pot Weeknight Lasagna Soup Recipe</h4>
									</a>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="top-recipe-item">
						<div class="row">
							<div class="col-sm-4">
								<div>
									<img src="main_column/custom_images/recipe-3.jpg" class="main_column_small_img">	
								</div>
							</div>
							<div class="col-sm-8">
								<div class="top-recipe-text">
									<a href="#">
										<h4>Veggie soup with Mushrooms</h4>
									</a>
									<p>Consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor
										sit amet, consectetur.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="top-recipe-item">
						<div class="row">
							<div class="col-sm-4">
								<div>
									<img src="main_column/custom_images/recipe-4.jpg" class="main_column_small_img">	
								</div>
							</div>
							<div class="col-sm-8">
								<div class="top-recipe-text">
									<a href="#">
										<h4>Caramel Ice Cream with Berries</h4>
									</a>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua.</p>
								</div>
							</div>
						</div>
					</div>
<!-- 					<div class="top-recipe-item"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-sm-4"> -->
<!-- 								<div> -->
<!-- 									<img src="main_column/custom_images/recipe-5.jpg" class="main_column_small_img">	 -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="col-sm-8"> -->
<!-- 								<div class="top-recipe-text"> -->
<!-- 									<a href="#"> -->
<!-- 										<h4>Freash Octopuse with lime juice</h4> -->
<!-- 									</a> -->
<!-- 									<p>Consectetur adipiscing elit, sed do eiusmod tempor -->
<!-- 										incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor -->
<!-- 										sit amet, consectetur.</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			<div>
				<a href="#" style="float: right;">more</a>
			</div>
		</div>
	</section>
	
	</div>
		<div class="col-md-2"></div>
	</div>

</body>
</html>
