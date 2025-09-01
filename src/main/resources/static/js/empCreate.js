const joinBtn = document.querySelector('[id=join]');

joinBtn.addEventListener('click', (e) => {
	
	const part = document.querySelector('[id=part]');
	const work = document.querySelector('[id=work]');
	const posi = document.querySelector('[id=posi]');
	
	if(part.value == '') {
		alert('부서를 선택하세요.');
		e.preventDefault();
		return false;
	}
	
	if(work.value == '') {
		alert('근무 형태를 선택하세요.');
		e.preventDefault();
		return false;
	}
	
	if(posi.value == '') {
		alert('직급을 선택하세요.');
		e.preventDefault();
		return false;
	}
	
	const email = document.querySelector('[id=email]');
	
	if(email.value != '') {
		const emailReg = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
		
		if(!emailReg.test(email.value)) {
			alert('올바른 이메일 형식으로 입력하세요.');
			e.preventDefault();
			return false;
		}
		
	}
	
	const address = document.querySelector('[id=successAddr]');
	
	if(address.value == '') {
		alert('주소를 검색하세요.');
		e.preventDefault();
		return false;
	}
	
	const phoneReg = /^0\d{1,2}-\d{3,4}-\d{4}$/;
	const phone = document.querySelector('[id=phone]');
	
	if(!phoneReg.test(phone.value)) {
		alert('010-0000-0000 형식으로 전화번호를 입력하세요.');
		e.preventDefault();
		return false;
	}
});