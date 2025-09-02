<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>결근&조퇴 기록 및 조회</title>
    <link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/empHeader.css">
	<link rel="stylesheet" href="/css/mngEatView.css"/>
</head>
<body>
<%@ include file="empHeader.jsp" %>
    <div class="content">
    <h1>결근&조퇴 기록 및 조회</h1>
    <p>${employeeDTO.department_name } ${employeeDTO.name}님!</p>
    
    <!--  검색창 -->
<form action="/lateness/eatView" method="get">
    <div class="search-box">
        <label for="status">상태:</label>
        <select name="status" id="status">
            <option value="">상태 전체</option>
            <option value="0" ${param.status == 0 ? 'selected' : ''}>미승인</option>
            <option value="1" ${param.status == 1 ? 'selected' : ''}>승인</option>
        </select>
        <label for="atte_flag">유형:</label>
        <select name="atte_flag" id="atte_flag">
            <option value="">유형 전체</option>
            <option value="3" ${param.atte_flag == 3 ? 'selected' : ''}>조퇴</option>
            <option value="4" ${param.atte_flag == 4 ? 'selected' : ''}>결근</option>
        </select>
        <button type="submit" class="search-btn">검색</button>
    </div>
</form>

    <!-- 신청하기 버튼 추가 -->

    <a href="/lateness/createForm">
        <button type="submit" class="search-btn">신청하기</button>
    </a>

    <hr>

<div class = "table-scroll-container">    
<table class="data-table">
    <thead>
        <tr>
            <th colspan="7" class="table-title">나의 기록 목록</th>
        </tr>
        </thead>
    <tbody>
        <c:forEach var="lateness" items="${LatenessDTOList}">
            <tr>
                <td>${lateness.created_date }</td>
                <td>${lateness.ness_date}</td>
                <td>
                    <c:choose>
                        <c:when test="${lateness.atte_flag == 3}">조퇴</c:when>
                        <c:when test="${lateness.atte_flag == 4}">결근</c:when>
                    </c:choose>
                </td>
                <td>
                    <div class="tooltip-container">
                        <span class="content-text">${lateness.content}</span>
                        <span class="tooltip-text">${lateness.content}</span>
                    </div>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${lateness.status == 0}">미승인</c:when>
                        <c:when test="${lateness.status == 1}">승인</c:when>
                        <c:otherwise>대기</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${lateness.status == 0}">
                        <a href="/lateness/eatUpdateView?employee_id=${lateness.employee_id}&ness_date=${lateness.ness_date}" 
                         class="btn fix-btn">수정</a>
                    </c:if>
                </td>
                <td>
                    <c:if test="${lateness.status == 0}">
                        <form action="/lateness/eatDelete" method="post" style="display:inline;">
                            <input type="hidden" name="employee_id" value="${lateness.employee_id}">
                            <input type="hidden" name="ness_date" value="${lateness.ness_date}">
                            <button type="submit" class="btn delete-btn">삭제</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
			<script>

			    document.addEventListener('DOMContentLoaded', () => {
			        const tableBody = document.querySelector('.data-table tbody');
			        const rows = tableBody.getElementsByTagName('tr');
			        const scrollContainer = document.querySelector('.table-scroll-container');
			

			        if (rows.length > 8) {

			            scrollContainer.style.maxHeight = '500px'; // 원하는 높이 설정
			            scrollContainer.style.overflowY = 'auto';
			        } else {

			            scrollContainer.style.maxHeight = 'none';
			            scrollContainer.style.overflowY = 'visible';
			        }
			    });
			</script>
<script src="/js/nowtime.js"></script>
</body>
</html>