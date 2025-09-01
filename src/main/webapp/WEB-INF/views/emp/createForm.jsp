<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>결근&조퇴 신청서 작성</title>
</head>
<body>
    <h1>결근&조퇴 신청서 작성</h1>
    <p>신청서를 작성해주세요, ${employeeDTO.name}님!</p>

    <form action="/lateness/eatCreate" method="post">
        날짜: <input type="date" name="ness_date" id="ness_date"><br>
        유형:
	    <select name="atte_flag" id="atte_flag">
	        <option value="" disabled selected>선택하시오</option>    
	        <option value="3">조퇴</option>
	        <option value="4">결근</option>
	    </select><br>
	    내용: <textarea name="content" id="content"></textarea><br>
	    <input type="hidden" name="status" value="0">
	    <button type="submit">신청하기</button>
    </form>
	    <script>
	    function checkForm() {
	        const ness_date = document.getElementById('ness_date').value;
	        const atte_flag = document.getElementById('atte_flag').value;
	        const content = document.getElementById('content').value;
	        
	        if (ness_date === "") {
	            alert("날짜를 입력해주세요.");
	            return false;
	        }

	        if (atte_flag === "") {
	            alert("유형을 선택하십시오.");
	            return false;
	        }
	        
	        if (content.length > 30) {
	            alert("내용은 30자 이내로 작성하시오.");
	            return false;
	        }

	        return true;
	    }
	    </script>

    <a href="/lateness/eatView">목록으로 돌아가기</a>

</body>
</html>