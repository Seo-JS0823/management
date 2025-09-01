// 제대로 입력 안되었을 경우 출력
const btnEl = document.querySelector('[id=loginBtn]');

btnEl.addEventListener('click', function(e) {
	const idEl = document.querySelector('[name=employee_id]').value.trim();
	const pwEl = document.querySelector('[name=password]').value.trim();
	
	if(!idEl) {
		alert('사번코드를 입력해주세요.');
		e.preventDefault();
		return;
	}
	
	if(!pwEl) {
		alert('비밀번호를 입력해주세요.');
		e.preventDefault();
		return;
	}	
});

// 로그인 했는데 존재하지 않는 직원인 경우 출력할 메세지
const notEmpEl = document.querySelector('[id=notEmp]');

if(notEmpEl != null) {
	alert(notEmpEl.value);
}

// 회원가입 버튼 눌렀을 때
const joinBtnEl = document.querySelector('[id=joinBtn]');

joinBtnEl.addEventListener('click', function() {
	const login_formEl = document.querySelector('[class=login_form]');
	
	login_formEl.action = '/joinView';
	login_formEl.method = 'GET';
	return true;
});

// 관리자 회원가입 후 보여줄 사번코드와 비밀번호
let managerSuccessEl = document.querySelector('[class=managerSuccess]');
let idBtnEl = document.querySelector('[id=idBtn]');

if(managerSuccessEl != null) {
	managerSuccessEl.style.display = 'flex';
}

idBtnEl.addEventListener('click', function() {
	managerSuccessEl.style.display = 'none';
});

















