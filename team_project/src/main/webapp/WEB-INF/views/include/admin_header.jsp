<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<img src="/resources/admin/images/admin.png" alt="관리자 이미지">
							<p class="name">${loginVo.username}</p>
						</div>
						<ul class="nav">
							<li class="nav-item">
								<a class="nav-link menuEx" href="/message/receive_list?page=1"> 
									<span class="menu-title">전체문의내역</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link menuEx" href="/inquiry/inquiry_admin_list"> 
									<span class="menu-title">1:1문의내역</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link menuEx" href="#"> 
									<span class="menu-title">회원정보관리</span>
								</a>
							</li>
						</ul>
					</nav>
					<!-- partial -->
					<div class="content-wrapper bg-white">