<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/reset.css"/>
	<link rel="stylesheet" href="/css/empHeader.css">
    <link rel="stylesheet" href="/css/mngEatView.css"/>
    <title>결근&조퇴 신청서 작성</title>
    <style>
        .form-container {
            display: flex;
            flex-direction: column;
            gap: 15px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            width: 100%;
            max-width: 500px;
            margin-top: 20px;
        }

        .form-container label {
            font-weight: bold;
            color: #555;
        }
        
        .form-container input,
        .form-container select,
        .form-container textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* 패딩이 너비에 포함되도록 설정 */
        }
        
        .form-container textarea {
            resize: vertical; /* 세로 크기 조절만 가능하도록 */
            min-height: 100px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@ include file="empHeader.jsp" %>
    <div class="content">
        <h1>결근&조퇴 신청서 작성</h1>
        <p>신청서를 작성해주세요, ${employeeDTO.name}님!</p>

        <form action="/lateness/eatCreate" method="post" onsubmit="return checkForm()">
            <div class="form-container">
                <label for="ness_date">발생날짜:</label>
                <input type="date" name="ness_date" id="ness_date" max="" required>

                <label for="atte_flag">유형:</label>
                <select name="atte_flag" id="atte_flag" required>
                    <option value="" disabled selected>선택하시오</option>    
                    <option value="3">조퇴</option>
                    <option value="4">결근</option>
                </select>

                <label for="content">내용:</label>
                <textarea name="content" id="content" required></textarea>
                
                <input type="hidden" name="status" value="0">
            </div>
            
            <div class="btn-group">
                <button type="submit" class="btn sign-btn">신청하기</button>
                <a href="/lateness/eatView" class="btn return-btn">목록으로 돌아가기</a>
            </div>
        </form>

        <script>
            function checkForm() {
                const ness_date = document.getElementById('ness_date').value;
                const atte_flag = document.getElementById('atte_flag').value;
                const content = document.getElementById('content').value;
                
                const today = new Date();
                today.setHours(0, 0, 0, 0);
                const inputDate = new Date(ness_date);
            
                if (ness_date === "") {
                	displayMessage("날짜를 입력해주세요.");
                    return false;
                }
                if (inputDate > today) {
                    alert("오늘 날짜를 넘어가는 날짜는 선택할 수 없습니다.");
                    return false;
                }
            
                if (atte_flag === "") {
                    alert("유형을 선택하십시오.");
                    return false;
                }
                
                if (content === "") {
                    alert("내용을 입력해주세요.");
                    return false;
                }
                
                if (content.length > 30) {
                    alert("내용은 30자 이내로 작성하시오.");
                    return false;
                }
            
                return true;
            }
        </script>
        <script>
         function getCurrentDate() {
        	 const today = new Date();
             const year = today.getFullYear();
             const month = String(today.getMonth() + 1).padStart(2, '0');
             const day = String(today.getDate()).padStart(2, '0');
             return `${year}-${month}-${day}`;
         }
         window.onload = function() {
             const dateInput = document.getElementById('ness_date');
             const todayString = getCurrentDate();
             
             dateInput.max = todayString;
         };
        </script>
    </div>
<script src="/js/atted.js"></script>
<script src="/js/nowtime.js"></script>
</body>
</html>