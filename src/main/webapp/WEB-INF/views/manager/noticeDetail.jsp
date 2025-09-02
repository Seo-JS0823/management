<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 - 부가가치세</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            font-size: 20px;
        }
        .container {
            background-color: white;
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        .content {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .buttons {
            text-align: right;
        }
        .buttons button {
            background-color: #2196F3;
            color: white;
            border: none;
            padding: 8px 15px;
            margin-left: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .buttons button:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>

<header>회사 공지사항</header>
<div class="container">
    <h2>부가가치세 공지사항입니다.</h2>

	<form action="/manage/noticeUpdateView" method="POST">
		 <table>
		 <tr>
        	<th>공지사항 번호</th>
        	<td>${notice.posting_num}</td>
        </tr>
        <tr>
            <th>작성일자</th>
            <td>${notice.posting_date}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${notice.manager_name}</td>
        </tr>
        <tr>
        	<th>제목</th>
        	<td>${notice.title}</td>
        </tr>
        
        <tr>
        	<th>부서 이름</th>
        	<td>${notice.department_name}</td>
        </tr>
        <tr>
        	<th>내용</th>
        	<td>${notice.content}</td>
        </tr>
        <tr>
        	<td>
        		<input type="hidden" name="posting_num" value="${notice.posting_num}"/>
        		<input type="submit" value="수정"/>
        	</td>
        </tr>
        <tr>
        	<td>
        		<a href="">삭제</a>
        	</td>
        </tr>
		</table>
   </form>
</div>

</body>
</html>
