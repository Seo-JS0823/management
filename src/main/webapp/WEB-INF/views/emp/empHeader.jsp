<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="emp_header">
	<div class="emp_header_item">
		<a href="/emp/empView">
			<label class="item-label">Dash Board</label>
		</a>
	</div>
	<div class="emp_header_item">
		<a href="/emp/empUpdateView">
			<label class="item-label">직원정보 수정</label>
		</a>
	</div>
	<div class="emp_header_item">
		<a href="/leave/leaveView?employee_id=${employee.employee_id}">
			<label class="item-label">휴가 신청</label>
		</a>
	</div>
	<!-- <a href="/leave/leaveReqHistoryList?employee_id=${employee.employee_id}">휴가신청 기록보기</a> -->
	<div class="emp_header_item">
		<a href="/leave/leaveReqHistoryList?employee_id=${employee.employee_id}">
			<label class="item-label">휴가 조회</label>
		</a>
	</div>
	<div class="emp_header_item">
		<a href="#">
			<label class="item-label">근태 관리</label>
		</a>
	</div>
	<div class="emp_header_item">
		<a href="#">
			<label class="item-label">출/퇴근 기록</label>
		</a>
	</div>
	<div class="emp_header_item">
		<div id="now_time">
			<!-- 5초마다 바뀌는 시계 공간 -->
		</div>
	</div>
</header>