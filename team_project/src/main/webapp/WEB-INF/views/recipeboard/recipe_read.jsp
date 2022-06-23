<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/WEB-INF/views/include/main_header.jsp" %>
<link rel="stylesheet" href="/resources/recipe/recipe.css" type="text/css">
<script src="/resources/recipe/recipe_read.js" ></script>
<!-- 모달리스트 -->
<div class="row">
	<div class="col-md-12">
<!-- 	모달 별 평점매기기-->
		<a id="modal-269785" style="display: none;" href="#modal-container-269785" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>
			
		<div class="modal fade" id="modal-container-269785" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">평점을 매겨주세요.</h4>
					</div>
					<div class="modal-body modalReview">
						<div class="starReviewEx">당신의 평점은?</div>
						<div class="starsDiv">
							<div class="starRating">
							  <input type="radio" id="stars5" name="rating" value="5" />
							  <label for="stars5" class="star">&#9733;</label>
							  <input type="radio" id="stars4" name="rating" value="4" />
							  <label for="stars4" class="star">&#9733;</label>
							  <input type="radio" id="stars3" name="rating" value="3" />
							  <label for="stars3" class="star">&#9733;</label>
							  <input type="radio" id="stars2" name="rating" value="2" />
							  <label for="stars2" class="star">&#9733;</label>
							  <input type="radio" id="star1" name="rating" value="1" />
							  <label for="star1" class="star">&#9733;</label>
							</div>
						</div>
					</div>
					<div class="modal-footer modalReview">
						<button type="button" id="starRatingFinish" class="btn btn-outline-primary">평점등록</button>
					</div>
				</div>
			</div>
		</div>
<!-- 		모달 사진만 -->
		<a id="modal-531767" style="display: none;" href="#modal-container-531767" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>

		<div class="modal fade" id="modal-container-531767" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">사 진</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<img id="modalReviewImage" src="#">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
<!-- 		모달 리뷰이미지리스트 -->
		<a id="modal-533333" style="display: none;" href="#modal-container-533333" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>

		<div class="modal fade" id="modal-container-533333" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg"" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">포토 리뷰 전체보기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body mymodalBody">
						<div class="modalImageDiv">
							<i id="modalLeftBtn" class="fas fa-chevron-circle-left fa-4x"></i>
							<img id="modalReviewImageList" src="#">
							<i id="modalRightBtn" class="fas fa-chevron-circle-right fa-4x"></i>
						</div>
						<div id="modalReviewInfo" class="modalReviewInfo">
							<div class="UserInfoDiv">
								<span><img id="modalReviewPic" class="rounded-circle" src="#"></span>
								<span id="modalReviewUser">노유홍</span> 
								<span id="modalReviewDate">2022-06-12</span>
								<span id="modalReviewScore"></span>
							</div>
							<div id="modalReviewComment">코멘트를 달아주세용</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-secondary"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
<!-- 		모달 쪽지보내기 -->
		<a id="modal-522222" style="display: none;" href="#modal-container-522222" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>

		<div class="modal fade" id="modal-container-522222" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">쪽지 보내기</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<textarea id="modalMessageText" 
							placeholder="쪽지내용을 입력해주세요."></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" id="modalSendBtn" class="btn btn-outline-primary"
							>보내기</button>
						<button type="button" class="btn btn-outline-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<a id="modal-534545" style="display: none;" href="#modal-container-534545" role="button"
			class="btn" data-toggle="modal">Launch demo modal</a>

		<div class="modal fade" id="modal-container-534545" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">신고사유를 선택해주세요.</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="declareDiv">
							<input type="radio" class="declareReason declare1009Hide" id="declare1001" name="declare" value="1001">
							<label class="declareLabel" for="declare1001">광고/홍보</label><br>
							<input type="radio" class="declareReason declare1009Hide" id="declare1002" name="declare" value="1002">
							<label class="declareLabel" for="declare1002">음란/선정성</label><br>
							<input type="radio" class="declareReason declare1009Hide" id="declare1003" name="declare" value="1003">
							<label class="declareLabel" for="declare1003">욕설/비방</label><br>
							<input type="radio" class="declareReason declare1009Hide" id="declare1004" name="declare" value="1004">
							<label class="declareLabel" for="declare1004">안 맞는 글</label><br>
							<input type="radio" class="declareReason declare1009Hide" id="declare1005" name="declare" value="1005">
							<label class="declareLabel" for="declare1005">도배글</label><br>
							<input type="radio" class="declareReason declare1009Hide" id="declare1006" name="declare" value="1006">
							<label class="declareLabel" for="declare1006">중복글</label><br>
							<input type="radio" class="declareReason declare1009Hide" id="declare1007" name="declare" value="1007">
							<label class="declareLabel" for="declare1007">저작권 위배</label><br>
							<input type="radio" class="declareReason declare1009Hide" id="declare1008" name="declare" value="1008">
							<label class="declareLabel" for="declare1008">개인정보 노출</label><br>
							<input type="radio" class="declareReason" id="declare1009" name="declare" value="1009">
							<label class="declareLabel" for="declare1009">기타</label><br>
							<input type="text" id="declareExplain" style="display:none;"></input>
						</div>
					</div>
					<div class="modal-footer modalDeclareBtnDiv">
						<button type="button" id="reciepCommentDeclareBtn" class="btn btn-outline-danger"
							data-dismiss="modal">신고하기</button>
						<button type="button" class="btn btn-outline-secondary"
							data-dismiss="modal">취소하기</button>
					</div>
				</div>
			</div>
		</div>
<!-- 모달리스트 -->
<!-- 쪽지폼 -->
<form id="messageForm" method="post">
	<input type="hidden" id="sender" name="sender">
	<input type="hidden" id="receiver" name="receiver">
	<input type="hidden" id="message" name="message">
	<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno }">
</form>
<!-- 쪽지폼 -->
<!-- 신고폼 -->
<form id="declareForm" method="post">
	<input type="hidden" id="r_cno" name="r_cno">
	<input type="hidden" id="reporter" name="reporter" value="${loginVo.userid }">
	<input type="hidden" id="criminal" name="criminal">
	<input type="hidden" id="d_code" name="d_code">
	<input type="hidden" id="d_explain" name="d_explain">
</form>
<!-- 신고폼 -->
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="cookP cookCenterDiv">
			<img class="mainImage" 
				src="/recipeboard/displayImage?filename=${recipeBoardVo.r_titlepic }"/>
			<div class="userImageDiv">
				<c:choose>
					<c:when test="${not empty memberVo.m_picture }">
						<img class="userImage rounded-circle img-thumbnail" 
							src="/recipeboard/displayImage?filename=${memberVo.m_picture }" /><br>
					</c:when>
					<c:otherwise>
						<img class="userImage rounded-circle img-thumbnail" 
							src="/resources/main_mypage/images/userImageM.png" /><br>
					</c:otherwise>
				</c:choose>
				<div class="cookUserid">${memberVo.username }</div>
				<div class="cookViewRatingDiv">
					<span class="cookavgRating">
						<i class="fas fa-star fa-lg"></i>
						<span class="cookavgRatingVal">${fn:substring(recipeBoardVo.avgRating, 0, 3 )}</span>
					</span>
					<span class="cookViewCntBack">
						<i class="fas fa-eye fa-lg"></i>
						<span class="cookViewCntVal">${recipeBoardVo.r_viewcnt }</span>
					</span>
				</div>
			</div>
			<div class="row" style="clear:both;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="cookTitle">${recipeBoardVo.r_title }</div>
					<div class="cookExplain">${recipeBoardVo.r_explain }</div>
					<div class="row iconDivs">
						<div class="col-md-4 iconDiv">
							<span><i class="fa-solid fa-bowl-rice fa-3x cookIcon"></i></span> 
							<div class="iconExplain">${recipeBoardVo.f_type }</div>
						</div>
						<div class="col-md-4 iconDiv">
							<span><i class="fas fa-clock fa-3x cookIcon"></i></span> 
							<div class="iconExplain">${recipeBoardVo.r_time }</div>
						</div>
						<div class="col-md-4 iconDiv">
							<c:choose>
								<c:when test="${recipeBoardVo.r_level == '쉬움'}">
									<span><i class="fas fa-grin-alt fa-3x cookIcon"></i></span>
								</c:when>
								<c:when test="${recipeBoardVo.r_level == '보통'}">
									<span><i class="fas fa-grin-beam-sweat fa-3x cookIcon"></i></span>
								</c:when>
								<c:when test="${recipeBoardVo.r_level == '어려움'}">
									<span><i class="fas fa-tired fa-3x cookIcon"></i></span>
								</c:when>
							</c:choose>
							<div class="iconExplain">${recipeBoardVo.r_level }</div>
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
					<i class="fas fa-images cookStepStyleIcon fa-2x" id="stepStyle1"></i>
					<i class="fas fa-align-justify cookStepStyleIcon fa-2x" id="stepStyle2"></i>
					<i class="far fa-images cookStepStyleIcon fa-2x" id="stepStyle3"></i>
				</span>
			</div>
			<div class="stepDiv">
			<c:forEach items="${recipeStepVoList }" var="recipeStepVo" varStatus="index"> 
				<div class="step1">
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
						<c:if test="${not empty recipeStepVo.r_picture }">
							<img class="stepPicture img-thumbnail" 
								src="/recipeboard/displayImage?filename=${recipeStepVo.r_picture }">
						</c:if>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${recipeStepVoList }" var="recipeStepVo" varStatus="index"> 
				<div class="step2" style="display:none;">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-10 r_contentP">${recipeStepVo.r_content }</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${recipeStepVoList }" var="recipeStepVo" varStatus="index"> 
				<div class="step3" style="display:none;">
					<div class="stepContent">
						<div class="row">
							<div class="col-md-1">
								<span class="stepCount">${index.count }</span>
							</div>
							<div class="col-md-7 r_contentP">${recipeStepVo.r_content }</div>
							<div class="col-md-3">
								<div class="stepPicDiv">
									<c:if test="${not empty recipeStepVo.r_picture }">
										<img class="stepPicture3 img-thumbnail" 
											src="/recipeboard/displayImage?filename=${recipeStepVo.r_picture }">
									</c:if>
								</div>
							</div>
							<div class="col-md-1"></div>
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
								src="/recipeboard/displayImage?filename=${memberVo.m_picture }">
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
						<a id="sendMessageBtn" class="btn btn-outline-primary" style="margin-left: 10px;">쪽지 보내기</a>
					</div>
					<div class="userEmail">${memberVo.email }</div>
				</div>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP">
			<span class="cookTitleP">포토리뷰</span>
			<span id="imageListNum" class="cookTitleExNum">comment</span>
			<div id="cookRecipeReImageDiv">
				<img class="cookRecipeReImage" style="display: none;" src="/resources/main_mypage/images/cookSample.jpg">
			</div>
			<div class="imageListButtonDiv" id="imageListButtonDiv" style="display: none;">
				<button class="imageListButton">
					<span class="imageListbuttonChar">+더보기</span><br>
					<span id="imageListNum2" class="imageListbuttonChar">숫자</span>
				</button>
			</div>
		</div>
		<hr class="createHr2">
		
		<div class="cookP" id="cookReviewAll">
			<span class="cookTitleP">요리후기</span>
			<span id="reviewListNum" class="cookTitleExNum">comment</span>
			<div id="cookRecipeReDiv">
				<div class="row oneRecipeReview" style="display: none;">
					<div class="reviewUserImageDiv">
						<img class="reviewUserImage rounded-circle"
							src="/resources/main_mypage/images/userImageM.png">								
					</div>
					<div class="reviewUserInfo">
						<div class="UserInfoDiv">
							<span class="reviewUser">사람이름</span> 
							<span class="reviewDate">2022-06-12</span>
							<span class="reviewScore"></span>
						</div>
						<div class="userReviewVal">코멘트를 달아주세용</div>
					</div>
					<div class="reviewUserCookImageDiv">
					</div>
				</div>
			</div>
			<div class="showHideDiv">
				<button id="reviewShowButton" class="showButton" style="display: none;">더보기</button>
				<button id="reviewHideButton" class="hideButton" style="display: none;">줄여보기</button>
			</div>
			<form id="cookReviewForm">
				<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno}">
				<input type="hidden" name="userid" value="${loginVo.userid}">
				<input type="hidden" name="m_picture" value="${loginVo.m_picture}">
				<input type="hidden" id="r_rating" name="r_rating">
				<div class="cookReviewInputDiv row">
					<div class="col-md-1">
						<img class="reviewImage" id="reviewImage"
							src="/resources/main_mypage/images/cook.png"> <input
							class="reviewUserImageFile" type="file" id="file3" name="file"
							style="display: none;">
					</div>
					<div class="col-md-10">
						<textarea rows="4" id="r_comment3" name="r_comment"
							class="reviewTextarea"></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="reviewButton" id="reviewButton">등록</button>
					</div>
				</div>
			</form>
		</div>
		<hr class="createHr2">
		
		<div class="cookP" id="cookCommentAll">
			<span class="cookTitleP">댓글달기</span>
			<span class="cookTitleExNum" id="commentNum">갯수</span>
			<div id="cookCommentDiv">
				<div class="oneComment" style="display: none;">
					<div class="commentUserImageDiv">
						<img class="commentUserImage rounded-circle"
							src="/resources/main_mypage/images/userImageM.png">
					</div>
					<div class="commentUserInfo">
						<div class="UserInfoDiv">
							<span class="commentUser">이름</span> 
							<span class="commentDate">날짜</span>
							<span class="smallHr">|</span> 
							<a class="commentReply" href="#">답글</a>
						</div>
						<div class="userCommentVal">코멘트</div>
					</div>
				</div>

				<!-- 				<이동용> -->
				<form id="cookCommentForm2" style="display: none;">
					<div class="cookCommentInputDiv2 row">
						<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno}">
						<input type="hidden" id="re_group" name="re_group"> <input
							type="hidden" name="userid" value="${loginVo.userid}">
						<div class="col-md-1">
							<img class="commentImage" id="commentImage2"
								src="/resources/main_mypage/images/userImagePlus.png"> <input
								class="commentUserImageFile" type="file" id="file2" name="file"
								style="display: none;">
						</div>
						<div class="col-md-10">
							<textarea rows="4" id="r_comment2" name="r_comment"
								class="commentTextarea"></textarea>
						</div>
						<div class="col-md-1">
							<button type="button" class="commentButton" id="commentButton2">등록</button>
						</div>
					</div>
				</form>
			</div>
			
<!-- 				<이동용> -->
			<div class="showHideDiv">
				<button id="commentShowButton" class="showButton" style="display: none;">더보기</button>
				<button id="commentHideButton" class="hideButton" style="display: none;">줄여보기</button>
			</div>
			<form id="cookCommentForm">
				<div class="cookCommentInputDiv row">
					<input type="hidden" name="r_bno" value="${recipeBoardVo.r_bno}">
					<input type="hidden" name="userid" value="${loginVo.userid}">
					<div class="col-md-1">
						<img class="commentImage" id="commentImage"
							src="/resources/main_mypage/images/userImagePlus.png"> <input
							class="commentUserImageFile" type="file" id="file" name="file"
							style="display: none;">
					</div>
					<div class="col-md-10">
						<textarea rows="4" id="r_comment" name="r_comment"
							class="commentTextarea"></textarea>
					</div>
					<div class="col-md-1">
						<button type="button" class="commentButton" id="commentButton">등록</button>
					</div>
				</div>
			</form>
		</div>
		<hr class="createHr2">
		
		<div class="cookP" id="cookCommentAll">
			<span class="cookTitleP">태그</span>
			<span class="cookSecondTitleP">Tag</span>
			<div id="tagDiv">
				<c:forEach items="${tagList}" var="oneTag">
					<span class="oneTag">
						<span class="tagFront">#</span>
						<span class="tagName">${oneTag}</span>
					</span>
				</c:forEach>
			</div>
		</div>
		<hr class="createHr2">
		<div class="cookP" id="buttonsDiv">
			<a class="btn btn-outline-success linkBtn" href="/recipeboard/recipe_list">목록으로</a>
			<c:if test="${memberVo.userid == loginVo.userid }">
				<a class="btn btn-outline-info linkBtn" href="/recipeboard/updateForm?r_bno=${recipeBoardVo.r_bno }">수정하기</a>
				<a class="btn btn-outline-danger linkBtn" href="/recipeboard/delete?r_bno=${recipeBoardVo.r_bno }" id="btnDelete">삭제하기</a>
			</c:if>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<%@include file="/WEB-INF/views/include/main_footer.jsp" %>