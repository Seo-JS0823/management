document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var targetDiv = document.querySelector('.leave-info');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth',
		locale: 'ko',
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
		},
		height: '90%',
		eventDisplay: 'block',
		eventTimeFormat: {
			hour: '2-digit',
			minute: '2-digit',
			hour12: false
		},
		events: function(fetchInfo, successCallback, failureCallback) {
			fetch(`http://192.168.0.97:9090/api/leaveList?start=${fetchInfo.startStr}&end=${fetchInfo.endStr}`)
				.then(response => response.json())
				.then(data => {
					let events = data.map(leave => ({
						title: leave.department_name + "-" + leave.name,
						start: leave.leave_start_date,
						end: leave.leave_end_date
					}));
					successCallback(events);
					updateLeaveList(data);
				})
				.catch(err => failureCallback(err));
		},
		datesSet: function(info) {
			fetch(`http://192.168.0.97:9090/api/leaveList?start=${info.startStr}&end=${info.endStr}`)
				.then(response => response.json())
				.then(data => {
					updateLeaveList(data);
				})
		}
	});
	calendar.render();
	
	function updateLeaveList(data) {
		targetDiv.innerHTML = "";
					
		data.forEach(leave => {
			const div = document.createElement("div");
			div.classList.add("leave-list");
			
			if(leave.gender == "남") {
				div.style.backgroundColor = "lightblue";
				div.innerHTML = `
					<div class="levae-emp">
						<img src="/images/human.png"/>
						<p>${leave.name} - ${leave.department_name}</p>
					</div>
					<p>출발일 : ${leave.leave_start_date}</p>
					<p>복귀일 : ${leave.leave_end_date}</p>
				`;
			} else if(leave.gender == "여") {
				div.style.backgroundColor = "lightpink";
				div.innerHTML = `
					<div class="levae-emp">
						<img src="/images/human2.png"/>
						<p>${leave.name} - ${leave.department_name}</p>
					</div>
					<p>출발일 : ${leave.leave_start_date}</p>
					<p>복귀일 : ${leave.leave_end_date}</p>
				`;
			}
			
			targetDiv.appendChild(div);
		});
	}
	
});