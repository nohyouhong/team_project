<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.cookP{
	padding: 35px;
	padding-left: 60px;
	padding-right: 60px;
}
.cookCenterDiv{
	text-align: center;
}
.mainImage{
	position:relative;
	top: 30px;
	width: 680px;
	height: 400px;
}
.userImageDiv{
	position:relative;
	bottom: 50px;
}
.userImage{
	width: 150px;
	height: 150px;
}
.cookUserid{
	position: relative;
	top: 8px;
	font-size: 18px;
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
	font-size: 19px;
	color: #BEB6B6;
}
.createHr2{
	margin-top: 10px;
	margin-bottom: 30px;
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
.iconExplain{
	margin-top: 5px;
}
.cookReadUl{
	list-style: none;
	width: 100%;
	margin-top: 30px;
	margin-left: 60px;
	margin-right: 60px;
}
.cookReadLl{
	width: 23%;
	display: inline-block;
	margin: 22px;
	margin-right:50px;	
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
.stepDiv{
	margin-top: 30px;
}
.cookTipTitle{
	color: rgba(248, 56, 1);
	font-size: 28px;
}
.cookTipEx{
	font-size: 20px;
	margin: 30px;
}
.stepContent{
	font-size: 23px;
	margin-top: 90px;
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 30px;
}
.r_contentP{
	padding-top: 5px;
}
.stepPicDiv, .userImageInfo{
	text-align: center;
}
.stepCount{
	float: right;
	color: rgba(248, 56, 1);
	font-size: 28px;
	font-weight: bold;
}
.cookStepStyleSpan{
	float:right;
	margin-top: 10px;
	margin-right: 90px;
}
.cookStepStyleIcon{
	border: 2px solid #BEB6B6;
	padding: 10px;
	color: #BEB6B6;
	cursor: pointer;
/* 	background: #8C8C8C; */
}
.stepPicture{
	width: 900px;
	height: 450px;
}
.stepPicture3{
	width: 300px;
	height: 150px;
}
.userImage2{
	width: 120px;
	height: 120px;
}
.userInfomation{
	margin: 30px;
	font-size: 20px;
}
.userInfos{
	margin-top: 15px;
}
.userEmail{
	margin-top: 10px;
	margin-left: 10px;
	font-size: 17px;
}
</style>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="cookP cookCenterDiv">
			<img class="mainImage" 
				src="/recipeboard/displayImage?filename=${recipeBoardVo.r_titlepic }"/>
			<div class="userImageDiv">
				<img class="userImage rounded-circle img-thumbnail" 
					src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" /><br>
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
							<span class="iconExplain">${recipeBoardVo.f_type }</span>
						</div>
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span><br> 
							<span>${recipeBoardVo.f_type }</span>
						</div>
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span><br> 
							<span>${recipeBoardVo.f_type }</span>
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
							<a href="${ingredientVo.i_address}" target="_blank">
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
			<div>
				<span class="cookTitleP">조리순서</span>
				<span class="cookSecondTitleP">Steps</span>
				<span class="cookStepStyleSpan">
					<i class="fas fa-images cookStepStyleIcon fa-2x"></i>
					<i class="fas fa-align-justify cookStepStyleIcon fa-2x"></i>
					<i class="far fa-images cookStepStyleIcon fa-2x"></i>
				</span>
			</div>
			<div class="stepDiv">
			<c:forEach items="${recipeStepVoList }" var="recipeStepVo" varStatus="index"> 
				<div class=".step1">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-10 r_contentP">${recipeStepVo.r_content }</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="stepPicDiv">
						<c:choose>
							<c:when test="${not empty recipeStepVo.r_picture }">
								<img class="stepPicture img-thumbnail" 
									src="/recipeboard/displayImage?filename=${recipeStepVo.r_picture }">
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class=".step2" style="display:none;">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-10">${recipeStepVo.r_content }</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
				<div class=".step3" style="display:none;">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-8">${recipeStepVo.r_content }</div>
							<div class="col-md-3">
								<div class="stepPicDiv">
									<c:choose>
										<c:when test="${not empty recipeStepVo.r_picture }">
											<img class="stepPicture3 img-thumbnail" 
												src="/recipeboard/displayImage?filename=${recipeStepVo.r_picture }">
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<i class="fa-solid fa-circle-exclamation fa-2x cookTipTitle"></i>
			<span class="cookTipTitle" style="margin-left: 10px">팁/주의사항 </span>
			<div class="cookTipEx">${recipeBoardVo.r_cooktip }</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">레시피 작성자</span>
			<span class="cookSecondTitleP">Writer</span>
			<div class="row userInfomation">
				<div class="col-md-2 userImageInfo">
					<c:choose>
						<c:when test="${not empty memberVo.m_picture }">
							<img class="userImage2 rounded-circle" 
								src="/recipeboard/dispalyImage?filename=${memberVo.m_picture }">
						</c:when>
						<c:otherwise>
							<img class="userImage2 rounded-circle" 
								src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="col-md-10 userInfos">
					<div>
						<span>${memberVo.username }</span>
						<a class="btn btn-primary btn-outline-* btn-sm" style="margin-left: 10px;">쪽지 보내기</a>
					</div>
					<div class="userEmail">${memberVo.email }</div>
				</div>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">댓글달기</span>
			<span class="cookSecondTitleP">comment</span>
		</div>
		<hr class="createHr2">
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>