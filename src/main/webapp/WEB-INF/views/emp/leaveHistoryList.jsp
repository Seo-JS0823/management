<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 휴가신청서 기록들</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/empHeader.css">
<link rel="stylesheet" href="/css/empMain.css"> 
</head>

<style>
	.emp_HistoryList_table {
		background : white;
		width : 70%;
		height : 50%;
		padding : 40px;
		border-radius : 20px;
		border : 3px solid #666;
		box-shadow : 20px 20px 20px #222;
	}
	
	tr,td {
		padding : 8px;
	}
	
	.div {
		margin-top : 100px;
		display : flex;
		flex-direction : row;
		align-items : center;
		justify-content: center;
	}
	
	h2{text-align : center;}
</style>

<body>

	<%@ include file="empHeader.jsp" %>

	<main class="emp_dashboard">
	<div class="div">
		<table class="emp_HistoryList_table">
			<tr>
				<td colspan="3"><h2>내 휴가신청 목록들</h2></td>
			</tr>
			<tr>
				<td>휴가 신청일</td>
				<td>휴가 일수</td>
				<td>승인 현황</td>
			</tr>
			<c:forEach var="HistoryList" items="${leaveHistoryList}">
			<tr>
				<td><a href="/leave/leaveReqHistory?seq=${HistoryList.seq}">${HistoryList.reg_date}</a></td>
				<td>${HistoryList.annual_days}</td>
				<td class="status">${HistoryList.status}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</main>
	
	<script>
		let statusEl = document.querySelectorAll('.status')
	  statusEl.forEach(el => {
		if (el.innerHTML == 0) {
			el.innerHTML = "승인대기"
		} else if (el.innerHTML == 1) { 
			el.innerHTML = "승인"
		} else {
			el.innerHTML = "반려"
		}	
	});
	</script>
	
</body>
</html>