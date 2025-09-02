window.onload = function() {
	let searchEl = document.getElementById('searchs');
	
	
	if(searchEl != null) {
		let options = searchEl.options;
		let searchNumEl = document.querySelector('[id=searchNum]');
		
		for(let i = 0; i < options.length; i++) {
			if(options[i].value == searchNumEl.value) {
				options[i].selected = true;
				break;
			}
		}
	}
	
	
	let nowPageEl = document.querySelector('[id=nowPage]').value;
	
	let aEl = document.querySelectorAll('.nows');
	
	aEl.forEach(function (e) {
		let nowEl = e.getAttribute('data-nowPage');
		
		if(nowPageEl == nowEl) {
			e.style.backgroundColor = '#1B2CF0';
			e.style.lineHeight = '30px';
			return;
		}
		
	});
	
}



