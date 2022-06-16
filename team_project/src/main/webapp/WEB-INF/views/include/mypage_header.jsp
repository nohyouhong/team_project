<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

			<!-- partial -->
			<div class="container-fluid">
				<div class="row row-offcanvas row-offcanvas-right">
					<!-- partial:partials/_sidebar.html -->
					<nav class="bg-white sidebar sidebar-offcanvas" id="sidebar">
						<div class="user-info">
							<img src="/resources/main_mypage/images/face.jpg" alt="프로필 이미지">
							<p class="name">${loginVo.username}</p>
							<p class="designation">Manager</p>

						</div>
						<ul class="nav">
							<li class="nav-item">
								<a class="nav-link menuEx" href="index.html">
									<span class="attendance"> 
										<span>2</span><br> <span>이번달 출석</span>
									</span> 
									<span class="attendance"> 
										<span>102</span><br> <span>총누적 출석</span>
									</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link menuEx" href="/message/receive_list?page=1"> 
									<span class="menu-title">쪽지함</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link menuEx" href="/member/point_list?userid=${loginVo.userid }"> 
									<span class="menu-title">포인트 내역</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link menuEx" href="#"> 
									<span class="menu-title">내 정보 수정</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link menuEx" href="/ask/ask_list"> 
									<span class="menu-title">1:1문의</span>
								</a>
							</li>
						</ul>
					</nav>
					<!-- partial -->
					<div class="content-wrapper bg-white">