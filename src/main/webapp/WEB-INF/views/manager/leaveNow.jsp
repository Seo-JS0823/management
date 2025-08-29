<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/calendar.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<script src="/js/index.global.min.js"></script>
	<script src="/js/calendar.js"></script>
	<title>My Company</title>
</head>
<body bgcolor="#F5F5F5">
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>
<div class="box">
	<div class="leave-info"></div>
	<div class="calendars" id='calendar'></div>
</div>
</body>
</html>