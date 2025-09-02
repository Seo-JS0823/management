<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/partChange.css"/>
	<title>My Company Management</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<main>
	<input type="hidden" id="clear" value="${clear}"/>
	<div class="change-top">
		<h3>-- 부서 이동 --</h3>
	</div>
	<div class="change-middle">
		<div class="change-s">
			<table>
				<colgroup>
					<col style="width:">
					<col style="width:90px;">
					<col>
					<col style="width: 125px;">
					<col style="width: 100px;">					
				</colgroup>
				<tr>
					<th>사번코드</th>
					<th>이름</th>
					<th>입사일</th>
					<th>부서명 (현)</th>
					<th>담당자 (현)</th>
				</tr>
				<c:forEach var="partEmp" items="${partEmps}">
					<tr>
						<td>${partEmp.employee_id}</td>
						<td>${partEmp.name}</td>
						<td>${partEmp.employment_date}</td>
						<td>${partEmp.department_name}</td>
						<td>${partEmp.manager_name}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="change-s">
			<div class="middle-box">
				<p>변경할 부서를 선택하세요.</p>
			</div>
			<div class="middle-box">
				<select id="part">
					<option value="" disabled selected>--- 부서 선택 ---</option>
					<option value="1010">총무 경비팀</option>
					<option value="1020">총무 시설관리팀</option>
					<option value="2010">재무회계 1팀</option>
					<option value="2020">재무회계 2팀</option>
					<option value="2030">감사팀</option>
					<option value="3010">영업 1팀</option>
					<option value="3020">영업 2팀</option>
					<option value="3030">영업 3팀</option>
					<option value="4010">자재관리팀</option>
					<option value="5010">가공 1팀</option>
					<option value="5020">가공 2팀</option>
					<option value="6010">생산 1라인</option>
					<option value="6020">생산 2라인</option>
					<option value="6030">생산 3라인</option>
					<option value="7010">운송 1팀</option>
					<option value="8010">안전관리팀</option>
					<option value="9010">인사팀</option>
				</select>
				<select id="ids" name="employee_id">
					<option value="" disabled selected>--- 이름 선택 ---</option>
					<c:forEach var="partEmp" items="${partEmps}">
						<option value="${partEmp.employee_id}">${partEmp.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="middle-box">
				<form action="" id="form-m">
					<input type="submit" id="update" value="C H A N G E"/>
					<input type="submit" id="back" value="B A C K"/>
				</form>
			</div>
		</div>
	</div>
</main>

<script src="/js/nowtime.js"></script>
<script>
	const updateEl = document.querySelector('[id=update]');
	const backEl = document.querySelector('[id=back]');
	
	const clearEl = document.querySelector('[id=clear]');
	
	if(clearEl.value != '') {
		alert(clearEl.value);
	}
	
	
	updateEl.addEventListener('click', (e) => {
		const formEl = document.querySelector('[id=form-m]');
		
		const partEl = document.querySelector('[id=part]').value;
		
		const idsEl = document.querySelector('[id=ids]').value;
		
		let id = null;
		if(idsEl != '') {
			id = document.createElement('input');
			id.type = 'hidden';
			id.name = 'employee_id';
			id.value = idsEl
			formEl.appendChild(id);
		} else {
			alert('이름을 지정해주세요.');
			e.preventDefault();
			return false;
		}
		
		let part = null;
		if(partEl != '') {
			part = document.createElement('input');
			part.type = 'hidden';
			part.name = 'department_id';
			part.value = partEl;
			formEl.appendChild(part);
		} else {
			alert('부서를 지정해주세요.');
			e.preventDefault();
			return false;
		}
		
		formEl.method = 'post';
		formEl.action = '/manage/empPartChange';
		formEl.submit();
	});
	
	backEl.addEventListener('click', () => {
		const formEl = document.querySelector('[id=form-m]');
		formEl.method = 'get';
		formEl.action = '/manage/mngindex';
		formEl.submit();
	});
	
	
	
	
</script>
</body>
</html>