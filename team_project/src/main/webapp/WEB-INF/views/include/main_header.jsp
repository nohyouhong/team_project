<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
	<head>
	<title>오늘뭐먹지?</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 	mypage script -->
<!-- Required meta tags -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="shortcut icon" href="/resources/main_mypage/images/favicon.png" />
  <link rel="stylesheet" href="/resources/main_mypage/hongcss.css" />



	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/resources/main_header/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/resources/main_header/css/icomoon.css">
	<!-- Ion Icon Fonts-->
	<link rel="stylesheet" href="/resources/main_header/css/ionicons.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/resources/main_header/css/bootstrap.min.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/resources/main_header/css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="/resources/main_header/css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="/resources/main_header/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/main_header/css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="/resources/main_header/css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="/resources/main_header/fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="/resources/main_header/css/style.css" type="text/css">

	<!-- customfont css -->
	<link rel="stylesheet" href="/resources/main_header/css/font.css" type="text/css">
	
	<!-- ho/main -->
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/main_catagory/style.css" type="text/css">
    <link rel="stylesheet" href="/resources/main_column/css/style.css" type="text/css">
    <link rel="stylesheet" href="/resources/ho_main_customstyle.css" type="text/css">
	
	<!-- summernote -->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
	<!-- font awesome -->
	<script src="https://kit.fontawesome.com/8393ee0e69.js" crossorigin="anonymous"></script>
	
	<!-- daum address api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	</head>
<script>
$(function(){
	var attend_success = '${attend_success}'
	var attend_fail = '${attend_fail}'
	console.log(attend_success);
	console.log(attend_fail);
	if (attend_fail == 'false') {
		alert("이미 출석체크를 하였습니다.")
	} else if (attend_success == 'true') {
		alert("출석완료!포인트가 지급되었습니다.")
	}
	// 검색
	$(".searchInputBtn").click(function(e) {
		e.preventDefault();
		var searchInput = $(".searchInput").val();
		if(searchInput != ""){
			console.log(searchInput);
			location.href = "/recipeboard/recipe_list?searchType=allSearch&keyword=" + searchInput;
		}
	});
});
</script>
	<body>
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row toploginmenu">
						<div class="col-md-12" id="col12" >
						<c:choose>
							<c:when test="${empty loginVo}">
								<a href="/member/login_form">로그인</a>
								<a href="/member/join_form">회원가입</a>
							</c:when>
							<c:otherwise>
								<a href="/member/logout">로그아웃</a>
								<c:choose>
									<c:when test="${loginVo.m_code == 101}">
										<a href="/inquiry/inquiry_admin_list">관리자페이지</a>
									</c:when>
									<c:otherwise>
										<a href="/cal/insertAttendance?userid=${loginVo.userid}">출석체크</a>
										<a href="/member/point_list?userid=${loginVo.userid}">마이페이지</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
							<a href="/customer/customer_center">고객센터</a>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-7 col-md-5">
							<div id="colorlib-logo"><a href="/">
							<img id=logoimg src="/resources/main_header/images/logo.png"></a></div>
							
						</div>
						<div class="col-sm-4 col-md-4" id="uldiv">
			            <ul>
								<li><a href="/recipeboard/recipe_list">레시피</a></li>
								<li><a href="/pointshop/list">포인트샵</a></li>
								<li><a href="/column/column_list">칼럼</a></li>
<!-- 								<li class="cart"><a href="cart.html"><i class="icon-shopping-cart"></i> Cart [0]</a></li> -->
						</ul>
						</div>
						<div class="col-sm-4 col-md-3">
			            <form id="searchForm" action="#" class="search-wrap" style="padding-top:70px;">
			               <div class="form-group">
			                  <input type="search" class="form-control search searchInput" placeholder="Search">
			                  <button class="btn submit-search text-center searchBtn searchInputBtn" type="submit"><i class="icon-search"></i></button>
			               </div>
			            </form>
			       		</div>
		         </div>
				</div>
			</div>
		</nav>
	</div>