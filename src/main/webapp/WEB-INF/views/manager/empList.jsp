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
<input type="hidden" id="delName" value="${del}"/>
<input type="hidden" id="resetName" value="${reset}"/>

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
				<c:if test="${not empty exit}">
					<tr>
						<th>사번 코드</th>
						<th>이름</th>
						<th>부서</th>
						<th>입사일</th>
						<th><p style="color: lightpink; margin: 0px;">퇴사일</p></th>
						<th>생년월일</th>
						<th>복구</th>
					</tr>
				</c:if>
				<c:if test="${empty exit}">
				<colgroup>
					<col style="width: 100px;">
					<col style="width: 150px;">
					<col style="width: 200px;">
					<col style="width: 100px;">
					<col style="width: 150px;">
					<col style="width: 120px;">
					<col style="width: 100px;">
					<col style="width: 150px;">
					<col style="width: 50px;">
				</colgroup>
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
						<th>퇴사 등록</th>
					</tr>
				</c:if>
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
								<td>
									<form action="/manage/empExit" method="post">
										<input type="hidden" class="exitName" value="${target.department_name} - ${target.name}"/>
										<input type="hidden" name="employee_id" value="${target.employee_id}"/>
										<input class="exitBtn" type="submit" value="E X I T"/>
									</form>
								</td>
							</tr>
						</c:when>
						<c:when test="${target.emp_flag == 0 }">
							<tr>
								<td>${target.employee_id}</td>
								<td>${target.name}</td>
								<td>${target.department_name}</td>
								<td>${target.employment_date}</td>
								<td>${target.exit_date}</td>
								<td>${target.birthdate}</td>
								<td>
									<form action="/manage/empExitReset" method="post">
										<input type="hidden" class="resetName" name="employee_id" value="${target.employee_id}"/>
										<input type="button" class="resetBtn" value="퇴사 철회"/>
									</form> 
								</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</table>
		</div>
	</div>
</div>


<script src="/js/nowtime.js"></script>
<script src="/js/empList.js"></script>
</body>
</html>