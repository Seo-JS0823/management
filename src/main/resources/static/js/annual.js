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