<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/calendar.css"/>
	<link rel="stylesheet" href="/css/mngHeader.css"/>
	<script src="/js/index.global.min.js"></script>
	<script>
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
					fetch('/api/leaveList')
						.then(response => response.json())
						.then(data => {
							let events = data.map(leave => ({
								title: leave.department_name + "-" + leave.name,
								start: leave.leave_start_date,
								end: leave.leave_end_date
							}));
							successCallback(events);
							
							targetDiv.innerHTML = "";
							
							data.forEach(leave => {
								const div = document.createElement("div");
								div.classList.add("leave-list");
								
								if(leave.gender == "남") {
									div.style.backgroundColor = "lightblue";
									div.innerHTML = `
										<img src="/images/human.png"/>
										<p>\${leave.name} - \${leave.department_name}</p>
										<p>\${leave.leave_start_date}</p>
										<p>~</p>
										<p>\${leave.leave_end_date}</p>
									`;
								} else if(leave.gender == "여") {
									div.style.backgroundColor = "lightpink";
									div.innerHTML = `
										<img src="/images/human2.png"/>
										<p>\${leave.name} - \${leave.department_name}</p>
										<p>\${leave.leave_start_date}</p>
										<p>~</p>
										<p>\${leave.leave_end_date}</p>
									`;
								}
								
								targetDiv.appendChild(div);
							});
							
						})
						.catch(err => failureCallback(err));
				}
			});
			calendar.render();
		});
	</script>
	<title>My Company</title>
</head>
<body bgcolor="#F5F5F5">
<!-- 관리자 메인 페이지 헤더 부분 -->
<%@ include file="mngHeader.jsp" %>
<div class="box">
	<div class="leave-info"></div>
	<div class="calendars" id='calendar'></div>
</div>
</body>
</html>