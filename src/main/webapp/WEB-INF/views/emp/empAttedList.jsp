<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/empHeader.css">
	<link rel="stylesheet" href="/css/empAtted.css">
	<title>My Company</title>
	<script src="/js/pagings.js"></script>
</head>
<body style="background-color: #2C3E50;">
<!-- empHeader 영역 -->
<!-- 나중에 값 넘겨야할 경우 inclue action 으로 변경 -->
<%@ include file="empHeader.jsp" %>

<!-- 본문 영역 -->
<main>
<div class="at-list">
	<h1>${emp.department_name} - ${emp.name} 출/퇴근 기록조회</h1>
</div>
<div class="at-list">
	<form action="/atted/empAttedList" method="POST">
		<div class="at-search-box">
			<div>
				<p>시작날짜</p>
				<input type="date" id="startDate" name="start" value="${start}" required/>
			</div>
			<input type="submit" id="searchBtn" value="S E A R C H"/>
			<div>
				<p>종료날짜</p>
				<input type="date" id="endDate" name="end" value="${end}" required/>
			</div>
			<input type="hidden" name="nowPage" value="1"/>
		</div>
		<div class="at-search-box">
			<div>
				오름차순
				<input type="radio" name="sort" value="ASC"/>
				내림차순
				<input type="radio" name="sort" value="DESC"/>
			</div>
			<div>
				검색옵션
				<input type="hidden" id="searchNum" value="${search}"/>
				<select id="searchs" name="search">
					<option value="1">정상퇴근</option>
					<option value="2">지각</option>
					<option value="3">조퇴</option>
					<option value="4">결석</option>
				</select>
			</div>
		</div>
	</form>
	<div class="tb-list">
		<table>
			<tr>
				<th>이름</th>
				<th>날짜</th>
				<th>출근 시간</th>
				<th>퇴근 시간</th>
				<th>총 근무시간</th>
				<th>비고</th>
			</tr>
			<c:forEach var="employee" items="${list}">
			<tr>
				<td>${employee.name}</td>
				<td>${employee.currentDate}</td>
				<td>${employee.atte_start}</td>
				<td>${employee.atte_end}</td>
				<td>${employee.work_time}</td>
				<td>${employee.status}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class="pagings">
		<input type="hidden" id="nowPage" value="${paging.nowPage}">		
			<a href="/atted/empAttedList?nowPage=${paging.nowPage - 1}&start=${start}&end=${end}&search=${search}&sort=${sort}">◀</a>
		<c:forEach var="page" begin="${paging.start}" end="${paging.end}">
			<a class="nows" href="/atted/empAttedList?nowPage=${page}&start=${start}&end=${end}&search=${search}" data-nowPage="${page}">${page}</a>
		</c:forEach>
		<c:if test="${paging.nowPage == paging.totalPage}">
			<a href="/atted/empAttedList?nowPage=${paging.nowPage}&start=${start}&end=${end}&search=${search}&sort=${sort}">▶</a>
		</c:if>
		<c:if test="${paging.nowPage != paging.totalPage}">
			<a href="/atted/empAttedList?nowPage=${paging.nowPage + 1}&start=${start}&end=${end}&search=${search}&sort=${sort}">▶</a>
		</c:if>
	</div>
</div>
</main>
<script src="/js/nowtime.js"></script>
<script>
	const searchBtnEl = document.querySelector('[id=searchBtn]');
	let sDate = document.querySelector('[id=startDate]');
	let eDate = document.querySelector('[id=endDate]');
	
	sDate.addEventListener('invalid', () => {
		if(sDate.validity.valueMissing) {
			sDate.setCustomValidity('시작 날짜를 지정하세요!');
		}
	})
	
	sDate.addEventListener('input', () => {
		sDate.setCustomValidity('');
	})
	
	eDate.addEventListener('invalid', () => {
		if(eDate.validity.valueMissing) {
			eDate.setCustomValidity('종료 날짜를 지정하세요!');
		}
	})
	
	eDate.addEventListener('input', () => {
		eDate.setCustomValidity('');
	})
	
</script>
</body>
</html>