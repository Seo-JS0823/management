<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/mngHeader.css">
	<link rel="stylesheet" href="/css/mngEmpList.css">
	<title>My Company Management</title>
</head>
<body>
<!-- Header 영역 -->
<%@ include file="mngHeader.jsp" %>

<!-- 본문 영역 -->
<div class="emp_list_main">
	<div class="emp_list_box">
		<h2>직원 목록 검색 ${count}</h2>
		<form action="/manage/empList" method="post">
			<div class="emp_search">
				<img src="/images/search-icon.png"/>
				<input type="text" name="search" placeholder="검색어를 입력하세요. ex) 부서명, 직원명, 근무형태, 직급 등"/>
			</div>
		</form>
		<div class="emp_list">
			<table class="list_table">
				<colgroup>
					<col style="width: 100px;">
					<col style="width: 150px;">
					<col style="width: 200px;">
					<col style="width: 100px;">
					<col style="width: 150px;">
					<col style="width: 120px;">
					<col style="width: 100px;">
					<col style="width: 150px;">
				</colgroup>
				<c:if test="${not empty exit}">
					<tr>
						<th>이름</th>
						<th>직급</th>
						<th>사번 코드</th>
						<th>근무 형태</th>
						<th>입사일</th>
						<th>부서</th>
						<th>부서 담당자</th>
						<th>생년월일</th>
						<th>주소</th>
					</tr>
				</c:if>
				<tr>
					<th>이름</th>
					<th>직급</th>
					<th>사번 코드</th>
					<th>근무 형태</th>
					<th>입사일</th>
					<th>부서</th>
					<th>부서 담당자</th>
					<th>생년월일</th>
					<th>주소</th>
				</tr>
				<c:forEach var="target" items="${target}">
					<c:choose>
						<c:when test="${target.emp_flag == 1}">
							<tr>
								<td>${target.name}</td>
								<td>${target.position_name}</td>
								<td>${target.employee_id}</td>
								<td>${target.worktype}</td>
								<td>${target.employment_date}</td>
								<td>${target.department_name}</td>
								<td>${target.manager_name}</td>
								<td>${target.birthdate}</td>
								<td>${target.address}</td>
							</tr>
						</c:when>
						<c:when test="${target.emp_flag == 0 }">
							<tr>
								<td>${target.name}</td>
								<td>${target.position_name}</td>
								<td>${target.employee_id}</td>
								<td>${target.worktype}</td>
								<td>${target.employment_date}</td>
								<td>${target.department_name}</td>
								<td>${target.manager_name}</td>
								<td>${target.birthdate}</td>
								<td>${target.address}</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</table>
		</div>
	</div>
</div>


<script src="/js/nowtime.js"></script>
</body>
</html>