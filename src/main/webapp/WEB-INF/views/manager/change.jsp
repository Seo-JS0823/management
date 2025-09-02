<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/mngChange.css"/>
	<title>My Company Management</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 관리자 변경 본문 -->
<main>
	<div class="mg-box">
		<div class="mg-h">
			<p>${manager.department_name} 부서 관리자 변경</p>
			<hr>
		</div>
		<div class="mg-main">
			<div class="mg-list-s">
				<p>담당자 (현)</p>
				<input type="text" value="${manager.name}" readOnly/>
			</div>
		</div>
		<div class="mg-list-m">
			<p>직원 목록에서 선택하세요.</p>
		</div>
		<div class="mg-list-l">
			<table>
				<tr>
					<th>이름</th>
					<th>사번코드</th>
					<th>입사일</th>
					<th>직급</th>
					<th>변경</th>
				</tr>
				<c:forEach var="employee" items="${employees}">
					<tr>
						<td class="names">${employee.name}</td>
						<td>${employee.employee_id}</td>
						<td>${employee.employment_date}</td>
						<td>${employee.position_name}</td>
						<td>
							<form action="/manage/empPartChg" method="post">
								<input type="hidden" name="employee_id" value="${employee.employee_id}"/>
								<input class="btns" type="submit" value="부서장 임명"/>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</main>
<script src="/js/nowtime.js"></script>
<script>
	const btnsEls = document.querySelectorAll('.btns');
	
	
	if(btnsEls.length > 0) {
		const namesEls = document.querySelectorAll('.names');
		for(let i = 0; i < btnsEls.length; i++) {
			btnsEls[i].addEventListener('click', (e) => {
				let name = namesEls[i].innerHTML;
				
				if(confirm(name + ' 직원을 담당자로 변경하시는게 확실하십니까?')) {
					return true;
				} else {
					e.preventDefault();
					return false;
				}
				
			})
		};
	}
	
</script>
</body>
</html>