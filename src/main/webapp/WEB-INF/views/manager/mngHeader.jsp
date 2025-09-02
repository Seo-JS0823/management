<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header	class="mngHeader">
	<div class="mngHeader_menu">
		<a href="/manage/mngindex">Manager Dash Board</a>
	</div>
	<div class="mngHeader_menu">
		<a href="/manage/attedListView">출/퇴근 기록부</a>
	</div>
	<div class="mngHeader_menu">
		<p>직원 조회</p>
		<ul class="selected_menu">
			<li><a href="/manage/empListView">직원 목록 조회</a></li>
			<li><a href="/manage/nowLeaveView">휴가자 조회</a></li>
		</ul>
	</div>
	<div class="mngHeader_menu">
		<p>승인</p>
		<ul class="selected_menu">
			<li><a href="/manage/showLeaveReqList">휴가자 승인</a></li>
			<li><a href="/manage/annualCreateView">연차 적립</a>
			<li><a href="/manage/annualReadView">연차 적립 내역</a></li>
			<li><a href="/manage/managerEatView">결근/조퇴 승인</a></li>
		</ul>
	</div>
	<div class="mngHeader_menu">
		<a href="/manage/empView">직원 등록</a>
	</div>
	<div class="mngHeader_menu">
		<a href="/manage/managerChangeView">관리자 변경</a>
	</div>
	<div class="mngHeader_menu">
		<a href="/manage/empPartChangeView">직원 부서 이동</a>
	</div>
	
	<!-- 시계 -->
	<div class="mngHeader_menu">
		<div id="now_time"></div>
	</div>
</header>