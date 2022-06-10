<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.cookP{
	padding: 35px;
}
.cookCenterDiv{
	text-align: center;
}
.mainImage{
	width: 680px;
	height: 400px;
}
.userImageDiv{
	position:relative;
	bottom: 50px;
}
.cookUserid{
	font-size: 16px;
	font-weight: bold;
}
.cookTitle{
	font-size: 30px;
	font-weight: bold;
}
.cookTitleP{
	font-size: 26px;
}
.cookSecondTitleP{
	margin-left: 5px;
	font-size: 15px;
	font-style:italic;
	color: #BEB6B6;
}
.cookExplain{
	margin-top: 25px; 
	font-size: 16px;
	color: #BEB6B6;
}
.createHr2{
	margin-bottom: 30px
}
.iconDivs{
	margin-top: 60px;
}
.iconDiv{
	width: 30%;	
}
.cookIcon, .grayCol{
	color: #BEB6B6;
}
.cookReadUl{
	list-style: none;
	width: 100%;
	margin-left: 30px;
	margin-top: 30px;
}
.cookReadLl{
	width: 20%;
	display: inline-block;
	margin: 20px;	
	border-bottom: 1px solid #C9C3C3;
}
.cookLiSpan{
	font-size: 18px;
}
.cookLiSpanAfter{
	float:right;
	font-size: 18px;
}
.info, .infoSpan{
	cursor: pointer;
}
</style>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="cookP cookCenterDiv">
			<img class="mainImage" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
			<div class="userImageDiv">
				<img class="userImage" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" /><br>
				<span class="cookUserid">${memberVo.username }</span>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="cookTitle">${recipeBoardVo.r_title }</div>
					<div class="cookExplain">${recipeBoardVo.r_explain }</div>
					<div class="row iconDivs">
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span><br> 
							<span>${recipeBoardVo.f_code }</span>
						</div>
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span><br> 
							<span>${recipeBoardVo.f_code }</span>
						</div>
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span><br> 
							<span>${recipeBoardVo.f_code }</span>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">재료</span>
			<span class="cookSecondTitleP">Ingredients</span>
			<div>
				<ul class="cookReadUl">
					<c:forEach items="${ingredientVoList }" var="ingredientVo">
						<li class="cookReadLl">
							<span class="cookLiSpan">${ingredientVo.i_name}</span>
							<a class="">
								<i class="fa-solid fa-circle-info fa-lg info"></i>
								<span class="grayCol infoSpan">나무위키</span>
							</a>
							<span class="cookLiSpanAfter grayCol">${ingredientVo.i_amount}${ingredientVo.i_unit}</span>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">조리순서</span>
			<span class="cookSecondTitleP">Steps</span>
			<div>
			<c:forEach items=""> 
				
			</c:forEach>
			</div>
		</div>
		<hr class="createHr2">
		
		<div>
			<span># 팁/주의사항</span>
			<div>${recipeBoardVo.r_cooktip }</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">레시피 작성자</span>
			<span class="cookSecondTitleP">Writer</span>
			<div class="row">
				<div class="col-md-2">
					${memberVo.m_picture }
				</div>
				<div class="col-md-10">
					<div>
						<span>${memberVo.username }</span>
						<a class="btn btn-primary">쪽지 보내기</a>
					</div>
					<div>${memberVo.email }</div>
				</div>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">댓글달기</span>
			<span class="cookSecondTitleP">영어 부제목</span>
		</div>
		<hr class="createHr2">
	</div>
	<div class="col-md-2"></div>
</div>


<%@include file="/WEB-INF/views/include/main_footer.jsp" %>