<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<style>
.recipeListNumDiv{
	margin-left: 20px;
	margin-right: 10px;
	margin-top: 100px;
	font-size: 18px;
}
.listNumVal{
	font-size: 25px;
	color: rgba(248, 56, 1);
}
.recipeListDiv{
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}
.oneRecipe{
	display: inline-block;
	margin: 10px;
	margin-top: 20px;
	margin-bottom: 35px;
	width: 280px;
}
.oneRecipeImage{
	width: 280px;
	height: 280px;
	border-radius: 10px;
	cursor: pointer;
}
.listUserImage{
	width: 25px;
	height: 25px;
}
.listUserName{
	margin-left: 5px;
}
.oneRecipeTitle{
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 16px;
	font-weight: bold;
	height: 50px;
}
.oneRecipeInfo{
	margin-top: 10px;
}
.listStarNum, .listViewName, .listViewCnt{
	color: #BEB6B6;
}
.listViewName{
	margin-left: 5px;
}
.listYellowStar{
	color: #EAE909;
	margin-right: -3px;
}
.listGrayStar{
	color: #BEB6B6;
	margin-right: -3px;
}
.listStarNum{
	margin-left: 3px;
}
</style>
<%-- ${recipeBoardList }	 --%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="recipeListNumDiv">
				<span>총</span>
				<span class="listNumVal">${boardCount }</span>
				<span>개의 맛있는 레시피가 있습니다.</span>
			</div>
			<div class="recipeListDiv">
				<c:forEach items="${recipeBoardList }" var="recipeBoardVo">
					<div class="oneRecipe">
						<div>
							<a href="/recipeboard/read?r_bno=${recipeBoardVo.r_bno }">
								<img class="oneRecipeImage" src="/recipeboard/displayImage?filename=${recipeBoardVo.r_titlepic}">
							</a>
						</div>
						<div>
							<div class="oneRecipeTitle">${fn:substring(recipeBoardVo.r_title, 0, 26 )}...</div>
							<div>
								<c:choose>
									<c:when test="${not empty recipeBoardVo.m_picture}">
										<img class="listUserImage rounded-circle" src="/recipeboard/displayImage?filename=${recipeBoardVo.m_picture}">
									</c:when>
									<c:otherwise>
										<img class="listUserImage rounded-circle" src="/resources/main_mypage/images/userImageM.png">
									</c:otherwise>
								</c:choose>
								<span class="listUserName">${recipeBoardVo.username }</span>
							</div>
							<div class="oneRecipeInfo">
								<span class="listStars">
									<c:choose>
										<c:when test="${recipeBoardVo.avgRating > 4}">
											<c:forEach begin="1" end="5">
												<i class="fas fa-star listYellowStar"></i>		
											</c:forEach>
										</c:when>
										<c:when test="${recipeBoardVo.avgRating > 3}">
											<c:forEach begin="1" end="4">
												<i class="fas fa-star listYellowStar"></i>		
											</c:forEach>
											<i class="fas fa-star listGrayStar"></i>
										</c:when>
										<c:when test="${recipeBoardVo.avgRating > 2}">
											<c:forEach begin="1" end="3">
												<i class="fas fa-star listYellowStar"></i>		
											</c:forEach>
											<c:forEach begin="1" end="2">
												<i class="fas fa-star listGrayStar"></i>		
											</c:forEach>
										</c:when>
										<c:when test="${recipeBoardVo.avgRating > 1}">
											<c:forEach begin="1" end="2">
												<i class="fas fa-star listYellowStar"></i>		
											</c:forEach>
											<c:forEach begin="1" end="3">
												<i class="fas fa-star listGrayStar"></i>		
											</c:forEach>
										</c:when>
										<c:when test="${recipeBoardVo.avgRating > 0}">
											<c:forEach begin="1" end="4">
												<i class="fas fa-star listYellowStar"></i>		
											</c:forEach>
											<i class="fas fa-star listGrayStar"></i>		
										</c:when>
										<c:otherwise>
											<c:forEach begin="1" end="5">
												<i class="fas fa-star listGrayStar"></i>		
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</span>
								<span class="listStarNum">(${recipeBoardVo.ratingNum })</span>
								<span class="listViewName">조회수</span>
								<span class="listViewCnt">${recipeBoardVo.r_viewcnt }</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 	페이징 -->
			<div class="row">
				<div class="col-md-12">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pagingDto.startPage != 1 }">
							<li class="page-item"><a class="page-link" href="${pagingDto.startPage - 1}">이전</a></li>
							</c:if>
							<c:forEach begin="${pagingDto.startPage }" end="${pagingDto.endPage }" var="i">
								<li
									<c:choose>
										<c:when test="${i == param.page }">
											class="page-item active"
										</c:when>
										<c:otherwise>
											class="page-item"
										</c:otherwise>							
									</c:choose>
								 class="page-item"><a class="page-link" href="${i }">${i }</a></li>
							</c:forEach>
							<c:if test="${pagingDto.endPage != pagingDto.totalPage }">
							<li class="page-item"><a class="page-link" href="${pagingDto.endPage + 1}">다음</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
<!-- 			페이징 -->
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>