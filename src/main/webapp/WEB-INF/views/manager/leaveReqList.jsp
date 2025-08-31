<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Company Management</title>
<link rel="stylesheet" href="/css/reset.css"/>
<link rel="stylesheet" href="/css/mngHeader.css"/>
<link rel="stylesheet" href="/css/manager.css"/>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/empHeader.css">
<link rel="stylesheet" href="/css/empMain.css"> 

<style>
	
	.mng_HistoryList_table {
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

</head>
<body>
	
	<%@ include file="mngHeader.jsp" %>

	<!-- 휴가 신청한 직원이름 리스트 페이지 -->
	<main class="emp_dashboard">
	<div class="div">
		<table class="mng_HistoryList_table">
			<tr>
				<td colspan="3"><h2>휴가 신청한 직원리스트</h2></td>
			</tr>
			<tr>
				<td>신청서 해당번호</td>
				<td>직원 이름</td>
				<td>신청일</td>
			</tr>
			<c:forEach var="List" items="${leaveReqList}">
				<tr>
					<td><a href="/manage/showLeaveDetail?seq=${List.seq}&employee_id=${List.employee_id}">${List.seq}</a></td>
					<td><a href="/manage/showLeaveDetail?seq=${List.seq}&employee_id=${List.employee_id}">${List.name}</a></td>
					<td><a href="/manage/showLeaveDetail?seq=${List.seq}&employee_id=${List.employee_id}">${List.reg_date}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</main>
	
	<script>
		
	</script>
</body>
</html>