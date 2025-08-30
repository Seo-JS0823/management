<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Company</title>
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/empHeader.css">
	<link rel="stylesheet" href="/css/empMain.css">
</head>
<body>
<!-- empHeader 영역 -->
<!-- 나중에 값 넘겨야할 경우 inclue action 으로 변경 -->
<%@ include file="empHeader.jsp" %>

<!-- 본문 영역 -->
<main>
	<!-- 출석 체크 완료되었음을 표시 -->
	<c:if test="${not empty attedStartSuccess}">
		<input type="hidden" id="attedStartSuccess" value="${attedStartSuccess}"/>
	</c:if>
	
	<!-- 퇴근 체크할 때 당일 출석 체크를 하지 않았음을 표시 -->
	<c:if test="${not empty startNot}">
		<input type="hidden" id="startNot"/>
	</c:if>
	
	<!-- 퇴근 체크 완료되었음을 표시 -->
	<c:if test="${not empty endSuccess}">
		<input type="hidden" id="endSuccess" value="${endSuccess}"/>
	</c:if>
	
	<!-- 출근체크를 한 상태에서 출근체크버튼을 눌렀을 때 보여줄 직원 이름 -->
	<c:if test="${not empty startContains}">
		<input type="hidden" id="startContains" value="${startContains}"/>
	</c:if>
	
	<!-- 퇴근체크를 한 상태에서 퇴근체크버튼을 눌렀을 때 보여줄 직원 이름 -->
	<c:if test="${not empty endContains}">
		<input type="hidden" id="endContains" value="${endContains}"/>
	</c:if>
	<div class="emp_dashboard">
	<div class="emp_top_box">
		<div class="emp_main_box">
			<label class="em_label">당일 출석 시간</label>
			<label class="em_label">${work_start}</label>
		</div>
		<div class="emp_main_box">
			<input type="hidden" id="nowYear"/>
			<label class="em_label">총 근무 일수</label>
			<label class="em_label">${allWork} 일</label>
		</div>
		<div class="emp_main_box">
			<label class="em_label">남은 연차</label>
			<label class="em_label">${leave}</label>
		</div>
		<c:if test="${not empty valueManager}">
			<div class="emp_main_box">
				<label class="em_label">관리자 페이지</label>
				<a href="/manage/mngindex">이동</a>
			</div>
		</c:if>
	</div>
	<div class="emp_info_box">
		<div class="emp_info_menu">
			<c:if test="${not empty employee}">
				<div class="info_item">
					<label>이름</label><label id="name">${employee.name}</label>
				</div>
				<div class="info_item">
					<label>사번코드</label><label id="employee_id">${employee.employee_id}</label>
				</div>
				<div class="info_item">
					<label>부서</label><label id="department_name">${employee.department_name}</label>
				</div>
				<div class="info_item">
					<label>부서 담당자</label><label id="manager_name">${employee.manager_name}</label>
				</div>
				<div class="info_item">
					<label>입사일</label><label id="employment_date">${employee.employment_date}</label>
				</div>
				<div class="info_item">
					<label>직급</label><label id="position_name">${employee.position_name}</label>
				</div>
				<div class="info_item">
					<label>근무형태</label><label id="worktype">${employee.worktype}</label>
				</div>
				<div class="info_item">
					<label>주소</label><label id="address">${employee.address}</label>
				</div>
				<div class="info_item">
					<form action="/atted/atteStart" method="post">
						<input type="hidden" name="currentDate"/>
						<input type="hidden" name="atte_start"/>
						<input type="hidden" name="employee_id" value="${employee.employee_id}"/>
						<input class="em_sm_btn" type="submit" id="atte_startBTN" value="출석"/>
					</form>
					<form action="/atted/atteEnd" method="post">
						<input type="hidden" name="currentDate"/>
						<input type="hidden" name="atte_end"/>
						<input type="hidden" name="employee_id" value="${employee.employee_id}"/>
						<input class="em_sm_btn" type="submit" id="atte_endBTN" value="퇴근"/>
					</form>
				</div>
			</c:if>
		</div>
		<div class="emp_info_menu">
			자신의 휴가신청건 목록
		</div>
		<div class="emp_info_menu">
			자신의 출/퇴근 기록
		</div>
	</div>
	</div>
</main>
<script src="/js/atted.js"></script>
<script src="/js/nowtime.js"></script>
</body>
</html>