<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css">
	<link rel="stylesheet" href="/css/join.css">
	<title>My Company JoIn</title>
</head>
<body style="background: #2C3E50;">
<form action="/join" method="post">
	<div class="join_box">
		<div class="join_menu">
			<h1>관리자 회원가입</h1>
		</div>
		<div class="join_menu">
			<p>이름</p><input type="text" name="name"/>
		</div>
		<div class="join_menu">
			<p>전화번호</p><input type="text" name="phone_num"/>
		</div>
		<div class="join_menu">
			<p>성별</p>
			<h3>남자</h3>
			<input type="radio" name="gender" value="남"/>
			<h3>여자</h3>
			<input type="radio" name="gender" value="여"/>			
		</div>
		<div class="join_menu">
			<p>부서</p>
			<select name="department_id" required>
				<option value="" disabled selected>-- 부서 선택 --</option>
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
			</select>
		</div>
		<div class="join_menu">
			<p>고용 형태</p>
			<select name="worktype_id">
				<option disabled selected>-- 고용 형태 --</option>
				<option value="1">정규직</option>
				<option value="2">계약직</option>
				<option value="3">파견직</option>
				<option value="4">일용직</option>
			</select>
		</div>
		<div class="join_menu">
			<p>직급</p>
			<select name="position_id">
				<option disabled selected>-- 직급 --</option>
				<option value="15">부장</option>
				<option value="24">생산반장</option>
				<option value="25">생산부팀장</option>
				<option value="26">생산본부장</option>
				<option value="32">가공반장</option>
				<option value="42">운송팀장</option>
				<option value="43">운송본부장</option>
				<option value="51">안전관리본부장</option>
			</select>
		</div>
		<div class="join_menu">
			<p>입사일</p>
			<input type="date" name="employment_date" value="2024-12-01"/>
		</div>
		<div class="join_menu">
			<p>주소</p>
			<input type="hidden" id="addressCode"/>
			<input type="button" id="addressSearch" value="주소 검색"/>
		</div>
		<div class="join_menu">
			<input type="text" id="successAddr" name="address" readOnly/>
		</div>
		<div class="join_menu">
			<p>생년월일</p>
			<input type="date" name="birthdate" value="1995-01-01"/>
		</div>
		<input type="submit" value="관리자 회원가입"/>
	</div>
</form>

<!-- 주소 모달창 -->
<div id="addressModal">
	<div>
		<input type="text" id="searchKeyword" placeholder="도로명 주소를 입력하세요." />
		<button type="button" id="searchBtn">검색</button>
		<ul id="addressList"></ul>
		<button type="button" id="closeModal">닫기</button>
	</div>
</div>
<script src="/js/address.js"></script>
</body>
</html>