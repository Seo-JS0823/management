<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Company Management</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/mngHeader.css" />
<link rel="stylesheet" href="/css/manager.css" />
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/empHeader.css">
<link rel="stylesheet" href="/css/empMain.css">

<style>
	* {
		box-sizing : border-box;
		border-collapse: collapse;
	}
	
	#mng_back{
		background:white;
		width:100%;
		height:9%;
	}
	
  table {
    border-collapse: collapse;
    width : 800px;
		height : 500px;
    margin: 20px auto;
    background : white;
		border : 3px solid black;
    box-shadow: 0 0 3px #FFF;
    margin-top : 40px;
    height : 75%;
    width : 65%;
    white-space: nowrap;
  }
  
  h2 { text-align : center; }
  
  td, th {
    border: 1px solid black;
    padding: 8px;
    text-align: left;
    font-weight: 600;
  }
  
  td:nth-of-type(1) { width : 8%; }
  td:nth-of-type(2) { width : 55%; }
  td:nth-of-type(3) { width : 12%; }
  td:nth-of-type(4) { width : 25%; }
  
  input { padding : 6px; }
  
	.leave_btn {
  		width: 120px;
  		height: 45px;
  		font-size: 18px;
  		font-weight: 600;
  		border: none;
  		border-radius: 12px;
  		
  		background-color: #2C3E50;
  		color: white;
  		letter-spacing: 1px;
  		
  		&:hover {
  			text-shadow: 0 0 3px #FFF;
  		}
  	}
  	
  .overlay {
	 position: fixed;
	 top: 0;
	 left: 0;
	 width: 100%;
	 height: 100%;
	 background: rgba(0, 0, 0, 0.5); /* 투명도를 더하는 스타일(아주 유용한듯) */
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 z-index: 1000;
}

	.modal {
	  background: white;
	  padding: 20px;
	  border-radius: 8px;
	  text-align: center;
	}
	
	button {
	  margin: 10px;
	  padding: 8px 16px;
	}
</style>

</head>
<%@ include file="mngHeader.jsp" %>

<div id="mng_back"></div>
<body>

	<main class="emp_dashboard">		
	<form action="/manage/leaveAgree" method="GET">
		<input type ="hidden" name="employee_id" value="${leaveDetail.employee_id}"/>
		<input type ="hidden" name="seq" value="${leaveDetail.seq}"/>
		<table>
		  <tr>
		    <td colspan="4" class="title"><h2>휴가 신청서</h2></td>
		  </tr>
		  <tr>
		    <td>성명</td>
		    <td><input type="text" name="name" value="${leaveDetail.name}" readonly></td>
		    <td>부서담당자</td>
		    <td><input type="text" name="manager_name" value="${leaveDetail.manager_name}" readonly></td>
		  </tr>
		  <tr>
		    <td>부서</td>
		    <td><input type="text" name="department_name" value="${leaveDetail.department_name}" readonly></td>
		    <td>전화번호</td>
		    <td><input type="text" name="phone_num" value="${leaveDetail.phone_num}" readonly></td>
		  </tr>
		  <tr>
		  	<td>신청일</td>
		  	<td><input type="date" value="${leaveDetail.reg_date}" readonly/></td>
		  	<td>남은 연차일수</td>
		  	<td><input type="number" value="${leave_cnt.leave_count}"></td>
		  </tr>
		  <tr>
		  <tr>
		    <td>기간</td>	    
		    <td>
		    <input type="date" name="leave_start_date" value="${leaveDetail.leave_start_date}" readonly>
		     ~ 
		     <input type="date" name="leave_end_date" value="${leaveDetail.leave_end_date}" readonly>
		    </td>		    
		    <td>휴가일수</td>
		    <td><input type="number" min="0" max="15" name="annual_days" value="${leaveDetail.annual_days}" readonly></td>
		  </tr>
		  <tr>
		    <td>사유</td>
		    <td colspan="3">
		    <textarea style="width:100%; height:120px; resize:none; outline:none;" name="content" readonly>
		    ${leaveDetail.content}
		    </textarea>
		    </td>
		  </tr>
		  <tr>
		    <td>신청자 (인)</td>
		    <td colspan="3"><input type="text" value="${leaveDetail.name}" readonly></td>
		  </tr>
		  <tr>
		    <td colspan="4" style="text-align:center; font-size: 18px; font-weight: 600; letter-spacing: 2px;">My Company</td>
		  </tr>
		  <tr>
		  	<td colspan="4">
		  	<input type="submit" value="승인"/><br>
		  	<a href="/manage/leaveRefuse?seq=${leaveDetail.seq}">반려</a><br>
		  	</td>
		  </tr>
		</table>
	</form>
		
	</main>
<script src="/js/nowtime.js"></script>
</body>
</html>