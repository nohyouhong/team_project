<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<%@include file="/WEB-INF/views/include/paging.jsp" %>
<link rel="stylesheet" href="/resources/recipe/recipe_list.css" type="text/css">

<script>
$(function(){
	var frmPaging = $("#frmPaging");
	//read할때 
	$(".recipeBoardLink").click(function() {
		var r_bno = $(this).attr("data-r_bno"); 
		frmPaging.find("input[name=r_bno]").val(r_bno);
		frmPaging.attr("action", "/recipeboard/recipe_read");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 이전 1, 2 ~ 10 다음   등등..
	$("a.page-link").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		
		frmPaging.find("input[name=page]").val(page);
		frmPaging.attr("action", "/recipeboard/recipe_list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	// 최신순, 조회순, 평점순   등등..
	$("a.listType").click(function(e) {
		e.preventDefault();
		var listType = $(this).attr("href");
		
		frmPaging.find("input[name=listType]").val(listType);
		frmPaging.attr("action", "/recipeboard/recipe_list");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
	
	$("#createRecipeBtn").click(function(e) {
		e.preventDefault();
		
		frmPaging.attr("action", "/recipeboard/recipeCreateForm");
		frmPaging.attr("method", "get");
		frmPaging.submit();
	});
});
</script>
<%-- ${recipeBoardList }	 --%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="listTypeDiv">
				<button style="visibility: hidden;" class="btn btn-outline-danger">레시피 작성 공간을 위해</button>
				<c:if test="${not empty loginVo }">
					<button id="createRecipeBtn" class="btn btn-outline-danger">
						<i class="fa-solid fa-pen-to-square fa-lg"></i>
						레시피 작성하기
					</button>
				</c:if>
				<a href="r_bno" class="listType"><span class="listTypeBtn 
				<c:if test="${pagingDto.listType == 'r_bno'}">selectTypeBtn</c:if>
				">최신순</span></a>
				<a href="r_viewcnt" class="listType"><span class="listTypeBtn 
				<c:if test="${pagingDto.listType == 'r_viewcnt'}">selectTypeBtn</c:if>
				">조회순</span></a>
				<a href="avgRating" class="listType"><span class="listTypeBtn 
				<c:if test="${pagingDto.listType == 'avgRating'}">selectTypeBtn</c:if>
				">평점순</span></a>
			</div>
			<div class="recipeListNumDiv">
				<span>총</span>
				<span class="listNumVal">${boardCount }</span>
				<span>개의 맛있는 레시피가 있습니다.</span>
			</div>
			<div class="recipeListDiv">
				<c:forEach items="${recipeBoardList }" var="recipeBoardVo">
					<div class="oneRecipe">
						<div>
							<a class="recipeBoardLink" data-r_bno="${recipeBoardVo.r_bno}" href="/recipeboard/recipe_read?r_bno=${recipeBoardVo.r_bno }">
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
				<div class="col-md-12 pagingDiv">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pagingDto.startPage != 1 }">
							<li class="page-item"><a class="page-link" href="${pagingDto.startPage - 1}">이전</a></li>
							</c:if>
							<c:forEach begin="${pagingDto.startPage }" end="${pagingDto.endPage }" var="i">
								<li
									<c:choose>
										<c:when test="${i == pagingDto.page }">
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