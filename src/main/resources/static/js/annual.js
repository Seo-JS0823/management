const searchEl = document.querySelector('[id=search]');
const runEl = document.querySelector('[id=run]');

searchEl.addEventListener('click', e => {
	runEl.submit();
});

function atted() {
	const leave_dateEl = document.querySelector('[id=leave_date]');
	
	const now = new Date();
	const year = now.getFullYear();
	const month = String(now.getMonth() + 1).padStart(2, '0');
	const day = String(now.getDate()).padStart(2, '0');
	
	leave_dateEl.value = `${year}-${month}-${day}`;
};

atted();

setInterval('atted', 600000);

const targetEl = document.querySelector('[id=leaveTarget]');

if(targetEl.value != '') {
	alert(targetEl.value + ' 직원의 연차가 적립되었습니다.');
}