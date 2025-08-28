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