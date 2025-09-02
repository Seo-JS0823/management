
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>공지사항 추가</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			padding: 20px;
			background-color: #f9f9f9;
		}
		form {
			background: white;
			padding: 20px;
			border-radius: 8px;
			max-width: 500px;
			margin: 0 auto;
			box-shadow: 0 0 5px rgba(0,0,0,0.1);
		}
		label {
			display: block;
			margin-top: 15px;
			font-weight: bold;
		}
		input[type=text], input[type=date], textarea {
			width: 100%;
			padding: 8px;
			margin-top: 5px;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
		}
		textarea {
			height: 300px;
			resize: none;
		}
		button {
			margin-top: 20px;
			padding: 10px 20px;
			background-color: #007BFF;
			color: white;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
		}
		button:hover {
			background-color: #0056b3;
		}
	</style>
</head>
<body>

	<h2>공지사항 추가</h2>
	
	<form action="/manage/noticeWrite" method="get">
	<input type="hidden" name="manager_id" value="${noticeDTO.manager_id}">
	<input type="hidden" name="department_id" value="${noticeDTO.department_id}">
		<label for="posting_num">공지 사항 작성</label>

		<label for="department_name">부서 이름</label>
		<input type="text" id="department_name" name="department_name" value="${manager.department_name}" placeholder="부서 이름 입력" readOnly >

		<label for="manager_name">담당자 이름</label>
		<input type="text" id="manager_name" name="manager_name" value="${manager.name}" placeholder="담당자 이름 입력" readOnly>
		
		<label for="title">공지 제목</label>
		<input type="text" id="title" name="title" placeholder="공지 제목 입력" >

		<label for="content">공지 내용</label>
		<textarea id="content" name="content" placeholder="공지 내용을 입력하세요" ></textarea>

		<button type="submit">작성 완료</button>
	</form>

</body>
</html>
