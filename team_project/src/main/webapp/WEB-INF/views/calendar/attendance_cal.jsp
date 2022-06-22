<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/main_header.jsp" %>
<%@ include file="/WEB-INF/views/include/mypage_header.jsp" %>

<style TYPE="text/css">
td {
	font-family: jua;
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: jua;
	font-size: 9pt;
	color: #000000;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	width: 80%;
	margin: auto;
}

.navigation {
	margin-top: 100px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 3px solid rgb(248, 56, 1);
	height: 120px;
	background-color: rgb(245, 245, 245);
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: rgb(245, 245, 245);
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}
.attend_img_div {
	text-align: center;
	padding-top: 10px;
}
.attend_img {
	width: 100px;
	height: auto;
}
</style>
<script>
$(function(){
	var attend_success = '${attend_success}'
	var attend_fail = '${attend_fail}'
	console.log(attend_success);
	console.log(attend_fail);
	if (attend_fail == 'false') {
		alert("이미 출석체크를 하였습니다.")
	} else if (attend_success == 'true') {
		alert("포인트가 지급되었습니다.")
	}
});
</script>
</head>
<form name="calendarFrm" id="calendarFrm" action="" method="GET">

	<div class="calendar">

		<!--날짜 네비게이션  -->
		<div class="navigation">
			<!-- 이전달 -->
			<a class="before_after_month"
				href="/cal/chkAttendance?year=${today_info.before_year}&month=${today_info.before_month}&userid=${loginVo.userid}">
				&lt;
			</a>
			<span class="this_month"> &nbsp;${today_info.search_year}.
				<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
			</span>
			<!-- 다음달 --> 
			<a class="before_after_month" 
			href="/cal/chkAttendance?year=${today_info.after_year}&month=${today_info.after_month}&userid=${loginVo.userid}">
			&gt;
			</a> 
		</div>

		<table class="calendar_body">

			<thead>
				<tr style="background-color: rgb(255, 227, 219)">
					<td class="day sun">일</td>
					<td class="day">월</td>
					<td class="day">화</td>
					<td class="day">수</td>
					<td class="day">목</td>
					<td class="day">금</td>
					<td class="day sat">토</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="dateList" items="${dateList}"
						varStatus="date_status">
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<td class="today">
									<div class="date">${dateList.date}</div>
									<div class="attend_img_div">
										<c:if test="${not empty dateList.attend_date}">
											<img class="attend_img" src="/resources/attendance_calendar/custom_img_attendance.png">
										</c:if>
									</div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat">${dateList.date}</div>
									<div class="attend_img_div">
										<c:if test="${not empty dateList.attend_date}">
											<img class="attend_img" src="/resources/attendance_calendar/custom_img_attendance.png">
										</c:if>
									</div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==0}">
				</tr>
				<tr>
					<td class="sun_day">
						<div class="sun">${dateList.date}</div>
						<div></div>
					</td>
							</c:when>
							<c:otherwise>
						<td class="normal_day">
							<div class="date">${dateList.date}</div>
							<div class="attend_img_div">
								<c:if test="${not empty dateList.attend_date}">
									<img class="attend_img" src="/resources/attendance_calendar/custom_img_attendance.png">
								</c:if>
							</div>
						</td>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			</tbody>
		</table>
	</div>
</form>
	<%@ include file="/WEB-INF/views/include/mypage_footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/main_footer.jsp"%>