<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/mngChange.css"/>
	<title>My Company Management</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 관리자 변경 본문 -->
<main>
	<div class="mg-box">
		<div class="mg-h">
			<p>관리자 변경</p>
			<hr>
		</div>
		<div class="mg-main">
			<div class="mg-list-s">
				<p>부서명</p>
				<input type="hidden" name="department_id" value="${manager.department_id}"/>
				<input type="text" name="department_name" value="${manager.department_name}" readOnly/>
			</div>
			<div class="mg-list-s">
				<p>담당자</p>
				<input type="text" value="${manager.name}" readOnly/>
			</div>
		</div>
	</div>
</main>
<script src="/js/nowtime.js"></script>
</body>
</html>