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
	<div class="mng_top_box">
		<div class="mng_top_item">
			<p>${manager.department_name} 당일 출근 인원</p>
			<p>${nowWorkEmpCount}/${allEmpCount} 명<br>${per}%</p>
		</div>
		<div class="mng_top_item">
			<p>${manager.department_name} 부서 휴가자 인원</p>
			<p>${nowLeaveEmp} 명</p>
		</div>
		<div class="mng_top_item">
			<p>휴가 승인 대기</p>
			<p>${leaveAgreeCount} 건</p>
		</div>
		<div class="mng_top_item">
			<p>직원 페이지</p>
			<a href="/emp/empView">이동</a>
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
				<label>부서 직원수</label><label>${allEmpCount} 명</label>
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
		</div>
		<div class="mng_bottom_item">
			부서 공지사항
		</div>
		<div class="mng_bottom_item">
			회사 공지사항
		</div>
	</div>
</main>
<script src="/js/nowtime.js"></script>
<script src="/js/atted.js"></script>
</body>
</html>