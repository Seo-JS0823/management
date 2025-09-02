<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Company</title>
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/login.css">
</head>
<body>
	<c:if test="${not empty notEmp}">
		<input type="hidden" id="notEmp" value="${notEmp}">
	</c:if>
	<c:if test="${not empty partChg}">
		<input type="hidden" id="partChg" value="${partChg}">
	</c:if>
	<div class="login_box">
		<form class="login_form" action="/login" method="post">
			<h1>My Company</h1>
			<input class="login_text" type="text" name="employee_id" placeholder="사번코드를 입력해주세요."/>
			<input class="login_text" type="text" name="password" placeholder="비밀번호를 입력해주세요."/>
			<input class="login_text" type="submit" id="loginBtn" value="로그인"/>
			<input class="login_text" type="submit" id="joinBtn" value="회원가입"/>
		</form>
	</div>
	<c:if test="${not empty managerSuccess}">
		<input type="hidden" id="managerSuccess" value="${managerSuccess}"/>
		<div class="managerSuccess">
			<label>${managerSuccess}</label>
			<button type="button" id="idBtn">닫기</button>
		</div>
	</c:if>
<script src="/js/login.js"></script>
</body>
</html>