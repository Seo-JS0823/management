<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/annual.css"/>
	<title>Insert title here</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 본문 -->
<main>
	<div class="ann_box">
		<form id="run" action="/manage/annualEmp" method="post">
			<h1>연차 적립</h1>
			<div class="ann_search">
				<input type="text" name="name" placeholder="성함을 입력해주세요."/>
				<img id="search" src="/images/search-icon.png"/>
			</div>
		</form>
		<!-- 직원 정보 -->
		<form action="/manage/annualCreate" method="post">
		<input type="hidden" id="leaveTarget" value="${leaveTarget.name}"/>
			<div class="emp_ann">
				<div class="emp_info">
					<input type="hidden" name="employee_id" value="${target.employee_id}"/>
					<p>이 름</p><input type="text" name="name" value="${target.name}" readonly/>
				</div>
				<div class="emp_info">
					<p>부 서</p><input type="text" value="${target.department_name}" readonly/>
				</div>
				<div class="emp_info">
					<p>부서 담당자</p><input type="text" value="${target.manager_name}" readonly/>
				</div>
				<div class="emp_info">
					<p>직급</p><input type="text" value="${target.position_name}" readonly/>
				</div>
				<div class="emp_info">
					<p>입사일</p><input type="text" value="${target.employment_date}" readonly/>
				</div>
				<div class="emp_info">
					<p>만근월 선택</p><input type="date" name="work_month"/>	
					<input type="hidden" id="leave_date" name="leave_date"/>				
					<input type="number" name="leave_count" placeholder="연차 수"/>
				</div>
				<textarea name="content" placeholder="연차 적립 사유를 입력하세요.만근 = 만근 / 기본연차 = 기본"></textarea>
				<input type="submit" value="연차 적립 실행"/>
			</div>
		</form>
	</div>
</main>
<script src="/js/nowtime.js"></script>
<script src="/js/annual.js"></script>
</body>
</html>