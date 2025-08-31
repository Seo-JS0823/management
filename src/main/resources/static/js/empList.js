const delName = document.querySelector('[id=delName]');
	
if(delName.value != '') {
	alert(delName.value + ' 직원의 퇴사 등록이 완료되었습니다.');
}

const resetName = document.querySelector('[id=resetName]');

if(resetName.value != '') {
	alert(resetName.value + ' 직원의 퇴사 등록을 철회하였습니다.');
}

const exitBtnEls = document.querySelectorAll('.exitBtn');
const exitNameEls = document.querySelectorAll('.exitName');

exitBtnEls.forEach( (btn, i) => {
	btn.addEventListener('click', (e) => {
		e.preventDefault();
		let empName = exitNameEls[i].value;
		
		alert(empName);
		
		const formEl = e.target.closest('form');
		
		if(confirm(empName + ' 님을 정말로 퇴사처리 하시겠습니까?')) {
			formEl.submit();
		} else {
			e.preventDefault();
			return false;
		}
	});
});

const resetBtnEls = document.querySelectorAll('.resetBtn');

resetBtnEls.forEach( (btn) => {
	btn.addEventListener('click', (e) => {
		e.preventDefault();
		
		const formEl = e.target.closest('form');
		
		if(confirm('퇴사 등록을 철회하시겠습니까?')) {
			formEl.submit();
		} else {
			e.preventDefault();
			return false;
		}
		
	});
});