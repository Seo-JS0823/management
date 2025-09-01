<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/departAtted.css"/>
	<title>My Company Management</title>
	<script src="/js/pagings.js"></script>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 출/퇴근 부서별 메인 본문 -->
<main>
	<div class="part-main">
		<div class="part-h">
			<p>${manager.department_name} 출/퇴근 기록 조회</p>
		</div>
		<div class="part-search-s">
			<form action="/manage/partAttedList" method="post">
				<input type="hidden" name="department_id" value="${manager.department_id}"/>
				<input type="hidden" name="nowPage" value="1"/>
				<div class="search-box-s">
					시작 날짜
					<input type="date" name="start" value="${start}"/>
				</div>
				<div class="search-box-s">
					종료 날짜
					<input type="date" name="end" value="${end}"/>
				</div>
				<div class="search-box-s">
					<select name="sort">
						<option disabled selected>-- 정렬 선택 --</option>
						<option value="ASC">오름차순</option>
						<option value="DESC">내림차순</option>
					</select>
				</div>
				<div class="search-box-s">
					<input type="submit" value="S E A R C H"/>
				</div>
			</form>
		</div>
		<div class="tb-list">
			<table>
				<tr>
					<th>이름</th>
					<th>출근 날짜</th>
					<th>출근 시간</th>
					<th>퇴근 시간</th>
					<th>총 근무시간</th>
					<th>비고</th>
				</tr>
				<c:forEach var="atted" items="${employees}">
					<tr>
						<td>${atted.name}</td>
						<td>${atted.currentDate}</td>				
						<td>${atted.atte_start}</td>				
						<td>${atted.atte_end}</td>
						<td>${atted.work_time}</td>
						<td>${atted.status}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pagings">
			<input type="hidden" id="nowPage" value="${paging.nowPage}">		
				<a href="/manage/partAttedList?nowPage=${paging.nowPage - 1}&start=${start}&end=${end}&sort=${sort}">◀</a>
			<c:forEach var="page" begin="${paging.start}" end="${paging.end}">
				<a class="nows" href="/atted/partAttedList?nowPage=${page}&start=${start}&end=${end}" data-nowPage="${page}">${page}</a>
			</c:forEach>
			<c:if test="${paging.nowPage == paging.totalPage}">
				<a href="/manage/partAttedList?nowPage=${paging.nowPage}&start=${start}&end=${end}&sort=${sort}">▶</a>
			</c:if>
			<c:if test="${paging.nowPage != paging.totalPage}">
				<a href="/manage/partAttedList?nowPage=${paging.nowPage + 1}&start=${start}&end=${end}&sort=${sort}">▶</a>
			</c:if>
		</div>
	</div>
</main>
<script src="/js/nowtime.js"></script>
</body>
</html>