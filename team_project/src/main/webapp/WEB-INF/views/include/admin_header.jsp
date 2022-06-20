<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/admin/admin.css" type="text/css">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" id="admin_div">
				<form id="admin_form">
					<nav class="adminsidebar">
						<div class="admin-info">
							<img id="admin-img" src="/resources/admin/images/admin.png" alt="관리자 이미지">
						</div>
							<p class="admin-name">${loginVo.username}</p>
						<ul class="nav">
							<li class="admin-item">
								<a class="nav-link menuEx" href="/message/receive_list?page=1"> 
									<span class="admin-title">전체문의내역</span>
								</a>
							</li>
							<li class="admin-item">
								<a class="nav-link menuEx" href="/ask/ask_admin_list"> 
									<span class="admin-title">1:1문의내역</span>
								</a>
							</li>
							<li class="admin-item">
								<a class="nav-link menuEx" href="/member/member_list"> 
									<span class="admin-title">회원정보관리</span>
								</a>
							</li>
							<li class="admin-item">
								<a class="nav-link menuEx" href="/member/admin_join_form"> 
									<span class="admin-title">관리자 추가</span>
								</a>
							</li>
						</ul>
					</nav>
				</form>
					<!-- partial -->
					<div class="admin-wrapper">
					
