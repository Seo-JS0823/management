<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/empHeader.css">
    <title>공지사항 - 부가가치세</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: #2C3E50;
            margin: 0;
            padding: 0;
        }

        header {
            background-color:  #2C3E50;
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

        h2 {
            margin-top: 0;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-group textarea {
            resize: vertical;
            height: 400px;
            outline: none;
        }

        .buttons {
            text-align: right;
            margin-top: 20px;
        }

        .buttons button {
            background-color:  #2C3E50;
            color: white;
            border: none;
            padding: 8px 15px;
            margin-left: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .buttons button:hover {
            background-color:  #2C3E50;
        }

    </style>
</head>
<body>

<%@ include file="empHeader.jsp" %>
<div class="container">
    <h2>${manager.department_name} 부서 공지사항 - ${notice.posting_num}</h2>

    <form action="/manage/noticeUpdateView" method="POST">
		<input type="hidden" id="posting_num" name="posting_num" value="${notice.posting_num}" readonly>
		
        <div class="form-group">
            <label for="posting_date">작성일자</label>
            <input type="text" id="posting_date" name="posting_date" value="${notice.posting_date}" readonly>
        </div>

        <div class="form-group">
            <label for="manager_name">작성자</label>
            <input type="text" id="manager_name" name="manager_name" value="${notice.manager_name}" readonly>
        </div>

        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" value="${notice.title}">
        </div>

        <div class="form-group">
            <label for="department_name">부서 이름</label>
            <input type="text" id="department_name" name="department_name" value="${notice.department_name}">
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content">${notice.content}</textarea>
        </div>
		
    </form>
</div>

<script src="/js/nowtime.js"></script>
</body>
</html>

