<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
    <link rel="stylesheet" href="/css/mngEatView.css"/>
    <title>결근&조퇴 신청 내역</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<div class="content">
    <h1>결근&조퇴 신청 내역</h1>
    <form action="/manage/managerEatView" method="get">
        <div class="search-box">
            <label for="search_text">검색:</label> <input type="text" name="search_text" id="search_text" value="${param.search_text}">
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

    <hr>
    
    <table class="data-table">
        <thead>
            <tr>
                <th colspan="8" class="table-title">신청자 명단</th>
            </tr>
            <tr>
                <th>이름</th>
                <th>부서</th>
                <th>신청일</th>
                <th>작성일</th>
                <th>유형</th>
                <th>사유</th>
                <th>상태</th>
                <th>결제</th>
            </tr>
        </thead>
        <tbody>
			<c:forEach var="lateness" items="${LatenessDTOList}">
			    <tr>
			        <td>${lateness.name}</td>
			        <td>${lateness.department}</td>
			        <td>${lateness.ness_date}</td>
			        <td>${lateness.created_date}</td>
			        <td>
			            <c:if test="${lateness.atte_flag == 3}">조퇴</c:if>
			            <c:if test="${lateness.atte_flag == 4}">결근</c:if>
			        </td>
			        <td>
			            <div class="tooltip-container">
			                <span class="content-text">${lateness.content}</span>
			                <span class="tooltip-text">${lateness.content}</span>
			            </div>
			        </td>
			        <td>
			            <c:if test="${lateness.status == 0}">미승인</c:if>
			            <c:if test="${lateness.status == 1}">승인</c:if>
			        </td>
			        <td>
					    <div class="btn-group">
					        <form action="/manage/eatApproveDeny" method="post" style="display:inline;">
					            <input type="hidden" name="employee_id" value="${lateness.employee_id}" />
					            <input type="hidden" name="ness_date" value="${lateness.ness_date}" />
					            <input type="hidden" name="action" value="approve" />
					            <button type="submit" class="btn approve-btn">승인</button>
					        </form>	
					        <form action="/manage/eatApproveDeny" method="post" style="display:inline;">
					            <input type="hidden" name="employee_id" value="${lateness.employee_id}" />
					            <input type="hidden" name="ness_date" value="${lateness.ness_date}" />
					            <input type="hidden" name="action" value="deny" />
					            <button type="submit" class="btn deny-btn">미승인</button>
					        </form>
					    </div>
			        </td>
			    </tr>
			</c:forEach>
        </tbody>
    </table>
</div>

<script src="/js/nowtime.js"></script>
</body>
</html>