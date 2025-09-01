<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/mngHeader.css" />
<link rel="stylesheet" href="/css/empMain.css">

<style>

	#mng_back{
		background:#EEEEEE;
		width:100%;
		height:9%;
		text-align : center;
		padding : 20px 0 20px 0;
		font-size : 35px;
		font-weight : 1000;
		letter-spacing: 2px;
	}
	
	.mng_HistoryList_table {
	 	background : white;
		width : 60%;
		height : 50%;
		padding : 40px;
		border-radius : 20px;
		border : 3px solid #666;
		box-shadow : 20px 20px 20px #222;
	 }
	 
	 	tr,td {
		padding : 8px;
		font-size : 20px;
		font-weight : 700;
		text-align : center;

	}
	
		td { width : 33%; }
	
		.div {
		margin-top : 100px;
		display : flex;
		flex-direction : row;
		align-items : center;
		justify-content: center;
	}
	
	h2{text-align : center;}
	
	a { 
		text-decoration: none;
		font-weight : 1000;
		font-size : 25px;
		color : #444;
		&:hover {
			text-shadow : 1px 1px 1px #888;
		}
	 }
</style>

</head>
<body>
	<!-- 휴가 신청한 직원이름 리스트 페이지 -->
	
	<%@ include file="mngHeader.jsp" %>
	
	<div id="mng_back">휴가 신청한 직원리스트</div>
	
	<main class="emp_dashboard">
	<div class="div">
		<table class="mng_HistoryList_table">
			<tr>
				<td>직원 이름</td>
				<td>신청일</td>
				<td>휴가 일수</td>
			</tr>
			<c:forEach var="List" items="${leaveReqList}">
				<tr>
					<td>
					<c:if test="${List.status == 0}">
					<a href="/manage/showLeaveDetail?seq=${List.seq}&employee_id=${List.employee_id}" >${List.name} (미승인)</a>
					</c:if>
					<c:if test="${List.status == 1}">
					<a href="/manage/showCancelDetail?seq=${List.seq}&employee_id=${List.employee_id}" >${List.name} (승인 완료)</a>
					</c:if>
					</td>
					<td>${List.reg_date}</td>
					<td>${List.annual_days}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</main>
	
	<script src="/js/nowtime.js"></script>
	
</body>
</html>