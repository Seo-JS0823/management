<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<link rel="stylesheet" href="/css/annualDetail.css"/>
	<title>My Company Management</title>
</head>
<body>
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>

<!-- 상제보기 View 본문 영역 -->
<main>
	<input type="hidden" id="clear" value="${clear}"/>
	<div class="an-detail">
		<div class="an-box-s">
			<p>연차 적립 상세보기</p>
		</div>
		<div class="an-box-s">
			<p>이름</p>
			<input type="text" value="${annual.name}" readOnly/>
		</div>
		<div class="an-box-s">
			<p>부서</p>
			<input type="text" value="${annual.department_name}" readOnly/>
		</div>
		<div class="an-box-s">
			<p>부서 담당자</p>
			<input type="text" value="${annual.manager_name}" readOnly/>
		</div>
		<div class="an-box-s">
			<p>직급</p>
			<input type="text" value="${annual.position_name}" readOnly/>
		</div>
		<div class="an-box-s">
			<p>입사일</p>
			<input type="text" value="${annual.employment_date}" readOnly/>
		</div>
		<div class="an-box-s">
			<p>적립일</p>
			<input type="text" id="leave_date" name="leave_date" value="${annual.leave_date}" readOnly/>
		</div>
		<div class="an-box-s">
			<p>적립 개수</p>
			<input type="text" id="leave_count" name="leave_count" value="${annual.leave_count}"/>
		</div>
		<div class="an-box-h">
			<hr class="an-hr">
			<h2 class="an-h2"> 적립 내용 </h2>
			<hr class="an-hr">
		</div>
		<div class="an-box-s">
			<textarea class="an-tarea" id="content" name="content">${annual.content}</textarea>
		</div>
	</div>
	<div class="an-box-a">
		<input type="hidden" id="leave_id" name="leave_id" value="${leave_id}"/>
		<form id="upRun" action="/manage/annualUpdate" method="post">
			<input type="button" id="up-btn" value="U P D A T E"/>
		</form>
		<form id="deRun" action="/manage/annualDel" method="post">
			<input type="button" id="de-btn" value="D E L E T E"/>
		</form>
	</div>
</main>

<script src="/js/nowtime.js"></script>
<script>
	const upBtn = document.querySelector('[id=up-btn]');
	const deBtn = document.querySelector('[id=de-btn]');
	
	const upRunForm = document.querySelector('[id=upRun]');
	const deRunForm = document.querySelector('[id=deRun]');
	
	upBtn.addEventListener('click', (e) => {
		if(confirm('수정하시겠습니까?')) {
			let leaveId = document.querySelector('[id=leave_id]');
			let leaveDate = document.querySelector('[id=leave_date]');
			let leaveCount = document.querySelector('[id=leave_count]');
			let leaveContent = document.querySelector('[id=content]');
			
			let id = document.createElement('input');
			id.type = 'hidden';
			id.name = leaveId.name;
			id.value = leaveId.value;
			
			let date = document.createElement('input');
			date.type = 'hidden';
			date.name = leaveDate.name;
			date.value = leaveDate.value;
			
			let count = document.createElement('input');
			count.type = 'hidden';
			count.name = leaveCount.name;
			count.value = leaveCount.value;
			
			let content = document.createElement('input');
			content.type = 'hidden';
			content.name = 'content';
			content.value = leaveContent.value;
			
			upRunForm.appendChild(content);
			upRunForm.appendChild(id);
			upRunForm.appendChild(date);
			upRunForm.appendChild(count);
			
			upRunForm.submit();
			return true;
		} else {
			e.preventDefault();
			return false;
		}
	});
	
	deBtn.addEventListener('click', (e) => {
		if(confirm('적립 내역을 삭제하시겠습니까?')) {
			let leaveId = document.querySelector('[id=leave_id]');
			
			let id = document.createElement('input');
			id.type = 'hidden';
			id.name = leaveId.name;
			id.value = leaveId.value;
			
			deRunForm.appendChild(id);
			
			deRunForm.submit();
			return true;
		} else {
			e.preventDefault();
			return false;
		}
	});
	
	const clearEl = document.querySelector('[id=clear]');
	
	if(clearEl.value != '') {
		alert(clearEl.value + ' 님의 적립 연차 정보가 수정되었습니다.');
	}
</script>
</body>
</html>