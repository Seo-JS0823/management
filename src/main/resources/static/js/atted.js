// atte_start에 값 넣기
function updateAtte() {
	const now = new Date(); 
	
	// 년 월 일
	const year = now.getFullYear();
	const month = String(now.getMonth() + 1).padStart(2, '0');
	const day = String(now.getDate()).padStart(2, '0');
	
	// 시간:분:초
	const hours = String(now.getHours()).padStart(2, '0');
	const minutes = String(now.getMinutes()).padStart(2, '0');
	const seconds = String(now.getSeconds()).padStart(2, '0');
	
	const atte_startEl = document.querySelector('[name=atte_start]');
		  atte_startEl.value = `${hours}:${minutes}`;
		  
	const atte_endEl = document.querySelector('[name=atte_end]');
	      atte_endEl.value = `${hours}:${minutes}`;
	
	const currentDateEl = document.querySelectorAll('[name=currentDate]');
	currentDateEl.forEach( e => {
		e.value = `${year}-${month}-${day}`;
	});
}
updateAtte();

setInterval('updateAtte', 10000);


// 출석 체크 후 시간 알려주기
const attedStartSuccessEl = document.querySelector('[id=attedStartSuccess]');

if(attedStartSuccessEl != null) {
	let attedStart = attedStartSuccessEl.value;
	
	alert(attedStart + '에 출석 체크가 완료되었습니다.');
}

// 당일 출석 체크 했는데 또 눌렀을 경우
const startContainsEl = document.querySelector('[id=startContains]');

if(startContainsEl != null) {
	alert(startContainsEl.value + ' 님은 당일 이미 출석체크를 하셨습니다');
}

// 당일 퇴근 체크 했는데 또 눌렀을 경우
const endContainsEl = document.querySelector('[id=endContains]');

if(endContainsEl != null) {
	alert(endContainsEl.value + ' 님은 당일 이미 퇴근체크를 하셨습니다');
}


// 퇴근 체크 버튼 누를 때 현재 시간 보여주기
const atte_endBTNEl = document.querySelector('[id=atte_endBTN]');

atte_endBTNEl.addEventListener('click', function(e) {
	
	const now = new Date();
	const hours = String(now.getHours()).padStart(2, '0');
	const minutes = String(now.getMinutes()).padStart(2, '0');
	
	if(confirm('현재 시각 ' + `${hours}시 ${minutes}분입니다. 퇴근 체크를 하시겠습니까?`)) {
		return true;
	} else {
		e.preventDefault();
		return false;
	}
	
});

// 출근 체크 버튼 누를 때 현재 시간 보여주기
const atte_startBTNEl = document.querySelector('[id=atte_startBTN]');

atte_startBTNEl.addEventListener('click', function(e) {
	const now = new Date();
	const hours = String(now.getHours()).padStart(2, '0');
	const minutes = String(now.getMinutes()).padStart(2, '0');
	
	/* 출석 체크 버튼을 누르는 시간이 17시 이후인 경우 출석체크 막는 로직 */
	if(hours > 17) {
		alert(`${hours}:${minutes} ` + '현재는 출근시간이 아닙니다.');
		e.preventDefault();
		return false;
	}
	
	if(confirm('현재 시각 ' + `${hours}시 ${minutes}분입니다. 출석 체크를 하시겠습니까?`)) {
		return true;
	} else {
		e.preventDefault();
		return false;
	}
	
});

// year_month 연차 적립에 필요한 데이터
const monthEl = document.querySelector('[id=month]');

monthEl.addEventListener('click', function() {
	const now = new Date();
	const year = now.getFullYear();
	
	const year_monthEl = document.querySelector('[id=year_month]');
	year_monthEl.value = `${year}-${monthEl.value}-01`;
	
});

// 퇴근 체크 눌렀을 때 당일 출석하지 않았다면 보여줄 경고창
const startNotEl = document.querySelector('[id=startNot]');

if(startNotEl != null) {
	alert('오늘 출석 체크를 하지 않았습니다.');
}

// 정상적으로 퇴근했을 때 퇴근 시간 보여주기
const endSuccessEl = document.querySelector('[id=endSuccess]');

if(endSuccessEl != null) {
	let attedEnd = endSuccessEl.value;
	alert(attedEnd + '에 퇴근 체크가 완료되었습니다.');
}


// 당월 연차 정보 업데이트 했을 때 업데이트된 직원 수 보여주기
const leave_upd_cntEl = document.querySelector('[id=leave_upd_cnt]');

if(leave_upd_cntEl != null) {
	alert('연차가 업데이트된 직원수는 ' + leave_upd_cntEl.value + ' 명 입니다.');
}

// 선택한 월 연차적립이 완료되었는데 또 적립하려는 경우 경고창 보여주기
const annualContainsEl = document.querySelector('[id=annualContains]');

if(annualContainsEl != null) {
	alert(annualContainsEl.value);
}

// [당월 연차 적립] 버튼 눌렀을 때 select가 선택되지 않았으면 막음 + 당월보다 높은 월을 선택했을 경우 막음
const leave_BTNEl = document.querySelector('[id=leave_BTN]');

leave_BTNEl.addEventListener('click', function(e) {
	
	const now = new Date();
	const month = String(now.getMonth() + 1).padStart(2, '0');
	
	if(monthEl.value.trim() == '') {
		alert('연차를 적립할 월을 선택하세요.')
		e.preventDefault();
		return false;
	}
	
	if(monthEl.value.trim() > month) {
		alert('해당 월은 연차를 적립할 수 없습니다.');
		e.preventDefault();
		return false;
	}
	
});









