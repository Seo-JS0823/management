<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결근&조퇴 신청 내역</title>
</head>
<body>
    <h1>결근&조퇴 신청 내역</h1>
         <form action="/manage/managerEatView" method="get">
        검색: <input type="text" name="search_text" value="${param.search_text}"><br>
        상태:
        <select name="status">
            <option value="">상태 전체</option>
            <option value="0" ${param.status == 0 ? 'selected' : ''}>미승인</option>
            <option value="1" ${param.status == 1 ? 'selected' : ''}>승인</option>
        </select>
        유형:
        <select name="atte_flag">
            <option value="">유형 전체</option>
            <option value="3" ${param.atte_flag == 3 ? 'selected' : ''}>조퇴</option>
            <option value="4" ${param.atte_flag == 4 ? 'selected' : ''}>결근</option>
        </select>
        <button type="submit">검색</button>
    </form>
    
    <hr>
    <table border="1">
        <thead>
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
                    <td>${lateness.content}</td>
                    <td>
                        <c:if test="${lateness.status == 0}">미승인</c:if>
                        <c:if test="${lateness.status == 1}">승인</c:if>
                    </td>
				    <td>
					    <a href="/manage/eatApprove?employee_id=${lateness.employee_id}&ness_date=${lateness.ness_date}">승인</a>
					    <a href="/manage/eatDeny?employee_id=${lateness.employee_id}&ness_date=${lateness.ness_date}">미승인</a>
					</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>