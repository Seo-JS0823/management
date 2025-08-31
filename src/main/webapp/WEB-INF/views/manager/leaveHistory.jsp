<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/mngLeaveHis.css"/>
	<title>My Company Management</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 연차 적립 내역 본문 -->
<main>
	<div class="leave-list">
		<div class="leave-menu-top">
			<p class="ll-p">연차 적립 내역 조회</p>
		</div>
		<hr class="leave-bar">
		<div class="leave-menu-middle">
			<img class="leave-img" src="/images/logo.png"/>
			<div class="search-bar">
				<form action="/manage/annualRead" method="post">
					<div class="in-search">
						<p class="ll-p">정렬 선택</p>
						<select class="in-selected" name="sort">
							<option disabled selected>─ 선택 ─</option>
							<option value="ASC">오름차순</option>
							<option value="DESC">내림차순</option>
						</select>
						<p class="ll-p">정렬 옵션 선택</p>
						<select class="in-selected" name="sortType">
							<option disabled selected>─ 선택 ─</option>
							<option value="name">이름</option>
							<option value="department_name">부서</option>
							<option value="content">적립사유</option>
							<option value="leave_date">처리날짜</option>
						</select>
					</div>
					<div class="in-search">
						<img class="leave-img" src="/images/search-icon.png"/>
						<input class="input-search" type="text" name="search" placeholder="검색어를 입력하세요."/>
					</div>
				</form>
			</div>
		</div>
		<div class="leave-tb">
			<table>
				<tr>
					<th>이름</th>
					<th>부서</th>
					<th>처리 날짜</th>
					<th>적립 연차</th>
					<th>적립 사유</th>
					<th>수정</th>
				</tr>
			</table>
			<c:forEach var="leave" items="${leaves}">
				<table>
					<tr>
						<td>${leave.name}</td>
						<td>${leave.department_name}</td>
						<td>${leave.leave_date}</td>
						<td>${leave.leave_count}</td>
						<td>${leave.content}</td>
						<td><a href="/manage/annualUpdateView?leave_id=${leave.leave_id}">수정하기</a></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</main>
<script src="/js/nowtime.js"></script>
<script src="/js/leaveHis.js"></script>
</body>
</html>