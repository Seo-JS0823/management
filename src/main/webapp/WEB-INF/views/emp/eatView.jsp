<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>결근&조퇴 기록 및 조회</title>
</head>
<body>
    <h1>결근&조퇴 기록 및 조회</h1>
    <p>${employeeDTO.department_name } ${employeeDTO.name}님!</p>
    
    <!--  검색창 -->
        <form action="/lateness/eatView" method="get">
        <select name="status">
            <option value="">상태 전체</option>
            <option value="0">미승인</option>
            <option value="1">승인</option>
        </select>
        <select name="atte_flag">
            <option value="">유형 전체</option>
            <option value="3">조퇴</option>
            <option value="4">결근</option>
        </select>
        <button type="submit">검색</button>
    </form>

    <!-- 신청하기 버튼 추가 -->
    <a href="/lateness/createForm">
        <button>신청하기</button>
    </a>

    <hr>

    <h2>기존 기록 목록</h2>
    <table>
        <thead>
            <tr>
                <th>작성날짜</th>
                <th>신청날짜</th>
                <th>유형</th>
                <th>내용</th>
                <th>상태</th> <th>수정</th>
                <th>삭제</th>
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
                    <td>${lateness.content}</td>
                    <td>
                        <c:choose>
                            <c:when test="${lateness.status == 0}">미승인</c:when>
                            <c:when test="${lateness.status == 1}">승인</c:when>
                            <c:otherwise>대기</c:otherwise>
                        </c:choose>
                    <td>
                      <c:if test="${lateness.status == 0}">
                        <a href="/lateness/eatUpdateView?employee_id=${lateness.employee_id}&ness_date=${lateness.ness_date}" style="display:inline-block; padding: 6px 12px; border: 1px solid #ccc; border-radius: 4px; background-color: #f0f0f0; text-decoration: none; color: black;">수정</a>
                    </c:if>
                    </td>
                    <td>
 					<c:if test="${lateness.status == 0}">
                        <form action="/lateness/eatDelete" method="post" ">
                            <input type="hidden" name="employee_id" value="${lateness.employee_id}">
                            <input type="hidden" name="ness_date" value="${lateness.ness_date}">
                            <button type="submit">삭제</button>
                        </form>
                    </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>