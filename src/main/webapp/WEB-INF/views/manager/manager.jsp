<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/manager.css"/>
	<title>My Company Manager</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 관리자 메인 페이지 본문 부분 -->
<main>
	<!-- 출석 체크 완료되었음을 표시 -->
	<c:if test="${not empty attedStartSuccess}">
		<input type="hidden" id="attedStartSuccess" value="${attedStartSuccess.atte_start}"/>
	</c:if>
	
	<!-- 퇴근 체크할 때 당일 출석 체크를 하지 않았음을 표시 -->
	<c:if test="${not empty startNot}">
		<input type="hidden" id="startNot"/>
	</c:if>
	
	<!-- 퇴근 체크 완료되었음을 표시 -->
	<c:if test="${not empty endSuccess}">
		<input type="hidden" id="endSuccess" value="${endSuccess.atte_end}"/>
	</c:if>
	
	<!-- 출근체크를 한 상태에서 출근체크버튼을 눌렀을 때 보여줄 직원 이름 -->
	<c:if test="${not empty startContains}">
		<input type="hidden" id="startContains" value="${startContains}"/>
	</c:if>
	
	<!-- 퇴근체크를 한 상태에서 퇴근체크버튼을 눌렀을 때 보여줄 직원 이름 -->
	<c:if test="${not empty endContains}">
		<input type="hidden" id="endContains" value="${endContains}"/>
	</c:if>
	
	<!-- 연차 정보 업데이트 했을 때 -->
	<c:if test="${not empty leave_upd_cnt}">
		<input type="hidden" id="leave_upd_cnt" value="${leave_upd_cnt}"/>
	</c:if>
	
	<!-- 선택한 월 연차 업데이트가 이미 되었을 경우 보여줄 경고창 -->
	<c:if test="${not empty annualContains}">
		<input type="hidden" id="annualContains" value="${annualContains}"/>
	</c:if>
	
	<div class="mng_top_box">
		<div class="mng_top_item">
			<p>당일 출근 인원</p>
			<p>24명/26명</p>
		</div>
		<div class="mng_top_item">
			<p>휴가자 인원</p>
			<p>2명/26명</p>
		</div>
		<div class="mng_top_item">
			<p>휴가 승인 대기</p>
			<p>2건</p>
		</div>
		<div class="mng_top_item">
			<p>초과근무 승인 대기</p>
			<p>5건</p>
		</div>
	</div>
	<div class="mng_bottom_box">
		<div class="mng_bottom_item">
			<div class="mng_bottom_menu">
				<label>담당 부서</label><label>${manager.department_name}</label>
			</div>
			<div class="mng_bottom_menu">
				<label>부서 코드</label><label>${manager.department_id}</label>
			</div>
			<div class="mng_bottom_menu">
				<label>이름</label><label>${manager.name}</label>
			</div>			
			<div class="mng_bottom_menu">
				<label>사번 코드</label><label>${manager.employee_id}</label>
			</div>
			<div class="mng_bottom_menu">
				<label>입사일</label><label>${manager.employment_date}</label>
			</div>
			<div class="mng_bottom_menu">
				<label>부서 직원수</label><label>부서 직원수</label>
			</div>
			<div class="mng_bottom_menu">
				<form action="/atted/atteStart" method="post">
					<input type="hidden" name="currentDate"/>
					<input type="hidden" name="atte_start"/>
					<input type="hidden" name="employee_id" value="${manager.employee_id}"/>
					<input class="em_sm_btn" type="submit" id="atte_startBTN" value="출석"/>
				</form>
				<form action="/atted/atteEnd" method="post">
					<input type="hidden" name="currentDate"/>
					<input type="hidden" name="atte_end"/>
					<input type="hidden" name="employee_id" value="${employee.employee_id}"/>
					<input class="em_sm_btn" type="submit" id="atte_endBTN" value="퇴근"/>
				</form>
			</div>
			<c:if test="${not empty annualBTN}">
			<div class="mng_bottom_menu">
				<!-- /manage/annualCreate -->
				<form action="/manage/annualCreate" method="post">
					<input type="hidden" id="year_month" name="year_month"/>
					<select id="month">
						<option value="" disabled selected>연차 적립월 선택</option>
						<option value="01">1 월</option>
						<option value="02">2 월</option>
						<option value="03">3 월</option>
						<option value="04">4 월</option>
						<option value="05">5 월</option>
						<option value="06">6 월</option>
						<option value="07">7 월</option>
						<option value="08">8 월</option>
						<option value="09">9 월</option>
						<option value="10">10 월</option>
						<option value="11">11 월</option>
						<option value="12">12 월</option>
					</select>
					<input class="em_sm_btn" type="submit" id="leave_BTN" value="당월 연차 적립"/>
				</form>
			</div>
			</c:if>
		</div>
		<div class="mng_bottom_item">
			여기는 부서 직원 목록
		</div>
		<div class="mng_bottom_item">
			여기는 당일 출근한 부서 직원 목록
		</div>
	</div>
</main>
<script src="/js/nowtime.js"></script>
<script src="/js/atted.js"></script>
</body>
</html>